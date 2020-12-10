Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B812D5417
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 07:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387578AbgLJGlf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 01:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbgLJGlf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 01:41:35 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55CEC0613CF;
        Wed,  9 Dec 2020 22:40:54 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cs47624CBz9sVl;
        Thu, 10 Dec 2020 17:40:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607582451;
        bh=hugfZXiv11BFqaO/f2B1HjycHJ7IP7Z/TBLmKjhbeYM=;
        h=Date:From:To:Cc:Subject:From;
        b=LdTLlZpdf6GLsNzJ49CiL6b8WdISWML5DipaXsQUgd65FR3DWKCwo3qR+QqK+Qc17
         +e7dt68RXRAIwCyu0z6QsrZB0lPu3rYzMN7wRrgoTBre5AkOZ0vWdHC6EKo0UhPd/V
         8EVIeFNzK078gJ9IiiQGbl0O9ZuVbi8zd6tFIwnQDcAjBTyk9ICdhZCvO58rM0ZaLH
         avPExY1H0nRYiFrOSC5XqO6fIxscoQGDvSLbbAvEmbBGTy5099p1592/k1XwnkXviF
         Gj+WyBBCklgar1mSMlRICLHnze7PpIfXfhZaj80NlZWjMUmGKBKusxAbFTh38Prhl5
         2pOLXWbgulMjg==
Date:   Thu, 10 Dec 2020 17:40:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: linux-next: manual merge of the staging tree with the phy-next tree
Message-ID: <20201210174047.3d1f8aaa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O4SzRHQndoKBDnHe5_08FFL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O4SzRHQndoKBDnHe5_08FFL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got conflicts in:

  drivers/staging/Kconfig
  drivers/staging/Makefile

between commit:

  53e7c92c7fa0 ("staging: mt7621-pci-phy: remove driver from staging")

from the phy-next tree and commit:

  518b466a21ad ("pinctrl: ralink: add a pinctrl driver for the rt2880 famil=
y")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/staging/Kconfig
index 4d7a5ddf9992,c42708e60afc..000000000000
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@@ -94,8 -92,8 +92,6 @@@ source "drivers/staging/pi433/Kconfig
 =20
  source "drivers/staging/mt7621-pci/Kconfig"
 =20
- source "drivers/staging/mt7621-pinctrl/Kconfig"
 -source "drivers/staging/mt7621-pci-phy/Kconfig"
--
  source "drivers/staging/mt7621-dma/Kconfig"
 =20
  source "drivers/staging/ralink-gdma/Kconfig"
diff --cc drivers/staging/Makefile
index 89bde2370eee,ebcc646d7b51..000000000000
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@@ -37,7 -36,7 +36,6 @@@ obj-$(CONFIG_GREYBUS)		+=3D greybus
  obj-$(CONFIG_BCM2835_VCHIQ)	+=3D vc04_services/
  obj-$(CONFIG_PI433)		+=3D pi433/
  obj-$(CONFIG_PCI_MT7621)	+=3D mt7621-pci/
- obj-$(CONFIG_PINCTRL_RT2880)	+=3D mt7621-pinctrl/
 -obj-$(CONFIG_PCI_MT7621_PHY)	+=3D mt7621-pci-phy/
  obj-$(CONFIG_SOC_MT7621)	+=3D mt7621-dma/
  obj-$(CONFIG_DMA_RALINK)	+=3D ralink-gdma/
  obj-$(CONFIG_SOC_MT7621)	+=3D mt7621-dts/

--Sig_/O4SzRHQndoKBDnHe5_08FFL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/RwvAACgkQAVBC80lX
0GyHRgf/aPmOW4WtbekZfjpWNFDf+l03fmojDldGcw2dNxzkqKcTcsD2ZNpLvcVL
+6nz3mnpYNGZGXuglOMxDQNdqq7nzKuQbR4XZpKhVH5d9U0b9MWmwLwHEfVZbOub
OFrRUFz/kVzPp2nuJvVkI0D6xwFdoeLzvljZ5e5J8KOIRD/YCzhbYOboE8B4EI0Q
11Kca3irZ16XsOd8wv8LS1huVHWfaGBR6tLssds2BzpsmAr+CFkb5mtbZL3ZWlJB
w+YhEtXcdosc4WJ1UIxqTneymVWsFiPaDajQcXT2CbyeS1P4xlLuwOHuYCrM48aP
IK3n77ijEbn1YV3Vf4lQ6fVlzbGN6A==
=CGvU
-----END PGP SIGNATURE-----

--Sig_/O4SzRHQndoKBDnHe5_08FFL--
