Return-Path: <linux-next+bounces-6230-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BB7A88BBF
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 20:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EC2016F736
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 18:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E5D156236;
	Mon, 14 Apr 2025 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nIjdRDDg"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6EDDC3;
	Mon, 14 Apr 2025 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744656719; cv=none; b=FX8X0F4x9JeO+nFw8aywBppoAzCn7AuaUVQqjPu2v9qHdMbhGXZ08+dErJxse0OthVzlzejflw7+MoUIaFgvpPoMxj6IQToUJ7B1YzRvRPVfYB+vba9IfrUk4Ta0iiH4fzc3Yy2zGmwvkdzbeSmIRHGAL5iWMeE+sIZLDw0qiDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744656719; c=relaxed/simple;
	bh=cvV7xn1odW8VfvP0Gdr6hJhh6UzfaVFbvI1J7LRet5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NycAYxxIJjTcIqH8H/LtzFTDb7f2wv5FFDaCSdNM2M9A6y2Amkbf0LU/rLE98gjycK0+bVje89CcFi3s7jmuU804yWWusWbp+ekMGH20Q7shhPwJ6Eih663oF4yPa50bu+9CmN+dZkHllR3GGL4bVK68/GUIVEnytIQd4Yv/85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nIjdRDDg; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LKHJuVA8j6ug4Ho7oRC/dzD6Qn1UJkygT8onm2ayDCk=; b=nIjdRDDgMTEecuFBvEDaO3iI56
	qyqChv227+kh+sZVvjOgPYmzfKTfBM6QL8Eq0AlWZH41ioNANzL8Ke4fBWuUYFqhBsimPZCHA2vAt
	UEnclwcQgLikcw8CkOvD5ICW9fopssncK+Kady/L7S7nn/svxLc2EpYxaKSJ5NvMIN8UOAJGwSZ9i
	UjJJkH/Xl3/VCSsOY7rPsok9XBahC8ekql94+u++5P92kQUM3SMA5scLSuejDgXDxGIwba58r9npU
	Fj+woAiwb8sgLnfdGr2bvmD03y1sT8P5NhCx7Wd3Rb54AH/A33SzsCTUU3T+LvDX9kaOC8Iapz4r6
	JzsfD9wQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OtF-0000000EZgN-0sWS;
	Mon, 14 Apr 2025 18:50:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 301343003AF; Mon, 14 Apr 2025 20:50:31 +0200 (CEST)
Date: Mon, 14 Apr 2025 20:50:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: syzbot <syzbot+c2537ce72a879a38113e@syzkaller.appspotmail.com>,
	riel@surriel.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de, x86@kernel.org
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING in
 switch_mm_irqs_off
Message-ID: <20250414185031.GA13096@noisy.programming.kicks-ass.net>
References: <67fce34b.050a0220.3483fc.0026.GAE@google.com>
 <20250414135629.GA17910@noisy.programming.kicks-ass.net>
 <Z_0lSxPcw4WW1wAP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_0lSxPcw4WW1wAP@gmail.com>

On Mon, Apr 14, 2025 at 05:10:03PM +0200, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > Call Trace:
> > >  <TASK>
> > >  unuse_temporary_mm+0x9f/0x100 arch/x86/mm/tlb.c:1038
> > >  __text_poke+0x7b6/0xb40 arch/x86/kernel/alternative.c:2214
> > >  text_poke arch/x86/kernel/alternative.c:2257 [inline]
> > >  smp_text_poke_batch_finish+0x3e7/0x12c0 arch/x86/kernel/alternative.c:2565
> > >  arch_jump_label_transform_apply+0x1c/0x30 arch/x86/kernel/jump_label.c:146
> > >  static_key_disable_cpuslocked+0xd2/0x1c0 kernel/jump_label.c:240
> > >  static_key_disable+0x1a/0x20 kernel/jump_label.c:248
> > >  once_deferred+0x70/0xb0 lib/once.c:20
> > >  process_one_work kernel/workqueue.c:3238 [inline]
> > >  process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
> > >  worker_thread+0x870/0xd50 kernel/workqueue.c:3400
> > >  kthread+0x7b7/0x940 kernel/kthread.c:464
> > >  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
> > >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> > >  </TASK>
> > 
> > So I can reproduce, and I I think I see what happens, except I'm
> > confused as to why the recently merged patches show this.
> > 
> > AFAIU what happens is that unuse_temporary_mm() clears the 
> > mm_cpumask() for the current CPU, while switch_mm_irqs_off() then 
> > checks that the mm_cpumask() bit is set for the current CPU.
> > 
> > This behaviour hasn't really changed since 209954cbc7d0 ("x86/mm/tlb: 
> > Update mm_cpumask lazily") introduced both.
> > 
> > I'm not entirely sure what the best way forward is.. we can simply 
> > delete the warning, or make use_temporary_mm() tag the special MMs 
> > somehow and exclude them from the warning.
> 
> So, mm_cpumask is basically tracking on which CPUs the MM ran on, and 
> this gets cleared lazily whenever there's an opportune time, but not 
> during context switches (for shared cacheline performance reasons), 
> right?
> 
> So why do we need to clear the mm_cpumask in unuse_temporary_mm() to 
> begin with:
> 
> 	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
>         cpumask_clear_cpu(smp_processor_id(), mm_cpumask(this_cpu_read(cpu_tlbstate.loaded_mm)));
> 
> What TLB flushing are we worried about here? Nothing much should 
> trigger any TLB flushing for text_poke_mm AFAICS?

No, it will actually try and issue TLBI for text_poking_mm and then
things go sideways. If you look up the original thread:

  https://lkml.kernel.org/r/20241113095550.GBZzR3pg-RhJKPDazS@fat_crate.local

you'll find this was discussed. You were on Cc there.

Some of the solutions there made the TLBI not explode, but fundamentally
the whole temporary_mm thing is CPU local and the CR3 switch away is
sufficient.

