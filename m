Return-Path: <linux-next+bounces-6537-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CBFAABBA9
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09393B3864
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 07:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6140A278761;
	Tue,  6 May 2025 05:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OKtjI1mQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D922A4D6;
	Tue,  6 May 2025 05:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510697; cv=none; b=OY1SFTmbogiHEIA/4jL8iZF38Mbt86cRQiQRNwKHddCeKU/yYToQChSZblSIZsVJT9rBI7XWHHaH4j3KplU5LvxHXViOxjqVNR91+un4siSEJ8vW5aEEhrsYl3K2CilFQfoockU4Xo01CYdSRp4atNXjnLzi+MPkNY6fkXT2lBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510697; c=relaxed/simple;
	bh=s6cBSkVGsEFxwDWF90N1a+nEVWSskSv7ojPB+C5dVbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m/PdVSUeEYXEv7ROXFIxvMgQle985VA0h0R5i77EMrAVbT1Fdq1vq/diNZzW3OJtY241cq+0Nc1RJUpq23JNV9V8IpwM6ak5yH9HKxZE0ZbQaDdNSMoD9eTn9hMHu5uxqh6FIlb5i8upek9686EOUrnWxasO0W5dlhJeeqEMNaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OKtjI1mQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746510688;
	bh=YpZZTtpWmhtS6HWeWM6IrwvDGHJJlAXrxq0GquhCK0k=;
	h=Date:From:To:Cc:Subject:From;
	b=OKtjI1mQKaopMFJMTG824D3RkNTeXmC7MS0cTn3bsAndDgCVu2XJ11uZq86+VNlWU
	 xiw8pTk3fy46ICSmQGXMZyxvOW1TRSbYlrhswV3GfaYGBPoLqQYESn1dnvLyVXZVHn
	 SVv43ZPJcgXwknY5xsi99wH56QYeLz3hvDqxn912+FtOcfG0leivYusdVldrTcCu1u
	 7m5IEQoNi3IsSiEuOcdaK9+cEcNmwulcblWL/0BvufAgfQNuoz0oPY1i4hMmJd7B/e
	 +mnKfYM3pnbZePOcxgPVy+Va3zg/j4IFJu35HLhnkzTwryxHtYgEtmTwzsqjKYMdK6
	 xqmz3hEjSoYrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zs6w00Gngz4wyh;
	Tue,  6 May 2025 15:51:27 +1000 (AEST)
Date: Tue, 6 May 2025 15:51:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Arthur-Prince <r2.arthur.prince@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mariana =?UTF-8?B?VmFsw6lyaW8=?=
 <mariana.valerio2@hotmail.com>, Tobias Sperling
 <tobias.sperling@softing.com>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <20250506155126.50ba1efb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nsy2QQUnWclVhEC+H18FDAT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Nsy2QQUnWclVhEC+H18FDAT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/adc/Kconfig

between commit:

  169eaf9ccfb0 ("iio: adc: ti-ads1298: Kconfig: add kfifo dependency to fix=
 module build")

from the iio-fixes tree and commit:

  0de3748d80f3 ("iio: adc: sort TI drivers alphanumerical")

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

diff --cc drivers/iio/adc/Kconfig
index b7aac84e5224,ad06cf556785..000000000000
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@@ -1512,6 -1546,41 +1547,42 @@@ config TI_ADS111
           This driver can also be built as a module. If so, the module wil=
l be
           called ti-ads1119.
 =20
+ config TI_ADS124S08
+ 	tristate "Texas Instruments ADS124S08"
+ 	depends on SPI
+ 	select IIO_BUFFER
+ 	select IIO_TRIGGERED_BUFFER
+ 	help
+ 	  If you say yes here you get support for Texas Instruments ADS124S08
+ 	  and ADS124S06 ADC chips
+=20
+ 	  This driver can also be built as a module. If so, the module will be
+ 	  called ti-ads124s08.
+=20
+ config TI_ADS1298
+ 	tristate "Texas Instruments ADS1298"
+ 	depends on SPI
+ 	select IIO_BUFFER
++	select IIO_KFIFO_BUF
+ 	help
+ 	  If you say yes here you get support for Texas Instruments ADS1298
+ 	  medical ADC chips
+=20
+ 	  This driver can also be built as a module. If so, the module will be
+ 	  called ti-ads1298.
+=20
+ config TI_ADS131E08
+ 	tristate "Texas Instruments ADS131E08"
+ 	depends on SPI
+ 	select IIO_BUFFER
+ 	select IIO_TRIGGERED_BUFFER
+ 	help
+ 	  Say yes here to get support for Texas Instruments ADS131E04, ADS131E06
+ 	  and ADS131E08 chips.
+=20
+ 	  This driver can also be built as a module. If so, the module will be
+ 	  called ti-ads131e08.
+=20
  config TI_ADS7138
  	tristate "Texas Instruments ADS7128 and ADS7138 ADC driver"
  	depends on I2C

--Sig_/Nsy2QQUnWclVhEC+H18FDAT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZo14ACgkQAVBC80lX
0Gwp4gf/cVuCd2T9TwoQYAaS4D2BsGgbf5QCgTBfOTOqmds04e3XUmzrOpDwNabb
gu8hYDM//1M0rQuTW975+4gxcIls3dhDoEncim741ZIPKN7CKl4IP8Zszoq2EImP
012ULkukC7/J+ZShpZWI+yYubciKADYtolgX+sKZD2tgX7rg/wx/Q8OblYSHyP+Z
Y86IvWZlSpfbv2kNCtj1nuIhs315rjXdi2+jyzcQ8dPWRXKr7WxS45v1rIKyIGD1
u3c/VdBM0dANfZLiChp2gF9fUSmMh8d6xU147IvkqeNuNHzSLE8zHHm1UE0eQmng
fdUfRzpkesQNX/Z/yHTkL4mM/hJ8fQ==
=5wle
-----END PGP SIGNATURE-----

--Sig_/Nsy2QQUnWclVhEC+H18FDAT--

