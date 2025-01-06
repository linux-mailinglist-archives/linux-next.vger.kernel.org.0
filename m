Return-Path: <linux-next+bounces-5040-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F2AA01E7F
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963FA1884F7A
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 04:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A08373451;
	Mon,  6 Jan 2025 04:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="q7rF8Ub5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE043EEB1;
	Mon,  6 Jan 2025 04:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736137273; cv=none; b=m1iUZCXxlc/69G8wJeSYsZCYdYmJHIPbpQT4QQ4e59fXe1tpIqCoqTlYVVQzG8Ny7vh4DjK+dybn1k10f5u6+p6dMowlUSj0YvkWy9oe67AirOCqoEfxuHfWj+bzZH2pBQMBP1rMDzsGhoBj+w4wHupdPaCTv8rv/r8F2F2WP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736137273; c=relaxed/simple;
	bh=YNwW0IW4Si6JmvkJ90aEFq0JEcpt1lgJB66vgLOnizU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I0dh/aV4Y7Cyf5jFoXGBqOcTc2O1k8G9H9lYshdrsIP2wHfhNzNWNXdLh200nMgg9lUAmdj68JkF6faexfocsrx0FOfKfkrv46cXNCb9A0+vePM00/xRNm+QLXJnnobIFY8XtTLFzOaLlyq+rTbNCgOSKmvTrxGUzNAEseN6QB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=q7rF8Ub5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736137262;
	bh=gjz87SQG9RQ2xo8jkjgzZlBRW+zLRK6aj48XF6VNUPI=;
	h=Date:From:To:Cc:Subject:From;
	b=q7rF8Ub5sskDdUkwvoX/uc4/pUEJxNkpKoexV1L12ejPEHYthqm9d/ekbv+iognXp
	 NntDY8w8aAv367DXO/QW0cIkD+947Stlt+9bDfvyIHw1FF2eisODChLVtVP3NK/Thn
	 PTMgeDA/sI+oJ3yt1MMXln4su7ONKSmQuTpI8FBThXzNryT3VivMUjonL+Mpoib7kt
	 AW/4wmwoExdtrvLUJhHJL1AFTzUSTfPxZjp5W3PisjHoZV8zwU3gKSeYx3H5LaPNFs
	 hWXqdEDP60VHYH4er9HVvMBSXiOqjADZgLGVnxRtnUw2xts7YQk3gwsPEzNIaMj+8y
	 ZG8ZWnNTdNfWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRLb16RwXz4wyw;
	Mon,  6 Jan 2025 15:21:01 +1100 (AEDT)
Date: Mon, 6 Jan 2025 15:21:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Greg KH
 <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iio tree with the char-misc.current
 tree
Message-ID: <20250106152107.2c0fc03c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7RPA0i1oKQhO4I5dgnjL=xa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7RPA0i1oKQhO4I5dgnjL=xa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/adc/ti-ads1119.c

between commit:

  54d394905c92 ("iio: adc: ti-ads1119: fix sample size in scan struct for t=
riggered buffer")

from the char-misc.current tree and commit:

  2cfb4cd058d0 ("iio: adc: Use aligned_s64 instead of open coding alignment=
.")

from the iio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/iio/adc/ti-ads1119.c
index c268e27eec12,0a68ecdea4e6..000000000000
--- a/drivers/iio/adc/ti-ads1119.c
+++ b/drivers/iio/adc/ti-ads1119.c
@@@ -500,8 -500,8 +500,8 @@@ static irqreturn_t ads1119_trigger_hand
  	struct iio_dev *indio_dev =3D pf->indio_dev;
  	struct ads1119_state *st =3D iio_priv(indio_dev);
  	struct {
 -		unsigned int sample;
 +		s16 sample;
- 		s64 timestamp __aligned(8);
+ 		aligned_s64 timestamp;
  	} scan;
  	unsigned int index;
  	int ret;

--Sig_/7RPA0i1oKQhO4I5dgnjL=xa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7WjMACgkQAVBC80lX
0GxLeAf9GFf3gCpVYGBcVK2yWXYuW5UwQS+fKZm1XuU0kKUg+Fs3V1kWt6R+9hVN
S2vEXTwE+ku/iTyHVMDRX/2ajXPWCFnERj75M7BViEqQI2HvoolONmBgp4hdB4Gb
s6PetQgU2kVBjQui0Vrrt/LokFybIq//5HlQCSjMi0SK/OmW0tdk3bnkJ2DLtLTx
k5ni8r7/a/oLecdHSpKxeyXDSd5xbg4lCISasdft48M3ogD/7i6s4HVKuKUXnEBs
z6W9xoP8iv1Lj/kooi+ehKeVy8a0JYqJlMFF8HT5KozH4vIykz/sEFM47eVg+iLe
cbqInncwsjNBkwMbKY/oeXmA+K3eUA==
=SLuE
-----END PGP SIGNATURE-----

--Sig_/7RPA0i1oKQhO4I5dgnjL=xa--

