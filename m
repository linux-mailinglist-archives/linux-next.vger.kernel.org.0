Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D262857C4
	for <lists+linux-next@lfdr.de>; Wed,  7 Oct 2020 06:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgJGEcD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Oct 2020 00:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgJGEcD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2020 00:32:03 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6055C0613D2
        for <linux-next@vger.kernel.org>; Tue,  6 Oct 2020 21:32:02 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b26so623365pff.3
        for <linux-next@vger.kernel.org>; Tue, 06 Oct 2020 21:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=v4KTFGLhmUtpUMvDLGNazVqX77+vM7WadFbBYH2zmZ8=;
        b=E67zoRNxdQRSHOtEg6Fdyr6eqTC52wwdN+pRIjO9S5CpNyziJd4DLRm/Pcnmg3fiia
         5z0MZ7xIbsxtzjp1fLSEJixSHoJj51PQB+BVV9hrZkw7VnEG4H+IIschznXmbicoN41r
         xmfk3+EeWLhzfo5hEdd7caNyLDFxzfmiwP0llYJnR329S7LRe2Vm2zDEvXeJUZBrbo4d
         cZrcU+GJT6zb5x+52ipQB/4DE6dm2ubNsn/xLh6/rKK6VTJZszrD0skqjNNNXa7GuA4x
         ASWgKwLFJJWfhd92Ej7GWIDOkzjBi0Kyu+x5EwlDXEk40kJl45g/Wq5iQ2u/r89SEizb
         MMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=v4KTFGLhmUtpUMvDLGNazVqX77+vM7WadFbBYH2zmZ8=;
        b=rK87U7SxrzM/ay6HTvdAySsxqWMAn1G7aliOnkNn/+nAGTVjGMBqRRnAUmmW7Afoft
         K44PgJ8WSNCQPl9RoRL23I2Gg/LB4WGRWNBKcYb+yatbNspslKq5JpW//rUqONX29kHd
         EZTzF7QUfYFk0i2pgYbC5VlxrQKkKZar83OwjqKcnp5qgjNGwFWFXnrAn/TcCuMn4Rlt
         VFF9dawTM9QAvsDGJb+tps55rWQvoSwCGSLx/XrvQe0XKHN5HbAI9KkmAz/j81SeJwCc
         4pNpd14vcfbEJ3P74HW/UnEpIG879vCqqvck3+O6tIvY5VVSl8PCvjxZnw8m4KNtJ0+8
         LaIA==
X-Gm-Message-State: AOAM531HRhbfHGtCvLt3q1HgmffNF0xhkkKscKsyH3vtVSDp29rzP54X
        lNIDtYzgxIOsn22S2nltH2QyAA==
X-Google-Smtp-Source: ABdhPJwxzNhlzAR6Ts05Aw34WJh8e2qwrLl1jfYKJAb3TLH2ea+zj0VCMRsm6KdHS+BUyGeh/E9b2w==
X-Received: by 2002:a63:1449:: with SMTP id 9mr1394750pgu.260.1602045122317;
        Tue, 06 Oct 2020 21:32:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id u69sm1008623pfc.27.2020.10.06.21.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 21:32:01 -0700 (PDT)
Date:   Tue, 06 Oct 2020 21:32:01 -0700 (PDT)
X-Google-Original-Date: Tue, 06 Oct 2020 21:31:59 PDT (-0700)
Subject:     Re: linux-next: manual merge of the akpm-current tree with the risc-v tree
In-Reply-To: <20201006213906.08554ae2@canb.auug.org.au>
CC:     akpm@linux-foundation.org, Paul Walmsley <paul@pwsan.com>,
        Atish Patra <Atish.Patra@wdc.com>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        rppt@linux.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-2d15c259-f5ff-4bab-92eb-b5f0eb2f4bd6@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 06 Oct 2020 03:39:06 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   arch/riscv/mm/init.c
>
> between commit:
>
>   c29c38fa2a8b ("RISC-V: Remove any memblock representing unusable memory area")
>
> from the risc-v tree and commits:
>
>   3520eeb79142 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
>
> from the akpm-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> It also looks like there is a bug in that risc-v tree patch: mem_start
> is used uninitialised in setup_bootmem().
> -- 
> Cheers,
> Stephen Rothwell
>
> diff --cc arch/riscv/mm/init.c
> index 812a48c91a95,bc72bb6b5fe0..000000000000
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@@ -152,20 -141,25 +152,20 @@@ disable
>   }
>   #endif /* CONFIG_BLK_DEV_INITRD */
>   
>  -static phys_addr_t dtb_early_pa __initdata;
>  -
>   void __init setup_bootmem(void)
>   {
> - 	struct memblock_region *reg;
> - 	phys_addr_t mem_start, end = 0;
>  -	phys_addr_t mem_size = 0;
>  -	phys_addr_t total_mem = 0;
> + 	phys_addr_t mem_start, start, end = 0;
>   	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>   	phys_addr_t vmlinux_start = __pa_symbol(&_start);
> + 	u64 i;
>   
>   	/* Find the memory region containing the kernel */
> - 	for_each_memblock(memory, reg) {
> - 		end = reg->base + reg->size;
> + 	for_each_mem_range(i, &start, &end) {
> + 		phys_addr_t size = end - start;
>  -		if (!total_mem)
>  +		if (!mem_start)
> - 			mem_start = reg->base;
> - 		if (reg->base <= vmlinux_start && vmlinux_end <= end)
> - 			BUG_ON(reg->size == 0);
> + 			mem_start = start;
> + 		if (start <= vmlinux_start && vmlinux_end <= end)
> + 			BUG_ON(size == 0);
>  -		total_mem = total_mem + size;
>   	}
>   
>   	/*
> @@@ -542,18 -455,11 +533,18 @@@ static void __init setup_vm_final(void
>   {
>   	uintptr_t va, map_size;
>   	phys_addr_t pa, start, end;
> - 	struct memblock_region *reg;
> + 	u64 i;
>   
>  -	/* Set mmu_enabled flag */
>  -	mmu_enabled = true;
>  -
>  +	/**
>  +	 * MMU is enabled at this point. But page table setup is not complete yet.
>  +	 * fixmap page table alloc functions should be used at this point
>  +	 */
>  +	pt_ops.alloc_pte = alloc_pte_fixmap;
>  +	pt_ops.get_pte_virt = get_pte_virt_fixmap;
>  +#ifndef __PAGETABLE_PMD_FOLDED
>  +	pt_ops.alloc_pmd = alloc_pmd_fixmap;
>  +	pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
>  +#endif
>   	/* Setup swapper PGD for fixmap */
>   	create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
>   			   __pa_symbol(fixmap_pgd_next),

Thanks for pointing this out.  Given that this is the tip of my for-next I'm
just going to drop it, we'll sort out the bug and the conflict.
