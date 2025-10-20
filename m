Return-Path: <linux-next+bounces-8645-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6C7BEF1FA
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 04:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A69D3A9DF7
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 02:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825F6EEC3;
	Mon, 20 Oct 2025 02:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h1U/DvGF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E4A29D270;
	Mon, 20 Oct 2025 02:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760928551; cv=none; b=n5NoQmmMUyhAy7qq0mt/80JhW4sT919kwlcYXA+UVA+XmEAGpsqBcRgCVk2TS74Z3j5/nvDv8jkHkTQV8f7BCHhi/YF2o41SRXKnsoYVzrm7WXtBsFIltjyJbl7s8k/nJof0JPY/88Jg6Vaic21Rikf8EW5Vz/JQPGdxIG/yOXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760928551; c=relaxed/simple;
	bh=tpMOxu0/VbXq/5zhbjKttMqwqIwQc12eAP5ZqHJ7gac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SmknYraJk98igZH35MsAoj/JVEYaUtMhatTf7ZLesnOcEhMa+OzK1cekHgnmsBsFrImPuHxG4X0KBWfd8lB/l1v+ekY+L80bwd15lsi77rZ30PS4Rf0hVGlZD/mIEndviy6nEYL8MFQ+jq7gmBwB87PYcBp3hj1ZxZUIEkeHWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h1U/DvGF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760928542;
	bh=YUWB6Ovp8c8VcswJfWIkveVFODnRm5bx8MfksFPvkiI=;
	h=Date:From:To:Cc:Subject:From;
	b=h1U/DvGF0G9bW+UTM+qLiapPgQE0h7Z0Hwtgsm2EPsJcoxaW8qZ4feIQCEXrnBXtr
	 n9KtsrOi/59WXlvTq2UiYWmY59y+0Rknu+Ar5bFKwxUdeGfE3x5SkNlDlAXgMyWW6A
	 ORm0njk6rdlFyuNzPmgn1V+NOqxpMrd0/KZHqfGUWBzdzQ1bvxjpL4hT78bFi+VrFu
	 V/KSroaRkbjop8vBt/f24G6GgfjJA15Ks/WEr6+ZcbFKnlp1h+0L4jNbuPXdmUKSf6
	 xOHf3WdPmP4GnJUZ0u6EJslSOVyd24bVxmbMpg3T8DffnabDy8F7HZHRhYiOs9OZj6
	 DXVMo4Ov1aZLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqfyQ6L1Vz4wC8;
	Mon, 20 Oct 2025 13:49:02 +1100 (AEDT)
Date: Mon, 20 Oct 2025 13:49:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20251020134902.3a11107e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.p6=RxII7RIXmuEKYGwffPC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.p6=RxII7RIXmuEKYGwffPC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/core-api/mm-api:52: /home/sfr/kernels/next/next/mm/vmalloc.c:=
4036: WARNING: Inline strong start-string without end-string. [docutils]

Introduced by commit

  32904ba6f5ef ("vmalloc: update __vmalloc_node_noprof() documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/.p6=RxII7RIXmuEKYGwffPC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1ox4ACgkQAVBC80lX
0Gy/JggAkpHPf9NVBCJf6zWNBO+4bElOogEdg1DSRTpQW951jpu6Wq/jTksoN3/n
ERg5KXL1H10tclFDajHcAmJ9fu30nfyMVOeQuMUJcsDJC4CxTUVFR6yNjcjS5IqJ
L36dtPjXx3KsJ75/0oTSQWToavyS/iqoPwAp/LDwNkuAtD4C3WIS47wR42C8PMYq
uo6Songm1Qpn14yXEhc6L/oXaFjryqzglXVjRExFx5KYVe4AbQ+p3sQqeWtDLH47
S+LGe6ij4r4vVulj5aV3m79xO0wRPAdKKPLuGlNskB+zsfwTtVo8+C1rWGpXCNEM
5S++klzN15PyhnHmLwRQkyzdHfUK7Q==
=6MbM
-----END PGP SIGNATURE-----

--Sig_/.p6=RxII7RIXmuEKYGwffPC--

