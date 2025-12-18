Return-Path: <linux-next+bounces-9462-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D16DACCAA63
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 08:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABAA430B212A
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 07:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96877328B4D;
	Thu, 18 Dec 2025 07:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HQ3JaF+7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E9C31D750;
	Thu, 18 Dec 2025 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042338; cv=none; b=Grqmhv9UwEfBAArKzVTvDuvmBT4o8ym6LrkoXwri1YZe4L3UbVsMmLikY2lSVMfeuZoAVZnA3JfwIRigXBLs1LgwS1epy6JW2DgQ9lIxqUXxVQ4ifF13AGPrGpJrlpmQoFcivfFJxS0bOAxxym1SuuiDeD0wzmoD27WvgMIwlNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042338; c=relaxed/simple;
	bh=tUZgC0jEYNQRSOPwlfKJ/5QBXCW7Jbz0c5sY8//ezd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gz3graIhZc3unA7eNs1A89P36POP3+A8IG8Sdk/YsCMVUQqb6KCPAFRb4zIaTrQDzI4aHVsJR7OqVsUJdk8V+kmk04DIiiNdh5U/QCQMWjad2zF+FXNn14os2nFWt7lqzsMBpFej9W7yerk0huLZS7IMCdx2jMMML0wvWC1QJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HQ3JaF+7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766042331;
	bh=dV2QF3aZTvcrLSnBc8QTRuWUVaq6WHoSpjHOlOgycio=;
	h=Date:From:To:Cc:Subject:From;
	b=HQ3JaF+7KlY/qNc0ezSOWgQ/zCllILbS27CJcPcpJG6gg/XvAGGxaTtmxlMcUzB3Z
	 6ZTQmAN0sJIlk+rBgn9/9uSSy9Hq56Us60AizDQ2tz7RIoj0xy/9lsjJ6Bzh/8g7/+
	 eMMMvE1ahViCtnAZ5MVEAr12UWQcpYDrVCOearW6lyk9lMmB5siOyDbMVJQa6rrhKG
	 vGE1HR0ai2mOP095uLMpv9xBB9wr/imI5SL6IJrv3ZCnKwHVm39ACjkkN5U1MX5tDm
	 z3M03PbXlwZSBDO2S86kvHEGRDbe3zjrdPTQn2e4YZ96KUVdg6TC4SaCwzuTCkF2SD
	 1OGk7DLyydv6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dX28W5ZlCz4wD7;
	Thu, 18 Dec 2025 18:18:51 +1100 (AEDT)
Date: Thu, 18 Dec 2025 18:18:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rosen Penev
 <rosenp@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <20251218181850.5d69e0ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Uxe7gzbheSgURev++ILIqsx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Uxe7gzbheSgURev++ILIqsx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio-brgl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpio/gpio-realtek-otto.c: In function 'realtek_gpio_probe':
drivers/gpio/gpio-realtek-otto.c:375:21: error: cast from pointer to intege=
r of different size [-Werror=3Dpointer-to-int-cast]
  375 |         dev_flags =3D (unsigned int) device_get_match_data(dev);
      |                     ^
cc1: all warnings being treated as errors

Caused by commit

  3203d8f573af ("gpio: realtek-otto: add COMPILE_TEST")

I have used the gpio-brgl tree from next-20251217 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Uxe7gzbheSgURev++ILIqsx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDqtoACgkQAVBC80lX
0GyNSQgAgJPoyoCA+7jkCLqLvN2mYqCK3otjQC/GEyuVoFUGG4Zh5/L/5yhokMgm
a5wGfejkC+bA12UT2yPXAR/RswglaeoOA0JH2vzBhPximzDTmcRLTueVWpkRQw7h
Ra+h7iOGj/w8/azJQZUoO5LRh4hNKL4Jzgrlu3ayvzT84mUiXmRV8rK+gy/ocnyd
gTUYfWa9AwXXd3jG5XvI4pg286Zho7WaOZyk5hEi1Z9/LF6PlEjBlpdqjXkRp6hl
XWdT4vXX4LZdt43jY6B9r3jJAq8vgTo7D0a89TWB59KSs1pFjbRk/qoWREri6SZE
sLaRCq9Cvqs1mlpoN0wzCIVpS+6xdA==
=s7G2
-----END PGP SIGNATURE-----

--Sig_/Uxe7gzbheSgURev++ILIqsx--

