Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90E4018612E
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 02:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgCPBLw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 21:11:52 -0400
Received: from ozlabs.org ([203.11.71.1]:40103 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729300AbgCPBLw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Mar 2020 21:11:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48gdYd51YGz9sQt;
        Mon, 16 Mar 2020 12:11:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584321110;
        bh=TONNJhWJly+zoYUt5zQ+eqWuGEiT9Xm7B7CzlZKAEUs=;
        h=Date:From:To:Cc:Subject:From;
        b=VAdNUfp2NJ5g5KCnficA8TvVefqXi8wZYKfj9rSUI42TCeIpB/pPF32Ig2ZaOZeIU
         VTm019AwGl6eVcJW52DKNmw3pgbebDnFfrKfK1UddKyLx5bMphRn8STgj0X5nxHFBT
         cGnsruv8EmjdvS2E6cNA1e0IkwOCFxNq1syo1qkPfBBG5Ck0FNVR17/VYGjryt3Ru2
         I9w8EZBqdFtp7+XmDKMxrVoEPK0alRTglwbURf9Euc6KmxDNIyqZSsyioy7CR3aFEO
         cZoyY5xo3PjQ+RGrKjqHUr811E8dkw1OrLBDhRuTJ9h23psTvi3f05bR880Ejsx9/9
         58e3lBHF+hiMA==
Date:   Mon, 16 Mar 2020 12:11:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20200316121148.6f65f3f9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q4Cg4nRI+Axz/UwWZOuGBnQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/q4Cg4nRI+Axz/UwWZOuGBnQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devicetree tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit addr=
ess format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (i2c_=
bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address must =
be less than 10-bits, got "0x40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit addr=
ess format error, expected "40000010"
arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (i2c_=
bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address must =
be less than 10-bits, got "0x40000010"
arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /soc/dr=
am-controller@1c01000:dma-ranges: "dma-ranges" property has invalid length =
(12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format): /=
soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid l=
ength (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=
=3D 2, #size-cells =3D=3D 1)

(Originally there were 51 lines of messages, but I removed the duplicates.)

I am assuming that these are due to the dtc update. :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/q4Cg4nRI+Axz/UwWZOuGBnQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5u0lQACgkQAVBC80lX
0Gy8VAgApCpmayavhPVofQP5fn2Ii6CmQUmBSdgDyGGMf/I4kGl3eGUZXKb1E7Yd
wqyXaRP9zbwQX3bzZCSqihxO0K4XtPXuoPW2dm2rcmBbXL919MCkP3jYkpVfe5cG
q3UhjYs4VENDViaqita/K1ppzeHpnIQPH0ogH49cnC/3gDeDer3v8Qu6+9yHHaZj
vyHngs9bBxU5k099JNkpetUkAJKMX/a+9wIdwoYnEiFVfO754Na0a1Jb1flAKhjM
bXBZTfFEFb/SFU5+URmWmB1xUW8XCQcHPHpCkCSJhqUjp+e1wj5XjAKplUJKMmah
z9QZOyHCoNVnXCKT2FSp2hXStNQuag==
=Wmnd
-----END PGP SIGNATURE-----

--Sig_/q4Cg4nRI+Axz/UwWZOuGBnQ--
