Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC6E91874FD
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 22:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732680AbgCPVot (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 17:44:49 -0400
Received: from ozlabs.org ([203.11.71.1]:44917 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732652AbgCPVos (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 17:44:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48h8wF0L0dz9sPF;
        Tue, 17 Mar 2020 08:44:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584395086;
        bh=qbTFgV14ckkB7rAIrq9ihJqPBeXY8LPVtrjwzECDf6s=;
        h=Date:From:To:Cc:Subject:From;
        b=snUnay4XdoM7ctIBRTBGerBxFzvnSAjGWtGtOWNzKcc6e4jHO4FY9nIP+FlN9xNK5
         3Vj/oo6p+4Pvs8kZeeF6AjK8qykqCmAEqfvl5svmyy0I6SL0SR8m6nfRNsOZR5rqpV
         55p7fmjt9HRDz+3X+GVucbv+3UTKdAH3dpRso9TKfRE7sbCVlWAiNkyRz+bzB4OBt1
         0efYUzIG+TyS43EmPNgbjFOGcM3kKNiTi8brXeCKSzsdi5InrZL/yMN7VYKzngk8kN
         y43FLgrFszoyi7wXEXLcA75ydkSZ+BsR8TTIBSqB+ZBMSe8g6ORzlVnzYRLhJxfF0m
         UHa4wQKIUOMAQ==
Date:   Tue, 17 Mar 2020 08:44:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Anson Huang <Anson.Huang@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Li Yang <leoyang.li@nxp.com>
Subject: linux-next: manual merge of the imx-mxs tree with Linus' tree
Message-ID: <20200317084441.1f59756d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=E/+sR8xhTsjJ0D4koT7qa6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=E/+sR8xhTsjJ0D4koT7qa6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the imx-mxs tree got a conflict in:

  arch/arm64/configs/defconfig

between commits:

  4a453ccf87d5 ("arm64: defconfig: Enable CONFIG_SUN8I_THERMAL")
  d5888c8e5586 ("arm64: defconfig: Replace ARCH_R8A7796 by ARCH_R8A77960")

from Linus' tree and commits:

  34e46ed80df6 ("arm64: defconfig: add i.MX system controller thermal suppo=
rt")
  63cccc8401c2 ("arm64: defconfig: Enable CONFIG_IMX8MM_THERMAL as module")
  3fbd82f9af29 ("arm64: defconfig: run through savedefconfig for ordering")

from the imx-mxs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index 4db223dbc549,0c110182497a..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -452,7 -485,8 +485,9 @@@ CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3D
  CONFIG_CPU_THERMAL=3Dy
  CONFIG_THERMAL_EMULATION=3Dy
  CONFIG_QORIQ_THERMAL=3Dm
 +CONFIG_SUN8I_THERMAL=3Dy
+ CONFIG_IMX_SC_THERMAL=3Dm
+ CONFIG_IMX8MM_THERMAL=3Dm
  CONFIG_ROCKCHIP_THERMAL=3Dm
  CONFIG_RCAR_THERMAL=3Dy
  CONFIG_RCAR_GEN3_THERMAL=3Dy

--Sig_/=E/+sR8xhTsjJ0D4koT7qa6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5v80kACgkQAVBC80lX
0GyE+wf/X2Ly3SBmOM/aVObHrHk1NmULalkPmlYP8kSL7g/RCtwV2tW21fT0xsJW
FY+QG+UZYeyWuK9V3OsgNIfmn6TfSRWUe83it3xrGeA9JC031MV7V6Q1v64gpTsf
o5YzFlpUHPb2OD/4o7JmBJS4HqONxzEf7bv0bQ01+D3zmcTzu2DnmLdZkEwjvqTu
bLcgkxmL6U4t6Mnczc4h4WmObPRrTh3mtso6TWN2+feuUtdpEmz264mbGmULh90c
uw/F4+f5neldgTXjEVa6JQtvfWJoq0nwE4RBpfNG/ecOd7zQNXdjbcyQdhFdX0mq
Qz+cBvMSU/HQzGOoPqOTBNPlzjVKuw==
=/xXn
-----END PGP SIGNATURE-----

--Sig_/=E/+sR8xhTsjJ0D4koT7qa6--
