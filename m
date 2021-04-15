Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92577360692
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 12:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhDOKHb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 06:07:31 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:65076 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229481AbhDOKHb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Apr 2021 06:07:31 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4FLZky2PTvz9v4hJ;
        Thu, 15 Apr 2021 12:07:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id U8NVifxNkUuw; Thu, 15 Apr 2021 12:07:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4FLZky1QWLz9v4hH;
        Thu, 15 Apr 2021 12:07:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 799B08B7F2;
        Thu, 15 Apr 2021 12:07:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id o6oLMiP1k9cJ; Thu, 15 Apr 2021 12:07:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id B61CD8B7FB;
        Thu, 15 Apr 2021 12:07:03 +0200 (CEST)
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20210415194417.498e71b7@canb.auug.org.au>
 <20210415195814.0dc4ced9@canb.auug.org.au>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9bc1b8fd-8051-54ed-b9d8-198fe1f4c348@csgroup.eu>
Date:   Thu, 15 Apr 2021 12:07:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210415195814.0dc4ced9@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



Le 15/04/2021 à 11:58, Stephen Rothwell a écrit :
> Hi all,
> 
> On Thu, 15 Apr 2021 19:44:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>    arch/powerpc/kernel/module.c
>>
>> between commit:
>>
>>    2ec13df16704 ("powerpc/modules: Load modules closer to kernel text")
>>
>> from the powerpc tree and commit:
>>
>>    4930ba789f8d ("powerpc/64s/radix: enable huge vmalloc mappings")
>>
>> from the akpm-current tree.
>>
>> I fixed it up (I think - see below) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc arch/powerpc/kernel/module.c
>> index fab84024650c,cdb2d88c54e7..000000000000
>> --- a/arch/powerpc/kernel/module.c
>> +++ b/arch/powerpc/kernel/module.c
>> @@@ -88,29 -88,26 +89,42 @@@ int module_finalize(const Elf_Ehdr *hdr
>>    	return 0;
>>    }
>>    
>> - #ifdef MODULES_VADDR
>>   -void *module_alloc(unsigned long size)
>>   +static __always_inline void *
>>   +__module_alloc(unsigned long size, unsigned long start, unsigned long end)
>>    {
>>   -	unsigned long start = VMALLOC_START;
>>   -	unsigned long end = VMALLOC_END;
>>   -
>>   -#ifdef MODULES_VADDR
>>   -	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
>>   -	start = MODULES_VADDR;
>>   -	end = MODULES_END;
>>   -#endif
>>   -
>> + 	/*
>> + 	 * Don't do huge page allocations for modules yet until more testing
>> + 	 * is done. STRICT_MODULE_RWX may require extra work to support this
>> + 	 * too.
>> + 	 */
>> +
>>    	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
>> - 				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
>> + 				    PAGE_KERNEL_EXEC,
>> + 				    VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
>> + 				    NUMA_NO_NODE,
>>    				    __builtin_return_address(0));
>>    }
>>   +
>> ++
>>   +void *module_alloc(unsigned long size)
>>   +{
>> ++	unsigned long start = VMALLOC_START;
>> ++	unsigned long end = VMALLOC_END;
>>   +	unsigned long limit = (unsigned long)_etext - SZ_32M;
>>   +	void *ptr = NULL;
>>   +
>> ++#ifdef MODULES_VADDR
>>   +	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
>> ++	start = MODULES_VADDR;
>> ++	end = MODULES_END;

The #endif should be here.


>>   +
>>   +	/* First try within 32M limit from _etext to avoid branch trampolines */
>>   +	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
>> - 		ptr = __module_alloc(size, limit, MODULES_END);
>> ++		ptr = __module_alloc(size, limit, end);
>>   +
>>   +	if (!ptr)
>> - 		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END);
>> ++#endif
>> ++		ptr = __module_alloc(size, start, end);
>>   +
>>   +	return ptr;
>>   +}
>> - #endif
> 
> Unfortunately, it also needs this:

Before the #endif is too far.

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 15 Apr 2021 19:53:58 +1000
> Subject: [PATCH] merge fix up for powerpc merge fix
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   arch/powerpc/kernel/module.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> index d8ab1ad2eb05..c060f99afd4d 100644
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@ -110,7 +110,9 @@ void *module_alloc(unsigned long size)
>   {
>   	unsigned long start = VMALLOC_START;
>   	unsigned long end = VMALLOC_END;
> +#ifdef MODULES_VADDR
>   	unsigned long limit = (unsigned long)_etext - SZ_32M;
> +#endif
>   	void *ptr = NULL;
>   
>   #ifdef MODULES_VADDR
> 
