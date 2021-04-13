Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DC035E6EA
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 21:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbhDMTHx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 15:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236935AbhDMTHx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Apr 2021 15:07:53 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC26C061574;
        Tue, 13 Apr 2021 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=5IS1kdjQ/wiovyMBlwaRQmI6DR2U+GDZoX5Ga6CzJBQ=; b=SWMMfeMR8QXg6ExV2ShIUEXXce
        YXQpA18y8ZtTm8wlph3xXnq45/yTGFharQ7QepvNuhPPoO/lXFpKosDqH1vqctC6bFlzZ7ceE9ZtK
        8mhX+F1WliOXFRe7Eo3iuZoYJWiM3UOh/jNkvsgYXFJmGOVLud88JYrqEDt8zryBojk4msfgpla9L
        Y7ofdK8zSMpkCVOKgZwbexY5Mk3QYZKR5zEn7YS6r27PmS/uIVc5VrxgMA4FG+c73hwlO9VcVsKKO
        kqBUcLkFQ9QrtrYbdeWEtcGEWERQCq6O6JyzE7j2SYWym/EbuRFIPOXj86IdGryxuogL0Rj1AaVeJ
        rzc/ef3A==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lWONm-00ADIa-FA; Tue, 13 Apr 2021 19:07:31 +0000
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
References: <20210409215103.03999588@canb.auug.org.au>
 <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
 <YHPlTifk6jST5auY@kernel.org>
 <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org>
 <YHR86T15BzETVHhk@kernel.org>
 <d56ebb95-1c40-5994-383f-70d8f226e8c3@infradead.org>
 <YHU03AIwrpHCUlU/@kernel.org>
 <7cec048d-26f0-104a-6bca-d9afc6a7d1e8@infradead.org>
 <YHXNyVVUwZbVDBrr@kernel.org>
 <7bc072c0-bf10-bd0f-95db-0f0a7db47b93@infradead.org>
 <YHXhhtCVf0RsgsDs@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4b980588-d7b8-24e8-dc68-709a3f9b9fc0@infradead.org>
Date:   Tue, 13 Apr 2021 12:07:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YHXhhtCVf0RsgsDs@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/13/21 11:23 AM, Mike Rapoport wrote:
> On Tue, Apr 13, 2021 at 10:34:25AM -0700, Randy Dunlap wrote:
>> On 4/13/21 9:58 AM, Mike Rapoport wrote:

>>
>> Mike,
>> That works.
>>
>> Please send the next test.
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

Yay! That boots.

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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
> 


-- 
~Randy

