Return-Path: <linux-next+bounces-6228-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A903A887BD
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 17:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 860F03A8788
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 15:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A11627587A;
	Mon, 14 Apr 2025 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M80dE7Yq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668425E813;
	Mon, 14 Apr 2025 15:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645837; cv=none; b=AZr0MGnv2DRtA308fm+08ZvlNagK/LkvNGX8/eeQiiw7ohlTnst/dgFWyTKy2LFkpU6W3VSvdi8bwGzYaJzRiqFuEHfivewppO0FFhgXcDKj2hCcylhY6c4cEpQeuTvEax/vC0yb2sA041/irrXUxvhkl1/lSW+4M35cbrSUY5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645837; c=relaxed/simple;
	bh=r1m7JKkm48IkvWCjD/5V7wAI2RFbRWcgsqepwAl+GE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxyNB6WfnUzVC5KMReQyV13N89CyGzKAOmwjjPtCJGcIkPtKiFRPRy49X5xn1fd1qpwyixD5lLwLKSvJGCA/z5A3QiArjpeukDf5/YLOoQ2mDUxbZx0UApz26Mxdp7lMLaZGh4R75hRqMbXDPIGLYG4dWJ+o3dTzEKhs3w4inRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M80dE7Yq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A997C4CEEB;
	Mon, 14 Apr 2025 15:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744645837;
	bh=r1m7JKkm48IkvWCjD/5V7wAI2RFbRWcgsqepwAl+GE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M80dE7Yq4F/VYMpMWIsVzkuDbqHZhgNgq9OwpJ8f3vJn/yy+V4I2E2F9nc3v3oM2U
	 FyldtmAZ7rJFJZ/7F0q8VYRW6L9D3ZP25vwLbUZCqr61v4M68tzHaldUVKOr0gi4C0
	 Ky0+V0Zh/mRSIbIIUyCUG8N9soNdevg1awmW1xbFLb2/hcaTjHKi0zmDL01z12cqfN
	 88L4PNFDWeyFBWlIF0q3rqZn1XRzzvkmia0G+WJ80oz+NJ9IL8D1GFoqiVjdUJp3gn
	 Ucu7ObEkyY47hCeN1/qRiPGlkunDQzONS6ZN8Jf/YRxwQl4FbhW6r3EtGOPF0zyTxe
	 H3FrIG13uM0YA==
Date: Mon, 14 Apr 2025 17:50:26 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: syzbot <syzbot+c2537ce72a879a38113e@syzkaller.appspotmail.com>,
	riel@surriel.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
	sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de, x86@kernel.org
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING in
 switch_mm_irqs_off
Message-ID: <Z_0uwvnbusKR2WqC@gmail.com>
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


* Ingo Molnar <mingo@kernel.org> wrote:

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

Ie. something like the patch below - but I might be missing something 
here ...

Thanks,

	Ingo

=================>
 arch/x86/mm/tlb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 0ebbaab55b0a..d36d370042e2 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1032,9 +1032,6 @@ void unuse_temporary_mm(struct mm_struct *prev_mm)
 {
 	lockdep_assert_preemption_disabled();
 
-	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
-	cpumask_clear_cpu(smp_processor_id(), mm_cpumask(this_cpu_read(cpu_tlbstate.loaded_mm)));
-
 	switch_mm_irqs_off(NULL, prev_mm, current);
 
 	/*

