Return-Path: <linux-next+bounces-3562-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 884949693FF
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 08:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46B30285C5B
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 06:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034B51D6799;
	Tue,  3 Sep 2024 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zg6TeEyk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4111D678A;
	Tue,  3 Sep 2024 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725345854; cv=none; b=dHFHLoncVC/tt208M57mnQQ3C2thvfAheX6azLqIJfMuIPa+8HZ/9bILvZTKi5cE6MNmLMXhteCepx2UgMFOXDahwSUvGW5U6FkBoWYev1/XW4IOAbUby0WhnDOVQmc1aehPGM2BRWExnWnv6/94614+bj/VPrIuz0IXMQpChmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725345854; c=relaxed/simple;
	bh=QqAT9W596BWLxWh9JNq2l5mZDxFk00w5wfHnzzw4HdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SqzEtNl2GgkHP0HwY+8/N8zgoZLRKTzGKpA5mVIldCf3FyL3b/pA2UDBODomnslcwSlfGvDZpBSMUXLaM2eUg1T76VUwUTq4Hp11qDdVM4DR4leOs3oi1i+VT4DKKGKlzFBbnl8sY8S+fl6JifHTPLyhCyNUsJUw2FQrY3p02Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zg6TeEyk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725345849;
	bh=7YUoxfleLcMpn8u1Qa++dwf0VyRwez0K2Q2i6LM4j6M=;
	h=Date:From:To:Cc:Subject:From;
	b=Zg6TeEyke2dUx/XUD5Zj1k37fpmx0XEIUA9m1NOyXf4o56qUl63AFTDjLKC96a+y3
	 k8yw/1vfDzhRySoSRmKjfr3rKXUIqGFg+aV7wTeVO7+tzFsLBL0YSXk4QVAN5Z/Ide
	 dDSuArZc+49rUIGj9iu8h9+Uu1sAWgTeukGU06M+kh5XOYdceDgbp/3vHvaeR4WlZP
	 YMs5A3JGOuzIHL2HCNG9c34bJ/UnNVgKyag/PFq1YJ4mSRldlIILGn/Pe2x6PL25lX
	 0chg+15Mv2sKbORFdS5qnKuFmpwCs7BYxKmJMwnrmBiv3h//58zQpV0OiBjMhI+VhR
	 td64962/FZiNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wybgs1d58z4x8h;
	Tue,  3 Sep 2024 16:44:09 +1000 (AEST)
Date: Tue, 3 Sep 2024 16:44:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ext4 tree
Message-ID: <20240903164408.749aa16d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IqAioDdBVipJK29ZO2v4zON";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IqAioDdBVipJK29ZO2v4zON
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  04760bdf975f ("ext4: fix error message when rejecting the default hash")

Fixes tag

  Fixes:985b67cd8639 ("ext4: filesystems without casefold feature cannot

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not wrap Fixes tag lines.  Also, please keep all the commit
message tag lines together at the end of the commit message. Also,
there should be a space after the ':'.

--=20
Cheers,
Stephen Rothwell

--Sig_/IqAioDdBVipJK29ZO2v4zON
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbWsDgACgkQAVBC80lX
0GyXpQgAix+tMD5XAmia7VIyuTpNhG488rVw5vZk3dCSPMMecsJnv4hA6WJA3ayZ
Mp0aGvCKNYCDVnAYECxsmSEyi2v7EpPotD2EHtHM9xY0VBn4mYbYJiC3AwYfmaC5
xvwPSWaAi/alYgLdOZ1RTZqA1MqV7lJPDbVa2z3VxZNbYbHzMhamLfN5DvIs5dTs
5dQMYkcrJqUNE3yIfGFzgzsxcbfTWGXuwUavsRHIcRyDQ/D45dQbH2sTeTiIVpvG
atT4A0XTCBDQj9dr5ZbazCfsbkYFzmXBOIv0XJog/fXyr7Wi63HWPrGRRUPJ65MO
Iq2G7oviD2NChnQkOb1p47mwOo82nQ==
=10Mx
-----END PGP SIGNATURE-----

--Sig_/IqAioDdBVipJK29ZO2v4zON--

