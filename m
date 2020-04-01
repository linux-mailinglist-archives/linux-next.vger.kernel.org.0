Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 202EF19A6D3
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 10:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731900AbgDAIIR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 04:08:17 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37527 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731959AbgDAIIR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Apr 2020 04:08:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sf2h44Zvz9sSM;
        Wed,  1 Apr 2020 19:08:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585728492;
        bh=CvNcLOPZYHoSKLkTFvgnu4VwDOclgFymmgY1i33jKfI=;
        h=Date:From:To:Cc:Subject:From;
        b=Pckhnjd+/6cbopaZGXqRpbDTBj8Ma/8sG7sDQUAEqLV9jy03utqI4kC0IJ7l8AgaP
         pvnvMJ1gQoS9e7HaeED38+bi3IMd+72UBiCaFjWcm3XANPz4nC6hgesCrkrzwdV0dN
         ovRqjcZiGc1hxlrPyeDU/4fK7CSOlRj2x9mg7yQ3phEVFUj7QvwnXtcm+d2kQDGFvx
         RX7mDeZoLSruFGpz+nHlpsws4fH8tSaSoRx3xm9KjUH+kczlToyB4/Yygly57Jne2L
         f1uNrfJNluKr5iWz3uFiczO63LPAq8QMS/ppMVKbB8ULsTgKUCdaPshH573nYoVm1M
         rB60AfWKY3l7A==
Date:   Wed, 1 Apr 2020 19:08:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <treding@nvidia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] gpio: turn of_pinctrl_get() into a static inline
Message-ID: <20200401190810.7a2cfa07@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3SZAq6yHrWYx3YSFUE9rMNj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3SZAq6yHrWYx3YSFUE9rMNj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This avoids the overheads of an EXPORTed function.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pinctrl/devicetree.c    | 6 ------
 include/linux/pinctrl/pinctrl.h | 9 +++------
 2 files changed, 3 insertions(+), 12 deletions(-)

This is not even build tested, but is this what you meant, Geert?

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index c6fe7d64c913..61abff89e5f8 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -99,12 +99,6 @@ static int dt_remember_or_free_map(struct pinctrl *p, co=
nst char *statename,
 	return -ENOMEM;
 }
=20
-struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
-{
-	return get_pinctrl_dev_from_of_node(np);
-}
-EXPORT_SYMBOL_GPL(of_pinctrl_get);
-
 static int dt_to_map_one_config(struct pinctrl *p,
 				struct pinctrl_dev *hog_pctldev,
 				const char *statename,
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctr=
l.h
index 2aef59df93d7..e7b5cd5e1b10 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -186,15 +186,12 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev =
*pctldev,
 				const char *pin_group, const unsigned **pins,
 				unsigned *num_pins);
=20
-#if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
-extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
-#else
-static inline
-struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
+static inline struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
 {
+	if (IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL))
+		return get_pinctrl_dev_from_of_node(np);
 	return NULL;
 }
-#endif /* CONFIG_OF */
=20
 extern const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev);
 extern const char *pinctrl_dev_get_devname(struct pinctrl_dev *pctldev);
--=20
2.26.0

--=20
Cheers,
Stephen Rothwell

--Sig_/3SZAq6yHrWYx3YSFUE9rMNj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ES+oACgkQAVBC80lX
0GyS4ggAguAh+IzL50faFNnn2lRVBp/2tcP+dANL293jv9obDnyQZZfs5RKDRyZr
HBgD0jz2EB+v+oAVMEHVq0AOpuZdygMRht+0vA2eZnZe68rAnKRS8yGhGxPgfILA
j4U4iSFhtxekLyGXHC+SyRRvX3/iJcVXPiW1XRA24DPrKaTFowmFIBEft2VmGjtY
5nWLeDDSi/O5TCca4Enrw3RXcvM6iKIHPAxH5N99tPZRBqxsAfgBUVgmLK0hdz+a
Bwx01Yy+8L4jX+eiXkCz4/88NekWJ2ByHXgt/xHBxcR7vVs6hsvRsITNLZK1bg4c
lkNP7zVCV3ItnOrV/mRoZVYUsI8CiA==
=fIjR
-----END PGP SIGNATURE-----

--Sig_/3SZAq6yHrWYx3YSFUE9rMNj--
