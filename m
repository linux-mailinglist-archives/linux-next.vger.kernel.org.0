Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C768C8FB91
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 08:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfHPG4L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 02:56:11 -0400
Received: from ozlabs.org ([203.11.71.1]:44101 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfHPG4L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 02:56:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468vHD3nsWz9s00;
        Fri, 16 Aug 2019 16:56:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565938568;
        bh=s8Ek3AUUEpdUyReBiFQ2Grbuguu8Y1jMvSOVW3HYLtk=;
        h=Date:From:To:Cc:Subject:From;
        b=CgBiAHpzBmonPmS+uuQDb4AtaUBOSSTRi3W/zkgYRYgGriNDVWS5CMo9EP3syYCnL
         hm4ashXsE4z+G/D++ERyJt+j6kLr1xZP3M/wSd74mu0npJyDbPV7O0F277gYPkgE3e
         xDR7uId8CWJYu+OtofgP8nIC9GyloA10j8joFxnikp9VkORZfxQ3kQyYT76UDmetzS
         SqvBk5N4Ys1sYZmVgxedMEhXm6tGW5S0bfo51m0e2g/Ef1TaoWTa2ccy/wsuF89coD
         K5Z0efwguemYhn49xIge/mG3EljgXkGfsOWfRhl8FvRl79fW+IT2++cnejCsL9+RBx
         TbvRLVQitdWwA==
Date:   Fri, 16 Aug 2019 16:56:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Subject: linux-next: manual merge of the gpio-brgl tree with the gpio tree
Message-ID: <20190816165607.3b896463@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4sIVZc0bbTg/uHBfndk_bz.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4sIVZc0bbTg/uHBfndk_bz.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  include/linux/gpio/driver.h

between commit:

  fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")

from the gpio tree and commit:

  9091373ab7ea ("gpio: remove less important #ifdef around declarations")

from the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/gpio/driver.h
index 0e6d3b0c0211,f28f534f451a..000000000000
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@@ -20,12 -20,6 +20,8 @@@ struct module
  enum gpiod_flags;
  enum gpio_lookup_flags;
 =20
- #ifdef CONFIG_GPIOLIB
-=20
- #ifdef CONFIG_GPIOLIB_IRQCHIP
-=20
 +struct gpio_chip;
 +
  /**
   * struct gpio_irq_chip - GPIO interrupt controller
   */
@@@ -530,38 -443,6 +523,36 @@@ struct bgpio_pdata=20
  	int ngpio;
  };
 =20
 +#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 +
 +void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
 +					     struct irq_fwspec *fwspec,
 +					     unsigned int parent_hwirq,
 +					     unsigned int parent_type);
 +void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chip,
 +					      struct irq_fwspec *fwspec,
 +					      unsigned int parent_hwirq,
 +					      unsigned int parent_type);
 +
 +#else
 +
 +static void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chi=
p,
 +						    struct irq_fwspec *fwspec,
 +						    unsigned int parent_hwirq,
 +						    unsigned int parent_type)
 +{
 +}
 +
 +static void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *ch=
ip,
 +						     struct irq_fwspec *fwspec,
 +						     unsigned int parent_hwirq,
 +						     unsigned int parent_type)
 +{
 +}
 +
 +#endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
 +
 +
- #if IS_ENABLED(CONFIG_GPIO_GENERIC)
-=20
  int bgpio_init(struct gpio_chip *gc, struct device *dev,
  	       unsigned long sz, void __iomem *dat, void __iomem *set,
  	       void __iomem *clr, void __iomem *dirout, void __iomem *dirin,

--Sig_/4sIVZc0bbTg/uHBfndk_bz.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1WU4cACgkQAVBC80lX
0GxhVwf+Nf3MjQSZE/zHRBzEFSdsEJyZdjWqDJduEwnnCazu2+rToykDlRJBO4nT
ib0/tuciaikjtbqz4ka6xY8bGzuyanZwwW1L90jko/9wWChi9Q85n79Mpei3bjoA
bR15BbedikgVGBsgMaEYMBaEw/D4eTT9mFxwSgmMO8fztL39Ownlh60wJkOd5Ljp
WejV8gQT241uCBCHWx/d/1xGVMvK94rt1v/QjC1QB8HzuSNd2h5DGkeHXRcqrvnV
p6Ntt3fB+oChg2F5d4nAnEPfxVawiNVKW4xd2eOjUC+l56e2uiSfWLGKEkKwBDtJ
QfDXvUBAvQTb3RbgLzXmVoaORHYd+A==
=mDIy
-----END PGP SIGNATURE-----

--Sig_/4sIVZc0bbTg/uHBfndk_bz.--
