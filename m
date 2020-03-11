Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE8301825B9
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 00:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731168AbgCKXTH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 19:19:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:54723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgCKXTG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 19:19:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48d7FK2RvPz9sRR;
        Thu, 12 Mar 2020 10:19:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583968743;
        bh=RY4jhSfTQdX+/9tbmwG83fYt5HRfbczE83/K96nIVBU=;
        h=Date:From:To:Cc:Subject:From;
        b=RaC3mQ3i7nIzMdU69+bNPWOQM2wrPTk2r/EyiUO1w9+cRdMnB73lTGpFkBSspod5w
         3KJQZEm1BQhW4hVvcpNWzu+xNzuubpd1MHA/J1lTTxo6zyLA0LQFf4sCpsNiYQCfCO
         3eClgeUjTtmulGMdrmEJyOOOuKeGF+0O/wcmv9uLxm3Uxtn4HcYJ2mA8PNEhbHm6Om
         9R7fHOdjQK7/eDhl2XagP/XzO15/DCWlxNYdH4pr5PhZReSmh11NVb1U9kvB746h2Z
         i8x7NdbLfRV1khDQVhKM2+qy725RnivDYY5s5OjHvCWcVfBXgaSsJzHedRgARCeQaj
         joY1G4kNRDAqw==
Date:   Thu, 12 Mar 2020 10:18:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Anson Huang <Anson.Huang@nxp.com>
Subject: linux-next: manual merge of the imx-mxs tree with Linus' tree
Message-ID: <20200312101854.3c261c88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cKAl/mrWKXLyRajs26N7V+P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cKAl/mrWKXLyRajs26N7V+P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the imx-mxs tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  4a453ccf87d5 ("arm64: defconfig: Enable CONFIG_SUN8I_THERMAL")

from Linus' tree and commit:

  34e46ed80df6 ("arm64: defconfig: add i.MX system controller thermal suppo=
rt")

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
index 4db223dbc549,31d098438a43..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -452,7 -454,7 +454,8 @@@ CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3D
  CONFIG_CPU_THERMAL=3Dy
  CONFIG_THERMAL_EMULATION=3Dy
  CONFIG_QORIQ_THERMAL=3Dm
 +CONFIG_SUN8I_THERMAL=3Dy
+ CONFIG_IMX_SC_THERMAL=3Dm
  CONFIG_ROCKCHIP_THERMAL=3Dm
  CONFIG_RCAR_THERMAL=3Dy
  CONFIG_RCAR_GEN3_THERMAL=3Dy

--Sig_/cKAl/mrWKXLyRajs26N7V+P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5pcd4ACgkQAVBC80lX
0Gw2/Af/cQLTK+KcHabQnTGtd2CRmzLxRRSss9bc1a4w+G8+iUd8C7Qc5lYIjdVo
+w5lvZxxiilj9aWuuDlUhC3vZZYl2G8+fv1ms2O+ntB0Y5Q9nad7qKZf4szCnz7F
AmY2nXhLzbAwgHKMI09TthZIf2AnMP6nPRos2loyh0Wu98dHeZ18s6e1l5+sswwQ
zGSgGx36OaXXkX561zX4X3DG7BJqTxapDKzwUx8e8ZT7irkuTFq5AmEaDvSRjaWX
T++Kb/Azl26wnnjnYZDCTshZRzrob21IKRXL3hg+RVlM45AVXnBl7DmgFuALfGH8
+TJforGOkwMYTH2QXPbQT4wKMfUbjA==
=7tD9
-----END PGP SIGNATURE-----

--Sig_/cKAl/mrWKXLyRajs26N7V+P--
