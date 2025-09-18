Return-Path: <linux-next+bounces-8374-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4EAB85345
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 16:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E33CF3B5458
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 14:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F1930DED3;
	Thu, 18 Sep 2025 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHO7PII1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B87314D28;
	Thu, 18 Sep 2025 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204950; cv=none; b=pDh90ijOzMneTd0dfrNgWT4gwBMQhQnTsvACLtFJIRwOHq1CZ4UNlMNZatmXJeARHvJmqVLEeZ+1B62hE/yj7P7gPcD8KVCtTZg2CS/7GJVhkyNqAVx1sz1aJuGt48738Kw3oUc6JrjtOcYA3MWb9yNZVkFSZq3kOUCFlWI2AyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204950; c=relaxed/simple;
	bh=MBjb3dNG3tkBuBacJDOOMyqs0vjIlyjvFY8EUa5pvX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9QFRD199c1GY2tiNJUMzkSD/dkMHLSZjVoVU6R66jU9X4tI5RpWNgSyM6xIbozUaCwPYxfSsz/reFMQVOf/evuu0UXnT8A2B1V39lQiemE//USu4OfORibEU48OjMwjYocW4C/kS+gIpTDmmjgTBHrdgKF8h43UpkaRXvMIDqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHO7PII1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9752FC4CEE7;
	Thu, 18 Sep 2025 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758204950;
	bh=MBjb3dNG3tkBuBacJDOOMyqs0vjIlyjvFY8EUa5pvX4=;
	h=Date:From:To:Cc:Subject:From;
	b=MHO7PII1MmiBquTUz1ni8U+YKzkdedbpjjU/j8sr26+vZ6THi+ZZRnMu949QjVBXU
	 o11BxieZf0WqmQsIMSHLKoO9L/ZT5+JZzoSbcFI/4dwq44NluBAK6DSRmWQYEOkIEN
	 S0SKDHY0P+yAeLh6fQT1GRb/o7rZodYtoQ6CtDwFaP/IKEM5h62pZgbZ1RPwC/qOOR
	 8IUjoGF0ISX2QHVCZ+wpiVpfD0ZnCBP/Xjre7bqwdS4nMlXYFZiQ67Uyu3VhIF2BpA
	 g4WFXRo3WCr7wTv/wNoZpGV3XUc6756koA3jQ0afeI5iZv2ehbl7a20osbQloUvHRE
	 37mh5CEGEKO7Q==
Date: Thu, 18 Sep 2025 15:15:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Lee Jones <lee@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ming Yu <a0282524688@gmail.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the usb tree
Message-ID: <aMwUEV6nY4AaJT8X@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f1cBj7XY7g+wQXvZ"
Content-Disposition: inline


--f1cBj7XY7g+wQXvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/i2c/busses/Kconfig

between commit:

  daf161343a390 ("i2c: Add Intel USBIO I2C driver")

=66rom the usb tree and commit:

  c5cf27dbaeb6e ("i2c: Add Nuvoton NCT6694 I2C support")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/i2c/busses/Kconfig
index 9921fd9ea0983,63a2b5a9abc39..0000000000000
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@@ -1357,17 -1357,16 +1357,27 @@@ config I2C_LJC
  	  This driver can also be built as a module.  If so, the module
  	  will be called i2c-ljca.
 =20
+ config I2C_NCT6694
+ 	tristate "Nuvoton NCT6694 I2C adapter support"
+ 	depends on MFD_NCT6694
+ 	help
+ 	  If you say yes to this option, support will be included for Nuvoton
+ 	  NCT6694, a USB to I2C interface.
+=20
+ 	  This driver can also be built as a module. If so, the module will
+ 	  be called i2c-nct6694.
+=20
 +config I2C_USBIO
 +	tristate "Intel USBIO I2C Adapter support"
 +	depends on USB_USBIO
 +	default USB_USBIO
 +	help
 +	  Select this option to enable I2C driver for the INTEL
 +	  USBIO driver stack.
 +
 +	  This driver can also be built as a module.  If so, the module
 +	  will be called i2c_usbio.
 +
  config I2C_CP2615
  	tristate "Silicon Labs CP2615 USB sound card and I2C adapter"
  	depends on USB
diff --cc drivers/i2c/busses/Makefile
index 401a79c9767e6,fe8cf6325fc98..0000000000000
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@@ -135,7 -135,7 +135,8 @@@ obj-$(CONFIG_I2C_GXP)		+=3D i2c-gxp.
  obj-$(CONFIG_I2C_DIOLAN_U2C)	+=3D i2c-diolan-u2c.o
  obj-$(CONFIG_I2C_DLN2)		+=3D i2c-dln2.o
  obj-$(CONFIG_I2C_LJCA)		+=3D i2c-ljca.o
+ obj-$(CONFIG_I2C_NCT6694)	+=3D i2c-nct6694.o
 +obj-$(CONFIG_I2C_USBIO)		+=3D i2c-usbio.o
  obj-$(CONFIG_I2C_CP2615) +=3D i2c-cp2615.o
  obj-$(CONFIG_I2C_PARPORT)	+=3D i2c-parport.o
  obj-$(CONFIG_I2C_PCI1XXXX)	+=3D i2c-mchp-pci1xxxx.o

--f1cBj7XY7g+wQXvZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjMFBEACgkQJNaLcl1U
h9Aa2wf8CT743rTsxr1EZVGbNF/Pp+0WO+VJoOkU4atIrIMnmtHy3IZTadUqK+zj
szb7jhwkGUCx1VYOzaPR6Uh9794aG/go8iYA2rdehtDijd8A4JZSp1kBFEYtPYwi
Xbnl/Uz+T+o8EffPVjtVJVHAxmEMcjgLbi6jJRnjlDvXuOVkWkImafklJwAHt7h4
xUE+A1yyAvuRlMvfVnT6qFIWSkaf9iYCqYGgdYpWmK/hrn3Xg9tkut511rMW01rL
DwE+dZFWKGb+b6mbaqMxTO0sOeMFpRGO//jacGptdcZGF4bAF7xY7jApVXjA4W7Q
Lk2UrVh8/pllgVmNYNo8uVGOoGHhFA==
=+den
-----END PGP SIGNATURE-----

--f1cBj7XY7g+wQXvZ--

