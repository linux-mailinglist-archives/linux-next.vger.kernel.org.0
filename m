Return-Path: <linux-next+bounces-6226-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25635A8869A
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 17:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B960F16DA73
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 15:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521432522B8;
	Mon, 14 Apr 2025 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2+pk2CC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6A1F3D54;
	Mon, 14 Apr 2025 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643410; cv=none; b=LPIXeX8fbF/XlfK0t7Srt230vzMXegeKkUmmYirBe98Ed/zXcQWCdidkHtJdMFP+oOogisika6b8aO2CsOXD4Ty4j7JUGlOcKhqaggypof6bFIWmZjAEKXMgrTdcBtDEbFx8V+XMU1ycix//AHm/EvrLiYxD4hESw8u62JbP+8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643410; c=relaxed/simple;
	bh=qSiKrGMiJDaDDXBJBhkiBIPOZWCKcsrgk7W1G9JlKf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9rzbB3As+AsXys4gIoOg8ghHsOsyaz+is1deZEERHPrpur3D/Dsc872o1Ftodzc0ouNGL9G7CJYg5NvvTDzGc+Eeqy2qPYdierGaYbRsNQ5SplP8e+CpKcQ3UpQr5hVhlwLNjoa2y0XNdjNtE098Rd4rFro5upmDkkbriEXRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2+pk2CC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E2AC4CEE9;
	Mon, 14 Apr 2025 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744643409;
	bh=qSiKrGMiJDaDDXBJBhkiBIPOZWCKcsrgk7W1G9JlKf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2+pk2CCPEX2GAUEUnqJ4Cwk+KFvqFtENK5Oh24m6fqgPS3LZ/9Y2TsMbQw3ZzrAp
	 izTQ3VUiCxufEWKFM026EnhyW6MwYyb6PZLa8DSbyiluOOBDQz/mBPK2lZmrkfuvSC
	 JO3aif+VlZ/Ko6In0GGeZIlKJxStGZvx/b22qeN0jp3V6EydrkwKnOGacz41xb2377
	 1bq5/3XkQc7dbfNUQCW3AAwGlzw80a/swIIbiFR2WMIbko633paAq7uXjBduZg0Lw6
	 cPjDrn6Vstjx31U0xkSW5su/DJXm/A3Gm0Q/25M43pz/vuRZ0UqJzLepr57uU+wAZy
	 Uw05cthWpsu5Q==
Date: Mon, 14 Apr 2025 17:10:03 +0200
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
Message-ID: <Z_0lSxPcw4WW1wAP@gmail.com>
References: <67fce34b.050a0220.3483fc.0026.GAE@google.com>
 <20250414135629.GA17910@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414135629.GA17910@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> > Call Trace:
> >  <TASK>
> >  unuse_temporary_mm+0x9f/0x100 arch/x86/mm/tlb.c:1038
> >  __text_poke+0x7b6/0xb40 arch/x86/kernel/alternative.c:2214
> >  text_poke arch/x86/kernel/alternative.c:2257 [inline]
> >  smp_text_poke_batch_finish+0x3e7/0x12c0 arch/x86/kernel/alternative.c:2565
> >  arch_jump_label_transform_apply+0x1c/0x30 arch/x86/kernel/jump_label.c:146
> >  static_key_disable_cpuslocked+0xd2/0x1c0 kernel/jump_label.c:240
> >  static_key_disable+0x1a/0x20 kernel/jump_label.c:248
> >  once_deferred+0x70/0xb0 lib/once.c:20
> >  process_one_work kernel/workqueue.c:3238 [inline]
> >  process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
> >  worker_thread+0x870/0xd50 kernel/workqueue.c:3400
> >  kthread+0x7b7/0x940 kernel/kthread.c:464
> >  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >  </TASK>
> 
> So I can reproduce, and I I think I see what happens, except I'm
> confused as to why the recently merged patches show this.
> 
> AFAIU what happens is that unuse_temporary_mm() clears the 
> mm_cpumask() for the current CPU, while switch_mm_irqs_off() then 
> checks that the mm_cpumask() bit is set for the current CPU.
> 
> This behaviour hasn't really changed since 209954cbc7d0 ("x86/mm/tlb: 
> Update mm_cpumask lazily") introduced both.
> 
> I'm not entirely sure what the best way forward is.. we can simply 
> delete the warning, or make use_temporary_mm() tag the special MMs 
> somehow and exclude them from the warning.

So, mm_cpumask is basically tracking on which CPUs the MM ran on, and 
this gets cleared lazily whenever there's an opportune time, but not 
during context switches (for shared cacheline performance reasons), 
right?

So why do we need to clear the mm_cpumask in unuse_temporary_mm() to 
begin with:

	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
        cpumask_clear_cpu(smp_processor_id(), mm_cpumask(this_cpu_read(cpu_tlbstate.loaded_mm)));

What TLB flushing are we worried about here? Nothing much should 
trigger any TLB flushing for text_poke_mm AFAICS?

Thanks,

	Ingo

