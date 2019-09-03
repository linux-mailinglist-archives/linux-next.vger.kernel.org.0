Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1965EA6033
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 06:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfICE0p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 00:26:45 -0400
Received: from ozlabs.org ([203.11.71.1]:45261 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfICE0p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Sep 2019 00:26:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Mv6T0Jx9z9s4Y;
        Tue,  3 Sep 2019 14:26:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567484801;
        bh=ik6lRfimEE9A3HxGKDLKD9BJcOQNRt21i98iuUwi5M0=;
        h=Date:From:To:Cc:Subject:From;
        b=NwJ8i3ojihMTskBHIBbe9TEs/+l0iR8utQxPTWhO2lje3Wnv7LoY/oKUKJk6isJsF
         iR5hVYBbXu2JH97SdMW8jBElcHSo9czS3snJjjGqIAHzmrYuKAbKD0sxD08+UH+f/H
         cUQFsQDgZyzXwwQ0xjzqSz7xrOYiCK5RBNotTRNqdy3TskGcp67Ca7ggpnMaxhiXwh
         BRrQ2oLayNjbbs5llt1TcpzcZDM4/Ze69b2GTOGVrqPmey0pix6h3uSBwdqk1ApayE
         g3EC4cC/muDt221j1K7AM4JcemCdMJL2ks6zPvLADgZYh6k8hQKISbCTpP02//YQBL
         xcvouX91jrA8w==
Date:   Tue, 3 Sep 2019 14:26:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: linux-next: build failure after merge of the regulator tree
Message-ID: <20190903142638.79d2cc87@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u_So2=NMJY1hVIWxRbO1Sps";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u_So2=NMJY1hVIWxRbO1Sps
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ld: drivers/ata/ahci.o:(.opd+0x150): multiple definition of `regulator_bulk=
_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined here
ld: drivers/ata/ahci.o: in function `.regulator_bulk_set_supply_names':
ahci.c:(.text+0x1780): multiple definition of `.regulator_bulk_set_supply_n=
ames'; drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/ata/libahci.o: in function `.regulator_bulk_set_supply_names':
(.text+0x84a0): multiple definition of `.regulator_bulk_set_supply_names'; =
drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/ata/libahci.o:(.opd+0x5d0): multiple definition of `regulator_b=
ulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined h=
ere
ld: drivers/ata/sata_mv.o:(.opd+0x690): multiple definition of `regulator_b=
ulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined h=
ere
ld: drivers/ata/sata_mv.o: in function `.regulator_bulk_set_supply_names':
sata_mv.c:(.text+0xb9b0): multiple definition of `.regulator_bulk_set_suppl=
y_names'; drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/common/common.o: in function `.regulator_bulk_set_supply_na=
mes':
(.text+0x7d0): multiple definition of `.regulator_bulk_set_supply_names'; d=
rivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/common/common.o:(.opd+0x120): multiple definition of `regul=
ator_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first def=
ined here
ld: drivers/usb/core/usb.o: in function `.regulator_bulk_set_supply_names':
(.text+0x17d0): multiple definition of `.regulator_bulk_set_supply_names'; =
drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/core/usb.o:(.opd+0x348): multiple definition of `regulator_=
bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined =
here
ld: drivers/usb/core/hub.o: in function `.regulator_bulk_set_supply_names':
(.text+0x2610): multiple definition of `.regulator_bulk_set_supply_names'; =
drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/core/hub.o:(.opd+0x378): multiple definition of `regulator_=
bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined =
here
ld: drivers/usb/core/hcd.o: in function `.regulator_bulk_set_supply_names':
(.text+0x3020): multiple definition of `.regulator_bulk_set_supply_names'; =
drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/core/hcd.o:(.opd+0x378): multiple definition of `regulator_=
bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined =
here
ld: drivers/usb/core/message.o: in function `.regulator_bulk_set_supply_nam=
es':
(.text+0x2350): multiple definition of `.regulator_bulk_set_supply_names'; =
drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/core/message.o:(.opd+0x240): multiple definition of `regula=
tor_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defi=
ned here
ld: drivers/usb/core/phy.o: in function `.regulator_bulk_set_supply_names':
(.text+0x700): multiple definition of `.regulator_bulk_set_supply_names'; d=
rivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/core/phy.o:(.opd+0xc0): multiple definition of `regulator_b=
ulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined h=
ere
ld: drivers/usb/core/of.o: in function `.regulator_bulk_set_supply_names':
(.text+0x2f0): multiple definition of `.regulator_bulk_set_supply_names'; d=
rivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/core/of.o:(.opd+0x48): multiple definition of `regulator_bu=
lk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined he=
re
ld: drivers/usb/phy/of.o: in function `.regulator_bulk_set_supply_names':
(.text+0x120): multiple definition of `.regulator_bulk_set_supply_names'; d=
rivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/phy/of.o:(.opd+0x18): multiple definition of `regulator_bul=
k_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined here
ld: drivers/usb/host/ehci-hcd.o: in function `.regulator_bulk_set_supply_na=
mes':
(.text+0x11830): multiple definition of `.regulator_bulk_set_supply_names';=
 drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/host/ehci-hcd.o:(.opd+0x8d0): multiple definition of `regul=
ator_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first def=
ined here
ld: drivers/usb/host/ohci-hcd.o: in function `.regulator_bulk_set_supply_na=
mes':
(.text+0xe8d0): multiple definition of `.regulator_bulk_set_supply_names'; =
drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/usb/host/ohci-hcd.o:(.opd+0x570): multiple definition of `regul=
ator_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first def=
ined here
ld: drivers/of/platform.o: in function `.regulator_bulk_set_supply_names':
(.text+0x1180): multiple definition of `.regulator_bulk_set_supply_names'; =
drivers/phy/phy-core.o:(.text+0x2390): first defined here
ld: drivers/of/platform.o:(.opd+0x180): multiple definition of `regulator_b=
ulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined h=
ere

Caused by commit

  d0087e72710c ("regulator: provide regulator_bulk_set_supply_names()")

I applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 3 Sep 2019 14:23:17 +1000
Subject: [PATCH] regulator: stubs in header files should be static inline

Fixes: d0087e72710c ("regulator: provide regulator_bulk_set_supply_names()")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/regulator/consumer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/c=
onsumer.h
index 6d2181a76987..fe9bdf37c296 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -586,7 +586,7 @@ static inline int regulator_list_voltage(struct regulat=
or *regulator, unsigned s
 	return -EINVAL;
 }
=20
-void regulator_bulk_set_supply_names(struct regulator_bulk_data *consumers,
+static inline void regulator_bulk_set_supply_names(struct regulator_bulk_d=
ata *consumers,
 				     const char *const *supply_names,
 				     unsigned int num_supplies)
 {
--=20
2.23.0.rc1

--=20
Cheers,
Stephen Rothwell

--Sig_/u_So2=NMJY1hVIWxRbO1Sps
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1t634ACgkQAVBC80lX
0GzomAgAnqNtfMVaJ4JBPwCvcptoP8IMXucVJMvoiZrmu9EoCcUWC+tdLgkrYGCL
xyBFAQd1gO08aPOSa0A7vRK9bIaS31u+qnLNqIxSdyg4Q17MBbZdZgkU1tfjqhAs
vQ7OXXNkqU9DUcn12HqQhTwFFPi3dtXmUKp01mFXhr6mc/ougC4zfs8lNPpPPRaL
0O5s3hrc8/+eEHNcIyL3hsx1gDwTocD/y8EiCtDIbeg1wDSzjIFsHFQ4D689pr1q
f/vhCJGveLjQlvOytYpULtKhi0UK+st5xGpgyNzajhP/zdtQGTEe//JzUi60tJNM
+oR49mpxhYfRlE8yEk8l+WwZ7C9kxQ==
=mRcA
-----END PGP SIGNATURE-----

--Sig_/u_So2=NMJY1hVIWxRbO1Sps--
