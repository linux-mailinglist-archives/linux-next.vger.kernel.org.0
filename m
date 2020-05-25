Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74BF1E0C11
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 12:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389522AbgEYKpk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 06:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389484AbgEYKpk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 06:45:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE004C061A0E;
        Mon, 25 May 2020 03:45:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49VtzP0yzHz9sSg;
        Mon, 25 May 2020 20:45:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590403537;
        bh=6Q7JXlwF2Rcy26HZZvGUKpQSB/dFk+mz8rLmYPUDsq8=;
        h=Date:From:To:Cc:Subject:From;
        b=S1w8YoBl4a/LvKGndnClVAUxDFa7K4P0Viucd/BPReV+BIV9/aD2LIKkOknTKGqtn
         +xnMco+B8iBR7Irvv2SUB9dyg74CZOb8M5q9LU+r25XIG9IOsH/Kscf7d+boscoZV4
         TNts9Cl3yD4ucAlnh6yYJvEFXjff+hb3zybMjdZnlC86YGuz8Snb0ZmB/jPb2k+k2V
         WFu7SPsloaCaO0gXCgiZzBK+XXe1B1S3tcucJttpaWy+YKXT9HiWj3tSGY2xRqYW/N
         CT1YQdgSe85HHNqotSn5iYUWpm7Mgjvq5zwVyIP7kyiqzVzoC2bXhpKUKlNUrxR1QR
         giiHiJOY13N8w==
Date:   Mon, 25 May 2020 20:45:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20200525204535.18e243d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3geVHwl1tYIx_S6vKZI_F3q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3geVHwl1tYIx_S6vKZI_F3q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/mtd/nand/raw/pasemi_nand.c: In function 'pasemi_nand_probe':
drivers/mtd/nand/raw/pasemi_nand.c:157:1: warning: label 'out_cleanup' defi=
ned but not used [-Wunused-label]
  157 | out_cleanup:
      | ^~~~~~~~~~~
drivers/mtd/nand/raw/pasemi_nand.c:149:3: error: label 'out_cleanup_nand' u=
sed but not defined
  149 |   goto out_cleanup_nand;
      |   ^~~~

Caused by commit

  d6a2207d79e3 ("mtd: rawnand: pasemi: Fix the probe error path")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 May 2020 20:41:22 +1000
Subject: [PATCH] mtd: rawnand: pasemi: fix up label spelling

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pase=
mi_nand.c
index 37570f0c3a36..d8eca8c3fdcd 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -154,7 +154,7 @@ static int pasemi_nand_probe(struct platform_device *of=
dev)
=20
 	return 0;
=20
-out_cleanup:
+ out_cleanup_nand:
 	nand_cleanup(chip);
  out_lpc:
 	release_region(lpcctl, 4);
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/3geVHwl1tYIx_S6vKZI_F3q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Loc8ACgkQAVBC80lX
0Gz/dgf/VsOmeJkK9N/mBkx+mpOQz4tCKEQRK0IH2391WEd0cupp7flpnLD+YIz3
C7Om40haQRSkphj3iCGQbKYe/dZDKw341yH0072tjnFkgCIQmT3KYuGjvtq1CnkV
XJ6QSWpOdjXOJyyOONldKgvw3ax/kPFELhKA/vrMDIk2iOnTPfg6lr9tF63crkdR
ZnDG3mY28Eoe4DI0FJU3bM3+f+xFbBWs9tY1kDypeAx1/x/FIDZfZcgjCsJoZJrx
7XOnVnonB92NKpVO0EAaxW3iueY/diM2Vq58BWXgvf3HtMFnQhGJd7ouFYJG9L2Z
RMDDkih/glJGM9mCjpvVB/bMyPUdqg==
=/5Pw
-----END PGP SIGNATURE-----

--Sig_/3geVHwl1tYIx_S6vKZI_F3q--
