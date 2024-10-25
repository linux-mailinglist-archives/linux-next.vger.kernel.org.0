Return-Path: <linux-next+bounces-4432-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B43649AFA73
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 08:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60AD01F21BF9
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 06:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61D91B0F03;
	Fri, 25 Oct 2024 06:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPxFmXFg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB0B18F2E8;
	Fri, 25 Oct 2024 06:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839421; cv=none; b=p52kuCw0Yw0tkS9Sg4MGyQ45l+6PLHxY1wwlXZ1imBuFnPZ4+55WiVzSltE14+EVuFydULfo90wnfZKRSENeVTFTzZhYEPoiswSskLFkr9qvS96U58ghCfIlrFpWSqvJCXIJOD0hGtB5jKckHefQKf5mUs56CfJgEKyqiSX8q2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839421; c=relaxed/simple;
	bh=bgylbL/aJ92AEBMVWCOnuEj+76dKY3PEU0Sc78f+niE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0A02lNlwmHj2ShO+SCEQDj8DXcqoStoUxNokdC8q3HsYFRkQbo7Kw5ryCd0xUlLucM25xT8Mcr/Sv07O6ZSXljiifrrN6oKU7kF2GqdcMuKhlF/acc16qhIdzyJdp9/ShgLWl/pxlw9WBz23f77HeKb9+CU91MxOAHW4ySF7yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPxFmXFg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C89BC4CEE4;
	Fri, 25 Oct 2024 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729839421;
	bh=bgylbL/aJ92AEBMVWCOnuEj+76dKY3PEU0Sc78f+niE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPxFmXFgMUTPNxNt3ByNOFLF4zUToDJ9u77qWP0AFumT7thPSZNfP8HP109HOX1Sm
	 soxO6h/7/to2dtYQzjSpxKFAHC7r3iCuqii4FlmcNvNKgR2ngI1fxhoCQxWD1Xuard
	 MTpaVLEfe98KLGBfLmg1lOhkzO8Z2yGpzXwSg14u3Lj32VFTmy5OKz3GOK2CE+i8Yd
	 3w76VRcNZtcjuPhh/oloB+Fu3hRcyguYF8jCvN0z5qhKdEsycU0tGx6vsShIuDXvFx
	 jZi1+5862IqQP3n7XttyKFtRRKT+LTr/4rgXFCNFB/V3NGidPaZCbn2+u1dqt662+z
	 1R5epQjF7UNdQ==
Date: Fri, 25 Oct 2024 09:53:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hua Su <suhua.tanke@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the memblock tree
Message-ID: <ZxtAWopjlF9unBno@kernel.org>
References: <20241022173921.6fdbdd38@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022173921.6fdbdd38@canb.auug.org.au>

Hi Stephen,

On Tue, Oct 22, 2024 at 05:39:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the memblock tree, today's linux-next build
> (powerpc_pseries_le_defconfig) failed my qemu boot test like this:
> 
> mem auto-init: stack:all(zero), heap alloc:off, heap free:off
> BUG: Unable to handle kernel data access on read at 0x00001878
> Faulting instruction address: 0xc0000000004f00e4
> Oops: Kernel access of bad area, sig: 7 [#1]
> LE PAGE_SIZE=4K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in:
> CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.12.0-rc4-06078-g367eaba2691a #1
> Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,HEAD pSeries
> NIP:  c0000000004f00e4 LR: c000000000489df8 CTR: 0000000000000000
> REGS: c0000000028cfae0 TRAP: 0300   Not tainted  (6.12.0-rc4-06078-g367eaba2691a)
> MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 84000240  XER: 00000000
> CFAR: c0000000004f2c48 DAR: 0000000000001878 DSISR: 00080000 IRQMASK: 3 
> GPR00: c00000000204994c c0000000028cfd80 c0000000016a4300 c00c000000040000 
> GPR04: 0000000000000001 0000000000001000 0000000000000007 c000000002a11178 
> GPR08: 0000000000000000 0000000000001800 c00000007fffe720 0000000000002001 
> GPR12: 0000000000000000 c000000002a6a000 0000000000000000 00000000018855c0 
> GPR16: c000000002940270 c00c000000000000 0000000000040000 0000000000000000 
> GPR20: 0000000000000000 ffffffffffffffff 0000000000000001 ffffffffffffffff 
> GPR24: 00c0000000000000 0000000000000000 0000000000000000 0000000008000000 
> GPR28: 0000000000000000 0000000000002a6b 0000000000000000 0000000000001000 
> NIP [c0000000004f00e4] set_pfnblock_flags_mask+0x74/0x140
> LR [c000000000489df8] reserve_bootmem_region+0x2a8/0x2c0
> Call Trace:
> c0000000028cfd80] [c0000000028cfdd0] 0xc0000000028cfdd0 (unreliable)
> c0000000028cfe20] [c00000000204994c] memblock_free_all+0x144/0x2d0
> c0000000028cfea0] [c000000002016354] mem_init+0x5c/0x70
> c0000000028cfec0] [c00000000204547c] mm_core_init+0x158/0x1dc
> c0000000028cff30] [c000000002004350] start_kernel+0x608/0x944
> c0000000028cffe0] [c00000000000e99c] start_here_common+0x1c/0x20
> Code: 4182000c 79082d28 7d4a4214 e9230000 3d020137 38e8ce78 79284620 792957a0 79081f24 79295d24 7d07402a 7d284a14 <e9090078> 7c254040 41800094 e9290088 
> ---[ end trace 0000000000000000 ]---
> 
> Kernel panic - not syncing: Attempted to kill the idle task!
> 
> Caused by commit
> 
>   ad48825232a9 ("memblock: uniformly initialize all reserved pages to MIGRATE_MOVABLE")
> 
> I bisected the failure to this commit and have reverted it for today.

Apparently set_pfnblock_flags_mask() is unhappy when called for
uninitialized struct page. With the patch below

qemu-system-ppc64el -M pseries -cpu power10 -smp 16 -m 32G -vga none -nographic -kernel $KERNEL

boots up to mounting root filesystem.
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 49dbd30e71ad..2395970314e7 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -723,10 +723,10 @@ static void __meminit init_reserved_page(unsigned long pfn, int nid)
 			break;
 	}
 
+	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
+
 	if (pageblock_aligned(pfn))
 		set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
-
-	__init_single_page(pfn_to_page(pfn), pfn, zid, nid);
 }
 #else
 static inline void pgdat_set_deferred_range(pg_data_t *pgdat) {}

> -- 
> Cheers,
> Stephen Rothwell



-- 
Sincerely yours,
Mike.

