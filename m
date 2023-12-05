Return-Path: <linux-next+bounces-235-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCB805ACF
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 18:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 618A9B20F61
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 17:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DF76928E;
	Tue,  5 Dec 2023 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VZUbUKqL"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F189DA9;
	Tue,  5 Dec 2023 09:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1llierF4zA5793A0h8X4gsP2jzq0+KwCB4rIq5DDmzk=; b=VZUbUKqL5NX+XS5uyMthkp/nId
	OVaS08z9q7+cJ/3uONusQZfOFscvx0ZTXbIZSnZT6EdhPkAutf+jaoCPUWR1+i1iKmTSBkWhWqC9z
	rLAvq6LZuTWic/4zPopHcUaTSjoDKVAKgJbPild6F4eMt0OLO7Jk7siA51jy2isnDjzc5tfX5tsRY
	USwbjhPxdzSuFN9BPjemmk9vEwRdLxgahXg+SOkZgs5yP4BoUpnDF46pypE5PeFkhwc0JwAVrdOiX
	r2KD3WhCfOfl1FwGLCedvoOedXoLU0gokVgNE8o/V8nipxbt0kMPNBF80tW1ZOwooSuZ6rhIXM22E
	eJ12iGJw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYuW-007zp0-1J;
	Tue, 05 Dec 2023 17:08:40 +0000
Message-ID: <5f9f018a-dc4f-42f0-ba90-2f44d2f61a7c@infradead.org>
Date: Tue, 5 Dec 2023 09:08:37 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv, crash: don't export some symbols when
 CONFIG_MMU=n
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org,
 ignat@cloudflare.com, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, eric_devolder@yahoo.com
References: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
 <ZW03ODUKGGhP1ZGU@MiWiFi-R3L-srv>
 <694baf13-65d0-4877-b6c7-56e3006f83be@infradead.org>
 <ZW7OsX4zQRA3mO4+@MiWiFi-R3L-srv>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZW7OsX4zQRA3mO4+@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/4/23 23:18, Baoquan He wrote:
> On 12/04/23 at 11:14am, Randy Dunlap wrote:

[]

>>
>> Both riscv 32-bit and 64-bit complain:
>>
>> ../arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
>> ../arch/riscv/kernel/crash_core.c:11:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
>>    11 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>>       |                                                        ~~^
>>       |                                                          |
>>       |                                                          long unsigned int
>>       |                                                        %x
> 
> Thanks for all these testing.
> 
> This warning is irrelevant to the kexec patch, it's becasue 
> VMALLOC_START is defined as 0 which is int when CONFIG_MMU=n.
> 
> Below patch can fix the warning.
> 
> From 46984a0287e5f1b41ae3e9adfcfa0d26b71db8f4 Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Tue, 5 Dec 2023 11:02:55 +0800
> Subject: [PATCH] riscv: fix VMALLC_START definition
> Content-type: text/plain
> 
> When below config items are set, compiler complained:
> 
> --------------------
> CONFIG_CRASH_CORE=y
> CONFIG_KEXEC_CORE=y
> CONFIG_CRASH_DUMP=y
> ......
> -----------------------
> 
> -------------------------------------------------------------------
> arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
> arch/riscv/kernel/crash_core.c:11:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
> 11 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>    |                                                        ~~^
>    |                                                          |
>    |                                                          long unsigned int
>    |                                                        %x
> ----------------------------------------------------------------------
> 
> This is because on riscv macro VMALLOC_START has different type when
> CONFIG_MMU is set or unset.
> 
> arch/riscv/include/asm/pgtable.h:
> --------------------------------------------------
> 
> Changing it to _AC(0, UL) in case CONFIG_MMU=n can fix the warning.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


Thanks.

> ---
>  arch/riscv/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 294044429e8e..ab00235b018f 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -899,7 +899,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  #define PAGE_KERNEL		__pgprot(0)
>  #define swapper_pg_dir		NULL
>  #define TASK_SIZE		0xffffffffUL
> -#define VMALLOC_START		0
> +#define VMALLOC_START		_AC(0, UL)
>  #define VMALLOC_END		TASK_SIZE
>  
>  #endif /* !CONFIG_MMU */

-- 
~Randy

