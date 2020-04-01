Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895D719A3E2
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 05:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731649AbgDADLU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 23:11:20 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53533 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731611AbgDADLT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 23:11:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sWS43cL6z9sPF;
        Wed,  1 Apr 2020 14:11:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585710676;
        bh=RCS6w+XsN2y2Hr3WJXdBqRTPgGg44FN2saBcX6nSQ+c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KEmvZ8Mp87D1322Bw8TBxhvi/MCUlQmMlql4nUF3CqhHFTMMFBVUavMHUH7EatAyT
         2hUWzJ1+BmWfpdq0+T5aa879I4WAoo2tuKOBVItKSFMUMk0LJQernI0fglZ4s+PYtg
         3WcPqoRAdKgwFmV8PC0QfGAhP3Tc5CPDiD2YkXydVbI/SBqsxZmVq0+zMyS6QosE6i
         yQQAIkQ7N1fayiEZrwKEtM9/p8Y0u3Gf7T4WXCyROVgyAww7ip//gQ1qsvBvjOegXU
         Z+60oJHOn/oozfyxpyjfoXu5nSvVJk8vcdDG31ayl95cK5ryFck2YVleATg8sJmANe
         oacjOGpV1Qimg==
Date:   Wed, 1 Apr 2020 14:11:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Greg KH <greg@kroah.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drivers-x86 tree
Message-ID: <20200401141113.21014665@canb.auug.org.au>
In-Reply-To: <20200323143816.345b3d54@canb.auug.org.au>
References: <20200323143816.345b3d54@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5cBGlr0KSr6lYUqc=FgqimL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5cBGlr0KSr6lYUqc=FgqimL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 23 Mar 2020 14:38:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/platform/x86/Kconfig
>=20
> between commit:
>=20
>   45a3d578f2ed ("platform/x86: Kconfig: Group modules by companies and fu=
nctions")
>=20
> from the drivers-x86 tree and commit:
>=20
>   835e1b86ef8c ("platform/x86: touchscreen_dmi: Add EFI embedded firmware=
 info support")
>=20
> from the driver-core tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/platform/x86/Kconfig
> index ae75b19e8649,cd9e2758c479..000000000000
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@@ -1134,46 -978,54 +1134,47 @@@ config TOPSTAR_LAPTO
>   	depends on ACPI
>   	depends on INPUT
>   	select INPUT_SPARSEKMAP
>  -	help
>  -	  This driver provides support for the Intel Virtual Button interface.
>  -	  Some laptops require this driver for power button support.
>  -
>  -	  To compile this driver as a module, choose M here: the module will
>  -	  be called intel_vbtn.
>  -
>  -config INTEL_SCU_IPC
>  -	bool "Intel SCU IPC Support"
>  -	depends on X86_INTEL_MID
>  -	default y
>  +	select LEDS_CLASS
>  +	select NEW_LEDS
>   	---help---
>  -	  IPC is used to bridge the communications between kernel and SCU on
>  -	  some embedded Intel x86 platforms. This is not needed for PC-type
>  -	  machines.
>  +	  This driver adds support for hotkeys found on Topstar laptops.
>  =20
>  -config INTEL_SCU_IPC_UTIL
>  -	tristate "Intel SCU IPC utility driver"
>  -	depends on INTEL_SCU_IPC
>  -	---help---
>  -	  The IPC Util driver provides an interface with the SCU enabling
>  -	  low level access for debug work and updating the firmware. Say
>  -	  N unless you will be doing this on an Intel MID platform.
>  +	  If you have a Topstar laptop, say Y or M here.
>  =20
>  -config INTEL_MID_POWER_BUTTON
>  -	tristate "power button driver for Intel MID platforms"
>  -	depends on INTEL_SCU_IPC && INPUT
>  +config I2C_MULTI_INSTANTIATE
>  +	tristate "I2C multi instantiate pseudo device driver"
>  +	depends on I2C && ACPI
>   	help
>  -	  This driver handles the power button on the Intel MID platforms.
>  +	  Some ACPI-based systems list multiple i2c-devices in a single ACPI
>  +	  firmware-node. This driver will instantiate separate i2c-clients
>  +	  for each device in the firmware-node.
>  =20
>  -	  If unsure, say N.
>  +	  To compile this driver as a module, choose M here: the module
>  +	  will be called i2c-multi-instantiate.
>  =20
>  -config INTEL_MFLD_THERMAL
>  -       tristate "Thermal driver for Intel Medfield platform"
>  -       depends on MFD_INTEL_MSIC && THERMAL
>  -       help
>  -         Say Y here to enable thermal driver support for the  Intel Med=
field
>  -         platform.
>  +config MLX_PLATFORM
>  +	tristate "Mellanox Technologies platform support"
>  +	depends on I2C && REGMAP
>  +	---help---
>  +	  This option enables system support for the Mellanox Technologies
>  +	  platform. The Mellanox systems provide data center networking
>  +	  solutions based on Virtual Protocol Interconnect (VPI) technology
>  +	  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
>  +	  connection.
>  =20
>  -config INTEL_IPS
>  -	tristate "Intel Intelligent Power Sharing"
>  -	depends on ACPI && PCI
>  +	  If you have a Mellanox system, say Y or M here.
>  +
>  +config TOUCHSCREEN_DMI
>  +	bool "DMI based touchscreen configuration info"
>  +	depends on ACPI && DMI && I2C=3Dy && TOUCHSCREEN_SILEAD
> ++	select EFI_EMBEDDED_FIRMWARE if EFI
>   	---help---
>  -	  Intel Calpella platforms support dynamic power sharing between the
>  -	  CPU and GPU, maximizing performance in a given TDP.  This driver,
>  -	  along with the CPU frequency and i915 drivers, provides that
>  -	  functionality.  If in doubt, say Y here; it will only load on
>  -	  supported platforms.
>  +	  Certain ACPI based tablets with e.g. Silead or Chipone touchscreens
>  +	  do not have enough data in ACPI tables for the touchscreen driver to
>  +	  handle the touchscreen properly, as OEMs expect the data to be baked
>  +	  into the tablet model specific version of the driver shipped with the
>  +	  the OS-image for the device. This option supplies the missing info.
>  +	  Enable this for x86 tablets with Silead or Chipone touchscreens.
>  =20
>   config INTEL_IMR
>   	bool "Intel Isolated Memory Region support"

This is now a conflict between the drivers-x86 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5cBGlr0KSr6lYUqc=FgqimL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6EBlEACgkQAVBC80lX
0Gx3rwf8C/NMQ4Erny1vLm0SimXyCLep+qkKpsMGe/j76SLAoooPbwij3q8mc6mT
i1EN+ruVc6M5Ur0jojmXGrjmKE5AUj3qtA1PZqfOemFixinOWPQ0RtCqdKkJpwEP
oWsczD12KhXCfhNmWfS2KbtK10Bu7Gt4kerGyAjZuMoyuj4+RkFoXtwL+zIiVgk8
tEArHEdkYEDJCeKdNxxBNRt++vDBRs4AUH3wTueAbHQ87lG7Rkodj2Q4jVs+rxcl
QlbxV3RBqh02Rb/ciujFERkk/FB9KetovVxeJNy5nHXgfBz+rYXeiJGCjHEDSGII
TqDEkJiNQvWYhS8JW2D3/rGHBcMiZA==
=+4l/
-----END PGP SIGNATURE-----

--Sig_/5cBGlr0KSr6lYUqc=FgqimL--
