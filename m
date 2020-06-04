Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB811EDD8C
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 08:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgFDGwu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 02:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgFDGwt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 02:52:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B378BC05BD1E;
        Wed,  3 Jun 2020 23:52:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cxL72snVz9sSg;
        Thu,  4 Jun 2020 16:52:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591253567;
        bh=/r1CAKtCIxiqFy4xQJQMesnAJdFfw5/dQLpE/npLIT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MKA7/UW2zHGF4/Ep53TjO8O+xzBvfOfwwQeuzljVQiSPr2oQ17NwVp8W8cMNJh8E3
         OOIKMik9FErkmWTuT32PvY5i6N7WBY3S8YXHmEesh3SzVT5nAzHYfeCyWfetkz0yXe
         +FPkEWwixoviwKgRnA+b7xA4kUpJ3DEdo8UW+4WpwkXrRrIGHiGEAluUtOAIs0rr4K
         QVbjA2vr2oBnNYBkkdzSbdz9VNiYeDmnU87tdL1S5Fw5J/0On196RJ6l/hJwgIrKJ+
         n19FSmN6gRoOq06lXfQ14VNePMCGIimtbTpqXqpqUbA1apRjCewBkmulIZJR8MwVH5
         aJOrtbXhvhPVw==
Date:   Thu, 4 Jun 2020 16:52:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: fix ups for clashes between akpm and powerpc trees
Message-ID: <20200604165246.436f02ba@canb.auug.org.au>
In-Reply-To: <20200603202655.0ad0eacc@canb.auug.org.au>
References: <20200603202655.0ad0eacc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=DWI=A5QvwYmtmW3ryBDDxf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=DWI=A5QvwYmtmW3ryBDDxf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Jun 2020 20:26:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Some things turned up in the powerpc tree today that required some changes
> to patches in the akpm tree and also the following fixup patch provided
> (mostly) by Michael. I have applied this as a single patch today, but
> parts of it should probably go in some other patches.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 3 Jun 2020 20:03:49 +1000
> Subject: [PATCH] powerpc fixes for changes clashing with akpm tree changes
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---

I applied this again today.  It is slightly different and now looks like th=
is:

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/64/pgtable.h
index 25c3cb8272c0..a6799723cd98 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1008,6 +1008,12 @@ extern struct page *p4d_page(p4d_t p4d);
 #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
 #define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
=20
+static inline unsigned long pgd_index(unsigned long address)
+{
+	return (address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1);
+}
+#define pgd_index pgd_index
+
 #define pte_ERROR(e) \
 	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/32/pgtable.h
index c188a6f64bcd..1927e1b653f2 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -205,10 +205,6 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp =3D __pmd(0);
 }
=20
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /* to find an entry in a page-table-directory */
 #define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
 #define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
@@ -241,7 +237,7 @@ static inline pte_basic_t pte_update(struct mm_struct *=
mm, unsigned long addr, p
 	pte_basic_t old =3D pte_val(*p);
 	pte_basic_t new =3D (old & ~(pte_basic_t)clr) | set;
 	int num, i;
-	pmd_t *pmd =3D pmd_offset(pud_offset(pgd_offset(mm, addr), addr), addr);
+	pmd_t *pmd =3D pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, addr), add=
r), addr), addr);
=20
 	if (!huge)
 		num =3D PAGE_SIZE / SZ_4K;
@@ -341,6 +337,10 @@ static inline int pte_young(pte_t pte)
 	pfn_to_page((__pa(pmd_val(pmd)) >> PAGE_SHIFT))
 #endif
=20
+#define pte_offset_kernel(dir, addr)	\
+	(pmd_bad(*(dir)) ? NULL : (pte_t *)pmd_page_vaddr(*(dir)) + \
+				  pte_index(addr))
+
 /*
  * Encode and decode a swap entry.
  * Note that the bits we use in a PTE for representing a swap entry
diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
index db4ef44af22f..569d98a41881 100644
--- a/arch/powerpc/mm/kasan/8xx.c
+++ b/arch/powerpc/mm/kasan/8xx.c
@@ -10,7 +10,7 @@
 static int __init
 kasan_init_shadow_8M(unsigned long k_start, unsigned long k_end, void *blo=
ck)
 {
-	pmd_t *pmd =3D pmd_ptr_k(k_start);
+	pmd_t *pmd =3D pmd_off_k(k_start);
 	unsigned long k_cur, k_next;
=20
 	for (k_cur =3D k_start; k_cur !=3D k_end; k_cur =3D k_next, pmd +=3D 2, b=
lock +=3D SZ_8M) {
@@ -59,7 +59,7 @@ int __init kasan_init_region(void *start, size_t size)
 		return ret;
=20
 	for (; k_cur < k_end; k_cur +=3D PAGE_SIZE) {
-		pmd_t *pmd =3D pmd_ptr_k(k_cur);
+		pmd_t *pmd =3D pmd_off_k(k_cur);
 		void *va =3D block + k_cur - k_start;
 		pte_t pte =3D pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
=20
diff --git a/arch/powerpc/mm/kasan/book3s_32.c b/arch/powerpc/mm/kasan/book=
3s_32.c
index 4bc491a4a1fd..a32b4640b9de 100644
--- a/arch/powerpc/mm/kasan/book3s_32.c
+++ b/arch/powerpc/mm/kasan/book3s_32.c
@@ -46,7 +46,7 @@ int __init kasan_init_region(void *start, size_t size)
 	kasan_update_early_region(k_start, k_cur, __pte(0));
=20
 	for (; k_cur < k_end; k_cur +=3D PAGE_SIZE) {
-		pmd_t *pmd =3D pmd_ptr_k(k_cur);
+		pmd_t *pmd =3D pmd_off_k(k_cur);
 		void *va =3D block + k_cur - k_start;
 		pte_t pte =3D pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
=20
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 286441bbbe49..92e8929cbe3e 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -74,7 +74,7 @@ static pte_t __init *early_hugepd_alloc_kernel(hugepd_t *=
pmdp, unsigned long va)
 static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t=
 pa,
 					     pgprot_t prot, int psize, bool new)
 {
-	pmd_t *pmdp =3D pmd_ptr_k(va);
+	pmd_t *pmdp =3D pmd_off_k(va);
 	pte_t *ptep;
=20
 	if (WARN_ON(psize !=3D MMU_PAGE_512K && psize !=3D MMU_PAGE_8M))
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 45a0556089e8..1136257c3a99 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -264,7 +264,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *v=
ma,
 #if defined(CONFIG_PPC_8xx)
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep=
, pte_t pte)
 {
-	pmd_t *pmd =3D pmd_ptr(mm, addr);
+	pmd_t *pmd =3D pmd_off(mm, addr);
 	pte_basic_t val;
 	pte_basic_t *entry =3D &ptep->pte;
 	int num =3D is_hugepd(*((hugepd_t *)pmd)) ? 1 : SZ_512K / SZ_4K;
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index e2d054c9575e..6eb4eab79385 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -40,7 +40,7 @@ notrace void __init early_ioremap_init(void)
 {
 	unsigned long addr =3D ALIGN_DOWN(FIXADDR_START, PGDIR_SIZE);
 	pte_t *ptep =3D (pte_t *)early_fixmap_pagetable;
-	pmd_t *pmdp =3D pmd_ptr_k(addr);
+	pmd_t *pmdp =3D pmd_off_k(addr);
=20
 	for (; (s32)(FIXADDR_TOP - addr) > 0;
 	     addr +=3D PGDIR_SIZE, ptep +=3D PTRS_PER_PTE, pmdp++)
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/=DWI=A5QvwYmtmW3ryBDDxf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7Ymj4ACgkQAVBC80lX
0Gz/0wf+PinPxZIEIlFjnePxzC9hCdnNEhidEzKZWTzJkTgsvCkilgqD8I6ZH1wg
xrbfVB9kzujL7ahA8xK//2uFRO5NUZS+qQXfQyCgl3UxigBpuFM5nCksuiOrgb3D
8pd/gYXvzhNRhLWwYQvoW1peYUjk0qk4CqCRnZqXp6F6J9DUnlMQi5df+uD/hPga
97cpICa+4PQqj4KpuywBnlLq/Zyr+Gp3QaxprG/3iVQd2F0GRosUFLt6IOo58Y8q
5Yx56F0Jl75JG/spsZK2VkNnQyi0O3uFK1X++q2olcb8m8Sm51IDGkYuT7NOXKLX
bnwZ45IXwoszHUpqUQpOK2rY9d25mg==
=9mCQ
-----END PGP SIGNATURE-----

--Sig_/=DWI=A5QvwYmtmW3ryBDDxf--
