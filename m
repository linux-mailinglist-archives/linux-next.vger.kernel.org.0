Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADDF355C9C
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 21:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbhDFT5P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 15:57:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:47794 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233018AbhDFT5P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Apr 2021 15:57:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 09872AF9A;
        Tue,  6 Apr 2021 19:57:06 +0000 (UTC)
Date:   Tue, 6 Apr 2021 21:57:03 +0200
From:   Oscar Salvador <osalvador@suse.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>
Subject: Re: linux-next: Tree for Apr 6 (arch/x86/mm/init_64.c)
Message-ID: <YGy9DwRZ+dFKi9/c@localhost.localdomain>
References: <20210406223109.50ebe35a@canb.auug.org.au>
 <58d0c74b-ef4d-447b-9285-3d2c192fd3eb@infradead.org>
 <a7895e6e-b00a-4b75-6506-ca38af495829@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7895e6e-b00a-4b75-6506-ca38af495829@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 06, 2021 at 11:39:47AM -0700, Randy Dunlap wrote:
 
> > Looks like that compound "if" is too much for gcc 7.5.0 to handle:
> > 
> > 			} else if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) &&
> > 				   vmemmap_pmd_is_unused(addr, next)) {
> > 					free_hugepage_table(pmd_page(*pmd),
> > 							    altmap);
> > 					spin_lock(&init_mm.page_table_lock);
> > 					pmd_clear(pmd);
> > 					spin_unlock(&init_mm.page_table_lock);
> > 			}
> > 
> > 
> 
> This is what I am using for now:

Hi Randy

Yeah, that is what v4 was using [1].
We decided to get rid of the ifdef for costimetic reasons but it seems
it does not do the trick.

I will ask Andrew to squash that on top.

[1] https://patchwork.kernel.org/project/linux-mm/patch/20210301083230.30924-4-osalvador@suse.de/

Thanks

> 
> ---
> ---
>  arch/x86/mm/init_64.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> --- linux-next-20210406.orig/arch/x86/mm/init_64.c
> +++ linux-next-20210406/arch/x86/mm/init_64.c
> @@ -1123,14 +1123,16 @@ remove_pmd_table(pmd_t *pmd_start, unsig
>  				pmd_clear(pmd);
>  				spin_unlock(&init_mm.page_table_lock);
>  				pages++;
> -			} else if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) &&
> -				   vmemmap_pmd_is_unused(addr, next)) {
> +			}
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +			else if (vmemmap_pmd_is_unused(addr, next)) {
>  					free_hugepage_table(pmd_page(*pmd),
>  							    altmap);
>  					spin_lock(&init_mm.page_table_lock);
>  					pmd_clear(pmd);
>  					spin_unlock(&init_mm.page_table_lock);
>  			}
> +#endif
>  
>  			continue;
>  		}
> 

-- 
Oscar Salvador
SUSE L3
