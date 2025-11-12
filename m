Return-Path: <linux-next+bounces-8932-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6CC51938
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 11:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B59A1886D4E
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCAF2F9984;
	Wed, 12 Nov 2025 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sg1vAAkl"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746392798EA;
	Wed, 12 Nov 2025 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942168; cv=none; b=E1DFarcXxYCLJsYWAocxc0KqPM651aBmVXlFf9RWxzDnM1Pu1162LW2GkmOOaclo9yHLYjrFazl/xx/A/KgxsZXq/69Bw41go4pU/JC5LzUUszagjI0MHDLy6Ka3uRVxW5sm9xrJu+pjnVHANu9cWnMZLMigGXDVRgPKFqBEaEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942168; c=relaxed/simple;
	bh=B5TaGI6wtvr9ooKN4HgE0RdNcHLd/NXQf+uGS78OABI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGPl5i7rBTHO7Eenr1+Taiv0p41ugI9gyKmHrawCttxj3Og2G2asC2hdPI/dPkVk7Z/XNtfpZ1PJaP8xy8KZ3A2Ek2XMES5GOYqW6++6CFep9QteMAc2Vxm6L3ljXiP347qhaoUL/LuIMkVKVhVY52H/H2/seTBdHBSrtFiHefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sg1vAAkl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B5EC4CEF5;
	Wed, 12 Nov 2025 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942168;
	bh=B5TaGI6wtvr9ooKN4HgE0RdNcHLd/NXQf+uGS78OABI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sg1vAAkl0PHFyuNcId1MfHx/qNOGoFXNForPo1Fdkjh/HSNvfZWYqOZSSLMMKYYg5
	 eTJeVrz6CGHlYp9MfzMAI9rhcfeqS7RiggRRhPYE6rAypEIlWYRlr+OdUkQ3EgPWuB
	 MZqqn+92LGz4tbXeh34ot0JgjwOYOv5dstf+l2Q7SnJjlHO5QRaZWCHrp7xeCDNWrt
	 K69G7150mf+n1JfT6iS0s9si55hoaNYlDIiI36DopMchvcaptQG2kRNqlbAVkisgGz
	 lOTQ+PvTGejkNoy4Mu2u4cPLBpx01flEez0IFo1b6u8rWErzsi42i7AWBE04pbDpQ8
	 pLAtCASXrYmiA==
Date: Wed, 12 Nov 2025 11:09:14 +0100
From: Ingo Molnar <mingo@kernel.org>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] perf/x86/intel: Fix and clean up intel_pmu_drain_arch_pebs()
 type use
Message-ID: <aRRcyoOobRyam5yD@gmail.com>
References: <20251112154200.4d3671f9@canb.auug.org.au>
 <cb49c1be-99a5-4aba-b3da-f902058a4996@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb49c1be-99a5-4aba-b3da-f902058a4996@linux.intel.com>


* Mi, Dapeng <dapeng1.mi@linux.intel.com> wrote:

> 
> On 11/12/2025 12:42 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the tip tree, today's linux-next build (i386 defconfig)
> > failed like this:
> >
> > arch/x86/events/intel/ds.c: In function 'intel_pmu_drain_arch_pebs':
> > arch/x86/events/intel/ds.c:2983:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> >  2983 |         top = (void *)((u64)cpuc->pebs_vaddr +
> >       |                        ^
> > arch/x86/events/intel/ds.c:2983:15: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> >  2983 |         top = (void *)((u64)cpuc->pebs_vaddr +
> >       |               ^
> > cc1: all warnings being treated as errors
> 
> Thanks for reporting the issue. I suppose the below patch would fix the
> building error. I would post it as an independent patch later.
> 
> diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
> index c93bf971d97b..f695de9f7049 100644
> --- a/arch/x86/events/intel/ds.c
> +++ b/arch/x86/events/intel/ds.c
> @@ -2979,7 +2979,7 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs
> *iregs,
>         }
> 
>         base = cpuc->pebs_vaddr;
> -       top = (void *)((u64)cpuc->pebs_vaddr +
> +       top = (void *)((unsigned long)cpuc->pebs_vaddr +
>                        (index.wr << ARCH_PEBS_INDEX_WR_SHIFT));

This doesn't really address the core issue: ugly, fragile code due to 
type confusion. The proper fix is:

	top = cpuc->pebs_vaddr + (index.wr << ARCH_PEBS_INDEX_WR_SHIFT);

which is also much cleaner, see:

	60f9f1d43720 ("perf/x86/intel: Fix and clean up intel_pmu_drain_arch_pebs() type use")

(also attached below.)

All this should be resolved in the latest -tip tree.

Thanks,

	Ingo

=====================>
From 60f9f1d437201f6c457fc8a56f9df6d8a6d0bea6 Mon Sep 17 00:00:00 2001
From: Ingo Molnar <mingo@kernel.org>
Date: Wed, 12 Nov 2025 10:40:26 +0100
Subject: [PATCH] perf/x86/intel: Fix and clean up intel_pmu_drain_arch_pebs() type use

The following commit introduced a build failure on x86-32:

  2721e8da2de7 ("perf/x86/intel: Allocate arch-PEBS buffer and initialize PEBS_BASE MSR")

  ...

  arch/x86/events/intel/ds.c:2983:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]

The forced type conversion to 'u64' and 'void *' are not 32-bit clean,
but they are also entirely unnecessary: ->pebs_vaddr is 'void *' already,
and integer-compatible pointer arithmetics will work just fine on it.

Fix & simplify the code.

Fixes: 2721e8da2de7 ("perf/x86/intel: Allocate arch-PEBS buffer and initialize PEBS_BASE MSR")
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>
Link: https://patch.msgid.link/20251029102136.61364-10-dapeng1.mi@linux.intel.com
---
 arch/x86/events/intel/ds.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index c93bf971d97b..2e170f2093ac 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -2979,8 +2979,7 @@ static void intel_pmu_drain_arch_pebs(struct pt_regs *iregs,
 	}
 
 	base = cpuc->pebs_vaddr;
-	top = (void *)((u64)cpuc->pebs_vaddr +
-		       (index.wr << ARCH_PEBS_INDEX_WR_SHIFT));
+	top = cpuc->pebs_vaddr + (index.wr << ARCH_PEBS_INDEX_WR_SHIFT);
 
 	index.wr = 0;
 	index.full = 0;

