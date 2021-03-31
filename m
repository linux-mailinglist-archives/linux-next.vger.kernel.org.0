Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6133B350A1D
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 00:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbhCaWUo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 18:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCaWUe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 18:20:34 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899ABC061574;
        Wed, 31 Mar 2021 15:20:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9gk455jmz9sVt;
        Thu,  1 Apr 2021 09:20:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617229230;
        bh=fuNgT7aS+dH8rWhmk4dHk2bAcDwGs9Dhi1zxbtfYiTY=;
        h=Date:From:To:Cc:Subject:From;
        b=a6hxe7DGfFvO4ohAbbjfEaIzCbVBxm9Ue5YSfzmrKUNv6y+sSnJ71/f6VLNVCjbcj
         XEcljaH65kYbmhTcOBAXsm5L6MmxJaNobyGNHv4tO1r+X0vE8X8Ta9/iR5fu9rYdPA
         54cvsXdlQ81wsoWhhLiFaGGzDaR0NcV1nkOVeajdZVYYvpOlNhDCoeEHt/cslzer5G
         1eijrdcc0mm2coUP+A3VJPr3DhYcR5Gm+Wt1Ir7kBSOTV+o9KSjXIX1wxzHtaixY2q
         f+h9pKGSWY/ZLKAhdGypnoKbAM+0r4zbwgt9WCD7xkYZj7v9/DByFFq6TKGKC81Ckg
         ir3lxuNF4wt5Q==
Date:   Thu, 1 Apr 2021 09:20:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Walle <michael@walle.cc>
Subject: linux-next: manual merge of the mediatek tree with the imx-mxs tree
Message-ID: <20210401092027.1e4c8b05@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A_Z4F_MLvA02L7lFY4gbo7T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A_Z4F_MLvA02L7lFY4gbo7T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mediatek tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  94c586e5941a ("arm64: configs: enable FlexTimer alarm timer")

from the imx-mxs tree and commit:

  fbbe38309d56 ("arm64: defconfig: Allow mt8173-based boards to boot from u=
sb")

from the mediatek tree.

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
index ec94b0438ab2,f2dc42c9b932..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -996,7 -998,7 +1006,8 @@@ CONFIG_OWL_PM_DOMAINS=3D
  CONFIG_RASPBERRYPI_POWER=3Dy
  CONFIG_FSL_DPAA=3Dy
  CONFIG_FSL_MC_DPIO=3Dy
 +CONFIG_FSL_RCPM=3Dy
+ CONFIG_MTK_PMIC_WRAP=3Dy
  CONFIG_QCOM_AOSS_QMP=3Dy
  CONFIG_QCOM_COMMAND_DB=3Dy
  CONFIG_QCOM_GENI_SE=3Dy

--Sig_/A_Z4F_MLvA02L7lFY4gbo7T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBk9asACgkQAVBC80lX
0GzhsQf/TLnYB/2EyzOfDsB+FGBzqUVDdU/aZyMKgfg/ck86PrpFzSKVbpCd0NTS
c3oLa8Ry9n6iytpuqzHJuPdyK0pg4wgyhRe16PaX4UdxNbD1VZ/EBtie2xIuyDur
9LAKQ+qXDLwBfUcStMs/OgDbWaPrLXlzodH2hn31pet6bqwe+hlPZacErwu7meE9
nQBbl1+MSiewbAJ8T8nfolnCNu8ACnM8vfSJw+3j6iff1jopp7qVYljGSeMmgk6b
lMJwyjXvTbzUF2y8uS0ZAa5WzqATn/Tk6Rbm/7X5o8Z6t5Cp/tGYFoYl7GpJQ5pC
f9XicnQeJZMwx77tb4niBNqvpoxPUA==
=WeGX
-----END PGP SIGNATURE-----

--Sig_/A_Z4F_MLvA02L7lFY4gbo7T--
