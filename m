Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3452619A421
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 06:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgDAEDu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 00:03:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46067 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbgDAEDu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Apr 2020 00:03:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sXcg2v0Nz9sR4;
        Wed,  1 Apr 2020 15:03:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585713827;
        bh=2MZpAJNorevh5i7bfgHRJn+E5L04InxjRRGMpB1Sl/Q=;
        h=Date:From:To:Cc:Subject:From;
        b=kI4C21RLGz3qC1SCefIFV5/jslKyAAfrEFVX/rORopfM9nNp5W6TewDPV6LoDFlVh
         IkJNP1Fc/Yz6pHb7xB+LinuNjVCL4Vaq9AQvhDU1skaE8rsRhJrJ5q1VNck4SIGJn/
         3IfUdTx24fXl9sdl4TG3fNQt7rZh/ha3bnTPB1wpWzXJG0k9FGxlCT/y3DKhwl+PnT
         h+s7ITBUBZY3Mkj3cT0+lfK74dJJCeO6cdRcWNOoBJq1aLY10TUQxvybz4Tn5KOZgJ
         0TkzVqFHG68AsxXT00GXdPfnpiAdzgFyOxWt7LpYENt9quyOtkDZ2io0pLmxXwlPHF
         Hf+f3qubqvWDw==
Date:   Wed, 1 Apr 2020 15:03:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the gpio tree with Linus' tree
Message-ID: <20200401150345.248e4610@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//3skiLYk4Rv9C=C0HBmwCYP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//3skiLYk4Rv9C=C0HBmwCYP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/gpio/gpiolib.c

between commit:

  8959b304c706 ("gpiolib: Fix irq_disable() semantics")

from Linus' tree and commit:

  a0b66a73785c ("gpio: Rename variable in core APIs")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpio/gpiolib.c
index 00fb91feba70,c2cc437ce831..000000000000
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@@ -2304,25 -2443,18 +2443,25 @@@ static void gpiochip_irq_enable(struct=20
 =20
  static void gpiochip_irq_disable(struct irq_data *d)
  {
- 	struct gpio_chip *chip =3D irq_data_get_irq_chip_data(d);
+ 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 =20
 +	/*
 +	 * Since we override .irq_disable() we need to mimic the
 +	 * behaviour of __irq_disable() in irq/chip.c.
 +	 * First call .irq_disable() if it exists, else mimic the
 +	 * behaviour of mask_irq() which calls .irq_mask() if
 +	 * it exists.
 +	 */
- 	if (chip->irq.irq_disable)
- 		chip->irq.irq_disable(d);
- 	else if (chip->irq.chip->irq_mask)
- 		chip->irq.chip->irq_mask(d);
- 	gpiochip_disable_irq(chip, d->hwirq);
+ 	if (gc->irq.irq_disable)
+ 		gc->irq.irq_disable(d);
 -	else
++	else if (gc->irq.chip->irq_mask)
+ 		gc->irq.chip->irq_mask(d);
+ 	gpiochip_disable_irq(gc, d->hwirq);
  }
 =20
- static void gpiochip_set_irq_hooks(struct gpio_chip *gpiochip)
+ static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
  {
- 	struct irq_chip *irqchip =3D gpiochip->irq.chip;
+ 	struct irq_chip *irqchip =3D gc->irq.chip;
 =20
  	if (!irqchip->irq_request_resources &&
  	    !irqchip->irq_release_resources) {

--Sig_//3skiLYk4Rv9C=C0HBmwCYP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6EEqEACgkQAVBC80lX
0Gzj5Qf/V35Jumgw4SNmy4c9WfSFgoJ71W6XmckTgvel4kX3lI5GdXX6aQ6QNsvu
Jh9sX+KQBy0aSV2NujIXUw+fPb+XtTB3cYNCCtOnRBupv45aCcpvlgEx2U546yZi
om14GPC8A/IKhgvSC3fthaPlrSQ9vjeoQtfZRPAo9YsuqZP6my9/uCPpY4UUfKwl
0LPS9EZtpLMg2cy+ogsfEPmdOgfQvhY5oVeXMJ97YS6MaTb7fz6bveqk15ZXpwDT
KFY1+fDV5XGqYHALmLfzlls2ogh7TggRf7Y22K+b0BEdybqx3mvsqGHgOVTKYiFM
eVz0J/kri8GdlkZKpta7RNlOofefYw==
=DPbo
-----END PGP SIGNATURE-----

--Sig_//3skiLYk4Rv9C=C0HBmwCYP--
