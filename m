Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C377818EE90
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 04:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgCWDi0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Mar 2020 23:38:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37435 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726979AbgCWDi0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Mar 2020 23:38:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48m0TV55Kkz9sR4;
        Mon, 23 Mar 2020 14:38:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584934703;
        bh=uPCNoVEw+QAUy93lHSU8pF9nTZf1T0t1eG2TShFgHs8=;
        h=Date:From:To:Cc:Subject:From;
        b=YCB0w4xVdG5QzA+Q8SlpD+JA4Q//qAbKYOqM87LOUhrlXiIJV1l+7B5OlKBKuFZSe
         RuUvIOFnYJ0XC7qZSQk3vZ5wegG6rxqCizZnOufjl3HIJ06QXmjX6R1uoEpTyPQ3vj
         lhHR/PsBJATIOkLNzaq25IKPt+oonLdHtLz+tBj70bAWsAt5W5tjuxcaRKiHA7CANT
         7m9qYQJkCtFsHpCCl+gqEWoNvHDgr7JvAwOBq89Wn3dV02oIXsRuasdsYo2xOP5TNc
         10PZwFgnNtxJwM2UKGN873OvGVPJxpNlIERcFvaNRvfOEjTl3FioByytyoiqVZkXez
         DeKAVXbWyBw/A==
Date:   Mon, 23 Mar 2020 14:38:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: linux-next: manual merge of the driver-core tree with the
 drivers-x86 tree
Message-ID: <20200323143816.345b3d54@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/soBEOiYHNlehT2faRHoYIpf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/soBEOiYHNlehT2faRHoYIpf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/platform/x86/Kconfig

between commit:

  45a3d578f2ed ("platform/x86: Kconfig: Group modules by companies and func=
tions")

from the drivers-x86 tree and commit:

  835e1b86ef8c ("platform/x86: touchscreen_dmi: Add EFI embedded firmware i=
nfo support")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/platform/x86/Kconfig
index ae75b19e8649,cd9e2758c479..000000000000
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@@ -1134,46 -978,54 +1134,47 @@@ config TOPSTAR_LAPTO
  	depends on ACPI
  	depends on INPUT
  	select INPUT_SPARSEKMAP
 -	help
 -	  This driver provides support for the Intel Virtual Button interface.
 -	  Some laptops require this driver for power button support.
 -
 -	  To compile this driver as a module, choose M here: the module will
 -	  be called intel_vbtn.
 -
 -config INTEL_SCU_IPC
 -	bool "Intel SCU IPC Support"
 -	depends on X86_INTEL_MID
 -	default y
 +	select LEDS_CLASS
 +	select NEW_LEDS
  	---help---
 -	  IPC is used to bridge the communications between kernel and SCU on
 -	  some embedded Intel x86 platforms. This is not needed for PC-type
 -	  machines.
 +	  This driver adds support for hotkeys found on Topstar laptops.
 =20
 -config INTEL_SCU_IPC_UTIL
 -	tristate "Intel SCU IPC utility driver"
 -	depends on INTEL_SCU_IPC
 -	---help---
 -	  The IPC Util driver provides an interface with the SCU enabling
 -	  low level access for debug work and updating the firmware. Say
 -	  N unless you will be doing this on an Intel MID platform.
 +	  If you have a Topstar laptop, say Y or M here.
 =20
 -config INTEL_MID_POWER_BUTTON
 -	tristate "power button driver for Intel MID platforms"
 -	depends on INTEL_SCU_IPC && INPUT
 +config I2C_MULTI_INSTANTIATE
 +	tristate "I2C multi instantiate pseudo device driver"
 +	depends on I2C && ACPI
  	help
 -	  This driver handles the power button on the Intel MID platforms.
 +	  Some ACPI-based systems list multiple i2c-devices in a single ACPI
 +	  firmware-node. This driver will instantiate separate i2c-clients
 +	  for each device in the firmware-node.
 =20
 -	  If unsure, say N.
 +	  To compile this driver as a module, choose M here: the module
 +	  will be called i2c-multi-instantiate.
 =20
 -config INTEL_MFLD_THERMAL
 -       tristate "Thermal driver for Intel Medfield platform"
 -       depends on MFD_INTEL_MSIC && THERMAL
 -       help
 -         Say Y here to enable thermal driver support for the  Intel Medfi=
eld
 -         platform.
 +config MLX_PLATFORM
 +	tristate "Mellanox Technologies platform support"
 +	depends on I2C && REGMAP
 +	---help---
 +	  This option enables system support for the Mellanox Technologies
 +	  platform. The Mellanox systems provide data center networking
 +	  solutions based on Virtual Protocol Interconnect (VPI) technology
 +	  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
 +	  connection.
 =20
 -config INTEL_IPS
 -	tristate "Intel Intelligent Power Sharing"
 -	depends on ACPI && PCI
 +	  If you have a Mellanox system, say Y or M here.
 +
 +config TOUCHSCREEN_DMI
 +	bool "DMI based touchscreen configuration info"
 +	depends on ACPI && DMI && I2C=3Dy && TOUCHSCREEN_SILEAD
++	select EFI_EMBEDDED_FIRMWARE if EFI
  	---help---
 -	  Intel Calpella platforms support dynamic power sharing between the
 -	  CPU and GPU, maximizing performance in a given TDP.  This driver,
 -	  along with the CPU frequency and i915 drivers, provides that
 -	  functionality.  If in doubt, say Y here; it will only load on
 -	  supported platforms.
 +	  Certain ACPI based tablets with e.g. Silead or Chipone touchscreens
 +	  do not have enough data in ACPI tables for the touchscreen driver to
 +	  handle the touchscreen properly, as OEMs expect the data to be baked
 +	  into the tablet model specific version of the driver shipped with the
 +	  the OS-image for the device. This option supplies the missing info.
 +	  Enable this for x86 tablets with Silead or Chipone touchscreens.
 =20
  config INTEL_IMR
  	bool "Intel Isolated Memory Region support"

--Sig_/soBEOiYHNlehT2faRHoYIpf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl54LykACgkQAVBC80lX
0GzxtQf+JK3ShCaIYV88xyxISKZVa76jagYjeFTU3hdgMR8H94jX3ui4NV3ZcmEI
iQxykJ/XPw2KRF6YJ/BaCEdc3zX+ECXWu5V7xDzVPK84z79nN107Vy5khJbu0hmZ
qERT1FjIVAgw8RUTqma6sO9AebpUKlNaHpFA+Z0VPzpXvJ0X5cI7jUm6mdHiBEQX
5+CUgSmdV16SQq48X09WcRGs1Bp6ZbeHKwcWTt73hqOab3gnva85Ql9FaV2lscuy
WFl6+zlmPh07V7yJdgXRXFR5aiueMNVtT3MTq1nhI1P6bv38boMY9ilr9m9JWIxe
shCJeQ9+y/SvtBvw1eF8UL7oIYOmxg==
=F02p
-----END PGP SIGNATURE-----

--Sig_/soBEOiYHNlehT2faRHoYIpf--
