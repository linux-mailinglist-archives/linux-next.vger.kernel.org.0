Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931E4971DF
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 08:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727563AbfHUGDj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 02:03:39 -0400
Received: from ozlabs.org ([203.11.71.1]:37677 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbfHUGDj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Aug 2019 02:03:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CxtJ3Brsz9sBp;
        Wed, 21 Aug 2019 16:03:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566367416;
        bh=vs3GGswOy1exMDVbBRjU30NMiqokAxn6p2wGBo3Szhs=;
        h=Date:From:To:Cc:Subject:From;
        b=dOJK3cCsXGVlNwJ2lk6cW2EyN21PIU2lGJ5wLiQFdDxIocyDnxUDa1NyNhDsgKvEF
         Lp96mSBjeqOgCseltyTwNP9mfaENRGFHLII/RHYwP42ODZ+fWA8nK0psXbAYimyMLk
         Ivy6pGhDut/5CCNY6E2TShscwZ34fsTrEqvwTO33HwotQJj1eWtk+xIVEuzFLLtGNn
         3Fint2Arog9my0pqxtwiW5u4hT473CvbGS59IYYIT61CPv4MSf5xBVHjAwSDWRJLnJ
         vr7hYirT66s+dwEwnkUfpyJlm4rDE2tJHjOYkBubM7s0UJKm6M56Vd1gCNXjsxJe9n
         L1OietA/N0Cug==
Date:   Wed, 21 Aug 2019 16:03:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the gpio tree with the irqchip tree
Message-ID: <20190821160335.09071cb5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e2eGRYLvbTGTDmbOt9cvHnS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e2eGRYLvbTGTDmbOt9cvHnS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/gpio/gpio-ixp4xx.c

between commit:

  daa19fe5b082 ("gpio/ixp4xx: Register the base PA instead of its VA in fwn=
ode")

from the irqchip tree and commit:

  aa7d618ac65f ("gpio: ixp4xx: Convert to hierarchical GPIOLIB_IRQCHIP")

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

diff --cc drivers/gpio/gpio-ixp4xx.c
index cc72c9aca5a1,8bd23e80c61f..000000000000
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@@ -326,6 -209,35 +209,35 @@@ static int ixp4xx_gpio_probe(struct pla
  		return PTR_ERR(g->base);
  	}
 =20
+ 	/*
+ 	 * When we convert to device tree we will simply look up the
+ 	 * parent irqdomain using irq_find_host(parent) as parent comes
+ 	 * from IRQCHIP_DECLARE(), then use of_node_to_fwnode() to get
+ 	 * the fwnode. For now we need this boardfile style code.
+ 	 */
+ 	if (np) {
+ 		struct device_node *irq_parent;
+=20
+ 		irq_parent =3D of_irq_find_parent(np);
+ 		if (!irq_parent) {
+ 			dev_err(dev, "no IRQ parent node\n");
+ 			return -ENODEV;
+ 		}
+ 		parent =3D irq_find_host(irq_parent);
+ 		if (!parent) {
+ 			dev_err(dev, "no IRQ parent domain\n");
+ 			return -ENODEV;
+ 		}
+ 		g->fwnode =3D of_node_to_fwnode(np);
+ 	} else {
+ 		parent =3D ixp4xx_get_irq_domain();
 -		g->fwnode =3D irq_domain_alloc_fwnode(g->base);
++		g->fwnode =3D irq_domain_alloc_fwnode(&res->start);
+ 		if (!g->fwnode) {
+ 			dev_err(dev, "no domain base\n");
+ 			return -ENODEV;
+ 		}
+ 	}
+=20
  	/*
  	 * Make sure GPIO 14 and 15 are NOT used as clocks but GPIO on
  	 * specific machines.

--Sig_/e2eGRYLvbTGTDmbOt9cvHnS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1c3rcACgkQAVBC80lX
0Gxougf8CEK/NBAi0KYvdY/mqGVadziAe/ub/+k3dD2UWogEImQf77DQOTdDplvz
o8NV/3HKC47SgnCKug/SWl4PGW20sCykSpHVn5C79J5MJWrWCX+gqc28+L0Iyv/9
ibYLfAkNpK7NT2lBWDNSlLk6OEG1Dq/FjC4X/TtiiFTz4oM1Y4hJd6E4t12vE4uH
i3lu38saBh0tdWuqUeDW8Wg2cGHINdbW0t53FvxBcbKEYCiiGzpWtOdjTa3wsINI
7nDnD5zXhLLS7IoNDMcrvNoJZHr09IrT8GfazFf6FhEls/wTGKxdDNuM3hWeerCb
O8Y+8H00lFw2Vj7Easth85DzncbZLg==
=tzNv
-----END PGP SIGNATURE-----

--Sig_/e2eGRYLvbTGTDmbOt9cvHnS--
