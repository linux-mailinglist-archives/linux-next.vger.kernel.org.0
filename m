Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70556391342
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 11:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbhEZJEN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 05:04:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233436AbhEZJEJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 May 2021 05:04:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26156613BF;
        Wed, 26 May 2021 09:02:37 +0000 (UTC)
Date:   Wed, 26 May 2021 10:02:34 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm64-fixes
 tree
Message-ID: <20210526090234.GB19992@arm.com>
References: <20210526164910.564f598f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526164910.564f598f@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 26, 2021 at 04:49:10PM +1000, Stephen Rothwell wrote:
> diff --cc arch/arm64/mm/mmu.c
> index cbcbd64818eb,e3b639e2461d..000000000000
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@@ -515,8 -516,7 +516,7 @@@ static void __init map_mem(pgd_t *pgdp
>   	 */
>   	BUILD_BUG_ON(pgd_index(direct_map_end - 1) == pgd_index(direct_map_end));
>   
> - 	if (rodata_full || crash_mem_map || debug_pagealloc_enabled() ||
> - 	    IS_ENABLED(CONFIG_KFENCE))
>  -	if (can_set_direct_map() || crash_mem_map)
> ++	if (can_set_direct_map() || crash_mem_map || IS_ENABLED(CONFIG_KFENCE))
>   		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;

It looks fine. Thanks Stephen.



-- 
Catalin
