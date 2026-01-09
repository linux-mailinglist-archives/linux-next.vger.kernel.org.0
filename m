Return-Path: <linux-next+bounces-9600-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C229FD0BB58
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 18:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A14830D4D02
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 17:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00812DFF19;
	Fri,  9 Jan 2026 17:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YtOIZAVU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818CD20B22;
	Fri,  9 Jan 2026 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979820; cv=none; b=FeYT9tdYq1IcDj7EImCie+5pVlGAl8+B2jYt9Qstg3LkJiLtkSW8hep/xFAueviGuu76E4nBLEN/QTifJ0ZiD4SgNA61qvlo/OOBJpClnp4wpujFEDwv8QkzcW4wHBmMxosRLUswjWUgz3yPitl+5He3ixgwrB5zKx1WnTpsGq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979820; c=relaxed/simple;
	bh=a+6peM4CR12MIipZWQf5icTiun96z0O9ztBv5WBfiWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoLpgI+ml8xOfLzUJT6UIxGToehKY/vzoxJbfS2YRP3Q6BWRPH+SEjL2PkgaIRI7xeCZj7FP8fVmNpRxkVdJILUYTUUEqdrbeGqW5+vQVgasRiqxg2I6WUAWGgRoGvKlNy1a0DqKj0e/g127VGrD2nKTXSiPOVscRlsuqc5J+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YtOIZAVU; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3EFCC40E02D1;
	Fri,  9 Jan 2026 17:30:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nKlDrEnBPnjn; Fri,  9 Jan 2026 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767979810; bh=Qi7+oyMYn9Xkhl8Fa0PDJRxA97887/HcqLLT8P7dTJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtOIZAVUKFSB6ctVUcHWp+maaMqp/cDuUQc3LCcPXyazNTjaQ34CkGNFvONG+TuBH
	 E2n0t297FdmcA+wUIyn+SdNwzP9SRADmd4KzRk3OPZAss6jnBcZrARJY02MNFyaleb
	 8ajf+ZFJ13jm2DDgUOq23K0xiRkcPBb6KGgn83DKHsedELRrMlQ8ODh7nOMLE53h3l
	 oE8H0AB93NVbjFH04A4ixCGDWHlbj5FroXDX1PsAkVdHFGZhb0ApK9SM6CL4CNl+4N
	 gU89rXUH812y/FXzgB/ergsI3SCegbqKTQVt/pXOoe3k5DGIuxfSC5HmpRKZVpa0TO
	 43rkL5R/vG/F7VdR1lvX1HYTYAFs6LXIN1tSMZgQ6LVuhfUyCJ6fmTbWoYFjade183
	 cXsqVzLVA1fTLN9/rl2j3NLbBslYqba1JXnRmcpkFA8jDYCSyGRcaBBTh2ccu9EwVK
	 gpVI2It3dhdFKpZRANMQa8gG7DbKTlfKDZRUDpCKwzgTT/OT/KHmIrYcY5cLOU9AP0
	 r8wZTdBS7QMEw8iPgovRy8EGgzRTuk7mU3Qz9l27nvOUw4AEo97DA+BHq5xWyw6ssS
	 LBdW2/FlCZRVBfGAAzwT/54zOtj4vaQEFFkEONLS1YRb+lysbm8lv/nj5JNQdPiqim
	 Tp0kjFjVBSGvArSHJH5l58yw=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6624940E0200;
	Fri,  9 Jan 2026 17:30:02 +0000 (UTC)
Date: Fri, 9 Jan 2026 18:29:55 +0100
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
 <20260107144753.7071f5f2@canb.auug.org.au>
 <20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>

On Wed, Jan 07, 2026 at 11:52:22AM +0100, Borislav Petkov wrote:
> On Wed, Jan 07, 2026 at 02:47:53PM +1100, Stephen Rothwell wrote:
> > So this still failed with yesterday's tip tree, so clearly there is
> > some other change in today's linux-next that has exposed this. 
> 
> Yes, because tip/master is fine. This is the usual include hell biting us.
> 
> > Instead of using the old version of the tip tree, I have just reverted this
> > commit for today.
> 
> Ok, below is what fixes it. How do you want to handle this?
> 
> ---
> diff --git a/arch/x86/coco/sev/internal.h b/arch/x86/coco/sev/internal.h
> index 039326b5c799..0df642c76626 100644
> --- a/arch/x86/coco/sev/internal.h
> +++ b/arch/x86/coco/sev/internal.h
> @@ -2,6 +2,9 @@
>  #ifndef __X86_COCO_SEV_INTERNAL_H__
>  #define __X86_COCO_SEV_INTERNAL_H__
>  
> +#include <asm/percpu.h>
> +#include <asm/msr.h>
> +
>  #define DR7_RESET_VALUE        0x400
>  
>  extern u64 sev_hv_features;
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 0e6c0940100f..9cfbb27a7bab 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -16,6 +16,7 @@
>  #include <asm/coco.h>
>  #include <asm/set_memory.h>
>  #include <asm/svm.h>
> +#include <asm/pgtable_types.h>
>  
>  #define GHCB_PROTOCOL_MIN	1ULL
>  #define GHCB_PROTOCOL_MAX	2ULL
> 
> 
> -- 

Yah, so I took another look at your linux-next merge order and did build the
tree at those points which are before tip/master. I also merged the
"problematic" tip branch tip/x86/sev each time. Result is:

...
96664520b51e Merge branch 'dma-mapping-for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git
b59860457d3a Merge branch 'perf-tools-next' of https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
f22a45b0077d Merge branch 'kbuild-for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git

<-- merge tip/x86/sev ontop: NO

90914704bb11 Merge branch 'mm-nonmm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

<-- OK

dafcd15eda39 Merge branch 'mm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

<-- OK

0d069c5ced0c (refs/remotes/linux-next/pending-fixes) Merge branch 'for-linux-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
b269a870523e Merge branch 'tip/urgent' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
2f4bcdcf5ff3 Merge branch 'fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
...

So it is that mm-nonmm-unstable pile of random crap.

Looking through the patches there, there's:

Author: Coiby Xu <coxu@redhat.com>  2026-01-06 10:50:59
Committer: Andrew Morton <akpm@linux-foundation.org>  2026-01-08 23:31:57
Parent: 63cb8b34f8287156b4dd888f05f9ca5415f9da93 (x86/crash: use set_memory_p instead of __set_memory_prot)
Child:  ad1b7e9fdddc88f32b129507a85095f2a1bb9766 (ocfs2: add check for free bits before allocation in ocfs2_move_extent())
Branch: remotes/akpm/mm-nonmm-unstable
Follows: mm-hotfixes-stable-2025-12-28-21-50, v6.19-rc3
Precedes: 

    Reapply "x86/mm: Remove unused __set_memory_prot()"
    
    This reverts commit e1e6cd01d93359e22be84a23c8bb24ee4e04e142 as
    __set_memory_prot is unsued (again) after set_memory_p is used instead for
    x86_64 kdump LUKS support (CONFIG_CRASH_DM_CRYPT).

which removes this include:

---------------------- arch/x86/include/asm/set_memory.h ----------------------
index 61f56cdaccb5..8d9f1c9aaa4c 100644
@@ -4,7 +4,6 @@
 
 #include <asm/page.h>
 #include <asm-generic/set_memory.h>
-#include <asm/pgtable.h>
 
 #define set_memory_rox set_memory_rox
 int set_memory_rox(unsigned long addr, int numpages);

---

So I added it back and the tree builds fine.

Well, what can I say: I have been trying for a long time to get akpm to *stop*
taking patches touching arch/x86/ because this causes issues but nope, that
still goes on.

The issue now is cross-tree build failure which ends up in linux-next and gets
detected there. Had this patch above been in tip, none of that would've
happened.

So, Andrew, once again: please stop taking patches touching arch/x86!

This is causing an unnecessary churn and headaches for no good reason
whatsoever!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

