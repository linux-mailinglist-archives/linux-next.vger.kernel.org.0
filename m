Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A6F1EDD6B
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 08:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgFDGop (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 02:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbgFDGop (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 02:44:45 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE9BC05BD1E;
        Wed,  3 Jun 2020 23:44:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cx8q31m8z9sV7;
        Thu,  4 Jun 2020 16:44:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591253083;
        bh=JDsqhQUeDemGyzzsWYj0ptApwtGBWAVIHeBYPS6C8lM=;
        h=Date:From:To:Cc:Subject:From;
        b=TD4un/PbOeigPQCdtGpzGOCBe2AYuN6w54chL1FJNFhlyE5Bbrm68/3fajHUNt+ax
         wVm/Dj/5CM4tTZ1wF/qNoR69dTkT4rTLA/pTO/zILYVqNqVfnK+/UbnboJusS/R83s
         OMW06lqcpWAyOMbNSB38rOk4enby8mJYCZOHbj2ETmdeO1l262eNgNUnGvGGXbxRC2
         3BCOEsBUJJPHR0gcjVHoUI+2uBIdPh8U8l9JvASjGWXsSSSvn90FQpNjSrXjAQfw+L
         U4vrmXUUEKh7TC8hsfi3/1YJNS+0o3AJVSYl2AM9hGZUGWHHh00/BUlIamq0izuoE0
         0HkPIRW4febcw==
Date:   Thu, 4 Jun 2020 16:44:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: build failure after merge of the akpm tree
Message-ID: <20200604164442.5101cf27@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nli84aVRfTBFTkkk9AEKAl6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nli84aVRfTBFTkkk9AEKAl6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm tree, today's linux-next build (powerpc
allyesconfig) failed like this:

arch/powerpc/mm/ptdump/ptdump.c: In function 'walk_pagetables':
arch/powerpc/mm/ptdump/ptdump.c:337:25: error: implicit declaration of func=
tion 'pgd_is_leaf'; did you mean 'p4d_is_leaf'? [-Werror=3Dimplicit-functio=
n-declaration]
  337 |   if (pgd_none(*pgd) || pgd_is_leaf(*pgd))
      |                         ^~~~~~~~~~~
      |                         p4d_is_leaf

Caused by commit

   "powerpc: add support for folded p4d page tables"

I applied the following fix up patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 4 Jun 2020 16:33:01 +1000
Subject: [PATCH] fixup for powerpc ptdump.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/mm/ptdump/ptdump.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdum=
p.c
index 9b1c89b05622..de6e05ef871c 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -334,12 +334,12 @@ static void walk_pagetables(struct pg_state *st)
 	for (i =3D pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr +=3D PGDIR=
_SIZE) {
 		p4d_t *p4d =3D p4d_offset(pgd, 0);
=20
-		if (pgd_none(*pgd) || pgd_is_leaf(*pgd))
+		if (p4d_none(*p4d) || p4d_is_leaf(*p4d))
 			note_page(st, addr, 1, p4d_val(*p4d), PGDIR_SIZE);
 		else if (is_hugepd(__hugepd(p4d_val(*p4d))))
-			walk_hugepd(st, (hugepd_t *)pgd, addr, PGDIR_SHIFT, 1);
+			walk_hugepd(st, (hugepd_t *)p4d, addr, PGDIR_SHIFT, 1);
 		else
-			/* pgd exists */
+			/* p4d exists */
 			walk_pud(st, p4d, addr);
 	}
 }
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/nli84aVRfTBFTkkk9AEKAl6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7YmFoACgkQAVBC80lX
0GwNjgf6A6IiGqej01ytuMTE8MXcHy4sljfzPy612hAnV1PIXpU9p2AUDCIk/amc
aeN6/r10Ao2cvBHDzSsNlsnkq72msp3vvE56kGF9vZyZRYrBMpD5OCxOBsBjYImH
L1a6JUqk7n9vjYHZLR+1INP5oHPBcJLOVNFkecItrtdZkIIoHQ0vrldugD4OnLs0
zrjq29GabVmgOi03k33LF63bd1PpJ6yhSW5dlx+rf+rWL0KT6tgPoI6CfP9N4xdf
jMmtUgQPAjxObEKo04TyWhKffuAiuAPtANZI6ZXmU4WV2kd9Ow9VUz3JxhLJbzIF
Mb8B47fS0r0zjWaOMW/MvvjnqsR7fg==
=9hip
-----END PGP SIGNATURE-----

--Sig_/nli84aVRfTBFTkkk9AEKAl6--
