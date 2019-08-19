Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B66D91D1A
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 08:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfHSGaN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Aug 2019 02:30:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50407 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbfHSGaN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 19 Aug 2019 02:30:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46BkYt52KJz9sMr;
        Mon, 19 Aug 2019 16:30:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566196210;
        bh=6ffNc5YKyfeNsMXVYg4F16qohiDqgMUq3zabAzOyfLA=;
        h=Date:From:To:Cc:Subject:From;
        b=WCu/wyEmM8UIpzDw+DO8ID14Vg4wXZBCigdrf9qb6OWMxdnCpuCKoMiMjfDbj8Kqs
         xRVBJqxBWibKk/bVgz0IZjmNM88hBOK8LcD6KqgcCh+vMv+oLte4C40MKhCUGqDTu0
         EfwSwOtwxQcOWa6x5yg43dCNtmiROcc2uRp8qcl/yR/2/ZUPUla/8xo624zr9KJGLo
         xIbjn5Do9eQil116F7tn80TvGuprZaOh9oeZUNHszY4rZUYjsZCXXjmu4wljQxs9Ah
         oFisnMbDVeZpbPRqKaqcGUQ0RCFWXu8wynC2nw9lN6r8gzRfPhqh31BYc8z0C8a9JR
         450GGtwyW8JeQ==
Date:   Mon, 19 Aug 2019 16:30:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the gpio tree
Message-ID: <20190819163008.093911f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BtC_YQ5NEzpqMV2nZpwYJi7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BtC_YQ5NEzpqMV2nZpwYJi7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  include/linux/gpio/driver.h

between commit:

  379ce1ff51aa ("gpio: stubs in headers should be inline")

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
index 72d48a2bab65,f28f534f451a..000000000000
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
@@@ -530,38 -443,6 +523,35 @@@ struct bgpio_pdata=20
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

--Sig_/BtC_YQ5NEzpqMV2nZpwYJi7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1aQfAACgkQAVBC80lX
0GwuXwf/XHu8MMs4Tudmm75YDQyzviiCC3blf5F0hZcuLbgXOfildZlaiahw/Dz6
EktR/ii3+9COhEMuYrtSm9DV/TS+CLvbylz+VFykjru6q+sEoA0U5MsdRNuekWqa
oYPYpBwC6XR0WP/tEljXpcbytG5VpwXb8DBYw1ebyZ2DA3injX9gmijKuZ7ZRTcR
DgOy22gnaY+1Fogj/mG2ft9kNE05cwMPtan4lkKFdS+NJbAlJUYzX5uOZ6TiYGk0
6xPWqGLdyUHojrnJJbve1/YOldE0no05EU4sNZNZhsBTJmy9JTElEmZP+4WQglCY
Rd/6z2oN4AEgSfUePIKBJVv4b9f1zg==
=c2mq
-----END PGP SIGNATURE-----

--Sig_/BtC_YQ5NEzpqMV2nZpwYJi7--
