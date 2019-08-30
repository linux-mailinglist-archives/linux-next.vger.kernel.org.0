Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D361A3826
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 15:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH3Nzj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 09:55:39 -0400
Received: from ozlabs.org ([203.11.71.1]:36015 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727170AbfH3Nzj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Aug 2019 09:55:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Kgwl19HKz9s7T;
        Fri, 30 Aug 2019 23:55:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567173335;
        bh=VTAiaBz22TTXel1ha2s/bTgs6tmonm/LUfRyubXF/Dw=;
        h=Date:From:To:Cc:Subject:From;
        b=lKkrnMmiKFvu5EfyA27jHtGLH3nCTUI68MCausSw+qzoIdzYFdkbO8zqXPHx/SrVF
         8mEtqxlwewsxy4vhrvYjOvetximHJCVBsXaZwRDWQKV7oA26W0vMtF8Kl36zB9gmhx
         NwD5ZLiO/uJc7aIpr62KegpjkiVLmGudBP78zuZjg0H/LThbCqTkV8Ppz6KlyDI8Lg
         uQjmzYKiIDiE2XKOlD4ocn9AyOTiBWHH07mHVwDARaEFEPkPEEwpFWHcumGWH/V9e6
         Kp4Bx1AQrkN/yp3fkcLW19JMV3Alfr4NZmZbRKam3HRHLTVryK6Y3PeCa1TMEpd5sy
         0n90MHgrhNxdw==
Date:   Fri, 30 Aug 2019 23:55:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Minchan Kim <minchan@kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20190830235530.67c23ad3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_h0l=FaIWHvEqTs3K=mFyHZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_h0l=FaIWHvEqTs3K=mFyHZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

mm/madvise.c: In function 'madvise_cold_page_range':
mm/madvise.c:459:4: error: 'struct mm_walk' has no member named 'pmd_entry'
  459 |   .pmd_entry =3D madvise_cold_or_pageout_pte_range,
      |    ^~~~~~~~~
mm/madvise.c:459:16: error: initialization of 'const struct mm_walk_ops *' =
from incompatible pointer type 'int (*)(pmd_t *, long unsigned int,  long u=
nsigned int,  struct mm_walk *)' {aka 'int (*)(unsigned int *, long unsigne=
d int,  long unsigned int,  struct mm_walk *)'} [-Werror=3Dincompatible-poi=
nter-types]
  459 |   .pmd_entry =3D madvise_cold_or_pageout_pte_range,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/madvise.c:459:16: note: (near initialization for 'cold_walk.ops')
mm/madvise.c:465:18: warning: passing argument 1 of 'walk_page_range' makes=
 pointer from integer without a cast [-Wint-conversion]
  465 |  walk_page_range(addr, end, &cold_walk);
      |                  ^~~~
      |                  |
      |                  long unsigned int
In file included from mm/madvise.c:24:
include/linux/pagewalk.h:60:39: note: expected 'struct mm_struct *' but arg=
ument is of type 'long unsigned int'
   60 | int walk_page_range(struct mm_struct *mm, unsigned long start,
      |                     ~~~~~~~~~~~~~~~~~~^~
mm/madvise.c:465:29: warning: passing argument 3 of 'walk_page_range' makes=
 integer from pointer without a cast [-Wint-conversion]
  465 |  walk_page_range(addr, end, &cold_walk);
      |                             ^~~~~~~~~~
      |                             |
      |                             struct mm_walk *
In file included from mm/madvise.c:24:
include/linux/pagewalk.h:61:17: note: expected 'long unsigned int' but argu=
ment is of type 'struct mm_walk *'
   61 |   unsigned long end, const struct mm_walk_ops *ops,
      |   ~~~~~~~~~~~~~~^~~
mm/madvise.c:465:2: error: too few arguments to function 'walk_page_range'
  465 |  walk_page_range(addr, end, &cold_walk);
      |  ^~~~~~~~~~~~~~~
In file included from mm/madvise.c:24:
include/linux/pagewalk.h:60:5: note: declared here
   60 | int walk_page_range(struct mm_struct *mm, unsigned long start,
      |     ^~~~~~~~~~~~~~~
mm/madvise.c: In function 'madvise_pageout_page_range':
mm/madvise.c:498:4: error: 'struct mm_walk' has no member named 'pmd_entry'
  498 |   .pmd_entry =3D madvise_cold_or_pageout_pte_range,
      |    ^~~~~~~~~
mm/madvise.c:498:16: error: initialization of 'const struct mm_walk_ops *' =
from incompatible pointer type 'int (*)(pmd_t *, long unsigned int,  long u=
nsigned int,  struct mm_walk *)' {aka 'int (*)(unsigned int *, long unsigne=
d int,  long unsigned int,  struct mm_walk *)'} [-Werror=3Dincompatible-poi=
nter-types]
  498 |   .pmd_entry =3D madvise_cold_or_pageout_pte_range,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/madvise.c:498:16: note: (near initialization for 'pageout_walk.ops')
mm/madvise.c:504:18: warning: passing argument 1 of 'walk_page_range' makes=
 pointer from integer without a cast [-Wint-conversion]
  504 |  walk_page_range(addr, end, &pageout_walk);
      |                  ^~~~
      |                  |
      |                  long unsigned int
In file included from mm/madvise.c:24:
include/linux/pagewalk.h:60:39: note: expected 'struct mm_struct *' but arg=
ument is of type 'long unsigned int'
   60 | int walk_page_range(struct mm_struct *mm, unsigned long start,
      |                     ~~~~~~~~~~~~~~~~~~^~
mm/madvise.c:504:29: warning: passing argument 3 of 'walk_page_range' makes=
 integer from pointer without a cast [-Wint-conversion]
  504 |  walk_page_range(addr, end, &pageout_walk);
      |                             ^~~~~~~~~~~~~
      |                             |
      |                             struct mm_walk *
In file included from mm/madvise.c:24:
include/linux/pagewalk.h:61:17: note: expected 'long unsigned int' but argu=
ment is of type 'struct mm_walk *'
   61 |   unsigned long end, const struct mm_walk_ops *ops,
      |   ~~~~~~~~~~~~~~^~~
mm/madvise.c:504:2: error: too few arguments to function 'walk_page_range'
  504 |  walk_page_range(addr, end, &pageout_walk);
      |  ^~~~~~~~~~~~~~~
In file included from mm/madvise.c:24:
include/linux/pagewalk.h:60:5: note: declared here
   60 | int walk_page_range(struct mm_struct *mm, unsigned long start,
      |     ^~~~~~~~~~~~~~~

Caused by commit

  1c8999b3963d ("mm: introduce MADV_COLD")
(and following commits)

interacting with commit

  923bfc561e75 ("pagewalk: separate function pointers from iterator data")

from the hmm tree.

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 30 Aug 2019 23:39:37 +1000
Subject: [PATCH] mm: merge fix for "pagewalk: separate function pointers fr=
om iterator data"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/madvise.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 7ec7c8f6d5ab..20598df8360a 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -446,6 +446,10 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pm=
d,
 	return 0;
 }
=20
+static const struct mm_walk_ops cold_walk_ops =3D {
+	.pmd_entry =3D madvise_cold_or_pageout_pte_range,
+};
+
 static void madvise_cold_page_range(struct mmu_gather *tlb,
 			     struct vm_area_struct *vma,
 			     unsigned long addr, unsigned long end)
@@ -455,14 +459,8 @@ static void madvise_cold_page_range(struct mmu_gather =
*tlb,
 		.pageout =3D false,
 	};
=20
-	struct mm_walk cold_walk =3D {
-		.pmd_entry =3D madvise_cold_or_pageout_pte_range,
-		.mm =3D vma->vm_mm,
-		.private =3D &walk_private,
-	};
-
 	tlb_start_vma(tlb, vma);
-	walk_page_range(addr, end, &cold_walk);
+	walk_page_range(vma->vm_mm, addr, end, &cold_walk_ops, &walk_private);
 	tlb_end_vma(tlb, vma);
 }
=20
@@ -485,6 +483,10 @@ static long madvise_cold(struct vm_area_struct *vma,
 	return 0;
 }
=20
+static const struct mm_walk_ops pageout_walk_ops =3D {
+	.pmd_entry =3D madvise_cold_or_pageout_pte_range,
+};
+
 static void madvise_pageout_page_range(struct mmu_gather *tlb,
 			     struct vm_area_struct *vma,
 			     unsigned long addr, unsigned long end)
@@ -494,14 +496,8 @@ static void madvise_pageout_page_range(struct mmu_gath=
er *tlb,
 		.tlb =3D tlb,
 	};
=20
-	struct mm_walk pageout_walk =3D {
-		.pmd_entry =3D madvise_cold_or_pageout_pte_range,
-		.mm =3D vma->vm_mm,
-		.private =3D &walk_private,
-	};
-
 	tlb_start_vma(tlb, vma);
-	walk_page_range(addr, end, &pageout_walk);
+	walk_page_range(vma->vm_mm, addr, end, &pageout_walk_ops, &walk_private);
 	tlb_end_vma(tlb, vma);
 }
=20
--=20
2.23.0.rc1

--=20
Cheers,
Stephen Rothwell

--Sig_/_h0l=FaIWHvEqTs3K=mFyHZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1pKtIACgkQAVBC80lX
0GxvGgf+Itl70PzMNQJTI39dr4u8EAVCgIl4Xyvm9DDS25l0onw33TFaMnybqnaG
B7pcm539jWVubOIGTuZq6SM9HO1lApYCBv8Y0UNu0hgAg2lHeDnFzJxBgL4o1dm2
f95KFyqo2s25UcVmxG74FSH5thOsE/sCyYirJQ9ElCq/J037ogCeZO5oohrMGAbK
cK2fGMnka++8fqbRs1ZOyVv3bAGOHJW4z2mqMxp2hGkN2648xIJnv3tqtBg/+ElJ
Bz0pgtunmc0x6TUxmz33fUGT3kNaHG5by3pw0DIGVcJzxJDSX6iqZByTl/MAdIa+
Pq22AwBSHaDLamHKm6Uv53mq3PUp3Q==
=p1E9
-----END PGP SIGNATURE-----

--Sig_/_h0l=FaIWHvEqTs3K=mFyHZ--
