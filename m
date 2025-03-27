Return-Path: <linux-next+bounces-6045-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D4A73453
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 15:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C948A179426
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 14:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690D7217707;
	Thu, 27 Mar 2025 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cV48Wgj/"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE821422C;
	Thu, 27 Mar 2025 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085510; cv=none; b=lM0jsy+N5uIgOxbMZiEA3Ac5/32/glNb2Qp80ZwUFEr0ebcdNDBclx6jKiVZkXxgojrqGIEC+/n5Xcq7uKU4gyBn/CFGDRLcv11Pkqm3vT1uEQMvNIi/YPzsK+NIXcUqC2iygP/Azy32u/RReax70yoNIoJmvMVmMHeHh8tLvTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085510; c=relaxed/simple;
	bh=gFCavKiTyxczZO2epOKJR57B8snAmsxfV0Lqi+6JKyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiCEbPJO9dd5pIVLmFt8DMw9WdpP99H5YHUsuNSsYJOzFrRlx5OnajLv5b9nDISc2cSDSHAr+jedjMJPZ44fskZgxl9E5Eoc2bpc99FQ7BJ5fmI5Ow4Z0Bbzrhw+TbLmp1Z2L7fZ4W7aAcXApWrEqh2CCEL7+xSGVK1v58UbnzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cV48Wgj/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743085509; x=1774621509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gFCavKiTyxczZO2epOKJR57B8snAmsxfV0Lqi+6JKyc=;
  b=cV48Wgj/B9HccoqYXvQzzrlg5YkQICSRsCYzdOD3cFGmvq4V+W5Dj2hd
   SjjaFhlTmTQEMeg4v+qNI6GZPWH2tEtu652PCmlP5DDIdZfgC43HDoxtd
   3nrjwRH2XjLqA7UDR64wwf2PCfahJOSclvScXz/QonY9JskLiMIcqlfKX
   VuJA5SvRkAeUBIbY/LsjfKDNPkKKKfHE04arUWoxlQtpTuTmGJ1DLCmiF
   t+HVl2NMsHcyGdKvUtjOgAYSji+m+kpnHvGT/K2mghLGyZ/PlvPYKPDir
   RxvJha9yNLkhowpBFn0DaQjTDNUoqZQoSQ870nsRmPt46gaNQ+tK8R32g
   w==;
X-CSE-ConnectionGUID: LORaX9o3RHCudwhTlBaXlA==
X-CSE-MsgGUID: VsDpGeUBQqK3NFto0F/6IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54620837"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="54620837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 07:25:08 -0700
X-CSE-ConnectionGUID: Ta6IpfHJR7KdWFUlLEK6iQ==
X-CSE-MsgGUID: nXQoAvlCT5iTHuSukzzkqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125972773"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2025 07:25:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 7323F1D9; Thu, 27 Mar 2025 16:25:04 +0200 (EET)
Date: Thu, 27 Mar 2025 16:25:04 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Aithal, Srikanth" <sraithal@amd.com>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
Message-ID: <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
 <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
 <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>

On Thu, Mar 27, 2025 at 02:58:12PM +0200, Kirill A. Shutemov wrote:
> On Wed, Mar 26, 2025 at 05:30:35PM -0500, Tom Lendacky wrote:
> > On 3/25/25 08:33, Kirill A. Shutemov wrote:
> > > On Tue, Mar 25, 2025 at 02:40:00PM +0530, Aithal, Srikanth wrote:
> > >> Hello,
> > >>
> > >>
> > >> Starting linux-next build next-20250312, including recent build 20250324, we
> > >> are seeing an issue where the SNP guest boot hangs at the "boot smp config"
> > >> step:
> > >>
> > >>
> > >>  [ 2.294722] smp: Bringing up secondary CPUs ...
> > >> [    2.295211] smpboot: Parallel CPU startup disabled by the platform
> > >> [    2.309687] smpboot: x86: Booting SMP configuration:
> > >> [    2.310214] .... node  #0, CPUs:          #1   #2   #3   #4 #5   #6  
> > >> #7   #8   #9  #10  #11  #12  #13  #14  #15  #16  #17 #18  #19  #20  #21 
> > >> #22  #23  #24  #25  #26  #27  #28  #29  #30 #31  #32  #33  #34  #35  #36 
> > >> #37  #38  #39  #40  #41  #42  #43 #44  #45  #46  #47  #48  #49  #50  #51 
> > >> #52  #53  #54  #55  #56 #57  #58  #59  #60  #61  #62  #63  #64  #65  #66 
> > >> #67  #68  #69 #70  #71  #72  #73  #74  #75  #76  #77  #78  #79  #80  #81 
> > >> #82 #83  #84  #85  #86  #87  #88  #89  #90  #91  #92  #93  #94  #95 #96 
> > >> #97  #98  #99 #100 #101 #102 #103 #104 #105 #106 #107 #108 #109 #110 #111
> > >> #112 #113 #114 #115 #116 #117 #118 #119 #120 #121 #122 #123 #124 #125 #126
> > >> #127 #128 #129 #130 #131 #132 #133 #134 #135 #136 #137 #138 #139 #140 #141
> > >> #142 #143 #144 #145 #146 #147 #148 #149 #150 #151 #152 #153 #154 #155 #156
> > >> #157 #158 #159 #160 #161 #162 #163 #164 #165 #166 #167 #168 #169 #170 #171
> > >> #172 #173 #174 #175 #176 #177 #178 #179 #180 #181 #182 #183 #184 #185 #186
> > >> #187 #188 #189 #190 #191 #192 #193 #194 #195 #196 #197 #198
> > >> --> The guest hangs forever at this point.
> > >>
> > >>
> > >> I have observed that certain vCPU and memory combinations work, while others
> > >> do not. The VM configuration I am using does not have any NUMA nodes.
> > >>
> > >> vcpus             Mem        SNP guest boot
> > >> <=240            19456M    Boots fine
> > >>> =241,<255   19456M    Hangs
> > >> 1-255              2048M    Boots fine
> > >> 1-255              4096M    Boots fine
> > >>> 71                 8192M    Hangs
> > >>> 41                 6144M    Hangs
> > >>
> > >> When I bisected this issue, it pointed to the following commit :
> > >>
> > >>
> > >> *commit 800f1059c99e2b39899bdc67a7593a7bea6375d8*
> > >> Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > >> Date:   Mon Mar 10 10:28:55 2025 +0200
> > >>
> > >>     mm/page_alloc: fix memory accept before watermarks gets initialized
> > > 
> > > Hm. It is puzzling for me. I don't see how this commit can cause the hang.
> > > 
> > > Could you track down where hang happens?
> > 
> > Let me say that the guest config is key for this. Using that config, I
> > think you might be able to repro this on TDX. The config does turn off TDX
> > support, so I'm hoping that turning it on doesn't change anything.
> > 
> > I've been able to track it down slightly... It is happening during the CPU
> > bringup trace points and it eventually gets to line 2273 in
> > rb_allocate_cpu_buffer() and never comes back from an alloc_pages_node()
> > call. That's as far as I've gotten so far. I'm not a mm expert so not sure
> > if I'll be able to progress much further.
> 
> Urgh... It is deadlock on cpu_hotplug_lock :/
> 
> _cpu_up() takes the lock on write and starts CPU bring up under it.
> If during CPU bringup we accept the last page in the zone, __accept_page()
> calls static_branch_dec() which takes the lock again.
> 
> Oopsie.
> 
> So the patch itself doesn't introduce a regression, but uncovers
> preexisting deadlock. With the patch we accept more pages during the boot
> and it triggers the deadlock.
> 
> Let me think about the fix.

+ Static branch maintainers

The only option I see so far is to drop static branch from this path.

But I am not sure if it the only case were we use static branch from CPU
hotplug callbacks.

Any other ideas?

The deadlock I'm talking about:

============================================
WARNING: possible recursive locking detected
6.14.0-rc5+ #13 Tainted: G S
--------------------------------------------
swapper/0/1 is trying to acquire lock:
ffffffffbdc7e150 (cpu_hotplug_lock){++++}-{0:0}, at: static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336) 

but task is already holding lock:
ffffffffbdc7e150 (cpu_hotplug_lock){++++}-{0:0}, at: _cpu_up (./arch/x86/include/asm/bitops.h:227 ./arch/x86/include/asm/bitops.h:239 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 ./include/linux/cpumask.h:570 ./include/linux/cpumask.h:1131 kernel/cpu.c:1641) 

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(cpu_hotplug_lock);
  lock(cpu_hotplug_lock);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

2 locks held by swapper/0/1:
#0: ffffffffbdc7e058 (cpu_add_remove_lock){+.+.}-{4:4}, at: cpu_up (kernel/cpu.c:? kernel/cpu.c:1712) 
#1: ffffffffbdc7e150 (cpu_hotplug_lock){++++}-{0:0}, at: _cpu_up (./arch/x86/include/asm/bitops.h:227 ./arch/x86/include/asm/bitops.h:239 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 ./include/linux/cpumask.h:570 ./include/linux/cpumask.h:1131 kernel/cpu.c:1641) 

stack backtrace:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S                 6.14.0-rc5+ #13
Tainted: [S]=CPU_OUT_OF_SPEC
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 02/02/2022
Call Trace:
 <TASK>
dump_stack_lvl (lib/dump_stack.c:122) 
print_deadlock_bug (kernel/locking/lockdep.c:3041) 
__lock_acquire (kernel/locking/lockdep.c:? kernel/locking/lockdep.c:3893 kernel/locking/lockdep.c:5228) 
? asm_sysvec_apic_timer_interrupt (./arch/x86/include/asm/idtentry.h:702) 
? free_one_page (mm/page_alloc.c:?) 
? static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336) 
lock_acquire (kernel/locking/lockdep.c:5851) 
? static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336) 
cpus_read_lock (./include/linux/percpu-rwsem.h:51) 
? static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336) 
static_key_slow_dec (kernel/jump_label.c:321 kernel/jump_label.c:336) 
cond_accept_memory (mm/page_alloc.c:7024) 
get_page_from_freelist (./arch/x86/include/asm/bitops.h:206 ./arch/x86/include/asm/bitops.h:238 ./include/asm-generic/bitops/instrumented-non-atomic.h:142 mm/page_alloc.c:3417) 
? lock_release (kernel/locking/lockdep.c:469) 
__alloc_frozen_pages_noprof (mm/page_alloc.c:4740) 
__alloc_pages_noprof (mm/page_alloc.c:4774) 
rb_allocate_cpu_buffer (kernel/trace/ring_buffer.c:2235) 
? _raw_spin_unlock_irqrestore (./arch/x86/include/asm/irqflags.h:42 ./arch/x86/include/asm/irqflags.h:97 ./arch/x86/include/asm/irqflags.h:155 ./include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194) 
trace_rb_cpu_prepare (kernel/trace/ring_buffer.c:7322) 
cpuhp_invoke_callback (kernel/cpu.c:216) 
? __pfx_trace_rb_cpu_prepare (kernel/trace/ring_buffer.c:7297 kernel/trace/ring_buffer.c:7304) 
_cpu_up (kernel/cpu.c:967 kernel/cpu.c:990 kernel/cpu.c:1021 kernel/cpu.c:1691) 
cpu_up (kernel/cpu.c:473 kernel/cpu.c:1725) 
cpuhp_bringup_mask (kernel/cpu.c:1789) 
? kernel_init (init/main.c:1459) 
smp_init (./include/linux/bitmap.h:445 ./include/linux/nodemask.h:241 ./include/linux/nodemask.h:438 kernel/smp.c:1012) 
kernel_init_freeable (init/main.c:1561) 
? __pfx_kernel_init (init/main.c:1455) 
kernel_init (init/main.c:1459) 
ret_from_fork (arch/x86/kernel/process.c:148) 
? __pfx_kernel_init (init/main.c:1455) 
ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
 </TASK>
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

