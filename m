Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A3935E6F2
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 21:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhDMTJp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 15:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbhDMTJo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Apr 2021 15:09:44 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D29AC061756
        for <linux-next@vger.kernel.org>; Tue, 13 Apr 2021 12:09:22 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id d15so6027470qkc.9
        for <linux-next@vger.kernel.org>; Tue, 13 Apr 2021 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=7hlbKO+nfOBQ9jb/4q5zl38fZNJwCd9YNYudz1e6oJo=;
        b=emUo/ODKrTSEKAjOumtSF4lr31MN8w+c7mJq9O7Q7bHXDLIN1y/Mo948Umq7rGdAzn
         RAsuiyqIQg1+d9PTPO650M50ud8ZcaC2g7sergtqjR7zOzsTd8ejTAc64nV9boZuYb0R
         wMtjB/t+VQm6Bxp8EDMh8xJ3Si2KMnLMSdIJ5bjoLjS7etD90jnj6bEwc/er0yPCUE+S
         zfL4o7U/kdXBRouiQfAPxkXHQw7DZHH5F53lYhTpp0dHrF8/fL6G82OLqaERdYSNbl9c
         4NqwqpOyw8JYcCMmEtDbojq2r1Y7c7i562IV4g+trYrjVi+1mPVa01z+EkkxnFJWtshj
         wn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=7hlbKO+nfOBQ9jb/4q5zl38fZNJwCd9YNYudz1e6oJo=;
        b=Aq1MAnjqkBvqpr0v2or4gMlCT8jCR0Wi9KubxCPepzKByD6FWKTktDkt0hXuugwHYR
         gT93STlRT3WkqOdzqQUrkcWNjBWETI2r9hE1iNogqolKd+2ysSrCfCXzQc+Nra92hN58
         fg5RFpn/6DwWslUrENPH6fJgWup1sE3U3l+qNs0sp/YZhnZpf7W8QNo7KqHS91MwZuS/
         u+NjO6lL6TZpjhCaA8nchEdtJBBVVUfqHHNu8OjbPMhDY43xiR4qzSQ0mxn+ct+6yTEs
         qAx/4GbO//LGkkuDOXdBI0TImsSeU5z0vLerU+AzfxB1kyR5G5nha5ZqMw12KbJyU9dP
         OMpw==
X-Gm-Message-State: AOAM533C5GY/7AK1mcPfAlOAu0keeudgzB4nTBj7Nl/OrThFAophOejD
        jIDs8ZYIeZftNRyXZjZyy53ePQ==
X-Google-Smtp-Source: ABdhPJwRLs56//HXapWYHGi0JxUqlYObxwGV06Fj6/7/tUMiy6xQehOCqYGMtCNI7kvFvDd5f/SelQ==
X-Received: by 2002:a37:2cc1:: with SMTP id s184mr14892831qkh.489.1618340960420;
        Tue, 13 Apr 2021 12:09:20 -0700 (PDT)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id w1sm8833346qto.85.2021.04.13.12.09.18
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 13 Apr 2021 12:09:20 -0700 (PDT)
Date:   Tue, 13 Apr 2021 12:09:08 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Mike Rapoport <rppt@kernel.org>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
In-Reply-To: <YHXhhtCVf0RsgsDs@kernel.org>
Message-ID: <alpine.LSU.2.11.2104131158350.1037@eggly.anvils>
References: <20210409215103.03999588@canb.auug.org.au> <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org> <YHPlTifk6jST5auY@kernel.org> <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org> <YHR86T15BzETVHhk@kernel.org> <d56ebb95-1c40-5994-383f-70d8f226e8c3@infradead.org>
 <YHU03AIwrpHCUlU/@kernel.org> <7cec048d-26f0-104a-6bca-d9afc6a7d1e8@infradead.org> <YHXNyVVUwZbVDBrr@kernel.org> <7bc072c0-bf10-bd0f-95db-0f0a7db47b93@infradead.org> <YHXhhtCVf0RsgsDs@kernel.org>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 13 Apr 2021, Mike Rapoport wrote:
> 
> I think I've found the reason. trim_snb_memory() reserved the entire first
> megabyte very early leaving no room for real mode trampoline allocation.
> Since this reservation is needed only to make sure integrated gfx does not
> access some memory, it can be safely done after memblock allocations are
> possible.
> 
> I don't know if it can be fixed on the graphics device driver side, but
> from the setup_arch() perspective I think this would be the proper fix:
> 
> From c05f6046137abbcbb700571ce1ac54e7abb56a7d Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Tue, 13 Apr 2021 21:08:39 +0300
> Subject: [PATCH] x86/setup: move trim_snb_memory() later in setup_arch to fix
>  boot hangs
> 
> Commit a799c2bd29d1 ("x86/setup: Consolidate early memory reservations")
> moved reservation of the memory inaccessible by Sandy Bride integrated
> graphics very early and as the result on systems with such devices the
> first 1M was reserved by trim_snb_memory() which prevented the allocation
> of the real mode trampoline and made the boot hang very early.
> 
> Since the purpose of trim_snb_memory() is to prevent problematic pages ever
> reaching the graphics device, it is safe to reserve these pages after
> memblock allocations are possible.
> 
> Move trim_snb_memory later in boot so that it will be called after
> reserve_real_mode() and make comments describing trim_snb_memory()
> operation more elaborate.
> 
> Fixes: a799c2bd29d1 ("x86/setup: Consolidate early memory reservations")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Tested-by: Hugh Dickins <hughd@google.com>

Thanks Mike and Randy. ThinkPad T420s here. I didn't notice this thread
until this morning, but had been investigating bootup panic on mmotm
yesterday. I was more fortunate than Randy, in getting some console
output which soon led to a799c2bd29d1 without bisection. Expected
to go through it line by line today, but you've saved me - thanks.

> ---
>  arch/x86/kernel/setup.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 59e5e0903b0c..ccdcfb19df1e 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -633,11 +633,16 @@ static void __init trim_snb_memory(void)
>  	printk(KERN_DEBUG "reserving inaccessible SNB gfx pages\n");
>  
>  	/*
> -	 * Reserve all memory below the 1 MB mark that has not
> -	 * already been reserved.
> +	 * SandyBridge integrated graphic devices have a bug that prevents
> +	 * them from accessing certain memory ranges, namely anything below
> +	 * 1M and in the pages listed in the bad_pages.
> +	 *
> +	 * To avoid these pages being ever accessed by SNB gfx device
> +	 * reserve all memory below the 1 MB mark and bad_pages that have
> +	 * not already been reserved at boot time.
>  	 */
>  	memblock_reserve(0, 1<<20);
> -	
> +
>  	for (i = 0; i < ARRAY_SIZE(bad_pages); i++) {
>  		if (memblock_reserve(bad_pages[i], PAGE_SIZE))
>  			printk(KERN_WARNING "failed to reserve 0x%08lx\n",
> @@ -746,8 +751,6 @@ static void __init early_reserve_memory(void)
>  
>  	reserve_ibft_region();
>  	reserve_bios_regions();
> -
> -	trim_snb_memory();
>  }
>  
>  /*
> @@ -1083,6 +1086,13 @@ void __init setup_arch(char **cmdline_p)
>  
>  	reserve_real_mode();
>  
> +	/*
> +	 * Reserving memory causing GPU hangs on Sandy Bridge integrated
> +	 * graphic devices should be done after we allocated memory under
> +	 * 1M for the real mode trampoline
> +	 */
> +	trim_snb_memory();
> +
>  	init_mem_mapping();
>  
>  	idt_setup_early_pf();
> -- 
> 2.28.0
