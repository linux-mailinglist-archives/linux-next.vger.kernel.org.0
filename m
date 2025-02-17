Return-Path: <linux-next+bounces-5466-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16AA37A37
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 04:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EB8216D7BE
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 03:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8750782899;
	Mon, 17 Feb 2025 03:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DofaAc/y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB4C2C9;
	Mon, 17 Feb 2025 03:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739764613; cv=none; b=In0pH9HVWgCh8hpWygJPddu3wLj18offm1gEFOn7jlVl40h7aWnEUibmxcPav17OjSmU0ldXVPUeUrSz7yywTIWMoFUvDeAhoQkoIDO1KWifdcaU2WHxb3k4GqZiM3m1ubnomSRFThydhONgIYzW7zOS2JsTFxiuRme1kR7C8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739764613; c=relaxed/simple;
	bh=HL9f+syMQDsFWUoQOD69NgzQ668GNBmX4e8GA0zddxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ueD0gGhOnxG+SmTwWkRTMCuPHeZMwjzjSs0cVNAZ+zSNJeEgOpnp00zmTXtjLAR6r3Neym/EWVrNnuAgtSo64MFHgv98YYgYLJ2loqXDF25Imu3nZiM9I9P/M4VFYkSKn0uAKULhkZgCEDJ/07Uo+Ri6bw4CP8kMgeKj+TAGMUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DofaAc/y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739764604;
	bh=6WSqKaFUzHhGRhLRQ9fZfQ+P24a/r+GzPC8WLMsu8qE=;
	h=Date:From:To:Cc:Subject:From;
	b=DofaAc/ygLDCrbHDSyfN+LHlAvJIlsCv+zqgByPfJH0Lsf/DujncT41U6lw6JDg/t
	 dxHvGnknPH3arPLdLCoaWxnYdabA3ukbS8BtgpR8tNWmyLkH6Fw16GVXk9YvcUrRls
	 e8XF+pFvmotW2Eunv8b0x7TyeIoOr0bx1qMybLky7lkn2diddbz1G/4IdeX7VSSoSV
	 nY2APp6NUngUznqVlLHqCyn7RnTYIvYRjrT5DEcxPnoSC/uKM1C8v+zxMOEcH693ZG
	 N582MoGT70uPnQSCos4xWYbVIq2Cb9TQh+SHxMjFtGeFQFywhoA7VX7UG6/dlVKbK0
	 aZQhqFfYdULsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yx83b1jbCz4wgp;
	Mon, 17 Feb 2025 14:56:43 +1100 (AEDT)
Date: Mon, 17 Feb 2025 14:56:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron
 <Jonathan.Cameron@Huawei.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, David Lechner <dlechner@baylibre.com>,
 Guillaume Stols <gstols@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the iio tree
Message-ID: <20250217145642.410f6a1c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ETjtAXRq3b4IjRiUOkWULIK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ETjtAXRq3b4IjRiUOkWULIK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/iio/adc/ad7606_spi.c

between commit:

  d2477887f667 ("iio: adc: ad7606: move software functions into common file=
")

from the iio tree and commit:

  8203bc81f025 ("iio: adc: ad7606: use gpiod_multi_set_value_cansleep")

from the gpio-brgl tree.

I fixed it up (code was moved so I used the former version of this file
and applied the following merge resolution patch) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

=46rom a1072aac97bdaf3042fe2def4d7e6e7fa928cfbd Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Feb 2025 14:52:30 +1100
Subject: [PATCH] fix up for "iio: adc: ad7606: use gpiod_multi_set_value_ca=
nsleep"

interacting with commit

  d2477887f667 ("iio: adc: ad7606: move software functions into common file=
")

from the iio tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/iio/adc/ad7606.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index cb3de1bd15b4..7d83bb320249 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -1259,10 +1259,9 @@ static int ad7606b_sw_mode_setup(struct iio_dev *ind=
io_dev)
 	 * in the device tree, then they need to be set to high,
 	 * otherwise, they must be hardwired to VDD
 	 */
-	if (st->gpio_os) {
-		gpiod_set_array_value(st->gpio_os->ndescs, st->gpio_os->desc,
-				      st->gpio_os->info, os);
-	}
+	if (st->gpio_os)
+		gpiod_multi_set_value_cansleep(st->gpio_os, os);
+
 	/* OS of 128 and 256 are available only in software mode */
 	st->oversampling_avail =3D ad7606b_oversampling_avail;
 	st->num_os_ratios =3D ARRAY_SIZE(ad7606b_oversampling_avail);
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/ETjtAXRq3b4IjRiUOkWULIK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeys3oACgkQAVBC80lX
0GwLPwf/Vm8RAVS4wYoBjAGzMTl0fH//QQTldi0Lwc93QWYUsOXPW39BAb+uheSZ
Cts1fErqPU/ifcwBZJqDwA23SXQm1tW2vVf+fc7OI0qt/F7+T5mE4OE7kArHB4s3
TlOUaIShSY77UMTwUA45c2VlRLvnpXbXdJWouL6hfxVmq6UrHOKb9BAKYhGgMmiQ
38wxkbvJgxw2typLvkKfHo4y7CVXfJtejS3W3PV0HMzBg/h+XHRGKWh2Z3ZA2yCq
2zK4Vxg19tSBfqIdx4Q5Azii4pLkWhldLBh/zB9/GAyLrOPtTHASBmo7T4sOyaj6
rOj+lq4ConYNazta9rYikd8e9Ti/KA==
=uP9N
-----END PGP SIGNATURE-----

--Sig_/ETjtAXRq3b4IjRiUOkWULIK--

