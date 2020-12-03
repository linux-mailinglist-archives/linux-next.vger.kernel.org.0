Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D472CCB41
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 01:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgLCAwZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 19:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgLCAwZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 19:52:25 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A74C0617A6;
        Wed,  2 Dec 2020 16:51:44 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CmcjR4bQtz9sT5;
        Thu,  3 Dec 2020 11:51:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606956701;
        bh=fWF5uj3a4ILlBULHxMHRrMJZJWYp+rRV3bFYXjTz8mQ=;
        h=Date:From:To:Cc:Subject:From;
        b=dBifTR1P1tdC3ua+smIYimj+WhC6u0YpSaYKBBBbDG0PNUAdEdtp/y/c0hGsOPLeF
         g59YFzQcZYLiCFGH3/Jm7QhzRJ8asFdvNxf3/0t9pn+9+6ESm60WPtW6RcwCR+nMr7
         ZaCD97h+fniCPf/+ck1/IAEepewGBtY12d9y9Mhe9K52ONw53L6QnKWRCCIlwmU/TS
         4Q6/Lr+o6Lkp7e3pKhE54V47NyeqUQZw13vVTJB/1u8Cj5aenaSO7FnEhITy6+7NQL
         kXByu+IU6Gz2mzzHsxqWzJdEZWmOJjHWH+TTRzrA+EB4TlQjn0fUF0eNRcFKH2Vqgd
         CWNB4epV1g+Zg==
Date:   Thu, 3 Dec 2020 11:51:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Luka Kovacic <luka.kovacic@sartura.hr>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the mvebu tree
Message-ID: <20201203115137.6620f27a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/USkYRJ.kjSQ4=svWLK4Gwyg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/USkYRJ.kjSQ4=svWLK4Gwyg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  MAINTAINERS

between commit:

  8c4e256e3d42 ("MAINTAINERS: Add an entry for MikroTik CRS3xx 98DX3236 boa=
rds")

from the mvebu tree and commit:

  b24cc2a18c50 ("media: smiapp: Rename as "ccs"")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 90acea633c4e,02437abc94c9..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -11664,17 -11630,17 +11665,28 @@@ M:	Oliver Neukum <oliver@neukum.org
  S:	Maintained
  F:	drivers/usb/image/microtek.*
 =20
 +MIKROTIK CRS3XX 98DX3236 BOARD SUPPORT
 +M:	Luka Kovacic <luka.kovacic@sartura.hr>
 +M:	Luka Perkov <luka.perkov@sartura.hr>
 +S:	Maintained
 +F:	arch/arm/boot/dts/armada-xp-crs305-1g-4s-bit.dts
 +F:	arch/arm/boot/dts/armada-xp-crs305-1g-4s.dts
 +F:	arch/arm/boot/dts/armada-xp-crs326-24g-2s-bit.dts
 +F:	arch/arm/boot/dts/armada-xp-crs326-24g-2s.dts
 +F:	arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s-bit.dts
 +F:	arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dts
 +
+ MIPI CCS, SMIA AND SMIA++ IMAGE SENSOR DRIVER
+ M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+ L:	linux-media@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+ F:	Documentation/driver-api/media/drivers/ccs/
+ F:	drivers/media/i2c/ccs/
+ F:	drivers/media/i2c/smiapp-pll.c
+ F:	drivers/media/i2c/smiapp-pll.h
+ F:	include/uapi/linux/smiapp.h
+=20
  MIPS
  M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
  L:	linux-mips@vger.kernel.org

--Sig_/USkYRJ.kjSQ4=svWLK4Gwyg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/INpoACgkQAVBC80lX
0Gw/Xgf+LPlUTuovtHxw06oh9GsU8B1B9NLBuIX5S9mhTrvykFv6JimL5AUQEA4D
4CaLMtv29Npq1qJv/Iu5p92EThcDzm+lVIAS4sqW7t90QQiZDB0R27ktucy74lpw
2T4x4NvTHG9f2vE7erWnRSzOJGZMZG/wAQ/bJHAiFf7olTtz5wM+7N5TsFPqzGpM
09DGFIORnd2lxqezIGSaKTAFDWMMT3dRmE65KnOIydyd8Qw0otBLmZnWLqhf0TNc
yORcoRyhMfHfkGFkgTV4rotUi3knwYp8csmT/BkGzn4E1Rn9NRHnPyG8X/xDufX+
TYx5sS5Ty6Cktas/CZ5FTpmMrhtsbw==
=4Xe6
-----END PGP SIGNATURE-----

--Sig_/USkYRJ.kjSQ4=svWLK4Gwyg--
