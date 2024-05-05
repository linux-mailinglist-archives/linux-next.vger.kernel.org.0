Return-Path: <linux-next+bounces-2169-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 347478BC479
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 00:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD3131F2170C
	for <lists+linux-next@lfdr.de>; Sun,  5 May 2024 22:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF50136E2E;
	Sun,  5 May 2024 22:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qR/PdExz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F128136E2C;
	Sun,  5 May 2024 22:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714947697; cv=none; b=eOSRCdJTd08QVRgpGEj5qkm+k54OJ3ShnZaM98XiuIv/+hSu8Vtx/mTYOn6TVJL6MxI4IHz5gBHzwF9Q6YhlXt7RN6/yDQHhmMdqOyY1aFt+NHsmDNFDUYWwlyk+/B29ZFT3BPDCfCHYdC4dng/QuPxHuV+xPoEF1myys9c0g/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714947697; c=relaxed/simple;
	bh=VRdqCRWPZOqBbYjjxwlo4eAKZ6zliN3zeSEyEez9f0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hl4Byi/10krrJqmklyDqpAecIvpyXhv11eAf9p1cIXI0Z/kVfC44ttBcT7W4AvDBp2zm6IT5QIDDcqhGWRUN7mwA3h3tt2wGD59RaOl86jfrLB8qs3YHmmNo19XmxnDnnK/n0QD4ErIihTVQTnPl9rAfu4dGRKt5T+ZspL9W8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qR/PdExz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714947691;
	bh=mZdMeAg4gj399JmLfxbyITCDdE9elXHEygJhYxvPLEw=;
	h=Date:From:To:Cc:Subject:From;
	b=qR/PdExzm5BqPVgpRoSsC7kHx+Cb1AYZbCzm9jNYFeCFMlRAz3uDDHPv1BI71qDe7
	 7n382KgnZH6S1qn9jPTXLrFT0AjfSDN0HDkcd+8pZrxwihzZPR+PgBb+x7zmv9kFmA
	 zedvTCSrxEoaW/z5Hfj0LAqKJJ69nJvbQCk7cjGE/uCG9JhNyEFSZcichzmT5ELhvY
	 Sf7LvHNN1MVAC+Dwa2vQAVVVh8iSLfp7NM4MMjwqpeow5/91Nf/AqhdmBlLOTlixeT
	 WsKLiijyM2RJbO4hWgvWnNWSiZeLtYzuy5Qomc6zQxL49ZBn6vnfheRAaZ73sFQ3W5
	 sYr+qQIA/4NEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXfCH2zk9z4wyj;
	Mon,  6 May 2024 08:21:31 +1000 (AEST)
Date: Mon, 6 May 2024 08:21:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the slimbus tree
Message-ID: <20240506082130.7b2329c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JEuV_Q5=knnjXI1c8Ca=Zbw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JEuV_Q5=knnjXI1c8Ca=Zbw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b12bd525ca6e ("slimbus: qcom-ngd-ctrl: Add timeout for wait operation")

This is commit

  98241a774db4 ("slimbus: qcom-ngd-ctrl: Add timeout for wait operation")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JEuV_Q5=knnjXI1c8Ca=Zbw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4BmoACgkQAVBC80lX
0GwTnQgAg4CgcBx/ISVS1IizBYCZweNDaxT+oIghC5keFoztW/P6BW40HQMWxXyL
NqiLgk3+WvoF1XbRstZJ3fDpyMENwKSRO08tLAB0T/aFPkC4P3zG+PQaHg0KMW0r
WWsI32Ze6iZnCfcsP9HbeZQpY+DUEYHgQEG4gz/nuAOpHPRoQ6CsLen83PpUnc/l
dxxS4/afu9lkwwF4xz7SJbDMjZ+dYN55ZD4m+22cLukPFOSAxPQ40X1FrGgyr9LD
QLHw4nKC1SI/+CH6oh9dqKSssht4Bk1+cZkyo0W8nsgbJ8GiLRSCTMgsWvoEQXui
L8I4EKsNl9PZb/egvLjmFCBdMGHJow==
=YMZZ
-----END PGP SIGNATURE-----

--Sig_/JEuV_Q5=knnjXI1c8Ca=Zbw--

