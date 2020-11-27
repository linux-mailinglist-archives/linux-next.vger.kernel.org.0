Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7812C60A5
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 08:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392763AbgK0Hsm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 02:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgK0Hsl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 02:48:41 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911ECC0613D1;
        Thu, 26 Nov 2020 23:48:41 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cj6FM1kWXz9sSn;
        Fri, 27 Nov 2020 18:48:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606463319;
        bh=aRCDjTnaf2MzVmObQbVRrncuMCD3C5qwOEdswnufBw4=;
        h=Date:From:To:Cc:Subject:From;
        b=GYmneNkqRP6J7oyzA0Ej07zdX7tdBXdjKNlC3Z4L+qXYrv7YAk3LE5pY+9F+JvQ9r
         FinRpvcM38GPZMEe3SZ4xm+p3M8mzxZs2DR1fmd3qv61zpikOv8e4tuAKGQHU87S/H
         V9mWpNAqjA3KG6h8Uyt2Ess68ITRHbnaw/PKDMMFqvylNY/xdGrqCs9igKP/clbNTr
         G8q2O7fptQbKaoHrUhDbyErPRT6hqaINWdZUsJkTD4Wxypw9kFq5BmsVfq4XsGyjB2
         4MLVR+Tou97mBsUz+2imdsK99ddDge/ArmHSDov8kcegdU7klJS2df5yziiImdEth8
         6/Wf0diHVCFfg==
Date:   Fri, 27 Nov 2020 18:48:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20201127184838.62efbb4c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//Ry/6q10Us/OaJYKuYgBvPs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//Ry/6q10Us/OaJYKuYgBvPs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/highmem.c

between commits:

  298fa1ad5571 ("highmem: Provide generic variant of kmap_atomic*")
  5fbda3ecd14a ("sched: highmem: Store local kmaps in task struct")

from the tip tree and commit:

  72d22a0d0e86 ("mm: support THPs in zero_user_segments")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/highmem.c
index 83f9660f168f,e2da8c9770e9..000000000000
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@@ -358,260 -367,68 +358,319 @@@ void kunmap_high(struct page *page
  	if (need_wakeup)
  		wake_up(pkmap_map_wait);
  }
 -
  EXPORT_SYMBOL(kunmap_high);
+=20
+ #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+ void zero_user_segments(struct page *page, unsigned start1, unsigned end1,
+ 		unsigned start2, unsigned end2)
+ {
+ 	unsigned int i;
+=20
+ 	BUG_ON(end1 > page_size(page) || end2 > page_size(page));
+=20
+ 	for (i =3D 0; i < compound_nr(page); i++) {
+ 		void *kaddr;
+ 		unsigned this_end;
+=20
+ 		if (end1 =3D=3D 0 && start2 >=3D PAGE_SIZE) {
+ 			start2 -=3D PAGE_SIZE;
+ 			end2 -=3D PAGE_SIZE;
+ 			continue;
+ 		}
+=20
+ 		if (start1 >=3D PAGE_SIZE) {
+ 			start1 -=3D PAGE_SIZE;
+ 			end1 -=3D PAGE_SIZE;
+ 			if (start2) {
+ 				start2 -=3D PAGE_SIZE;
+ 				end2 -=3D PAGE_SIZE;
+ 			}
+ 			continue;
+ 		}
+=20
+ 		kaddr =3D kmap_atomic(page + i);
+=20
+ 		this_end =3D min_t(unsigned, end1, PAGE_SIZE);
+ 		if (end1 > start1)
+ 			memset(kaddr + start1, 0, this_end - start1);
+ 		end1 -=3D this_end;
+ 		start1 =3D 0;
+=20
+ 		if (start2 >=3D PAGE_SIZE) {
+ 			start2 -=3D PAGE_SIZE;
+ 			end2 -=3D PAGE_SIZE;
+ 		} else {
+ 			this_end =3D min_t(unsigned, end2, PAGE_SIZE);
+ 			if (end2 > start2)
+ 				memset(kaddr + start2, 0, this_end - start2);
+ 			end2 -=3D this_end;
+ 			start2 =3D 0;
+ 		}
+=20
+ 		kunmap_atomic(kaddr);
+ 		flush_dcache_page(page + i);
+=20
+ 		if (!end1 && !end2)
+ 			break;
+ 	}
+=20
+ 	BUG_ON((start1 | start2 | end1 | end2) !=3D 0);
+ }
+ EXPORT_SYMBOL(zero_user_segments);
+ #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 -#endif	/* CONFIG_HIGHMEM */
 +#endif /* CONFIG_HIGHMEM */
 +
 +#ifdef CONFIG_KMAP_LOCAL
 +
 +#include <asm/kmap_size.h>
 +
 +/*
 + * With DEBUG_KMAP_LOCAL the stack depth is doubled and every second
 + * slot is unused which acts as a guard page
 + */
 +#ifdef CONFIG_DEBUG_KMAP_LOCAL
 +# define KM_INCR	2
 +#else
 +# define KM_INCR	1
 +#endif
 +
 +static inline int kmap_local_idx_push(void)
 +{
 +	WARN_ON_ONCE(in_irq() && !irqs_disabled());
 +	current->kmap_ctrl.idx +=3D KM_INCR;
 +	BUG_ON(current->kmap_ctrl.idx >=3D KM_MAX_IDX);
 +	return current->kmap_ctrl.idx - 1;
 +}
 +
 +static inline int kmap_local_idx(void)
 +{
 +	return current->kmap_ctrl.idx - 1;
 +}
 +
 +static inline void kmap_local_idx_pop(void)
 +{
 +	current->kmap_ctrl.idx -=3D KM_INCR;
 +	BUG_ON(current->kmap_ctrl.idx < 0);
 +}
 +
 +#ifndef arch_kmap_local_post_map
 +# define arch_kmap_local_post_map(vaddr, pteval)	do { } while (0)
 +#endif
 +
 +#ifndef arch_kmap_local_pre_unmap
 +# define arch_kmap_local_pre_unmap(vaddr)		do { } while (0)
 +#endif
 +
 +#ifndef arch_kmap_local_post_unmap
 +# define arch_kmap_local_post_unmap(vaddr)		do { } while (0)
 +#endif
 +
 +#ifndef arch_kmap_local_map_idx
 +#define arch_kmap_local_map_idx(idx, pfn)	kmap_local_calc_idx(idx)
 +#endif
 +
 +#ifndef arch_kmap_local_unmap_idx
 +#define arch_kmap_local_unmap_idx(idx, vaddr)	kmap_local_calc_idx(idx)
 +#endif
 +
 +#ifndef arch_kmap_local_high_get
 +static inline void *arch_kmap_local_high_get(struct page *page)
 +{
 +	return NULL;
 +}
 +#endif
 +
 +/* Unmap a local mapping which was obtained by kmap_high_get() */
 +static inline bool kmap_high_unmap_local(unsigned long vaddr)
 +{
 +#ifdef ARCH_NEEDS_KMAP_HIGH_GET
 +	if (vaddr >=3D PKMAP_ADDR(0) && vaddr < PKMAP_ADDR(LAST_PKMAP)) {
 +		kunmap_high(pte_page(pkmap_page_table[PKMAP_NR(vaddr)]));
 +		return true;
 +	}
 +#endif
 +	return false;
 +}
 +
 +static inline int kmap_local_calc_idx(int idx)
 +{
 +	return idx + KM_MAX_IDX * smp_processor_id();
 +}
 +
 +static pte_t *__kmap_pte;
 +
 +static pte_t *kmap_get_pte(void)
 +{
 +	if (!__kmap_pte)
 +		__kmap_pte =3D virt_to_kpte(__fix_to_virt(FIX_KMAP_BEGIN));
 +	return __kmap_pte;
 +}
 +
 +void *__kmap_local_pfn_prot(unsigned long pfn, pgprot_t prot)
 +{
 +	pte_t pteval, *kmap_pte =3D kmap_get_pte();
 +	unsigned long vaddr;
 +	int idx;
 +
 +	/*
 +	 * Disable migration so resulting virtual address is stable
 +	 * accross preemption.
 +	 */
 +	migrate_disable();
 +	preempt_disable();
 +	idx =3D arch_kmap_local_map_idx(kmap_local_idx_push(), pfn);
 +	vaddr =3D __fix_to_virt(FIX_KMAP_BEGIN + idx);
 +	BUG_ON(!pte_none(*(kmap_pte - idx)));
 +	pteval =3D pfn_pte(pfn, prot);
 +	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
 +	arch_kmap_local_post_map(vaddr, pteval);
 +	current->kmap_ctrl.pteval[kmap_local_idx()] =3D pteval;
 +	preempt_enable();
 +
 +	return (void *)vaddr;
 +}
 +EXPORT_SYMBOL_GPL(__kmap_local_pfn_prot);
 +
 +void *__kmap_local_page_prot(struct page *page, pgprot_t prot)
 +{
 +	void *kmap;
 +
 +	/*
 +	 * To broaden the usage of the actual kmap_local() machinery always map
 +	 * pages when debugging is enabled and the architecture has no problems
 +	 * with alias mappings.
 +	 */
 +	if (!IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP) && !PageHighMem(page))
 +		return page_address(page);
 +
 +	/* Try kmap_high_get() if architecture has it enabled */
 +	kmap =3D arch_kmap_local_high_get(page);
 +	if (kmap)
 +		return kmap;
 +
 +	return __kmap_local_pfn_prot(page_to_pfn(page), prot);
 +}
 +EXPORT_SYMBOL(__kmap_local_page_prot);
 +
 +void kunmap_local_indexed(void *vaddr)
 +{
 +	unsigned long addr =3D (unsigned long) vaddr & PAGE_MASK;
 +	pte_t *kmap_pte =3D kmap_get_pte();
 +	int idx;
 +
 +	if (addr < __fix_to_virt(FIX_KMAP_END) ||
 +	    addr > __fix_to_virt(FIX_KMAP_BEGIN)) {
 +		if (IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP)) {
 +			/* This _should_ never happen! See above. */
 +			WARN_ON_ONCE(1);
 +			return;
 +		}
 +		/*
 +		 * Handle mappings which were obtained by kmap_high_get()
 +		 * first as the virtual address of such mappings is below
 +		 * PAGE_OFFSET. Warn for all other addresses which are in
 +		 * the user space part of the virtual address space.
 +		 */
 +		if (!kmap_high_unmap_local(addr))
 +			WARN_ON_ONCE(addr < PAGE_OFFSET);
 +		return;
 +	}
 +
 +	preempt_disable();
 +	idx =3D arch_kmap_local_unmap_idx(kmap_local_idx(), addr);
 +	WARN_ON_ONCE(addr !=3D __fix_to_virt(FIX_KMAP_BEGIN + idx));
 +
 +	arch_kmap_local_pre_unmap(addr);
 +	pte_clear(&init_mm, addr, kmap_pte - idx);
 +	arch_kmap_local_post_unmap(addr);
 +	current->kmap_ctrl.pteval[kmap_local_idx()] =3D __pte(0);
 +	kmap_local_idx_pop();
 +	preempt_enable();
 +	migrate_enable();
 +}
 +EXPORT_SYMBOL(kunmap_local_indexed);
 +
 +/*
 + * Invoked before switch_to(). This is safe even when during or after
 + * clearing the maps an interrupt which needs a kmap_local happens because
 + * the task::kmap_ctrl.idx is not modified by the unmapping code so a
 + * nested kmap_local will use the next unused index and restore the index
 + * on unmap. The already cleared kmaps of the outgoing task are irrelevant
 + * because the interrupt context does not know about them. The same appli=
es
 + * when scheduling back in for an interrupt which happens before the
 + * restore is complete.
 + */
 +void __kmap_local_sched_out(void)
 +{
 +	struct task_struct *tsk =3D current;
 +	pte_t *kmap_pte =3D kmap_get_pte();
 +	int i;
 +
 +	/* Clear kmaps */
 +	for (i =3D 0; i < tsk->kmap_ctrl.idx; i++) {
 +		pte_t pteval =3D tsk->kmap_ctrl.pteval[i];
 +		unsigned long addr;
 +		int idx;
 +
 +		/* With debug all even slots are unmapped and act as guard */
 +		if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !(i & 0x01)) {
 +			WARN_ON_ONCE(!pte_none(pteval));
 +			continue;
 +		}
 +		if (WARN_ON_ONCE(pte_none(pteval)))
 +			continue;
 +
 +		/*
 +		 * This is a horrible hack for XTENSA to calculate the
 +		 * coloured PTE index. Uses the PFN encoded into the pteval
 +		 * and the map index calculation because the actual mapped
 +		 * virtual address is not stored in task::kmap_ctrl.
 +		 * For any sane architecture this is optimized out.
 +		 */
 +		idx =3D arch_kmap_local_map_idx(i, pte_pfn(pteval));
 +
 +		addr =3D __fix_to_virt(FIX_KMAP_BEGIN + idx);
 +		arch_kmap_local_pre_unmap(addr);
 +		pte_clear(&init_mm, addr, kmap_pte - idx);
 +		arch_kmap_local_post_unmap(addr);
 +	}
 +}
 +
 +void __kmap_local_sched_in(void)
 +{
 +	struct task_struct *tsk =3D current;
 +	pte_t *kmap_pte =3D kmap_get_pte();
 +	int i;
 +
 +	/* Restore kmaps */
 +	for (i =3D 0; i < tsk->kmap_ctrl.idx; i++) {
 +		pte_t pteval =3D tsk->kmap_ctrl.pteval[i];
 +		unsigned long addr;
 +		int idx;
 +
 +		/* With debug all even slots are unmapped and act as guard */
 +		if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !(i & 0x01)) {
 +			WARN_ON_ONCE(!pte_none(pteval));
 +			continue;
 +		}
 +		if (WARN_ON_ONCE(pte_none(pteval)))
 +			continue;
 +
 +		/* See comment in __kmap_local_sched_out() */
 +		idx =3D arch_kmap_local_map_idx(i, pte_pfn(pteval));
 +		addr =3D __fix_to_virt(FIX_KMAP_BEGIN + idx);
 +		set_pte_at(&init_mm, addr, kmap_pte - idx, pteval);
 +		arch_kmap_local_post_map(addr, pteval);
 +	}
 +}
 +
 +void kmap_local_fork(struct task_struct *tsk)
 +{
 +	if (WARN_ON_ONCE(tsk->kmap_ctrl.idx))
 +		memset(&tsk->kmap_ctrl, 0, sizeof(tsk->kmap_ctrl));
 +}
 +
 +#endif
 =20
  #if defined(HASHED_PAGE_VIRTUAL)
 =20

--Sig_//Ry/6q10Us/OaJYKuYgBvPs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Ar1YACgkQAVBC80lX
0Gw+mAgAmaLl2I3NOK1FbqEiaSvTOiGmtks2PJzoGPt5m8DKLNlwx3S2RTW+WOTE
khOgtNwed3FeLAUIBilmh5CcgJ8SMvxQjAP+/Ag0wOkDj6YMtkqqX4ajtqDS78kd
57TH+6ydPRarROElSu/hO92mI0+jx6AuGURJ1reAnqEKiW3cD6Bfo2UvBNc/v3xZ
Ca3dawj9DbIMqsJpaWIv4XC4rSauP8Suc22xLr9ki8Qk01SnHmUhTD2LTtnfTWEY
eTFbPTv7RnumUvrwEYZBlJ6nOfI/LT3kPEoK4d5b0wndH9inLTdDItweIaO/W5fz
7KI6JWHFuGb2FoMJhUfkR66c+wVQ4A==
=+/n/
-----END PGP SIGNATURE-----

--Sig_//Ry/6q10Us/OaJYKuYgBvPs--
