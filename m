Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F6F316445
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 11:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhBJKuT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 05:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhBJKsG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 05:48:06 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192E7C06174A;
        Wed, 10 Feb 2021 02:47:26 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DbGfy0P8sz9sBJ;
        Wed, 10 Feb 2021 21:47:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612954042;
        bh=Mr0rqSF8gviw0zM3gWdSV76YgCsysYNr9O7McGVF3cw=;
        h=Date:From:To:Cc:Subject:From;
        b=sylSplzBW0/PzbbcWxQQ4PezNE6Bt4EB4McVsvo4EJPfdSdYBbsZCgM4Tb2XRNvTR
         8BdaA7BtUqfUYstfIH9/1aldaj7BJ2ek0evsqDVsMcMN3vg23tMaSuZ+6lvHpt7EIH
         UP7WLsb4PQmjrwiDpOa+dujKgIrZaJFqFvhCcBnSsXAh46J75pxE+LLvfB2ZA91C2w
         nxsRdRJ04wbWKSBBa6/vgxGaC/f1aQxTU1qbo89t0wGHObH8aAqVGAozpcC5EA3NnX
         8rViRLhh3FtO72WHXhPkDnfhuXVILSfwa7E4wrG8HfX5mSDoxuJ9/unCqbtGEgTObL
         /+HJbFiJ/rlmA==
Date:   Wed, 10 Feb 2021 21:47:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20210210214720.02e6a6be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uW/byZSY6=kYP7Dn7xO4Mr6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uW/byZSY6=kYP7Dn7xO4Mr6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (sparc64
defconfig) failed like this:

drivers/of/property.o: In function `parse_interrupts':
property.c:(.text+0x14e0): undefined reference to `of_irq_parse_one'

Caused by commit

  f265f06af194 ("of: property: Fix fw_devlink handling of interrupts/interr=
upts-extended")

CONFIG_OF_IRQ depends on !SPARC so of_irq_parse_one() needs a stub.
I have added the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Feb 2021 21:27:56 +1100
Subject: [PATCH] of: irq: make a stub for of_irq_parse_one()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/of_irq.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index e8b78139f78c..f898d838d201 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -33,8 +33,6 @@ static inline int of_irq_parse_oldworld(struct device_nod=
e *device, int index,
 #endif /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
=20
 extern int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *ou=
t_irq);
-extern int of_irq_parse_one(struct device_node *device, int index,
-			  struct of_phandle_args *out_irq);
 extern unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data=
);
 extern int of_irq_to_resource(struct device_node *dev, int index,
 			      struct resource *r);
@@ -42,6 +40,8 @@ extern int of_irq_to_resource(struct device_node *dev, in=
t index,
 extern void of_irq_init(const struct of_device_id *matches);
=20
 #ifdef CONFIG_OF_IRQ
+extern int of_irq_parse_one(struct device_node *device, int index,
+			  struct of_phandle_args *out_irq);
 extern int of_irq_count(struct device_node *dev);
 extern int of_irq_get(struct device_node *dev, int index);
 extern int of_irq_get_byname(struct device_node *dev, const char *name);
@@ -57,6 +57,11 @@ extern struct irq_domain *of_msi_map_get_device_domain(s=
truct device *dev,
 extern void of_msi_configure(struct device *dev, struct device_node *np);
 u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_i=
n);
 #else
+static inline int of_irq_parse_one(struct device_node *device, int index,
+				   struct of_phandle_args *out_irq)
+{
+	return 0;
+}
 static inline int of_irq_count(struct device_node *dev)
 {
 	return 0;
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/uW/byZSY6=kYP7Dn7xO4Mr6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjubgACgkQAVBC80lX
0GwiVgf/YH8Bz3xdKRsC3kErh0gLgtafzLPtEeCwJB2fT7UBrJRiXwSLiLg4qgCS
t+d3S9teZWTHUTFLvXSDRwIEKES4UiNPKUJKL7M4eaJ8jkAurdQKknpY8u+RVhQQ
QIH8O0EebQT9Jln7Ru02JgwlBmrF7ImIklJZ+Ap8lN+JiDx2QWojteqjUUcT+2l+
RS3JhpkmVQ+zMiKuHEm5PaT1Yeda7fAq9vpi66y9MtqZY/Jc5g9/WNOUGk5knd+y
EnxNbxZiPnIKs98v0GyV8PmCDJoPq71fQ+LBiVfsI64Ef72lm3KOrSwrsoQGHGBf
vfwRhHM0pbGrKgYYs6SDS9Jtb8S/bw==
=Igqk
-----END PGP SIGNATURE-----

--Sig_/uW/byZSY6=kYP7Dn7xO4Mr6--
