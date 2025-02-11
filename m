Return-Path: <linux-next+bounces-5412-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 938CAA3178D
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 22:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8147169051
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 21:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59636266588;
	Tue, 11 Feb 2025 21:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gzUANOPB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15085264BD9;
	Tue, 11 Feb 2025 21:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739308909; cv=none; b=AiGmmzc8v+RTM3ci1J7K4pCAxyP+aNoELLmkuHCDI/ulAt1umEuWdmb92SiWkp7g92WmNik+t1nlc4bO3BI8FqZkurlwt/imAqHCPly+jrEpkEA3avmnXvQwP20DEfawumKW4d97XaGif2Q9/MGbErlTgCWfZzRLDGXFbT6aQeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739308909; c=relaxed/simple;
	bh=f1bbFWRJcRErnHrz+fEYTs5KoAAR1Ru42YicHzLnbuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BA2HWD5/139FGjNhzEoTta8sMPAOliipPNzBwDbH5XlhOfaQPg6t/P5tnzp/yIQKkK07GPEmapiTmwzW3n7O3ysR3y0n7Ul/TeCLNdfFy5iqtcHD7rMDAwgD+nGFP3AU2aQnglfng0LRJrmREi5OpqnssSQKlIWpuQCZzXTkOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gzUANOPB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739308903;
	bh=sRseoT7GUW1v47hKLrtlGTExPoSsmC36Y/PM9AO4jN0=;
	h=Date:From:To:Cc:Subject:From;
	b=gzUANOPBf4l5O68mRo+vBfRS+KqCxm+VrjIY8NW/8SMH9vj+jcwcBBd69D4wcW4jD
	 QtDD5UNC3hFSZ3WC5OHhHiW0RQJ0r9d1KQSPiJBYy8d0OyzXbbr0bfliKYAGOrRYm9
	 0vJHFqFSoIK8i5yudykFeSKKQY5zhbR25S1PJ+yx0PjGmCzVGsqMOc2T7ENv++H54L
	 Au/edHIw8gH8UFk21s38Fwc0tV8RZSCcRjdAldBkoIpflAUGWV5cD/FHoiE59uzzP/
	 iAtWvlG40Oux9PijPwl54ZTgDQIGVn5bll6/1eClGDmD/9diVJBAf4yQNav10OIKyy
	 +r/vuyvyISiow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YsvX66MR2z4wxh;
	Wed, 12 Feb 2025 08:21:41 +1100 (AEDT)
Date: Wed, 12 Feb 2025 08:21:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, <linux-xfs@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the xfs tree
Message-ID: <20250212082141.26dc0ad8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AfqEtdM1jdw4CXJy+rObNA+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AfqEtdM1jdw4CXJy+rObNA+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  bc0651d93a7b ("xfs: fix online repair probing when CONFIG_XFS_ONLINE_REPA=
IR=3Dn")

Fixes tag

  Fixes: 48a72f60861f79 ("xfs: don't complain about unfixed metadata when r=
epairs were injected")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

maybe you meant

Fixes: 48a72f60861f ("xfs: refactor repair forcing tests into a repair.c he=
lper")

or

Fixes: 8336a64eb75c ("xfs: don't complain about unfixed metadata when repai=
rs were injected")

--=20
Cheers,
Stephen Rothwell

--Sig_/AfqEtdM1jdw4CXJy+rObNA+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmerv2UACgkQAVBC80lX
0GwPEAf/THnWlCAOrvuU3mnDCz10TncUHJJWhw7MJpHuISw3rdKqcmYq2Lnfu7i/
C5YeulwabWKKML8604kFx/VKqfeyd1658lR8E7S6fp1yTkD6/kKAYh2WRsIdPkzS
H27110xkcyPFwnMRkiZ5rROkoie2UnzWU7jaclyq5PXzzS15Lb8X4WqfabXMw5/1
YE01DrhZwFSjtQYtZx5g52sbddym4VaLNlwBY4eHxi7RAUa663XBED8BkWRXGugH
/2t3i+LBX4xSSOW974g+XgV852kyrAseOZL9Xl0i1nOznyYKz4KG9wcyjYvxOFTQ
JaVdekQAm4e2/a9urP5smhAlToPV9A==
=tp25
-----END PGP SIGNATURE-----

--Sig_/AfqEtdM1jdw4CXJy+rObNA+--

