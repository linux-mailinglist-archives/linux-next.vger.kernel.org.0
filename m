Return-Path: <linux-next+bounces-5442-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24126A351DE
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 00:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF87916EEE0
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 22:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05922753EB;
	Thu, 13 Feb 2025 22:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="dNNJjgYE"
X-Original-To: linux-next@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10182753E4;
	Thu, 13 Feb 2025 22:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739487542; cv=none; b=FD6pyDnCwXs3sckxyjSw8HDfsIiJvIwo3o4X89so7lvTIcKIMWEKDbREymfUcTNo+39KQGt8gLnDMo/TLPp8Qo1TuSCEC6pXGgyPDT3RAeKT4oqVwl0spr4JdojZSwpejLhkXhR5qyBve4BPid/CLceW8/T1bS1q5jOUpcSTibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739487542; c=relaxed/simple;
	bh=R12l3J30axSbefudVlK1pDfbPxMUz7ztnO0/Roxys1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVlm4jDtQbzVDJEbfn4SNlX0iHFFuY94/EFPOQSXx9kEd4QphwLl61Kzuij+W61jtQdQsPIIXqcfO0pOXdTVyFOj7qBPLMXhKcWgCuxLneElYCmmgPpYBsBHmx4fY+lGSOkpTbqCWEGqVCwklfKn2QgTvoVkH+kOz6yuDsieTrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=dNNJjgYE; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 56985203F3CB;
	Thu, 13 Feb 2025 14:59:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 56985203F3CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739487540;
	bh=dW5XISQuWFvW8sCaOsovSOmFHY7oAkJUIf9J+EIrvV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dNNJjgYE3E1O/Nwy9lZn4szdb8PwF9vx8BaC1kSHQJVByX6KGgi686cXy3Fw0cdjQ
	 jaZgcXqiCgnzJrRd6KKLJUXAt9SbIkmyT4PxUf7HKTZ0TXgHIpjjtjDNKTK1iTzubx
	 wWB49pAqllw38xOz8rmDTUzNZG9RcCb6kFU/sFaE=
Message-ID: <8434b7a7-1062-4750-8a84-08e9f56b1d73@linux.microsoft.com>
Date: Thu, 13 Feb 2025 14:58:59 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the hyperv tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wei Liu <wei.liu@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250213142804.4ba0e125@canb.auug.org.au>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <20250213142804.4ba0e125@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/12/2025 7:28 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hyperv tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/asm-generic/bug.h:22,
>                  from arch/x86/include/asm/bug.h:99,
>                  from include/linux/bug.h:5,
>                  from arch/x86/include/asm/paravirt.h:19,
>                  from arch/x86/include/asm/irqflags.h:80,
>                  from include/linux/irqflags.h:18,
>                  from include/linux/spinlock.h:59,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:7,
>                  from include/linux/slab.h:16,
>                  from include/linux/resource_ext.h:11,
>                  from include/linux/acpi.h:13,
>                  from drivers/hv/hv_common.c:16:
> drivers/hv/hv_common.c: In function 'hv_get_partition_id':
> include/linux/kern_levels.h:5:25: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Werror=format=]
>     5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
>       |                         ^~~~~~
> include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
>   473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>       |                         ^~~~
> include/linux/printk.h:544:9: note: in expansion of macro 'printk'
>   544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~
> include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
>    11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
>       |                         ^~~~~~~~
> include/linux/printk.h:544:16: note: in expansion of macro 'KERN_ERR'
>   544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |                ^~~~~~~~
> drivers/hv/hv_common.c:304:17: note: in expansion of macro 'pr_err'
>   304 |                 pr_err("Hyper-V: failed to get partition ID: %#lx\n",
>       |                 ^~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   bc57d252ddf0 ("hyperv: Move hv_current_partition_id to arch-generic code")
> 
> I have used the hyperv tree from next-20250212.
> 

Thanks Stephen, I have sent a fixup patch to Wei.

I also added W=1 to my make command to catch this in future!

Nuno

