Return-Path: <linux-next+bounces-5542-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE24A414E8
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 06:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754333B2DC5
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 05:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB68156225;
	Mon, 24 Feb 2025 05:50:08 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C553D1448E3;
	Mon, 24 Feb 2025 05:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740376208; cv=none; b=JRNf2mnJV4hYVlLNp9bIDXLjrhGf2bpzvJFRorlkXl99dUEyoP1elauQ72Lt1BD41DPcGc+Misx6dGGh7o3tF2btQKEwBQnh8JXvFK8iGx9i4HX1VZLTIoEQBuwKLsk8IS2FZBlrH5K4TwvNRN1THnQQqXwl4vCT1gT1sVMgW2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740376208; c=relaxed/simple;
	bh=HNOxiLRv9euClf91fWu8MfVbJcHGLBkYxHdQou3cn80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gysjEVt535i7ovs71MoKUrStGYVOIkwt003xiDBlTJeNLJBunWzk1YiiobTjBXJb0RTPRREMwKARk+s9ZNpQOiPPsVwxAOVAfGI8L6Qng9OqjPCeCrdfIcc0iOG3pUMTdzoH0Nk1RtzDx7WkDUh8QaeaRq67jNxeudqBAnR17F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE140152B;
	Sun, 23 Feb 2025 21:50:21 -0800 (PST)
Received: from [10.163.39.8] (unknown [10.163.39.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF90D3F673;
	Sun, 23 Feb 2025 21:50:01 -0800 (PST)
Message-ID: <2edbba3b-8212-413e-afb9-060de6319661@arm.com>
Date: Mon, 24 Feb 2025 11:20:00 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250224144240.7b5bca3f@canb.auug.org.au>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250224144240.7b5bca3f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The fix for the merge-conflict looks good.

On 2/24/25 09:12, Stephen Rothwell wrote:
> diff --cc arch/riscv/include/asm/io.h
> index 0536846db9b6,0257f4aa7ff4..000000000000
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@@ -136,8 -136,8 +136,8 @@@ __io_writes_outs(outs, u64, q, __io_pbr
>   #include <asm-generic/io.h>
>   
>   #ifdef CONFIG_MMU
> - #define arch_memremap_wb(addr, size)	\
> + #define arch_memremap_wb(addr, size, flags)	\
>  -	((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
>  +	((__force void *)ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL)))
>   #endif
>   
>   #endif /* _ASM_RISCV_IO_H */

