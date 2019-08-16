Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 220B8900D7
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 13:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfHPLiX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 07:38:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47205 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727081AbfHPLiX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 07:38:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4691Xq72Hkz9sDB;
        Fri, 16 Aug 2019 21:38:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565955500;
        bh=fDWlHeiaPJo/8PWt5Ou3HjfUeVyfwrdxr7KrHXzygw4=;
        h=Date:From:To:Cc:Subject:From;
        b=ps1HwtQGrQvtD0cKBZdB/VM3AEwKIKd0De7vwfm6QDxZp+ERVjPPIWyWbKlUcdIax
         d+wS7VTacJLBF++8RB29bO1NJ+3L37jNkNkSrVkZeXpJUH9if7ySpYoxorgyAm9bFT
         +2I1Po6RYEMOdF5bj+IT2sT01GVvPiNI6HFZZRntiLJZNxKW8MWKI8lQtQlJM6DUkm
         QNO2WIteaABGJQk42Vd3Tyxv/kq6PGwEgNnKxUyj/f7cr3fK7U7lJVgMWyeJIcxgl8
         4/8TsV/c5wtSkpgb3O09M+HMIGQlNduBHR1OTLtyjIiZleOifiJ0J3pGB6rlIaDYn5
         9K2yd3zDmaX/g==
Date:   Fri, 16 Aug 2019 21:38:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Subject: linux-next: build failure after merge of the gpio tree
Message-ID: <20190816213812.40a130db@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y.Pl+1Q6g8WeR=dasF6urrW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y.Pl+1Q6g8WeR=dasF6urrW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

In file included from include/asm-generic/gpio.h:13,
                 from include/linux/gpio.h:62,
                 from include/linux/of_gpio.h:16,
                 from arch/powerpc/platforms/44x/warp.c:14:
include/linux/gpio/driver.h:546:13: error: 'gpiochip_populate_parent_fwspec=
_fourcell' defined but not used [-Werror=3Dunused-function]
 static void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chi=
p,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/gpio/driver.h:539:13: error: 'gpiochip_populate_parent_fwspec=
_twocell' defined but not used [-Werror=3Dunused-function]
 static void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

and several more similar ...

Caused by commit

  fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 16 Aug 2019 21:29:30 +1000
Subject: [PATCH] gpio: stubs in headers should be inline

Fixes: fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/gpio/driver.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index f285fee898f6..13c7d7ff497d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -536,14 +536,14 @@ void gpiochip_populate_parent_fwspec_fourcell(struct =
gpio_chip *chip,
=20
 #else
=20
-static void gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *chip,
+static inline void gpiochip_populate_parent_fwspec_twocell(struct gpio_chi=
p *chip,
 						    struct irq_fwspec *fwspec,
 						    unsigned int parent_hwirq,
 						    unsigned int parent_type)
 {
 }
=20
-static void gpiochip_populate_parent_fwspec_fourcell(struct gpio_chip *chi=
p,
+static inline void gpiochip_populate_parent_fwspec_fourcell(struct gpio_ch=
ip *chip,
 						     struct irq_fwspec *fwspec,
 						     unsigned int parent_hwirq,
 						     unsigned int parent_type)
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/y.Pl+1Q6g8WeR=dasF6urrW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1WlaQACgkQAVBC80lX
0Gw5FAf/TqDfL7CuB6whUtfoXoC+0YZiCbjUZ2BmQM0oskHpr36zmQKwmF8mP/8v
Zuo5KgWHTpvEUplZkdyymySdemj2olDErsoOm9/k8CaW2tywvcI7+/mMGLunS0Gl
VdK4DmSyUuq741Kss7EsfwMkF6IEN9Jsuu2eAuU0sqpsRAqP/qjYOmcrW0ap8X5c
ifVQ30P61GqSGB9tUOqhXnmbcfomka4dptwh6aI+FrosBq2oXwezOtmV8nnKdLoz
jWH8qLYdsVhSnEXlfkKtkrw83n+JhGpsPpW5GKBbRzZIIPtrarJgn8XOkRACQiZA
znFvlC24oEkdq8at7vXpJyLMzz6gzQ==
=hm82
-----END PGP SIGNATURE-----

--Sig_/y.Pl+1Q6g8WeR=dasF6urrW--
