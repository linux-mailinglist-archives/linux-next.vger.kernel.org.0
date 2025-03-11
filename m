Return-Path: <linux-next+bounces-5726-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6103A5BB93
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CBD53A3597
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 09:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861761C1ADB;
	Tue, 11 Mar 2025 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mTA+meW2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472A02AD20;
	Tue, 11 Mar 2025 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683762; cv=none; b=TjCPa1yv/lXD5FxRs++BfyUI0PBUWKYcyGrGt+nWrME5cSjxce6i6SjBTn9AJskhFToap3HcYCjQUMG3KcsOcARRWRpfgEgKlq6XX1++6oLFl1u4n8fi0OKtutl4n4ymsmKKTYxdX1kAMYhL/4xoZih/X+xjTrisvbArs8gIZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683762; c=relaxed/simple;
	bh=xHVnyu0Wj20hm/ACoGgPI8gDN90oW8OoELTpSDn11go=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Bpy3kwdPWweLmlZyZZO/wWgSaUr43zlwWciqB542KdAfyVvBHte6i5BiSV1Is1R877F4BZOQ4sy6q74qSafBAfCJSNLMXa6DVxGsCdorV3wtIghyKmGRFi0/sTE1imGKsbVk1ixUgSujJdLl9Rz4FAmSMio8SdRDtEkOgH0dwxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mTA+meW2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2CDC4CEE9;
	Tue, 11 Mar 2025 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741683761;
	bh=xHVnyu0Wj20hm/ACoGgPI8gDN90oW8OoELTpSDn11go=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mTA+meW2I1gRK9wLMCCbdi8zjdJsPLqyfo17Vpt+sbU1r9Gu9lKKdpqW4VL0Vmukh
	 LjyDwUllo5ACUaoV3JXDufPBaCaL4V5+/3tEslbsnwx3bqd3Oc596FuZBo23/4qV5M
	 mwtbayb7BKVG1cWSbVVmw1tK6BjKhRyiSOw2iu2c=
Date: Tue, 11 Mar 2025 02:02:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tip tree
Message-Id: <20250311020240.3b8c34b155f76fff5cccee01@linux-foundation.org>
In-Reply-To: <20250311150847.5a63db36@canb.auug.org.au>
References: <20250311150847.5a63db36@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Mar 2025 15:08:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in the mm tree as different commits
> (but the same patches):
> 
>   0b3bc3354eb9 ("arm64: vdso: Switch to generic storage implementation")
>   127b0e05c166 ("vdso: Rename included Makefile")
>   30533a55ec8e ("parisc: Remove unused symbol vdso_data")
>   31e9fa2ba9ad ("arm: vdso: Switch to generic storage implementation")
>   365841e1557a ("vdso: Add generic architecture-specific data storage")
>   3ef32d90cdaa ("x86/vdso: Fix latent bug in vclock_pages calculation")
>   46fe55b204bf ("riscv: vdso: Switch to generic storage implementation")
>   51d6ca373f45 ("vdso: Add generic random data storage")
>   5b47aba85810 ("vdso: Introduce vdso/align.h")
>   69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")
>   9729dceab17b ("x86/vdso/vdso2c: Remove page handling")
>   998a8a260819 ("vdso: Remove remnants of architecture-specific random state storage")
>   ac1a42f4e4e2 ("vdso: Remove remnants of architecture-specific time storage")
>   d2862bb9d9ca ("LoongArch: vDSO: Switch to generic storage implementation")
>   dafde29605eb ("x86/vdso: Switch to generic storage implementation")
>   df7fcbefa710 ("vdso: Add generic time data storage")
> 
> These are causing the following conflicts:
> 
> CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/compat_gettim
> ofday.h
> CONFLICT (content): Merge conflict in arch/arm64/include/asm/vdso/vsyscall.h
> CONFLICT (content): Merge conflict in arch/powerpc/include/asm/vdso/gettimeofday.h
> CONFLICT (content): Merge conflict in arch/s390/kernel/time.c
> CONFLICT (content): Merge conflict in arch/x86/include/asm/vdso/gettimeofday.h
> CONFLICT (content): Merge conflict in include/asm-generic/vdso/vsyscall.h
> CONFLICT (content): Merge conflict in include/vdso/datapage.h
> CONFLICT (content): Merge conflict in include/vdso/helpers.h
> CONFLICT (content): Merge conflict in kernel/time/namespace.c
> CONFLICT (content): Merge conflict in kernel/time/vsyscall.c
> CONFLICT (add/add): Merge conflict in lib/vdso/datastore.c
> CONFLICT (content): Merge conflict in lib/vdso/gettimeofday.c

Yup, thanks.  I trust it's not too much effort to simply skip the
mm.git copies?

There's presumably a better way of doing this, but it's really the
first time it has happened in N years so it isn't obviously worth
investing in setting something up.


