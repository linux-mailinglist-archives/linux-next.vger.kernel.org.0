Return-Path: <linux-next+bounces-9646-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A9D1B70D
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 22:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63FEB302356F
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 21:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E1E34F256;
	Tue, 13 Jan 2026 21:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IDVqEVG6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBAE34F27B;
	Tue, 13 Jan 2026 21:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340265; cv=none; b=HX5MpfrMtppjPk3DEScsJXiUfy/AhyDIkUkNDK1xC6DP5L/Mi0xTadFPEsEILa2VPkJyEqcvjfHnJ85LzwfPvdZmY0122BOhrbAg55JZMQoG5Mz8m9rHcBhF+Z9J5w5Xum+aqKyaXykk9m+U+D0OQ91em2JXKFUol4h68o5EaO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340265; c=relaxed/simple;
	bh=tzNQ3oLBJOSthJHEafTcKe7f5NffZZWfQ6DWAzlkM3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ACBJi9n/QfdQmZPr/gd6umOyXG2SqYu4pQ3ZWmJ1tkMCsAJzxwfnOBi7rSUlMqacUZ1emc18IEY6lK7OQ2mBVsOQP2mECrRGBmhF2Lvw5eNWj3HjPrbXknxcS5batk962ikheMaC4U3iNGsoH5le2oFvtDNZ3foIzBai+WfbXSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IDVqEVG6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768340252;
	bh=g2vSNG6UXv1HHFCbTfzyrj3hLCZrnccXgkM0XZ6Ewhs=;
	h=Date:From:To:Cc:Subject:From;
	b=IDVqEVG6/SsiEd9LEZ4IwkJrJ/SpiXxOC2F5WmwvAbvlq9LKoP7xfqVNLx4f7a//2
	 3AcYznSIU55HSa+ujVxzHtCec7fOzOUU/X7NKjw7IkP8oF4zYWohuPpbnw0UxrW24M
	 PVafGRA3aeOCpWljfgOlwJ3jn3aPDrA7rLUEkWJSFHDZ7QZ9Is3CTQDEN9NFXPM3zc
	 /wax4GoRXKYJguabtaJPFME+RiJnGs207RHj49eZeSpinlVRiS093A2A5J8Vwypded
	 X2oYQeW4P2kIlMIDMZXHa5GxvQHDIEfAyYpgQAE7mGLA09TCQ4eO5L/KP4yeuSgmp0
	 ml90YuvewVk+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drMzH6KT7z4wDk;
	Wed, 14 Jan 2026 08:37:31 +1100 (AEDT)
Date: Wed, 14 Jan 2026 08:37:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Felix Gu <gu_0233@qq.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the spi tree
Message-ID: <20260114083730.4e405e1f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MKfnQr+6x_LTT3CYZW4FXQu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MKfnQr+6x_LTT3CYZW4FXQu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  383d4f5cffcc ("spi: spi-sprd-adi: Fix double free in probe error path")

Fixes tag

  Fixes: ac17750 ("spi: sprd: Add the support of restarting the system")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/MKfnQr+6x_LTT3CYZW4FXQu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlmuxsACgkQAVBC80lX
0GzMnggAlM3bYpHK2utmh15k6jlCzIf8fD8tH8g2PZS42aobjIDXEe6hpe7qKNeK
lXvQ3qHBrcFrU3JErP4Lql58STx7Ri3RD4mdmDaBzlYLXN+On+/RpTp4ZXjJ+ALd
KypEZSS4sWiJoSTzA825h7Ydi70YeC6GBZlH/s2s5A6ua9SznjH1sgxLprXKVZsu
1LPl5m5OS39taR12B85Paj6xf83Ua+FtWGMhmcBWp2WiVaSJB1kEf1uFLlPxWcnt
lCIhkbLSIXOlYk1piuOY/i/Zn0ELbRmUGBiZQ+4p4e+Qfygfsd6du2WpcPuRxANs
8PZFAYAB2j1bI/XBv7Kjq2Phz/kaDA==
=eEPA
-----END PGP SIGNATURE-----

--Sig_/MKfnQr+6x_LTT3CYZW4FXQu--

