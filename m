Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E67B718A32F
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 20:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgCRTaN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 15:30:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50568 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgCRTaN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2020 15:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=O+utZDp6h+Ag36FQR3M3qAozcmtEVlhbVB67kokewtI=; b=jiSHutjc4pVvGu4/AN8BKp8FNf
        WJRjznsV6lArDRZsrhxA1HNW1M8qsSTAwkAeTQVmLvUeeA4VpvJKmx5WBqcZFIplbwk0jojxNQsZP
        znNqe0vLIX3KwLgZy6FrB3WEM9LDiP8AEyfWdQULKwaRAweDoBVZC/SaPYY+9bDjZgbFQG7rcITG1
        s3fzvhg6bSUA2C4DUFJXnwhFCOjqfSM6RyUnuwajEeAzkVnAfgA+7F2f/LqHBhOM3OzHBldlAkiCg
        WFRNkrq4P8TcI4SocYz3ey4d/CMp9KkIgz7s8WATNFiDgauFID4ZDDzJMDqtktHRbjlDzjLJsGUF3
        R8nImWvg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jEeOJ-0000km-PS; Wed, 18 Mar 2020 19:30:11 +0000
Subject: Re: [PATCH] x86/ioremap: Fix CONFIG_EFI=n build
To:     Borislav Petkov <bp@alien8.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>
References: <20200316183039.0d1c45ce@canb.auug.org.au>
 <7561e981-0d9b-d62c-0ef2-ce6007aff1ab@infradead.org>
 <20200318151707.GB4377@zn.tnic> <20200318183451.GC4377@zn.tnic>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cf994608-c5cc-6e0b-6fd3-a7975cc4c8cf@infradead.org>
Date:   Wed, 18 Mar 2020 12:30:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318183451.GC4377@zn.tnic>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/18/20 11:34 AM, Borislav Petkov wrote:
> On Wed, Mar 18, 2020 at 04:17:07PM +0100, Borislav Petkov wrote:
>>> ld: arch/x86/mm/ioremap.o: in function `__ioremap_caller':
>>> ioremap.c:(.text+0x150): undefined reference to `efi_mem_type'
>>
>> Working on it.
> 
> The below should fix it:
> 
> ---
> From: Borislav Petkov <bp@suse.de>
> Date: Wed, 18 Mar 2020 19:27:48 +0100
> 
> In order to use efi_mem_type(), one needs CONFIG_EFI enabled. Otherwise
> that function is undefined. Use IS_ENABLED() to check and avoid the
> ifdeffery as the compiler optimizes away the following unreachable code
> then.
> 
> Fixes: 985e537a4082 ("x86/ioremap: Map EFI runtime services data as encrypted for SEV")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Link: https://lkml.kernel.org/r/7561e981-0d9b-d62c-0ef2-ce6007aff1ab@infradead.org

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  arch/x86/mm/ioremap.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> index 935a91e1fd77..18c637c0dc6f 100644
> --- a/arch/x86/mm/ioremap.c
> +++ b/arch/x86/mm/ioremap.c
> @@ -115,6 +115,9 @@ static void __ioremap_check_other(resource_size_t addr, struct ioremap_desc *des
>  	if (!sev_active())
>  		return;
>  
> +	if (!IS_ENABLED(CONFIG_EFI))
> +		return;
> +
>  	if (efi_mem_type(addr) == EFI_RUNTIME_SERVICES_DATA)
>  		desc->flags |= IORES_MAP_ENCRYPTED;
>  }
> 


-- 
~Randy

