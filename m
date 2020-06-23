Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4289E2068A7
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 01:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387607AbgFWXuM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 19:50:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38443 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387520AbgFWXuL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 19:50:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49s31D3pffz9sRN;
        Wed, 24 Jun 2020 09:50:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592956208;
        bh=rIYUqM55iZRUKTgs1OeVsUpfCHoMePynkq5HGZEaoRc=;
        h=Date:From:To:Cc:Subject:From;
        b=H53XN9E0sKRnF9ANEyixCPVRwQ4YxmH5dXH5uRImzLNdMnl7nZl4VanMefGqpZr1d
         P9Je1hOoHdqJ+oYu/z5CZUsc/4TIZrxXzFjRsLvxXjn0RWEx2gZoWopoFjEgPuuE7S
         BNY4+2KkeF0EUgiaNt5b7Ty+zHP9/kM9TJmRn+SLaeK/PGR8pz5f1d14IMzyUSbo7t
         asgc4ZvgoxxzHJ5mQwxUPuuFR+xQU/Tp/VnplCnxpvPVWW+CT9EXCO+AOQCVTrsGuI
         jGadgedHWWjyPgpxp0XXHDmEp4NpKJ2q1XwPvmCohqVgFAMmB2/Iuu1J9w2zFiVPCZ
         n2jCRu1ztkfsw==
Date:   Wed, 24 Jun 2020 09:50:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Subject: linux-next: build warnings after merge of the imx-mxs tree
Message-ID: <20200624095007.141f0357@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oWW0+F3PNWuSrDmudtXDoce";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oWW0+F3PNWuSrDmudtXDoce
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the imx-mxs tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:350.4-27: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0:reg: property has invalid length (20 byt=
es) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:353.5-28: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0:reg: property has invalid len=
gth (20 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:356.6-29: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0:reg: property has =
invalid length (20 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6dl-gw53xx.dtb: Warning (pci_device_bus_num): Failed p=
rerequisite 'reg_format'
arch/arm/boot/dts/imx6dl-gw53xx.dtb: Warning (i2c_bus_reg): Failed prerequi=
site 'reg_format'
arch/arm/boot/dts/imx6dl-gw53xx.dtb: Warning (spi_bus_reg): Failed prerequi=
site 'reg_format'
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:349.14-360.5: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #ad=
dress-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:349.14-360.5: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #si=
ze-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:352.15-359.6: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0: Relying on =
default #address-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:352.15-359.6: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0: Relying on =
default #size-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:355.22-358.7: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0: =
Relying on default #address-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:355.22-358.7: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0: =
Relying on default #size-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:407.4-27: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0:reg: property has invalid length (20 byt=
es) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:410.5-28: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0:reg: property has invalid len=
gth (20 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:413.6-29: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0:reg: property has =
invalid length (20 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6dl-gw54xx.dtb: Warning (pci_device_bus_num): Failed p=
rerequisite 'reg_format'
arch/arm/boot/dts/imx6dl-gw54xx.dtb: Warning (i2c_bus_reg): Failed prerequi=
site 'reg_format'
arch/arm/boot/dts/imx6dl-gw54xx.dtb: Warning (spi_bus_reg): Failed prerequi=
site 'reg_format'
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:406.14-417.5: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #ad=
dress-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:406.14-417.5: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #si=
ze-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:409.15-416.6: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0: Relying on =
default #address-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:409.15-416.6: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0: Relying on =
default #size-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:412.22-415.7: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0: =
Relying on default #address-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:412.22-415.7: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0: =
Relying on default #size-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:350.4-27: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0:reg: property has invalid length (20 byt=
es) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:353.5-28: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0:reg: property has invalid len=
gth (20 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:356.6-29: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0:reg: property has =
invalid length (20 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6q-gw53xx.dtb: Warning (pci_device_bus_num): Failed pr=
erequisite 'reg_format'
arch/arm/boot/dts/imx6q-gw53xx.dtb: Warning (i2c_bus_reg): Failed prerequis=
ite 'reg_format'
arch/arm/boot/dts/imx6q-gw53xx.dtb: Warning (spi_bus_reg): Failed prerequis=
ite 'reg_format'
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:349.14-360.5: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #ad=
dress-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:349.14-360.5: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #si=
ze-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:352.15-359.6: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0: Relying on =
default #address-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:352.15-359.6: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0: Relying on =
default #size-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:355.22-358.7: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0: =
Relying on default #address-cells value
arch/arm/boot/dts/imx6qdl-gw53xx.dtsi:355.22-358.7: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,4,0/pcie@4,0,0: =
Relying on default #size-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:407.4-27: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0:reg: property has invalid length (20 byt=
es) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:410.5-28: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0:reg: property has invalid len=
gth (20 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:413.6-29: Warning (reg_format): /soc/=
pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0:reg: property has =
invalid length (20 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/imx6q-gw54xx.dtb: Warning (pci_device_bus_num): Failed pr=
erequisite 'reg_format'
arch/arm/boot/dts/imx6q-gw54xx.dtb: Warning (i2c_bus_reg): Failed prerequis=
ite 'reg_format'
arch/arm/boot/dts/imx6q-gw54xx.dtb: Warning (spi_bus_reg): Failed prerequis=
ite 'reg_format'
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:406.14-417.5: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #ad=
dress-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:406.14-417.5: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0: Relying on default #si=
ze-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:409.15-416.6: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0: Relying on =
default #address-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:409.15-416.6: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0: Relying on =
default #size-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:412.22-415.7: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0: =
Relying on default #address-cells value
arch/arm/boot/dts/imx6qdl-gw54xx.dtsi:412.22-415.7: Warning (avoid_default_=
addr_size): /soc/pcie@1ffc000/pcie@0,0,0/pcie@1,0,0/pcie@2,8,0/pcie@8,0,0: =
Relying on default #size-cells value

Introduced by commits

  26d7c769d460 ("ARM: dts: imx6qdl-gw53xx: allow boot firmware to set eth1 =
MAC")
  48d799918adf ("ARM: dts: imx6qdl-gw54xx: allow boot firmware to set eth1 =
MAC")

--=20
Cheers,
Stephen Rothwell

--Sig_/oWW0+F3PNWuSrDmudtXDoce
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ylS8ACgkQAVBC80lX
0Gx/WAf/bNJPU9kMjyLmibxhDiwXyRQSxQHYl8VfzrXZIh7WSZ4SoxLFcK0FhEwp
HKqN9NklECkvNFYWxm+gwK68D2zF4ZTl0zGSbNY/XRIpoHZCLBg7O8zr6MKJoYiE
bbloanSazVEPlkvIy/diNMe3S4iQ7MQ+WGaLTl5fd2b476URMrMyJ8JpYK/PIqT3
QUNZcUBcfueXJIYlzfk+KtNsCsujBeXTzhRnT65g+fiDJR8WQFiWX90xDI9H27Wq
A1Vh7wobktuq9BjI1i+OusEy4At4Hs+rLBtLPYq2TCn3PFq2M1uFYgowTAZNGiwO
o04Ja3sYsrn0BD39Jksa1EgQfbKsvA==
=FRui
-----END PGP SIGNATURE-----

--Sig_/oWW0+F3PNWuSrDmudtXDoce--
