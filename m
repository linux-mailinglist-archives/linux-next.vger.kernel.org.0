Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1B0373481
	for <lists+linux-next@lfdr.de>; Wed,  5 May 2021 06:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhEEE6X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 May 2021 00:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhEEE6X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2021 00:58:23 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88174C061574;
        Tue,  4 May 2021 21:57:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZkwM092gz9sRR;
        Wed,  5 May 2021 14:57:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1620190644;
        bh=AuqytXgyTjzcSaZ5rxKrOKGocPS1zQRYvPHDmGYeViM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Vaj1/IoRbMmQkNvWsi22fvZ+66dpKVAlm7aZOE3dak7B2BJLuYDEo/QaBzW+TKNN0
         BLnRKnOrH/Hre5uRF3gMkcv9kBwt/akEb+RoCVMjgZT7tKxM1nn/KnbK2Tn0D6baQJ
         uHHjWq60B5QVnYD8KtXPl5CQ1lYqAUlOHRDSZ/LHSULLGDIegCDNh7ImEhH72leep/
         odMFHy6ywpF5EiNM5Ty5FYIcP1B+YZToe8bn+G9q8yGeRS4awtuxVjK2p0dlFoovCd
         wiZZQTmilomX2RwoJWos/JiifwBzlyCQZnJEkRpc5W7X0rTN1T9ghXvfwQmJbNH1i1
         Be7da62j1p5iA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
In-Reply-To: <20210505113959.43340f19@canb.auug.org.au>
References: <20210505113959.43340f19@canb.auug.org.au>
Date:   Wed, 05 May 2021 14:57:18 +1000
Message-ID: <87wnsd93rl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   arch/powerpc/Kconfig
>
> between commit:
>
>   c6b05f4e233c ("powerpc/kconfig: Restore alphabetic order of the selects under CONFIG_PPC")
>
> from the powerpc tree and commits:
>
>   fd7d5c273c43 ("mm: generalize HUGETLB_PAGE_SIZE_VARIABLE")
>   301ba77ae03c ("mm: generalize ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE]")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Urgh, I did check linux-next to see if that patch would conflict but
didn't think it would conflict *that* badly.

I guess I'll leave it for now, but I can drop it if necessary.

cheers


> diff --cc arch/powerpc/Kconfig
> index ab17a56c3d10,d4333049b813..000000000000
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@@ -118,11 -118,10 +118,13 @@@ config PP
>   	# Please keep this list sorted alphabetically.
>   	#
>   	select ARCH_32BIT_OFF_T if PPC32
> + 	select ARCH_ENABLE_MEMORY_HOTPLUG
> + 	select ARCH_ENABLE_MEMORY_HOTREMOVE
>  +	select ARCH_HAS_COPY_MC			if PPC64
>   	select ARCH_HAS_DEBUG_VIRTUAL
>  +	select ARCH_HAS_DEBUG_VM_PGTABLE
>   	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  +	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_GCOV_PROFILE_ALL
> @@@ -163,8 -162,9 +165,8 @@@
>   	select BUILDTIME_TABLE_SORT
>   	select CLONE_BACKWARDS
>   	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
> - 	select DMA_OPS_BYPASS			if PPC64
>   	select DMA_OPS				if PPC64
> + 	select DMA_OPS_BYPASS			if PPC64
>  -	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC64 && PPC_PSERIES
>   	select DYNAMIC_FTRACE			if FUNCTION_TRACER
>   	select EDAC_ATOMIC_SCRUB
>   	select EDAC_SUPPORT
> @@@ -182,15 -181,12 +184,15 @@@
>   	select GENERIC_STRNCPY_FROM_USER
>   	select GENERIC_STRNLEN_USER
>   	select GENERIC_TIME_VSYSCALL
>  -	select GENERIC_GETTIMEOFDAY
>  +	select GENERIC_VDSO_TIME_NS
>   	select HAVE_ARCH_AUDITSYSCALL
> - 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>  +	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
> + 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>   	select HAVE_ARCH_JUMP_LABEL
>  +	select HAVE_ARCH_JUMP_LABEL_RELATIVE
>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>   	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
>  +	select HAVE_ARCH_KFENCE			if PPC32
>   	select HAVE_ARCH_KGDB
>   	select HAVE_ARCH_MMAP_RND_BITS
>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
> @@@ -231,19 -227,23 +233,20 @@@
>   	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
>   	select HAVE_MOD_ARCH_SPECIFIC
>   	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
>  -	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if (PPC64 && PPC_BOOK3S)
>  -	select HAVE_OPTPROBES			if PPC64
>  +	select HAVE_OPTPROBES
>   	select HAVE_PERF_EVENTS
>   	select HAVE_PERF_EVENTS_NMI		if PPC64
>  -	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
>   	select HAVE_PERF_REGS
>   	select HAVE_PERF_USER_STACK_DUMP
>  -	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
>  -	select MMU_GATHER_RCU_TABLE_FREE
>  -	select MMU_GATHER_PAGE_SIZE
>   	select HAVE_REGS_AND_STACK_ACCESS_API
>  -	select HAVE_RELIABLE_STACKTRACE		if PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
>  +	select HAVE_RELIABLE_STACKTRACE
>  +	select HAVE_RSEQ
>   	select HAVE_SOFTIRQ_ON_OWN_STACK
>  +	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
>  +	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
>   	select HAVE_SYSCALL_TRACEPOINTS
>   	select HAVE_VIRT_CPU_ACCOUNTING
>  -	select HAVE_IRQ_TIME_ACCOUNTING
>  -	select HAVE_RSEQ
> ++	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
>   	select IOMMU_HELPER			if PPC64
>   	select IRQ_DOMAIN
>   	select IRQ_FORCED_THREADING
