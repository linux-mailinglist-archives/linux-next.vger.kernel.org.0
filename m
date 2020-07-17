Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4830E2231BC
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 05:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgGQDl5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 23:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgGQDl5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2020 23:41:57 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB77BC061755;
        Thu, 16 Jul 2020 20:41:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7H42710Zz9sRN;
        Fri, 17 Jul 2020 13:41:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594957315;
        bh=I+diQgdBksqMDNEDQO1DW8SMPxA1UG60rYse/U+8AdA=;
        h=Date:From:To:Cc:Subject:From;
        b=AE4PMhkmmCW7YXcQNLsaTU0YVx/3DxL140ssxxbvyM15wJf6Sg7BdnytdSo9TL4jQ
         z9v9ulL7Zr6206TZbDOLKrwfCsRCepVfeP21MthdbDQwmDgUfctS4Kdn5HGdcLS7JV
         fRymt4XdmRn3qw8mQka4MAgkTb4PZL1a83B3ZWNwJecpttG0NeQqwk82822LNXCjUK
         qsKT3XpcxOQoIsRmQeA19APkq/2NajRFdWDRMK8NPJVz2X5549yI7R/d+UJFnUEWNf
         ofbSS5z7ETAl0DDH9JjCwcvtLGb4fRQjM8GK6AwtCzm3u7Eefi8ZvDTNsn8dROYe2o
         sJd75QfXwzNGw==
Date:   Fri, 17 Jul 2020 13:41:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the mfd tree
Message-ID: <20200717134154.50326d78@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wzSUY.Mm=JfxGqE90lH3=LR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wzSUY.Mm=JfxGqE90lH3=LR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/mfd/kempld-core.c: In function 'kempld_register_cells_generic':
drivers/mfd/kempld-core.c:105:13: error: assignment of read-only location '=
devs[i++]'
  105 |   devs[i++] =3D kempld_devs[KEMPLD_I2C];
      |             ^
drivers/mfd/kempld-core.c:108:13: error: assignment of read-only location '=
devs[i++]'
  108 |   devs[i++] =3D kempld_devs[KEMPLD_WDT];
      |             ^
drivers/mfd/kempld-core.c:111:13: error: assignment of read-only location '=
devs[i++]'
  111 |   devs[i++] =3D kempld_devs[KEMPLD_GPIO];
      |             ^
drivers/mfd/kempld-core.c:114:13: error: assignment of read-only location '=
devs[i++]'
  114 |   devs[i++] =3D kempld_devs[KEMPLD_UART];
      |             ^

Caused by commit

  70d48975c152 ("mfd: core: Make a best effort attempt to match devices wit=
h the correct of_nodes")

I have added the following fix patch for today (I assume that there is
a better solution):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 17 Jul 2020 13:36:22 +1000
Subject: [PATCH] fix up for struct mfd_cell change

Fixes: 70d48975c152 ("mfd: core: Make a best effort attempt to match device=
s with the correct of_nodes")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mfd/kempld-core.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index f48e21d8b97c..ad68ee699cb5 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -79,39 +79,31 @@ enum kempld_cells {
 	KEMPLD_UART,
 };
=20
-static const struct mfd_cell kempld_devs[] =3D {
-	[KEMPLD_I2C] =3D {
-		.name =3D "kempld-i2c",
-	},
-	[KEMPLD_WDT] =3D {
-		.name =3D "kempld-wdt",
-	},
-	[KEMPLD_GPIO] =3D {
-		.name =3D "kempld-gpio",
-	},
-	[KEMPLD_UART] =3D {
-		.name =3D "kempld-uart",
-	},
+static const char *kempld_devs[] =3D {
+	[KEMPLD_I2C] =3D "kempld-i2c",
+	[KEMPLD_WDT] =3D "kempld-wdt",
+	[KEMPLD_GPIO] =3D "kempld-gpio",
+	[KEMPLD_UART] =3D "kempld-uart",
 };
=20
 #define KEMPLD_MAX_DEVS	ARRAY_SIZE(kempld_devs)
=20
 static int kempld_register_cells_generic(struct kempld_device_data *pld)
 {
-	struct mfd_cell devs[KEMPLD_MAX_DEVS];
+	struct mfd_cell devs[KEMPLD_MAX_DEVS] =3D {};
 	int i =3D 0;
=20
 	if (pld->feature_mask & KEMPLD_FEATURE_BIT_I2C)
-		devs[i++] =3D kempld_devs[KEMPLD_I2C];
+		devs[i++].name =3D kempld_devs[KEMPLD_I2C];
=20
 	if (pld->feature_mask & KEMPLD_FEATURE_BIT_WATCHDOG)
-		devs[i++] =3D kempld_devs[KEMPLD_WDT];
+		devs[i++].name =3D kempld_devs[KEMPLD_WDT];
=20
 	if (pld->feature_mask & KEMPLD_FEATURE_BIT_GPIO)
-		devs[i++] =3D kempld_devs[KEMPLD_GPIO];
+		devs[i++].name =3D kempld_devs[KEMPLD_GPIO];
=20
 	if (pld->feature_mask & KEMPLD_FEATURE_MASK_UART)
-		devs[i++] =3D kempld_devs[KEMPLD_UART];
+		devs[i++].name =3D kempld_devs[KEMPLD_UART];
=20
 	return mfd_add_devices(pld->dev, -1, devs, i, NULL, 0, NULL);
 }
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/wzSUY.Mm=JfxGqE90lH3=LR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RHgIACgkQAVBC80lX
0GyeBQf/b5vLY/pw4G+VOpwfhhkkmnOYfUIioFB0RbMDhyACfxE+3uMLw6mkI9dQ
g5oB7HHWkHqzXSNhdVjfua2Zc1CAh//TTQhRuf+19SfSo8Z47wF/Z6+eQT20hK1J
1+5YvfeEh+S94RpnDmGAq35fFoDjC4WYP08KDslRgFGDNmkF3tcNhQ/f4PogO611
ePhWyhkE4hbzCJb2VbtKARFWpHJZ1d/G4rXPxCD+SpCnXsVHsXGWKXj+yhcrmwCk
VPvyaI9gC0l5p1NckYAFSXz40E21WJnz9CcQTOfwLbrNbVDi3y+BDMnfoCKQd7ai
m7vkWmm9IEeZbqlIQa+XKtaZOLM54w==
=B271
-----END PGP SIGNATURE-----

--Sig_/wzSUY.Mm=JfxGqE90lH3=LR--
