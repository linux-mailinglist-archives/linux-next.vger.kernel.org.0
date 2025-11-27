Return-Path: <linux-next+bounces-9252-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CA3C90573
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 00:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98EE43AA436
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 23:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E962417F0;
	Thu, 27 Nov 2025 23:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ST4nku4W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0472264CF;
	Thu, 27 Nov 2025 23:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764286035; cv=none; b=BXjV0I1CrONRWzxf0Vjy4/O8Ab9lYTj8/8rOMthEb0B15Eh56nZMRgT3pNkqpfLIEv3oUCMz4VAv0Hph1cgtQWrZk+RzBjZ6fg7d2jpTSNpQ11OHcjdQIJw2NehyPn/RH/pymiB6ZlNDfMl7oUsl/ihjmZaWtv1SymQp29C12nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764286035; c=relaxed/simple;
	bh=Xy+dm45iOPnchFiIOii5/XUMYkH+eFdx14w+M53QE1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lgbSa2l9mkFxJbJcgWGkLlLFpJt6qzImfk07MaW35nUz6AenTedDsANBFi8p6UakPOcrNvLW9Knve1+4pBT6tcpD5X+AzGe4zXIJPmBOb41jFdOm1jvbajD6D7jORs/WPxui0vpM3j0xmp41ize614IUaMmlWj4WR6B098wcbyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ST4nku4W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764286028;
	bh=Gae+lnO4dNKTw9/EfadbU9UYn3Yp9fhs2gt815xbaxQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ST4nku4WKNKM1KN7WRjpLJP0lhvi4LuEKWIEqs8IJRl3Nz1riSLrFDQIEXQeYoGK9
	 nPyXEAl4qE3bot6RvTOeUp7nJ5oRh7tQX6hLvpU/Op3MXxCMNsmmFO0xj71ES1U9Ka
	 I3Skv3B4CVn5BHI80t5kh/0orL7J2CYB+VeHpk++fLTfnxiiRpMQ1c4qwB9sFm3gKG
	 ONeHe54e0H5iZsEV2+0fJBRYRI+n9YEshcjK6zuZFHu8DE7zwR6arHcCxegerhyVj9
	 d+RwB5gNi76YTOAXQ+sozu1nbdExT1wZh6bacozPZ/44+Piu9EalTTUvkiJgC7JNi6
	 oMN/G85oInNYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dHXdS2jcyz4w0L;
	Fri, 28 Nov 2025 10:27:08 +1100 (AEDT)
Date: Fri, 28 Nov 2025 10:27:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Deepak Gupta <debug@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the risc-v tree with the mm-unstable
 tree
Message-ID: <20251128102707.15b3f283@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/efhHt5zeR5i2rcTM9HBgsnQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/efhHt5zeR5i2rcTM9HBgsnQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  include/linux/mm.h

between commit:

  554156bd610e ("mm: declare VMA flags by bit")

from the mm-unstable tree and commit:

  ae8460ac9db2 ("mm: add VM_SHADOW_STACK definition for riscv")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

This is relative to the changes in the mm-unstable tree:

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2887d3b34d3e..7c406637351e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -376,6 +376,11 @@ enum {
 	 * has similar constraints to shadow stacks.
 	 */
 	DECLARE_VMA_BIT_ALIAS(SHADOW_STACK, HIGH_ARCH_6),
+#elif defined(CONFIG_RISCV_USER_CFI)
+	/*
+	 * Following x86 and picking up the same bitpos.
+	 */
+	DECLARE_VMA_BIT_ALIAS(SHADOW_STACK, HIGH_ARCH_5),
 #endif
 	DECLARE_VMA_BIT_ALIAS(SAO, ARCH_1),		/* Strong Access Ordering (powerpc) =
*/
 	DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */

The full resolution diff:

diff --cc include/linux/mm.h
index 2887d3b34d3e,2032d3f195f1..000000000000
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@@ -275,233 -273,176 +275,238 @@@ extern unsigned int kobjsize(const voi
   * vm_flags in vm_area_struct, see mm_types.h.
   * When changing, update also include/trace/events/mmflags.h
   */
 +
  #define VM_NONE		0x00000000
 =20
 -#define VM_READ		0x00000001	/* currently active flags */
 -#define VM_WRITE	0x00000002
 -#define VM_EXEC		0x00000004
 -#define VM_SHARED	0x00000008
 -
 -/* mprotect() hardcodes VM_MAYREAD >> 4 =3D=3D VM_READ, and so for r/w/x =
bits. */
 -#define VM_MAYREAD	0x00000010	/* limits for mprotect() etc */
 -#define VM_MAYWRITE	0x00000020
 -#define VM_MAYEXEC	0x00000040
 -#define VM_MAYSHARE	0x00000080
 -
 -#define VM_GROWSDOWN	0x00000100	/* general info on the segment */
 -#ifdef CONFIG_MMU
 -#define VM_UFFD_MISSING	0x00000200	/* missing pages tracking */
 -#else /* CONFIG_MMU */
 -#define VM_MAYOVERLAY	0x00000200	/* nommu: R/O MAP_PRIVATE mapping that m=
ight overlay a file mapping */
 -#define VM_UFFD_MISSING	0
 -#endif /* CONFIG_MMU */
 -#define VM_PFNMAP	0x00000400	/* Page-ranges managed without "struct page"=
, just pure PFN */
 -#define VM_UFFD_WP	0x00001000	/* wrprotect pages tracking */
 -
 -#define VM_LOCKED	0x00002000
 -#define VM_IO           0x00004000	/* Memory mapped I/O or similar */
 -
 -					/* Used by sys_madvise() */
 -#define VM_SEQ_READ	0x00008000	/* App will access data sequentially */
 -#define VM_RAND_READ	0x00010000	/* App will not benefit from clustered re=
ads */
 -
 -#define VM_DONTCOPY	0x00020000      /* Do not copy this vma on fork */
 -#define VM_DONTEXPAND	0x00040000	/* Cannot expand with mremap() */
 -#define VM_LOCKONFAULT	0x00080000	/* Lock the pages covered when they are=
 faulted in */
 -#define VM_ACCOUNT	0x00100000	/* Is a VM accounted object */
 -#define VM_NORESERVE	0x00200000	/* should the VM suppress accounting */
 -#define VM_HUGETLB	0x00400000	/* Huge TLB Page VM */
 -#define VM_SYNC		0x00800000	/* Synchronous page faults */
 -#define VM_ARCH_1	0x01000000	/* Architecture-specific flag */
 -#define VM_WIPEONFORK	0x02000000	/* Wipe VMA contents in child. */
 -#define VM_DONTDUMP	0x04000000	/* Do not include in the core dump */
 -
 -#ifdef CONFIG_MEM_SOFT_DIRTY
 -# define VM_SOFTDIRTY	0x08000000	/* Not soft dirty clean area */
 -#else
 -# define VM_SOFTDIRTY	0
 -#endif
 -
 -#define VM_MIXEDMAP	0x10000000	/* Can contain "struct page" and pure PFN =
pages */
 -#define VM_HUGEPAGE	0x20000000	/* MADV_HUGEPAGE marked this vma */
 -#define VM_NOHUGEPAGE	0x40000000	/* MADV_NOHUGEPAGE marked this vma */
 -#define VM_MERGEABLE	BIT(31)		/* KSM may merge identical pages */
 -
 -#ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
 -#define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures =
*/
 -#define VM_HIGH_ARCH_BIT_1	33	/* bit only usable on 64-bit architectures =
*/
 -#define VM_HIGH_ARCH_BIT_2	34	/* bit only usable on 64-bit architectures =
*/
 -#define VM_HIGH_ARCH_BIT_3	35	/* bit only usable on 64-bit architectures =
*/
 -#define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures =
*/
 -#define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures =
*/
 -#define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures =
*/
 -#define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
 -#define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
 -#define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
 -#define VM_HIGH_ARCH_3	BIT(VM_HIGH_ARCH_BIT_3)
 -#define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 -#define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
 -#define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
 -#endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
 -
 -#ifdef CONFIG_ARCH_HAS_PKEYS
 -# define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
 -# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
 -# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
 -# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
 -#if CONFIG_ARCH_PKEY_BITS > 3
 -# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
 -#else
 -# define VM_PKEY_BIT3  0
 -#endif
 -#if CONFIG_ARCH_PKEY_BITS > 4
 -# define VM_PKEY_BIT4  VM_HIGH_ARCH_4
 -#else
 -# define VM_PKEY_BIT4  0
 -#endif
 -#endif /* CONFIG_ARCH_HAS_PKEYS */
 -
 -#ifdef CONFIG_X86_USER_SHADOW_STACK
 -/*
 - * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
 - * support core mm.
 +/**
 + * typedef vma_flag_t - specifies an individual VMA flag by bit number.
   *
 - * These VMAs will get a single end guard page. This helps userspace prot=
ect
 - * itself from attacks. A single page is enough for current shadow stack =
archs
 - * (x86). See the comments near alloc_shstk() in arch/x86/kernel/shstk.c
 - * for more details on the guard size.
 + * This value is made type safe by sparse to avoid passing invalid flag v=
alues
 + * around.
   */
 -# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
 -#endif
 +typedef int __bitwise vma_flag_t;
 =20
 -#if defined(CONFIG_ARM64_GCS)
 -/*
 - * arm64's Guarded Control Stack implements similar functionality and
 - * has similar constraints to shadow stacks.
 - */
 -# define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 +#define DECLARE_VMA_BIT(name, bitnum) \
 +	VMA_ ## name ## _BIT =3D ((__force vma_flag_t)bitnum)
 +#define DECLARE_VMA_BIT_ALIAS(name, aliased) \
 +	VMA_ ## name ## _BIT =3D (VMA_ ## aliased ## _BIT)
 +enum {
 +	DECLARE_VMA_BIT(READ, 0),
 +	DECLARE_VMA_BIT(WRITE, 1),
 +	DECLARE_VMA_BIT(EXEC, 2),
 +	DECLARE_VMA_BIT(SHARED, 3),
 +	/* mprotect() hardcodes VM_MAYREAD >> 4 =3D=3D VM_READ, and so for r/w/x=
 bits. */
 +	DECLARE_VMA_BIT(MAYREAD, 4),	/* limits for mprotect() etc. */
 +	DECLARE_VMA_BIT(MAYWRITE, 5),
 +	DECLARE_VMA_BIT(MAYEXEC, 6),
 +	DECLARE_VMA_BIT(MAYSHARE, 7),
 +	DECLARE_VMA_BIT(GROWSDOWN, 8),	/* general info on the segment */
 +#ifdef CONFIG_MMU
 +	DECLARE_VMA_BIT(UFFD_MISSING, 9),/* missing pages tracking */
 +#else
 +	/* nommu: R/O MAP_PRIVATE mapping that might overlay a file mapping */
 +	DECLARE_VMA_BIT(MAYOVERLAY, 9),
 +#endif /* CONFIG_MMU */
 +	/* Page-ranges managed without "struct page", just pure PFN */
 +	DECLARE_VMA_BIT(PFNMAP, 10),
 +	DECLARE_VMA_BIT(MAYBE_GUARD, 11),
 +	DECLARE_VMA_BIT(UFFD_WP, 12),	/* wrprotect pages tracking */
 +	DECLARE_VMA_BIT(LOCKED, 13),
 +	DECLARE_VMA_BIT(IO, 14),	/* Memory mapped I/O or similar */
 +	DECLARE_VMA_BIT(SEQ_READ, 15),	/* App will access data sequentially */
 +	DECLARE_VMA_BIT(RAND_READ, 16),	/* App will not benefit from clustered r=
eads */
 +	DECLARE_VMA_BIT(DONTCOPY, 17),	/* Do not copy this vma on fork */
 +	DECLARE_VMA_BIT(DONTEXPAND, 18),/* Cannot expand with mremap() */
 +	DECLARE_VMA_BIT(LOCKONFAULT, 19),/* Lock pages covered when faulted in */
 +	DECLARE_VMA_BIT(ACCOUNT, 20),	/* Is a VM accounted object */
 +	DECLARE_VMA_BIT(NORESERVE, 21),	/* should the VM suppress accounting */
 +	DECLARE_VMA_BIT(HUGETLB, 22),	/* Huge TLB Page VM */
 +	DECLARE_VMA_BIT(SYNC, 23),	/* Synchronous page faults */
 +	DECLARE_VMA_BIT(ARCH_1, 24),	/* Architecture-specific flag */
 +	DECLARE_VMA_BIT(WIPEONFORK, 25),/* Wipe VMA contents in child. */
 +	DECLARE_VMA_BIT(DONTDUMP, 26),	/* Do not include in the core dump */
 +	DECLARE_VMA_BIT(SOFTDIRTY, 27),	/* NOT soft dirty clean area */
 +	DECLARE_VMA_BIT(MIXEDMAP, 28),	/* Can contain struct page and pure PFN p=
ages */
 +	DECLARE_VMA_BIT(HUGEPAGE, 29),	/* MADV_HUGEPAGE marked this vma */
 +	DECLARE_VMA_BIT(NOHUGEPAGE, 30),/* MADV_NOHUGEPAGE marked this vma */
 +	DECLARE_VMA_BIT(MERGEABLE, 31),	/* KSM may merge identical pages */
 +	/* These bits are reused, we define specific uses below. */
 +	DECLARE_VMA_BIT(HIGH_ARCH_0, 32),
 +	DECLARE_VMA_BIT(HIGH_ARCH_1, 33),
 +	DECLARE_VMA_BIT(HIGH_ARCH_2, 34),
 +	DECLARE_VMA_BIT(HIGH_ARCH_3, 35),
 +	DECLARE_VMA_BIT(HIGH_ARCH_4, 36),
 +	DECLARE_VMA_BIT(HIGH_ARCH_5, 37),
 +	DECLARE_VMA_BIT(HIGH_ARCH_6, 38),
 +	/*
 +	 * This flag is used to connect VFIO to arch specific KVM code. It
 +	 * indicates that the memory under this VMA is safe for use with any
 +	 * non-cachable memory type inside KVM. Some VFIO devices, on some
 +	 * platforms, are thought to be unsafe and can cause machine crashes
 +	 * if KVM does not lock down the memory type.
 +	 */
 +	DECLARE_VMA_BIT(ALLOW_ANY_UNCACHED, 39),
 +#ifdef CONFIG_PPC32
 +	DECLARE_VMA_BIT_ALIAS(DROPPABLE, ARCH_1),
 +#else
 +	DECLARE_VMA_BIT(DROPPABLE, 40),
  #endif
 -
 -#if defined(CONFIG_RISCV_USER_CFI)
 -/*
 - * Following x86 and picking up the same bitpos.
 - */
 -# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
 +	DECLARE_VMA_BIT(UFFD_MINOR, 41),
 +	DECLARE_VMA_BIT(SEALED, 42),
 +	/* Flags that reuse flags above. */
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT0, HIGH_ARCH_0),
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT1, HIGH_ARCH_1),
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT2, HIGH_ARCH_2),
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT3, HIGH_ARCH_3),
 +	DECLARE_VMA_BIT_ALIAS(PKEY_BIT4, HIGH_ARCH_4),
 +#if defined(CONFIG_X86_USER_SHADOW_STACK)
 +	/*
 +	 * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
 +	 * support core mm.
 +	 *
 +	 * These VMAs will get a single end guard page. This helps userspace
 +	 * protect itself from attacks. A single page is enough for current
 +	 * shadow stack archs (x86). See the comments near alloc_shstk() in
 +	 * arch/x86/kernel/shstk.c for more details on the guard size.
 +	 */
 +	DECLARE_VMA_BIT_ALIAS(SHADOW_STACK, HIGH_ARCH_5),
 +#elif defined(CONFIG_ARM64_GCS)
 +	/*
 +	 * arm64's Guarded Control Stack implements similar functionality and
 +	 * has similar constraints to shadow stacks.
 +	 */
 +	DECLARE_VMA_BIT_ALIAS(SHADOW_STACK, HIGH_ARCH_6),
++#elif defined(CONFIG_RISCV_USER_CFI)
++	/*
++	 * Following x86 and picking up the same bitpos.
++	 */
++	DECLARE_VMA_BIT_ALIAS(SHADOW_STACK, HIGH_ARCH_5),
  #endif
 -
 -#ifndef VM_SHADOW_STACK
 -# define VM_SHADOW_STACK	VM_NONE
 +	DECLARE_VMA_BIT_ALIAS(SAO, ARCH_1),		/* Strong Access Ordering (powerpc)=
 */
 +	DECLARE_VMA_BIT_ALIAS(GROWSUP, ARCH_1),		/* parisc */
 +	DECLARE_VMA_BIT_ALIAS(SPARC_ADI, ARCH_1),	/* sparc64 */
 +	DECLARE_VMA_BIT_ALIAS(ARM64_BTI, ARCH_1),	/* arm64 */
 +	DECLARE_VMA_BIT_ALIAS(ARCH_CLEAR, ARCH_1),	/* sparc64, arm64 */
 +	DECLARE_VMA_BIT_ALIAS(MAPPED_COPY, ARCH_1),	/* !CONFIG_MMU */
 +	DECLARE_VMA_BIT_ALIAS(MTE, HIGH_ARCH_4),	/* arm64 */
 +	DECLARE_VMA_BIT_ALIAS(MTE_ALLOWED, HIGH_ARCH_5),/* arm64 */
 +#ifdef CONFIG_STACK_GROWSUP
 +	DECLARE_VMA_BIT_ALIAS(STACK, GROWSUP),
 +	DECLARE_VMA_BIT_ALIAS(STACK_EARLY, GROWSDOWN),
 +#else
 +	DECLARE_VMA_BIT_ALIAS(STACK, GROWSDOWN),
  #endif
 +};
 +#undef DECLARE_VMA_BIT
 +#undef DECLARE_VMA_BIT_ALIAS
 =20
 +#define INIT_VM_FLAG(name) BIT((__force int) VMA_ ## name ## _BIT)
 +#define VM_READ		INIT_VM_FLAG(READ)
 +#define VM_WRITE	INIT_VM_FLAG(WRITE)
 +#define VM_EXEC		INIT_VM_FLAG(EXEC)
 +#define VM_SHARED	INIT_VM_FLAG(SHARED)
 +#define VM_MAYREAD	INIT_VM_FLAG(MAYREAD)
 +#define VM_MAYWRITE	INIT_VM_FLAG(MAYWRITE)
 +#define VM_MAYEXEC	INIT_VM_FLAG(MAYEXEC)
 +#define VM_MAYSHARE	INIT_VM_FLAG(MAYSHARE)
 +#define VM_GROWSDOWN	INIT_VM_FLAG(GROWSDOWN)
 +#ifdef CONFIG_MMU
 +#define VM_UFFD_MISSING	INIT_VM_FLAG(UFFD_MISSING)
 +#else
 +#define VM_UFFD_MISSING	VM_NONE
 +#define VM_MAYOVERLAY	INIT_VM_FLAG(MAYOVERLAY)
 +#endif
 +#define VM_PFNMAP	INIT_VM_FLAG(PFNMAP)
 +#define VM_MAYBE_GUARD	INIT_VM_FLAG(MAYBE_GUARD)
 +#define VM_UFFD_WP	INIT_VM_FLAG(UFFD_WP)
 +#define VM_LOCKED	INIT_VM_FLAG(LOCKED)
 +#define VM_IO		INIT_VM_FLAG(IO)
 +#define VM_SEQ_READ	INIT_VM_FLAG(SEQ_READ)
 +#define VM_RAND_READ	INIT_VM_FLAG(RAND_READ)
 +#define VM_DONTCOPY	INIT_VM_FLAG(DONTCOPY)
 +#define VM_DONTEXPAND	INIT_VM_FLAG(DONTEXPAND)
 +#define VM_LOCKONFAULT	INIT_VM_FLAG(LOCKONFAULT)
 +#define VM_ACCOUNT	INIT_VM_FLAG(ACCOUNT)
 +#define VM_NORESERVE	INIT_VM_FLAG(NORESERVE)
 +#define VM_HUGETLB	INIT_VM_FLAG(HUGETLB)
 +#define VM_SYNC		INIT_VM_FLAG(SYNC)
 +#define VM_ARCH_1	INIT_VM_FLAG(ARCH_1)
 +#define VM_WIPEONFORK	INIT_VM_FLAG(WIPEONFORK)
 +#define VM_DONTDUMP	INIT_VM_FLAG(DONTDUMP)
 +#ifdef CONFIG_MEM_SOFT_DIRTY
 +#define VM_SOFTDIRTY	INIT_VM_FLAG(SOFTDIRTY)
 +#else
 +#define VM_SOFTDIRTY	VM_NONE
 +#endif
 +#define VM_MIXEDMAP	INIT_VM_FLAG(MIXEDMAP)
 +#define VM_HUGEPAGE	INIT_VM_FLAG(HUGEPAGE)
 +#define VM_NOHUGEPAGE	INIT_VM_FLAG(NOHUGEPAGE)
 +#define VM_MERGEABLE	INIT_VM_FLAG(MERGEABLE)
 +#define VM_STACK	INIT_VM_FLAG(STACK)
 +#ifdef CONFIG_STACK_GROWS_UP
 +#define VM_STACK_EARLY	INIT_VM_FLAG(STACK_EARLY)
 +#else
 +#define VM_STACK_EARLY	VM_NONE
 +#endif
 +#ifdef CONFIG_ARCH_HAS_PKEYS
 +#define VM_PKEY_SHIFT ((__force int)VMA_HIGH_ARCH_0_BIT)
 +/* Despite the naming, these are FLAGS not bits. */
 +#define VM_PKEY_BIT0 INIT_VM_FLAG(PKEY_BIT0)
 +#define VM_PKEY_BIT1 INIT_VM_FLAG(PKEY_BIT1)
 +#define VM_PKEY_BIT2 INIT_VM_FLAG(PKEY_BIT2)
 +#if CONFIG_ARCH_PKEY_BITS > 3
 +#define VM_PKEY_BIT3 INIT_VM_FLAG(PKEY_BIT3)
 +#else
 +#define VM_PKEY_BIT3  VM_NONE
 +#endif /* CONFIG_ARCH_PKEY_BITS > 3 */
 +#if CONFIG_ARCH_PKEY_BITS > 4
 +#define VM_PKEY_BIT4 INIT_VM_FLAG(PKEY_BIT4)
 +#else
 +#define VM_PKEY_BIT4  VM_NONE
 +#endif /* CONFIG_ARCH_PKEY_BITS > 4 */
 +#endif /* CONFIG_ARCH_HAS_PKEYS */
 +#if defined(CONFIG_X86_USER_SHADOW_STACK) || defined(CONFIG_ARM64_GCS)
 +#define VM_SHADOW_STACK	INIT_VM_FLAG(SHADOW_STACK)
 +#else
 +#define VM_SHADOW_STACK	VM_NONE
 +#endif
  #if defined(CONFIG_PPC64)
 -# define VM_SAO		VM_ARCH_1	/* Strong Access Ordering (powerpc) */
 +#define VM_SAO		INIT_VM_FLAG(SAO)
  #elif defined(CONFIG_PARISC)
 -# define VM_GROWSUP	VM_ARCH_1
 +#define VM_GROWSUP	INIT_VM_FLAG(GROWSUP)
  #elif defined(CONFIG_SPARC64)
 -# define VM_SPARC_ADI	VM_ARCH_1	/* Uses ADI tag for access control */
 -# define VM_ARCH_CLEAR	VM_SPARC_ADI
 +#define VM_SPARC_ADI	INIT_VM_FLAG(SPARC_ADI)
 +#define VM_ARCH_CLEAR	INIT_VM_FLAG(ARCH_CLEAR)
  #elif defined(CONFIG_ARM64)
 -# define VM_ARM64_BTI	VM_ARCH_1	/* BTI guarded page, a.k.a. GP bit */
 -# define VM_ARCH_CLEAR	VM_ARM64_BTI
 +#define VM_ARM64_BTI	INIT_VM_FLAG(ARM64_BTI)
 +#define VM_ARCH_CLEAR	INIT_VM_FLAG(ARCH_CLEAR)
  #elif !defined(CONFIG_MMU)
 -# define VM_MAPPED_COPY	VM_ARCH_1	/* T if mapped copy of data (nommu mmap=
) */
 +#define VM_MAPPED_COPY	INIT_VM_FLAG(MAPPED_COPY)
  #endif
 -
 -#if defined(CONFIG_ARM64_MTE)
 -# define VM_MTE		VM_HIGH_ARCH_4	/* Use Tagged memory for access control */
 -# define VM_MTE_ALLOWED	VM_HIGH_ARCH_5	/* Tagged memory permitted */
 -#else
 -# define VM_MTE		VM_NONE
 -# define VM_MTE_ALLOWED	VM_NONE
 -#endif
 -
  #ifndef VM_GROWSUP
 -# define VM_GROWSUP	VM_NONE
 +#define VM_GROWSUP	VM_NONE
  #endif
 -
 -#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 -# define VM_UFFD_MINOR_BIT	41
 -# define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
 -#else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 -# define VM_UFFD_MINOR		VM_NONE
 -#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 -
 -/*
 - * This flag is used to connect VFIO to arch specific KVM code. It
 - * indicates that the memory under this VMA is safe for use with any
 - * non-cachable memory type inside KVM. Some VFIO devices, on some
 - * platforms, are thought to be unsafe and can cause machine crashes
 - * if KVM does not lock down the memory type.
 - */
 -#ifdef CONFIG_64BIT
 -#define VM_ALLOW_ANY_UNCACHED_BIT	39
 -#define VM_ALLOW_ANY_UNCACHED		BIT(VM_ALLOW_ANY_UNCACHED_BIT)
 +#ifdef CONFIG_ARM64_MTE
 +#define VM_MTE		INIT_VM_FLAG(MTE)
 +#define VM_MTE_ALLOWED	INIT_VM_FLAG(MTE_ALLOWED)
  #else
 -#define VM_ALLOW_ANY_UNCACHED		VM_NONE
 +#define VM_MTE		VM_NONE
 +#define VM_MTE_ALLOWED	VM_NONE
 +#endif
 +#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 +#define VM_UFFD_MINOR	INIT_VM_FLAG(UFFD_MINOR)
 +#else
 +#define VM_UFFD_MINOR	VM_NONE
  #endif
 -
  #ifdef CONFIG_64BIT
 -#define VM_DROPPABLE_BIT	40
 -#define VM_DROPPABLE		BIT(VM_DROPPABLE_BIT)
 -#elif defined(CONFIG_PPC32)
 -#define VM_DROPPABLE		VM_ARCH_1
 +#define VM_ALLOW_ANY_UNCACHED	INIT_VM_FLAG(ALLOW_ANY_UNCACHED)
 +#define VM_SEALED		INIT_VM_FLAG(SEALED)
 +#else
 +#define VM_ALLOW_ANY_UNCACHED	VM_NONE
 +#define VM_SEALED		VM_NONE
 +#endif
 +#if defined(CONFIG_64BIT) || defined(CONFIG_PPC32)
 +#define VM_DROPPABLE		INIT_VM_FLAG(DROPPABLE)
  #else
  #define VM_DROPPABLE		VM_NONE
  #endif

--Sig_/efhHt5zeR5i2rcTM9HBgsnQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmko3ksACgkQAVBC80lX
0GwBZQgAjwwv2wGHB8gazI0Rs/iaI+nTx2+PM9+KcrlAcQpPmcUayNCsaYIJQmyN
/GmkB/sC1xmXWLaMEXwJSt/7J6sCKIZ21xlH81iywV1YTRfFUsP3WfONxzjrLWX0
978vsxnrrDB1yK/TN+Xx6ck7KWYWawyZU1XqpBYSGk5U2EHXyI+Uylk00q3xyFJJ
aA6qVutj9SAE0OAij2BSuRaCMdMU0fDM/mWbfK3njlv1q/5CYRgEQk1pz76ibto4
Ih+6GDyk2KPrsz9nHZvHgaGQt6VKmHwElL9pLZMohTZbDzDa2jlsMYLdVhO3WMWP
HLBbwjp+P5ZS5nuzyKuW4JgVbBwslg==
=0CII
-----END PGP SIGNATURE-----

--Sig_/efhHt5zeR5i2rcTM9HBgsnQ--

