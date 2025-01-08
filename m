Return-Path: <linux-next+bounces-5099-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824DA06943
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 00:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4633A6CF9
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 23:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF982046B7;
	Wed,  8 Jan 2025 23:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aaWXBVZ/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D520408C;
	Wed,  8 Jan 2025 23:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377618; cv=none; b=LviYpRpLqwo3WhjXzP/ldUa1JSUMQDG7tDNX5/alNeR3KS8MLrauffTE9tzYRPCEN56bM/SpYacVhazrTHhli7lBSuMw5TbNlypWGCIz+4L7CzLWkY+PUUkTt46E20MSzipRvgYnHL/FyLriwm8ac1FObCZAbFhOA49rXi+STzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377618; c=relaxed/simple;
	bh=Jm8qAfut6+6t24rGlPBDLOn7EdAz7R6cwoQ5dNlbR14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pkt2rGWUVM81TQlwjmfvb78FjkGGIni06POzxL0hc3uNYt3o38vZ+qRWyH7J9pYG3ls/5f/lbQAh4n3mo4IiXjJCmOfHYeQVWkLGMYMakj43wqNNqDHb57CU4n0IHu7y8o5My4W6hxc9b1zn3MOL/ye5MK6XyNb0IdyJxRVFSeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aaWXBVZ/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736377601;
	bh=7wNe598J0QJV4jbXv5R7Y0TmGXZIhcS6TbgPMv/p1Pc=;
	h=Date:From:To:Cc:Subject:From;
	b=aaWXBVZ/ezD+HDP08VgyjJug/8id04TfBaXVsR3KYhTIssTVCLqDCgDFxQAz0fkC7
	 0ruZDrCiArxL0mmSNAQ5y3/b1dikI8drsP/CDTnc8Co2run1E5o6ySINhNepKJNJWM
	 HvGvZs8/qIZuJrIB+/ZxN6TjzIZ/WP8RcJTdbh7BZfn3jwhTeTRnPXuVTvbPQKz6ls
	 fm1GZBBg4UVp1kofNv5X9q0t78R4oN55dTpCmRV5bHgdwi0VIcq06CINsqtJQLj6tP
	 icQTSSijx4g/T37vn/Ke/yHSW81J7b7c77mvudrL2VP+dT0cRZWi8NOYr/OMmMvXFF
	 sbSqVQ0Cp6E7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YT3Sx0gFgz4wc4;
	Thu,  9 Jan 2025 10:06:41 +1100 (AEDT)
Date: Thu, 9 Jan 2025 10:06:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20250109100646.7b0ef3b7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3W.8IC2k_SZspOGS8n4FxUa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3W.8IC2k_SZspOGS8n4FxUa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                 from arch/powerpc/include/asm/book3s/64/mmu.h:32,
                 from arch/powerpc/include/asm/mmu.h:377,
                 from arch/powerpc/include/asm/paca.h:18,
                 from arch/powerpc/include/asm/current.h:13,
                 from include/linux/thread_info.h:23,
                 from include/asm-generic/preempt.h:5,
                 from ./arch/powerpc/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:79,
                 from include/linux/alloc_tag.h:11,
                 from include/linux/rhashtable-types.h:12,
                 from include/linux/ipc.h:7,
                 from include/uapi/linux/sem.h:5,
                 from include/linux/sem.h:5,
                 from include/linux/compat.h:14,
                 from arch/powerpc/kernel/asm-offsets.c:12:
arch/powerpc/include/asm/book3s/64/pgtable.h:1364:1: error: expected identi=
fier or '(' before '}' token
 1364 | }
      | ^
arch/powerpc/mm/book3s64/pgtable.c: In function 'pmdp_huge_get_and_clear_fu=
ll':
arch/powerpc/mm/book3s64/pgtable.c:670:33: error: unterminated argument lis=
t invoking macro "VM_BUG_ON"
  670 | EXPORT_SYMBOL(vm_get_page_prot);
      |                                 ^
arch/powerpc/mm/book3s64/pgtable.c:207:9: error: 'VM_BUG_ON' undeclared (fi=
rst use in this function)
  207 |         VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
      |         ^~~~~~~~~
arch/powerpc/mm/book3s64/pgtable.c:207:9: note: each undeclared identifier =
is reported only once for each function it appears in
arch/powerpc/mm/book3s64/pgtable.c:207:18: error: expected ';' at end of in=
put
  207 |         VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
      |                  ^
      |                  ;
......
arch/powerpc/mm/book3s64/pgtable.c:207:9: error: expected declaration or st=
atement at end of input
  207 |         VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
      |         ^~~~~~~~~
arch/powerpc/mm/book3s64/pgtable.c:205:15: error: unused variable 'pmd' [-W=
error=3Dunused-variable]
  205 |         pmd_t pmd;
      |               ^~~
arch/powerpc/mm/book3s64/pgtable.c:671: error: control reaches end of non-v=
oid function [-Werror=3Dreturn-type]
cc1: all warnings being treated as errors
arch/powerpc/mm/book3s64/hash_hugepage.c: In function '__hash_page_thp':
arch/powerpc/mm/book3s64/hash_hugepage.c:57:44: error: '_PAGE_DEVMAP' undec=
lared (first use in this function)
   57 |         if (!(old_pmd & (H_PAGE_THP_HUGE | _PAGE_DEVMAP)))
      |                                            ^~~~~~~~~~~~
arch/powerpc/mm/book3s64/hash_hugepage.c:57:44: note: each undeclared ident=
ifier is reported only once for each function it appears in
arch/powerpc/mm/book3s64/hugetlbpage.c: In function '__hash_page_huge':
arch/powerpc/mm/book3s64/hugetlbpage.c:77:42: error: '_PAGE_DEVMAP' undecla=
red (first use in this function)
   77 |         if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
      |                                          ^~~~~~~~~~~~
arch/powerpc/mm/book3s64/hugetlbpage.c:77:42: note: each undeclared identif=
ier is reported only once for each function it appears in

Caused by commits

  c0c3319917db ("mm: remove devmap related functions and page table bits")
  f9a01843d366 ("mm: remove pXX_devmap callers")

from the mm-unstable branch of the mm tree.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 Jan 2025 09:33:31 +1100
Subject: [PATCH] fix up for "mm: remove devmap related functions and page
 table bits"

and "mm: remove pXX_devmap callers"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 1 -
 arch/powerpc/mm/book3s64/hash_hugepage.c     | 2 +-
 arch/powerpc/mm/book3s64/hugetlbpage.c       | 2 +-
 arch/powerpc/mm/book3s64/pgtable.c           | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/64/pgtable.h
index bda0649b316d..1d98d0a5984b 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1361,7 +1361,6 @@ static inline bool arch_needs_pgtable_deposit(void)
 }
 extern void serialize_against_pte_lookup(struct mm_struct *mm);
=20
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
=20
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/boo=
k3s64/hash_hugepage.c
index 15d6f3ea7178..cdfd4fe75edb 100644
--- a/arch/powerpc/mm/book3s64/hash_hugepage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
@@ -54,7 +54,7 @@ int __hash_page_thp(unsigned long ea, unsigned long acces=
s, unsigned long vsid,
 	/*
 	 * Make sure this is thp or devmap entry
 	 */
-	if (!(old_pmd & (H_PAGE_THP_HUGE | _PAGE_DEVMAP)))
+	if (!(old_pmd & H_PAGE_THP_HUGE))
 		return 0;
=20
 	rflags =3D htab_convert_pte_flags(new_pmd, flags);
diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3=
s64/hugetlbpage.c
index 83c3361b358b..2bcbbf9d85ac 100644
--- a/arch/powerpc/mm/book3s64/hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -74,7 +74,7 @@ int __hash_page_huge(unsigned long ea, unsigned long acce=
ss, unsigned long vsid,
 	} while(!pte_xchg(ptep, __pte(old_pte), __pte(new_pte)));
=20
 	/* Make sure this is a hugetlb entry */
-	if (old_pte & (H_PAGE_THP_HUGE | _PAGE_DEVMAP))
+	if (old_pte & H_PAGE_THP_HUGE)
 		return 0;
=20
 	rflags =3D htab_convert_pte_flags(new_pte, flags);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/=
pgtable.c
index b6aeb306ec0b..49293d0c41dd 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -204,7 +204,7 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struc=
t *vma,
 {
 	pmd_t pmd;
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp) &&
+	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)) ||
 		   !pmd_present(*pmdp));
 	pmd =3D pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
 	/*
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/3W.8IC2k_SZspOGS8n4FxUa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/BQYACgkQAVBC80lX
0GybOAf9Gq3Gk25d4SVQerdrCLl17NzNSQAVTtc4C87+vdaB3BlEGv0Z8x8M5lzy
hOmh+qkXu0ke4mpyleVaYhUBmnxE02nCZnYLnaS9qOYXpKHyBw9NugmTSd0nj4wq
aLFT2fvivk5ynhCUXt+hkG6fQgetUSQ1s3Y7LWRXs/tanFgmtn5c1EuMyefXIKoW
qEYTMX7MsuFcWstEhYmfxTC/qePYtFPL100jn/dplUHppbStCJfyNgM5pjsj5Bco
Kp/RzQI2scXGwFx0x3wckfNYOifm7KfyYYKmSIdGUSibCGfXy1gyMhvzkYfsRUbC
zAF/R1RL3tR6XOx9mLtxV9v6v8h70A==
=WgLv
-----END PGP SIGNATURE-----

--Sig_/3W.8IC2k_SZspOGS8n4FxUa--

