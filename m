Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D769818942B
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 03:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgCRCum (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 22:50:42 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60869 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbgCRCul (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 22:50:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hvfh5jKTz9sPk;
        Wed, 18 Mar 2020 13:50:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584499838;
        bh=ZDEifc+Hg8BVtIkvCwsPziddGTXcFJ+ZXnXSJLzRcGA=;
        h=Date:From:To:Cc:Subject:From;
        b=Ps1QdUJ8pbOVV342GdkNCiCwMCGzN3VPLndwDCDTtYhPL7alX+FcbHub0s1PN71uS
         m/atrOLNNC+wZJv5mYdhDrzlz/XJiOHVsuAn9M0LMdW0DPZQ0kGVxJM7OiRbznlOjw
         03+zqEmTPKRfgfSylyGB/t6Yvg7/VdDbqgps4W50VC4oc6fuytGkqJFyEk/HdAkZQn
         87D1Pd0vGnlHZ9gKHcCg+FfiSIyYZFCkhB0tG9Tw4XXNpUfaxw3Krg/qyD/NFYdbss
         1ZTANQ4Na/NSyo4gDLsgq5Px/WbB0x+2vW9srmFAHQ1RuG6UqfQHODTu545dSn1OOS
         D62de6MqgUigA==
Date:   Wed, 18 Mar 2020 13:50:34 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: linux-next: manual merge of the drm tree with the omap tree
Message-ID: <20200318135034.242d9edf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jywf5AF0NmomlGRZsbo/ll7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Jywf5AF0NmomlGRZsbo/ll7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  arch/arm/configs/omap2plus_defconfig

between commit:

  98c2cc359f8f ("ARM: omap2plus_defconfig: Update for moved and dropped opt=
ions")

from the omap tree and commit:

  e7e67d9a2f1d ("drm/omap: Switch the HDMI and VENC outputs to drm_bridge")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/configs/omap2plus_defconfig
index eedb26ff93f9,54f1a21de7e0..000000000000
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@@ -360,10 -353,10 +360,9 @@@ CONFIG_OMAP2_DSS_DSI=3D
  CONFIG_DRM_OMAP_PANEL_DSI_CM=3Dm
  CONFIG_DRM_TILCDC=3Dm
  CONFIG_DRM_PANEL_SIMPLE=3Dm
+ CONFIG_DRM_DISPLAY_CONNECTOR=3Dm
+ CONFIG_DRM_SIMPLE_BRIDGE=3Dm
 -CONFIG_DRM_TI_TFP410=3Dm
+ CONFIG_DRM_TI_TPD12S015=3Dm
  CONFIG_DRM_PANEL_LG_LB035Q02=3Dm
  CONFIG_DRM_PANEL_NEC_NL8048HL11=3Dm
  CONFIG_DRM_PANEL_SHARP_LS037V7DW01=3Dm

--Sig_/Jywf5AF0NmomlGRZsbo/ll7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5xjHoACgkQAVBC80lX
0GzIdQgAgRxMoqzoOCQk/qQ8NtySkvYGLqXff2HykmMA+hzn9XoPP4BtSd7mlSm8
IQx2+bAooyRU1Dg6369LGbYBNCU2AB52hbg3WAYOxIvyRx+1T0iORg9ygRPWENKK
bqN4/rhbbWY0o2KVwlXQh5BIqdsJzgX3v7Bq/sqhYL6jTzFGxO1StusqDabzcm0x
aPN3dKlaKoVSEmWbv65p7Pyv+09Y33lfUScXKdFXmL83z541cv1dn3bI+TShNEOg
qgRRKtm0km5OUF+byzJY61qTxv+v3DWBk0Gm46/y3ygje8XoyI4YhqvAIOE/sjSL
JuWN9KZpajiIEZz/dZb/++eZ949gkw==
=f4tr
-----END PGP SIGNATURE-----

--Sig_/Jywf5AF0NmomlGRZsbo/ll7--
