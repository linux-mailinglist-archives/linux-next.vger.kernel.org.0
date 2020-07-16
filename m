Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAAD221E3E
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 10:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgGPIX4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 04:23:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:53504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727795AbgGPIXp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 04:23:45 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C119206C1;
        Thu, 16 Jul 2020 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594887824;
        bh=1viaTCE1Yeyo4SeDpSutX/IP3wyM7j34HmaFbKeR/1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TRSdrAucvUECnfBWG92h1ymXgU3nMCCdLbM3Qux6t5JU8+Oe89Dl97LSLcCG1DetO
         YBaikSt0ed5gkIfGTd7ZwGKKu+tSYJzuEK5n13DFvkaz/8lAxonzCDVDCzqbqvGNmN
         GyysmsBx+emLyw+aEa6wjz5gI+bQ7Pl1rLVCbdMU=
Date:   Thu, 16 Jul 2020 09:23:40 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Barry Song <song.bao.hua@hisilicon.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20200716082339.GA6745@willie-the-truck>
References: <20200716180012.032723a9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716180012.032723a9@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 16, 2020 at 06:00:12PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   arch/arm64/mm/init.c
> 
> between commit:
> 
>   abb7962adc80 ("arm64/hugetlb: Reserve CMA areas for gigantic pages on 16K and 64K configs")
> 
> from the arm64 tree and commit:
> 
>   10d44973d8ab ("mm/hugetlb: split hugetlb_cma in nodes with memory")
> 
> from the akpm-current tree.

[...]

> diff --cc arch/arm64/mm/init.c
> index f8c19c6c8e71,ee551d71c4dd..000000000000
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@@ -421,22 -421,21 +421,21 @@@ void __init bootmem_init(void
>   	arm64_numa_init();
>   
>   	/*
> - 	 * must be done after arm64_numa_init() which calls numa_init() to
> - 	 * initialize node_online_map that gets used in hugetlb_cma_reserve()
> - 	 * while allocating required CMA size across online nodes.
> + 	 * sparse_init() tries to allocate memory from memblock, so must be
> + 	 * done after the fixed reservations
>   	 */
> - #if defined(CONFIG_HUGETLB_PAGE) && defined(CONFIG_CMA)
> - 	arm64_hugetlb_cma_reserve();
> - #endif
> + 	sparse_init();
> + 	zone_sizes_init(min, max);
>   
>   	/*
> - 	 * Sparsemem tries to allocate bootmem in memory_present(), so must be
> - 	 * done after the fixed reservations.
> + 	 * must be done after zone_sizes_init() which calls free_area_init()
> + 	 * that calls node_set_state() to initialize node_states[N_MEMORY]
> + 	 * because hugetlb_cma_reserve() will scan over nodes with N_MEMORY
> + 	 * state
>   	 */
> - 	memblocks_present();
> - 
> - 	sparse_init();
> - 	zone_sizes_init(min, max);
>  -#ifdef CONFIG_ARM64_4K_PAGES
>  -	hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
> ++#if defined(CONFIG_HUGETLB_PAGE) && defined(CONFIG_CMA)
> ++	arm64_hugetlb_cma_reserve();
> + #endif

Thanks, looks good to me, although we might be in for a hairier conflict
if the discussion at [1] ends up with a patch for merging.

Will

[1] https://lore.kernel.org/r/359ea1d0-b1fd-d09f-d28a-a44655834277@oracle.com
