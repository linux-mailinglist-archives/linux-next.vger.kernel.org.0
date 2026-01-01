Return-Path: <linux-next+bounces-9516-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9092FCED33F
	for <lists+linux-next@lfdr.de>; Thu, 01 Jan 2026 18:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79D3030038CE
	for <lists+linux-next@lfdr.de>; Thu,  1 Jan 2026 17:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE94E19DF8D;
	Thu,  1 Jan 2026 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J9g5BV/O"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003913AD1C;
	Thu,  1 Jan 2026 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767286890; cv=none; b=tp0HNq1iqKpJkLN2yZmKPiebFCen/JgNmNg3JA+oGkKG+ak8YkOBaDFyr0uRpjJJ2qwSh2UDs89CCOjVuQo9OmL74awNaV/HHDB2vOOy+nAgLHZjci3F/0XuDJcAIAsOR1xJXH3Dys+YhJsscGJj1zp6RUXEs6A3ebQHLVb5glI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767286890; c=relaxed/simple;
	bh=k2DOsBFQKp2nK5/PAeN2rN9ZW3ikdnXZ1xCNk8Or0Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POQrz2AcU2r5XO6FXcivD/L0JwzzuK/CFbd6u25pJHw7mPvHjrzW0vYrcbAfhy3CbokEXW2q/hogjCAChrtNJ9aLR43EGcLTYlFHVgySsMVT3pvUFEkZrLq1TZ1hmwZ6SmERibw/qL4OAZnAPpumriPAmwdQF+haw4HvX3GUAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J9g5BV/O; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=apiR2woFnSd4Xz/m8yf0lBOKVsC3myedKUwwwAIAzow=; b=J9g5BV/OLaTVS4zGy1c35gvAMU
	q92lp+WtZpbg6D6H3GqzHBVV5itsy0aPq/FNoWFgMoFAWpE+2JfKdVcLS8s7fvcn2ptgamR2S0ao5
	nrjKa4twZtmpHdKDhr5AN2fKyhZ5WBCZgZ/cYRA0akiq+PCl4xKbLCZ9bBP4cAzew9qn1fAInEiKX
	dMwfZsA6E7I6vvENJfoaax69stENDNO6eVjyQUbEeoN50LXLBIzdIkYXMgdKzMtmYGTttSQ9xmUxs
	O4jHddV6UvwyOXu99ZYtf1/jkwuC/YiM+p0W8esHvgDlWWLwCw/38AK3Dog0kw0Yt1G+vt5Z4sfPH
	80wHEAmg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbM34-00000007N1Q-3SYj;
	Thu, 01 Jan 2026 17:01:18 +0000
Message-ID: <77d3d65a-9ef0-451e-b24f-1b3f38cf822b@infradead.org>
Date: Thu, 1 Jan 2026 09:01:16 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
To: Finn Thain <fthain@linux-m68k.org>, Sasha Levin <sashal@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251218153050.44da4a78@canb.auug.org.au>
 <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org> <aU67sD1u83Qrpvdu@laps>
 <df9fbd22-a648-ada4-fee0-68fe4325ff82@linux-m68k.org>
 <4a3455a6-a0dc-f7fb-8b68-da471bb312c7@linux-m68k.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <4a3455a6-a0dc-f7fb-8b68-da471bb312c7@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/1/26 1:21 AM, Finn Thain wrote:
> 
> On Mon, 29 Dec 2025, Finn Thain wrote:
> 
>> On Fri, 26 Dec 2025, Sasha Levin wrote:
>>
>>> On Sun, Dec 21, 2025 at 01:58:17PM +1100, Finn Thain wrote:
>>>>
>>>> On Thu, 18 Dec 2025, Stephen Rothwell wrote:
>>>>
>>>>> After merging the mm-nonmm-unstable tree, today's linux-next build 
>>>>> (x86_64 allmodconfig) failed like this:
>>>>>
>>>>> x86_64-linux-gnu-ld: error: unplaced orphan section `__bug_table' from
>>>>> `arch/x86/boot/compressed/sev-handle-vc.o'
>>>>>
>>>>
>>>> I found that I could reproduce the same build failure after applying 
>>>> Peter's patch to v6.19-rc1. So it's not confined to linux-next. I 
>>>> used allnoconfig with CONFIG_LD_ORPHAN_WARN_LEVEL=error and 
>>>> CONFIG_AMD_MEM_ENCRYPT=y because allmodconfig takes forever to build.
>>>>
>>>> The patch in question is this one: 
>>>> https://lore.kernel.org/lkml/0c18fd08ef19497768070783da28086e01d11a00.1765866665.git.fthain@linux-m68k.org/
>>>>
>>>> I may have found a solution for the problem, but I don't understand 
>>>> this code, so I've Cc'd Ard et al. I don't know whether the 
>>>> __bug_table section is relevant to sev-handle-vc.c. If that section 
>>>> is not desired, I propose to make this change to Peter's patch --
>>>
>>> I think that the issue here is that we're trying to use WARN in the 
>>> early boot context. We should probably add CONFIG_DEBUG_ATOMIC to the 
>>> list of configs we disable for that:
>>>
>>> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
>>> index 4f86c5903e03..bb36dcef7d08 100644
>>> --- a/arch/x86/boot/compressed/misc.h
>>> +++ b/arch/x86/boot/compressed/misc.h
>>> @@ -14,6 +14,7 @@
>>>  #undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>  #undef CONFIG_KASAN
>>>  #undef CONFIG_KASAN_GENERIC
>>> +#undef CONFIG_DEBUG_ATOMIC
>>>
>>
>> Thanks for sending that suggestion. It does fix the problem on x86_64. 
>> However, the problem also affects arm, arm64, riscv, riscv64 and 
>> loongarch. The fix I proposed (i.e. test __DISABLE_EXPORTS) works on all 
>> of the affected architectures because 
>> drivers/firmware/efi/libstub/Makefile puts -D__DISABLE_EXPORTS in 
>> CFLAGS, just as arch/x86/boot/compressed/Makefile does.
>>
>> AFAICT, when I put -UCONFIG_DEBUG_ATOMIC in CFLAGS, it doesn't override 
>> that macro definition autoconf.h. And there is no equivalent of 
>> arch/x86/boot/compressed/misc.h in drivers/firmware/efi/libstub so I 
>> can't simply add #undef CONFIG_DEBUG_ATOMIC there.
>>
> 
> I'd better correct myself. That header does actually exist:
> drivers/firmware/efi/libstub/efistub.h
> I overlooked it somehow.
> 
>> If __DISABLE_EXPORTS is not the appropriate macro for this purpose, then 
>> we need a new macro (e.g. __DISABLE_BUG_TABLE) or else we need a new 
>> header, to be included by some unknown set of .c files (that might 
>> accidentally #include bug.h) so that this new header could do #undef 
>> CONFIG_DEBUG_ATOMIC. My inclination is to implement 
>> -D__DISABLE_BUG_TABLE but I'm open to suggestions.
>>
> 
> After I sent patches using -D__DISABLE_BUG_TABLE, I figured out that your 
> #undef suggestion has some appeal: by confining the preprocessor tricks to 
> drivers/firmware/efi/libstub/, we might avoid spreading them across 
> include/linux/ which has a certain tidyness to it.
> 
> The only problem is fragility. The ordering of #include and #undef 
> directives is critical and complicated. I can't seem to get it right.
> The following patch produces a build failure.
> 
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index fd855e32c9b9..8442eebaada1 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -8,6 +8,7 @@
>   * we just keep it from happening. (This list needs to be extended when new
>   * paravirt and debugging variants are added.)
>   */
> +#include <generated/autoconf.h>
>  #undef CONFIG_PARAVIRT
>  #undef CONFIG_PARAVIRT_XXL
>  #undef CONFIG_PARAVIRT_SPINLOCKS
> 
> 
> Problem is, you can't do #undef unless you know that #define has already 
> taken place, and you can't #define again if #undef has already taken 
> place...
> 
> Anyway, that's just BTW: I don't feel any need to revise the patches I 
> sent.
> 

Hi,
You mean something more than

+#include <generated/autoconf.h>
+#ifdef CONFIG_PARAVIRT
 #undef CONFIG_PARAVIRT
+#endif
+#ifdef CONFIG_PARAVIRT_XXL
 #undef CONFIG_PARAVIRT_XXL
+#endif
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
 #undef CONFIG_PARAVIRT_SPINLOCKS
+#endif

-- 
~Randy


