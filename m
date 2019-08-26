Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 719869CDB1
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 13:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfHZLDF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 07:03:05 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726787AbfHZLDF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 07:03:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46H8HS4WNTz9sBF;
        Mon, 26 Aug 2019 21:03:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566817381;
        bh=KShC81+odUckJVsysWN2s57UDuy9BUDnvyWQ9EDxuj0=;
        h=Date:From:To:Cc:Subject:From;
        b=FouCMZ1WLhEHQ+9DgAdLrJ8SlscXO5tuIi/fOHgMGkqQosZDvRy0gcsLTPsrutkTO
         FCWmUTHpoH9mdi9AOUp/wZGCXQ/LW4fGnjztXG32mJ0hgt6gizuOpIRJvlBPdzwonA
         YQVz4t5YD92zPdZRNOvZATmDZ3hTG6An5B9cjk5HDTKMUVflQvnvDkKda+0RBqgusg
         VhzvFZ3WhDu/k5eKWBoJFQ+IfAVnyWpK51LzlI3pauc5hTPqxy+zVhHdGI+iBMmaY9
         cf2tO7jTnnOcqmkaS0Dqe69Mj6m9TjLw995UsbSmghODhGQjKvz5L/tWY8AOazCRfA
         FNzpEFBkPwSsQ==
Date:   Mon, 26 Aug 2019 21:02:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Wahren <wahrenst@gmx.net>
Subject: linux-next: manual merge of the pinctrl tree with the gpio tree
Message-ID: <20190826210252.20ca44ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=0Imwp2hSL_DiSsaDjmtU5m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=0Imwp2hSL_DiSsaDjmtU5m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  drivers/pinctrl/bcm/pinctrl-bcm2835.c

between commit:

  82357f82ec69 ("pinctrl: bcm2835: Pass irqchip when adding gpiochip")

from the gpio tree and commit:

  e38a9a437fb9 ("pinctrl: bcm2835: Add support for BCM2711 pull-up function=
ality")

from the pinctrl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pinctrl/bcm/pinctrl-bcm2835.c
index b729997cd887,a493205bedaf..000000000000
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@@ -994,9 -1087,10 +1086,11 @@@ static int bcm2835_pinctrl_probe(struc
  	struct device *dev =3D &pdev->dev;
  	struct device_node *np =3D dev->of_node;
  	struct bcm2835_pinctrl *pc;
 +	struct gpio_irq_chip *girq;
  	struct resource iomem;
  	int err, i;
+ 	const struct of_device_id *match;
+=20
  	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) !=3D BCM2835_NUM_GPIOS);
  	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) !=3D BCM2835_NUM_GPIOS);
 =20
@@@ -1069,6 -1141,38 +1163,12 @@@
  		return err;
  	}
 =20
 -	err =3D gpiochip_irqchip_add(&pc->gpio_chip, &bcm2835_gpio_irq_chip,
 -				   0, handle_level_irq, IRQ_TYPE_NONE);
 -	if (err) {
 -		dev_info(dev, "could not add irqchip\n");
 -		return err;
 -	}
 -
 -	for (i =3D 0; i < BCM2835_NUM_IRQS; i++) {
 -		pc->irq[i] =3D irq_of_parse_and_map(np, i);
 -
 -		if (pc->irq[i] =3D=3D 0)
 -			continue;
 -
 -		/*
 -		 * Use the same handler for all groups: this is necessary
 -		 * since we use one gpiochip to cover all lines - the
 -		 * irq handler then needs to figure out which group and
 -		 * bank that was firing the IRQ and look up the per-group
 -		 * and bank data.
 -		 */
 -		gpiochip_set_chained_irqchip(&pc->gpio_chip,
 -					     &bcm2835_gpio_irq_chip,
 -					     pc->irq[i],
 -					     bcm2835_gpio_irq_handler);
 -	}
 -
+ 	match =3D of_match_node(bcm2835_pinctrl_match, pdev->dev.of_node);
+ 	if (match) {
+ 		bcm2835_pinctrl_desc.confops =3D
+ 			(const struct pinconf_ops *)match->data;
+ 	}
+=20
  	pc->pctl_dev =3D devm_pinctrl_register(dev, &bcm2835_pinctrl_desc, pc);
  	if (IS_ERR(pc->pctl_dev)) {
  		gpiochip_remove(&pc->gpio_chip);

--Sig_/=0Imwp2hSL_DiSsaDjmtU5m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1jvFwACgkQAVBC80lX
0GxCTwgAinYqIFx13uyqhlEh7e9THPh+Aekc8EUSWbyi20ibKAAhDBkTmQigvkL6
ANG7Y7sJXPcAAXZgEJXB/5hUPnZuuGhyrg4TnjKxXwU3tu7s0liop+YF7755ZLit
EC9dJhbszLKODUhoawbkWSYJZ2ImkPh0lNRYPzSOaz+/awCb78TtFoPaPJ+5T5dB
+vhIvdN3GpPv+C/p59mlxtFnAQ1ai2HucmofsbDdQwtNoG7kclZJBjxFLPIXrbLZ
VSJylHGOyf4hUXdDkFf8/ifyqxyVqsUorFAohTou96zSoRPzb7RKSbCZtwqVl5L9
UOhDwjlVDLXeWdXh6yyYUY5zfP2sfQ==
=Mjkm
-----END PGP SIGNATURE-----

--Sig_/=0Imwp2hSL_DiSsaDjmtU5m--
