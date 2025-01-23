Return-Path: <linux-next+bounces-5314-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B9A1AB04
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 21:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8988016227D
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 20:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920A11BFE10;
	Thu, 23 Jan 2025 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ogBBTqnz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C91ADC85;
	Thu, 23 Jan 2025 20:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737663223; cv=none; b=b2t+UDZRjjvdtWEAINpjNYAwO6xOCAqUfGPMFcNys9gPvyXqS4p//7g43ItQRcvu7obBQcgFkCVLUwyqLeD60R+T1PUn7WV6E4Rzldmbf3xpZXNj9qXzjraHwqiz9lFvzEcz4li5FArzLnrkWTzkVdREFbwQe02w2e/ZscUFAhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737663223; c=relaxed/simple;
	bh=K/6br4aNdXTEGeXW5qFg6f8cXw+1HfjQAmHhBCZdVhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NT0kfWWeHs0KzAqK+6ipc1fPmBCFsoPw4fbk4UblTQPZiyHFUIQeYWWuXyMZrTX9658vqGC6qMjvQKUFB4VhxpgaVQD0kV+iQW8m7nhApsRUGWQtGwTuah48aaO7oM9DOEf7Xp+KDsWmZ7w/mlwTz15GypfgtAJdDBFRsJDBMxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ogBBTqnz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737663207;
	bh=Ydm5hz4u+BLUsaq89XtEOYu9RJ5pJLCvLHqR4ELPyj0=;
	h=Date:From:To:Cc:Subject:From;
	b=ogBBTqnzHlVTCcUa5THNyzLkdK+1SgASgMhXkhZhHAd6+5bcaaT9MUaOcrbIVAyGB
	 sglrQexnN6pY9XeygPxmDModvTst8w3PwyQygb5a1VI2B6Um/CdJ/fq5CMvLUcPEAs
	 mZ97vKEqGB1bNqi77X+O44F5/TUEEmGjoDskdyxjNWJw3903J/86tN2cghFnXAjeo7
	 swVXVf8P6aaxTBO/x4UJBLW7t9VGBmHroF9+SXoX308anHMQ++RWON55OetZWFmQbN
	 LZRiWJNgwGDab6MfOvORvhWsTngxFtxeKTQSAjGg8SIFLG6xksj0NbmVfl2LZLBPYs
	 EImDGZecJuj2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YfBw70WgCz4wnp;
	Fri, 24 Jan 2025 07:13:26 +1100 (AEDT)
Date: Fri, 24 Jan 2025 07:13:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bschubert@ddn.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the fuse tree
Message-ID: <20250124071333.6d91cfc2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/krgtTRxlZD_NEy/LuFJ1i4r";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/krgtTRxlZD_NEy/LuFJ1i4r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d76c8bb7e031 ("fuse: Fix the struct fuse_args->in_args array size")

Fixes tag

  Fixes: fuse: make args->in_args[0] to be always the header

has these problem(s):

  - No SHA1 recognised

Maybe you meant:

Fixes: e24b7a3b70ae ("fuse: make args->in_args[0] to be always the header")

In commit

  a5564ff833b7 ("fuse: Remove unneeded include in fuse_dev_i.h")

Fixes tag

  Fixes: fuse: {io-uring} Make hash-list req unique finding functions non-s=
tatic

has these problem(s):

  - No SHA1 recognised

Maybe you meant:

Fixes: 543282def3fc ("fuse: {io-uring} Make hash-list req unique finding fu=
nctions non-static")

In commit

  f571aa60acaa ("fuse: Remove an err=3D assignment and move a comment")

Fixes tag

  Fixes: fuse: {io-uring} Handle SQEs - register commands

has these problem(s):

  - No SHA1 recognised

Maybe you meant:

Fixes: d7c8f3c02e21 ("fuse: {io-uring} Handle SQEs - register commands")

In commit

  3a0d08c113a3 ("fuse: Fix copy_from_user error return code in fuse_uring_c=
ommit")

Fixes tag

  Fixes: fuse: Add io-uring sqe commit and fetch support

has these problem(s):

  - No SHA1 recognised

Maybe you meant:

Fixes: d5223c566a20 ("fuse: Add io-uring sqe commit and fetch support")

--=20
Cheers,
Stephen Rothwell

--Sig_/krgtTRxlZD_NEy/LuFJ1i4r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeSou0ACgkQAVBC80lX
0Gy8GQf/W6Eda+kI9CVIHXcasBG2qymku/VAl0DbGkmb9i+5BgGt/qIucGUtMB7T
Xt/cMlMdPneRCgaRblqGuGvBcunwkNfrGAw+qMUDJwV3cJgSnN1MTQA2f0AQzXfQ
MMPAMGMCgPavKiEzU2PGIbfx15iOIysM1noC5rky6sMKv3KaoEsrWUCEKCDa4l1z
pVu9PWpA1NjbmBoBxlOI920Lzoqcy1zC9KrZd0UD1KJhDqIPhKxM4Sn8QTT2nmq7
YR4e+8kRlm/cN9S8dMui1Nh+27rw7awzYTRkFjG+P7xwQYMDrwawOPAI605N1JKu
lf4WueCostZmVmRZx6TJzihqph1tyg==
=GKQX
-----END PGP SIGNATURE-----

--Sig_/krgtTRxlZD_NEy/LuFJ1i4r--

