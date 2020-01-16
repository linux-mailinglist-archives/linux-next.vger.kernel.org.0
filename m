Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B63313D35C
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 06:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgAPFCo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 00:02:44 -0500
Received: from ozlabs.org ([203.11.71.1]:59861 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbgAPFCn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jan 2020 00:02:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47ysWg0nWlz9sPW;
        Thu, 16 Jan 2020 16:02:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579150960;
        bh=tcjsFmtE6rwms6qQPruMfvGEI5InVaCHB4/OPSGS+T8=;
        h=Date:From:To:Cc:Subject:From;
        b=R/eZmHbITuTL8Zh8t8EDnHVIYtwWdYLbUOh8TabazN+bkU578Ncpg9PZF62He+lsK
         X24MIwG6OQKNkOKURecrQ4oeUDCGXbWoDOVh6hWeH+1dAPn7NeqY94C/GHQA07Ab4T
         nHUtxonLzSC8E7PrKwLp6xza3EQTq82thEu2Uq0cE/BLNzZAeOSKL42jv0g4ia1EbW
         0qNrSwpKVweZDx6oTH2ZcIWNzXaJH9qE8uQe3IqdXZXsgTe8aMmuabvKG/Ns87/3W5
         51hMagjPvz38pNrN4EzskidTlzV8au75HSI4NcCA8dDoNV4FyHK+Ysfs0X8n/61Q1c
         IxJ+OHvrVj0yQ==
Date:   Thu, 16 Jan 2020 16:02:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: linux-next: manual merge of the generic-ioremap tree with the
 drm-misc tree
Message-ID: <20200116160238.6cbdc6b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i2nN6Em1mLxCXpTGTPgmt4/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i2nN6Em1mLxCXpTGTPgmt4/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the generic-ioremap tree got a conflict in:

  drivers/video/fbdev/s1d13xxxfb.c

between commit:

  091be7245a03 ("fbdev: s1d13xxxfb: use resource_size")

from the drm-misc tree and commit:

  4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")

from the generic-ioremap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/video/fbdev/s1d13xxxfb.c
index c23defa27036,8048499e398d..000000000000
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@@ -809,8 -809,8 +809,8 @@@ static int s1d13xxxfb_probe(struct plat
 =20
  	platform_set_drvdata(pdev, info);
  	default_par =3D info->par;
- 	default_par->regs =3D ioremap_nocache(pdev->resource[1].start,
- 					    resource_size(&pdev->resource[1]));
+ 	default_par->regs =3D ioremap(pdev->resource[1].start,
 -			pdev->resource[1].end - pdev->resource[1].start +1);
++				    resource_size(&pdev->resource[1]));
  	if (!default_par->regs) {
  		printk(KERN_ERR PFX "unable to map registers\n");
  		ret =3D -ENOMEM;
@@@ -818,8 -818,9 +818,8 @@@
  	}
  	info->pseudo_palette =3D default_par->pseudo_palette;
 =20
- 	info->screen_base =3D ioremap_nocache(pdev->resource[0].start,
- 					    resource_size(&pdev->resource[0]));
+ 	info->screen_base =3D ioremap(pdev->resource[0].start,
 -			pdev->resource[0].end - pdev->resource[0].start +1);
 -
++				    resource_size(&pdev->resource[0]));
  	if (!info->screen_base) {
  		printk(KERN_ERR PFX "unable to map framebuffer\n");
  		ret =3D -ENOMEM;

--Sig_/i2nN6Em1mLxCXpTGTPgmt4/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4f7m4ACgkQAVBC80lX
0GzgUgf8DoZP7ANEwFA1gmq90A09IBorF75zwmqIymxdXpOi2T7CVq6q1yR29A95
mXpemEXluocHJCNOqavmRW7aLHFmGI1LwxuG7axjp+GX65/AMxKS0VXi01BT8yEN
aisQSiccDkWvrU+pZaBDpWVFSGAoyNwk/tCLcdKtKnix3pPpTfvmmZ9wJZVqeKsb
56XAFmkLzaXY7VicldQxNslF6c4NCn19WUZ7wdcPxY01/0JhyN3Bhbe46wCLjgwX
OGondzDPgu00D8OOAvVhvY4nixZjybjQPqVCqsjVgwRUgWxGkZK2YQ5sxHUxyXYZ
3shGjgS1i7cNrSAsoaqXIVaWobs8Ng==
=yLii
-----END PGP SIGNATURE-----

--Sig_/i2nN6Em1mLxCXpTGTPgmt4/--
