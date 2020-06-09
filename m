Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9481F3ACC
	for <lists+linux-next@lfdr.de>; Tue,  9 Jun 2020 14:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgFIMm6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Jun 2020 08:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbgFIMm6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2020 08:42:58 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142A1C05BD1E;
        Tue,  9 Jun 2020 05:42:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49h8sp1pwkz9sRW;
        Tue,  9 Jun 2020 22:42:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591706574;
        bh=WE3JXySLmYgNjlUWsxltg1c+ac2THfPexOS2wHJxEt8=;
        h=Date:From:To:Cc:Subject:From;
        b=nmiFa7N9mZld4e4sxIX3tQHR9yDquCpEPfiwEqmhDcixnEM7XZdN3rtVdRIYi31IP
         dikB+gWm3gFmDeFcNYOki6AacT3GSZRYTzc/AI3/MzWbssjxsCtvONjvi4XtsG4By8
         dfSueqT/maVXJnWe6NblUx1Fp8p5P1WlQ4LiZ+TjAMqhmu2yfsV+7efois71k1IHFX
         i7fXwSBxFqanNTHD6bWcJ6MU7KP+aRdYehsS/qZ1XtdqF90y9sNwG7sbAp2eEj9qO4
         /fki3U1+WrmDUN8Jeb5X9Bn0wnLqKEK7XBZox5KFcLJXHgJpCtUsqZC+4ILAJC4MYv
         bctBAOD4RbtIg==
Date:   Tue, 9 Jun 2020 22:42:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200609224252.1704eff3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/20osjNj6dzcJHlq1F.yGC.c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/20osjNj6dzcJHlq1F.yGC.c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (sparc
defconfig) failed like this:

In file included from include/linux/mm.h:32:0,
                 from include/linux/memblock.h:13,
                 from arch/sparc/mm/srmmu.c:14:
include/linux/pgtable.h:74:27: error: redefinition of 'pte_offset_kernel'
 #define pte_offset_kernel pte_offset_kernel
                           ^
arch/sparc/mm/srmmu.c:144:8: note: in expansion of macro 'pte_offset_kernel'
 pte_t *pte_offset_kernel(pmd_t *dir, unsigned long address)
        ^~~~~~~~~~~~~~~~~
include/linux/pgtable.h:70:22: note: previous definition of 'pte_offset_ker=
nel' was here
 static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
                      ^~~~~~~~~~~~~~~~~

Caused by commit

  292aa65ed13a ("mm: consolidate pte_index() and pte_offset_*() definitions=
")

I used the (missing part of the) patch from next-20200608:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 9 Jun 2020 22:36:14 +1000
Subject: [PATCH] update sparc32 for "mm: consolidate pte_index() and
 pte_offset_*() definitions"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/mm/srmmu.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 989da22ba8e9..0070f8b9a753 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -140,16 +140,6 @@ void pmd_set(pmd_t *pmdp, pte_t *ptep)
 	set_pte((pte_t *)&pmd_val(*pmdp), __pte(SRMMU_ET_PTD | ptp));
 }
=20
-/* Find an entry in the third-level page table.. */
-pte_t *pte_offset_kernel(pmd_t *dir, unsigned long address)
-{
-	void *pte;
-
-	pte =3D __nocache_va((pmd_val(*dir) & SRMMU_PTD_PMASK) << 4);
-	return (pte_t *) pte +
-	    ((address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1));
-}
-
 /*
  * size: bytes to allocate in the nocache area.
  * align: bytes, number to align at.
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/20osjNj6dzcJHlq1F.yGC.c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7fg8wACgkQAVBC80lX
0GwVzQf+Mb6/pKs6w583Gf2Qh3JtbaZgw858sw8TmENiKIDjm+sQdAhJwZTXfNP6
vYEO5ibieSF8PEIzFJyr0hryPvO6mXoAUG5/7vnIs/h60odPnNqPzjDMVmpbKVcX
+B2s3DO7gTwMgV6C/k61mzrF2NvXh38k2xJIxw7in2hP3l7c1kKPM/opgQls73VT
g8JHhq3PjG/JA+jTkQXF3BWRgOTkFChLLb1cXL/bOKbsdLSiYHzZTXzDV1pYuG4M
73bgt6pSSS5xabdtclCEFtTXU9SBEyN+drUhIrYVcapVF5n5KQ3JLUE6PtWPjnU/
9RgvRNeGT6MPqSHB5K3VtiK3OJD32g==
=w6m3
-----END PGP SIGNATURE-----

--Sig_/20osjNj6dzcJHlq1F.yGC.c--
