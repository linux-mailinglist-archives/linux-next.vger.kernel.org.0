Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE839C9A4
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 08:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbfHZGud (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 02:50:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48507 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbfHZGuc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 02:50:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46H2h15r6Dz9sMr;
        Mon, 26 Aug 2019 16:50:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566802229;
        bh=AOqazLvPlGKJ9jojqYakHoX+JU05zoTI2NR0rZ5481A=;
        h=Date:From:To:Cc:Subject:From;
        b=MnQfzGO2JhTPFx/p8z717C4bzTu8guRo2o+22RIrjvpXgY7gzCw34eMtW/b8SJSM3
         7NOrx/EtjL4xRwfrK1Z3PCmi4SPOBk0hCuUrdzhbzG0Onnnc8UbrOMC+o8J/avIsRU
         JZcvdj8aecWfUGbzzIS0zj9sFJdaDrsklUPHfGFkS6/+ljIIQNogCRXsNUHFeASJwL
         cm7yOUMgbSu2JgY0m9GrFxYkaKSIWVXbYbESvaQZYWYqanzvoa/GlMllKZudX+JeUb
         vuHL6gW+XvRgtDQKVhXyjkfN7xIRlf9ZrKJW1jKxI0XL2lfczmXG/D0KbRBsbbM1xx
         HzsN0JCbmuR2A==
Date:   Mon, 26 Aug 2019 16:50:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the gpio tree
Message-ID: <20190826165024.03e6b16a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cGcOQyJ3z5vjdFXM63RtP3v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cGcOQyJ3z5vjdFXM63RtP3v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  include/linux/gpio/driver.h

between commit:

  c7663fa2a663 ("gpio: Move gpiochip_lock/unlock_as_irq to gpio/driver.h")

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
index 8d06a054abc8,f28f534f451a..000000000000
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
@@@ -520,38 -443,6 +513,35 @@@ struct bgpio_pdata=20
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
 +static inline void gpiochip_populate_parent_fwspec_twocell(struct gpio_ch=
ip *chip,
 +						    struct irq_fwspec *fwspec,
 +						    unsigned int parent_hwirq,
 +						    unsigned int parent_type)
 +{
 +}
 +
 +static inline void gpiochip_populate_parent_fwspec_fourcell(struct gpio_c=
hip *chip,
 +						     struct irq_fwspec *fwspec,
 +						     unsigned int parent_hwirq,
 +						     unsigned int parent_type)
 +{
 +}
 +
 +#endif /* CONFIG_IRQ_DOMAIN_HIERARCHY */
 +
-=20
- #if IS_ENABLED(CONFIG_GPIO_GENERIC)
-=20
  int bgpio_init(struct gpio_chip *gc, struct device *dev,
  	       unsigned long sz, void __iomem *dat, void __iomem *set,
  	       void __iomem *clr, void __iomem *dirout, void __iomem *dirin,
@@@ -720,10 -603,11 +702,15 @@@ void gpiochip_free_own_desc(struct gpio
  void devprop_gpiochip_set_names(struct gpio_chip *chip,
  				const struct fwnode_handle *fwnode);
 =20
+=20
+ #ifdef CONFIG_GPIOLIB
+=20
+ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
+=20
 +/* lock/unlock as IRQ */
 +int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
 +void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
 +
  #else /* CONFIG_GPIOLIB */
 =20
  static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *des=
c)
@@@ -733,18 -617,6 +720,18 @@@
  	return ERR_PTR(-ENODEV);
  }
 =20
 +static inline int gpiochip_lock_as_irq(struct gpio_chip *chip,
 +				       unsigned int offset)
 +{
 +	WARN_ON(1);
 +	return -EINVAL;
 +}
 +
 +static inline void gpiochip_unlock_as_irq(struct gpio_chip *chip,
 +					  unsigned int offset)
 +{
 +	WARN_ON(1);
 +}
  #endif /* CONFIG_GPIOLIB */
 =20
- #endif
+ #endif /* __LINUX_GPIO_DRIVER_H */

--Sig_/cGcOQyJ3z5vjdFXM63RtP3v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1jgTAACgkQAVBC80lX
0GzH0AgAkKXul0Kfk/5+cqaTMFfDvYCLTetW2+mjG7YjDzZkI8JFmVNRdeXtkvEl
RnbTLDH/NP11Zzrhrryn4I3v5X7eC+Ryz7Sbn+zoBXeeU2VUSCaQtELFXSMCtRy8
vuwakiFrrxQ2VD42jmyXDOeuiy27XLsrZCEPXMnVYmTGOe+FmLPqna9kQg2Rngeb
l8bRBCMemp7sU5clfnJXO734Vt0etibVHtqMRNrI981qYhpjnFJ4U/6tEvx7fN9M
M7jkGFFL/ZucPISZDfFLqFplScRIxiSYETCIgdcmi58yI0LL16Cf+0uiaMvczpIa
9tCJyvXMQO6LLtIWhA9jmCJBDJQReA==
=4XBZ
-----END PGP SIGNATURE-----

--Sig_/cGcOQyJ3z5vjdFXM63RtP3v--
