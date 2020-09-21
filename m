Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30910271DA3
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 10:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgIUIMc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Sep 2020 04:12:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgIUIMc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Sep 2020 04:12:32 -0400
Received: from gaia (unknown [31.124.44.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BE232085B;
        Mon, 21 Sep 2020 08:12:31 +0000 (UTC)
Date:   Mon, 21 Sep 2020 09:12:28 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20200921081228.GA13882@gaia>
References: <20200921180353.421484e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921180353.421484e8@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 21, 2020 at 06:03:53PM +1000, Stephen Rothwell wrote:
> diff --cc arch/arm64/mm/mmu.c
> index 087a844b4d26,64211436629d..000000000000
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@@ -493,21 -483,10 +494,15 @@@ static void __init map_mem(pgd_t *pgdp
>   #endif
>   
>   	/* map all the memory banks */
> - 	for_each_memblock(memory, reg) {
> - 		phys_addr_t start = reg->base;
> - 		phys_addr_t end = start + reg->size;
> - 
> + 	for_each_mem_range(i, &start, &end) {
>   		if (start >= end)
>   			break;
> - 		if (memblock_is_nomap(reg))
> - 			continue;
> - 
>  -		__map_memblock(pgdp, start, end, PAGE_KERNEL, flags);
>  +		/*
>  +		 * The linear map must allow allocation tags reading/writing
>  +		 * if MTE is present. Otherwise, it has the same attributes as
>  +		 * PAGE_KERNEL.
>  +		 */
>  +		__map_memblock(pgdp, start, end, PAGE_KERNEL_TAGGED, flags);
>   	}

It looks fine. Thanks Stephen.

-- 
Catalin
