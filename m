Return-Path: <linux-next+bounces-4540-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F29B6E5B
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 22:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FF8281EDB
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 21:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947301EF940;
	Wed, 30 Oct 2024 21:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dtz6TJ3k"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C24314F90;
	Wed, 30 Oct 2024 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322328; cv=none; b=AsraBxcANmdgTL3knQudEzr3Sipx7rnBz8ERJJhdEErtSTL/nZ7f4VyAv9Vb/N99VaUno5yXdyfdhH5ui5TD/bGZKT0WrUYc3Cs+stLUvddOVjOTYsOFdC9dzoIS6aUEmPGqNZLdVrMYhwDQdEFDN27O/x9iUpFCCC2vJ21IDPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322328; c=relaxed/simple;
	bh=ypfxW/NOsBShw1OGtEN1J0mz1RYRrV8CLlKTh75EDoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SXz1hJSV/3TtC7FCMS+ZaZIezg1OrTlpVhEFWAmHYVt6/uJl1bjsJhYyIeU1QW2yKXxh8Pu/YhjnNYBzcDu6tTazPq1ZQQwLFiVwfNzEdEMaDteB6FHXP/eDJ1v7Llr4NkbaJDObTOBLrdNeIoKLrNj3Ahvj/VjYIEx+ftjE4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dtz6TJ3k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A13C4CECE;
	Wed, 30 Oct 2024 21:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730322325;
	bh=ypfxW/NOsBShw1OGtEN1J0mz1RYRrV8CLlKTh75EDoI=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=Dtz6TJ3kEnFviiF8o/yP9LQhrtWccymKMICMU0ILeg7O5JfkMxwUFRxNUiClxpyYO
	 MjudHVFGL52YBW+Mjcgc27f+g15JhypkEeSW7fci2SfNQQEfbY+7PLYc4HC1DuNEEO
	 //ot8T2WlYeD0gUuTbVAgNN3wS3N3JNYHt5YglQp6lYuFKXNMWE3FijnvTtN/fUxBP
	 2shjmUoJyOmVzTjB1Xw/KbEOIuwzEsgwGEp+MASCOChd3TIxi2Fq+r3LJrPSMy4U6b
	 urdWDR8bhenx36QMfgjj21I8D6HkAtZbj1WONFUxBhusw/3aTjJ11QoIjuqHL7EVmf
	 SuZxbm4aoc1yA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 84629CE0BB3; Wed, 30 Oct 2024 14:05:24 -0700 (PDT)
Date: Wed, 30 Oct 2024 14:05:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org
Cc: sfr@canb.auug.org.au, bigeasy@linutronix.de, longman@redhat.com,
	boqun.feng@gmail.com, elver@google.com, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org, vbabka@suse.cz
Subject: [BUG] -next lockdep invalid wait context
Message-ID: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

The next-20241030 release gets the splat shown below when running
scftorture in a preemptible kernel.  This bisects to this commit:

560af5dc839e ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING")

Except that all this is doing is enabling lockdep to find the problem.

The obvious way to fix this is to make the kmem_cache structure's
cpu_slab field's ->lock be a raw spinlock, but this might not be what
we want for real-time response.

This can be reproduced deterministically as follows:

tools/testing/selftests/rcutorture/bin/kvm.sh --torture scf --allcpus --duration 2 --configs PREEMPT --kconfig CONFIG_NR_CPUS=64 --memory 7G --trust-make --kasan --bootargs "scftorture.nthreads=64 torture.disable_onoff_at_boot csdlock_debug=1"

I doubt that the number of CPUs or amount of memory makes any difference,
but that is what I used.

Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

[   35.659746] =============================
[   35.659746] [ BUG: Invalid wait context ]
[   35.659746] 6.12.0-rc5-next-20241029 #57233 Not tainted
[   35.659746] -----------------------------
[   35.659746] swapper/37/0 is trying to lock:
[   35.659746] ffff8881ff4bf2f0 (&c->lock){....}-{3:3}, at: put_cpu_partial+0x49/0x1b0
[   35.659746] other info that might help us debug this:
[   35.659746] context-{2:2}
[   35.659746] no locks held by swapper/37/0.
[   35.659746] stack backtrace:
[   35.659746] CPU: 37 UID: 0 PID: 0 Comm: swapper/37 Not tainted 6.12.0-rc5-next-20241029 #57233
[   35.659746] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[   35.659746] Call Trace:
[   35.659746]  <IRQ>
[   35.659746]  dump_stack_lvl+0x68/0xa0
[   35.659746]  __lock_acquire+0x8fd/0x3b90
[   35.659746]  ? start_secondary+0x113/0x210
[   35.659746]  ? __pfx___lock_acquire+0x10/0x10
[   35.659746]  ? __pfx___lock_acquire+0x10/0x10
[   35.659746]  ? __pfx___lock_acquire+0x10/0x10
[   35.659746]  ? __pfx___lock_acquire+0x10/0x10
[   35.659746]  lock_acquire+0x19b/0x520
[   35.659746]  ? put_cpu_partial+0x49/0x1b0
[   35.659746]  ? __pfx_lock_acquire+0x10/0x10
[   35.659746]  ? __pfx_lock_release+0x10/0x10
[   35.659746]  ? lock_release+0x20f/0x6f0
[   35.659746]  ? __pfx_lock_release+0x10/0x10
[   35.659746]  ? lock_release+0x20f/0x6f0
[   35.659746]  ? kasan_save_track+0x14/0x30
[   35.659746]  put_cpu_partial+0x52/0x1b0
[   35.659746]  ? put_cpu_partial+0x49/0x1b0
[   35.659746]  ? __pfx_scf_handler_1+0x10/0x10
[   35.659746]  __flush_smp_call_function_queue+0x2d2/0x600
[   35.659746]  __sysvec_call_function_single+0x50/0x280
[   35.659746]  sysvec_call_function_single+0x6b/0x80
[   35.659746]  </IRQ>
[   35.659746]  <TASK>
[   35.659746]  asm_sysvec_call_function_single+0x1a/0x20
[   35.659746] RIP: 0010:default_idle+0xf/0x20
[   35.659746] Code: 4c 01 c7 4c 29 c2 e9 72 ff ff ff 90 90 90 90 90 90 90 90 90
 90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d 33 80 3e 00 fb f4 <fa> c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90
[   35.659746] RSP: 0018:ffff888100a9fe68 EFLAGS: 00000202
[   35.659746] RAX: 0000000000040d75 RBX: 0000000000000025 RCX: ffffffffab83df45
[   35.659746] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffa8a5f7ba
[   35.659746] RBP: dffffc0000000000 R08: 0000000000000001 R09: ffffed103fe96c3c
[   35.659746] R10: ffff8881ff4b61e3 R11: 0000000000000000 R12: ffffffffad13f1d0
[   35.659746] R13: 1ffff11020153fd2 R14: 0000000000000000 R15: 0000000000000000
[   35.659746]  ? ct_kernel_exit.constprop.0+0xc5/0xf0
[   35.659746]  ? do_idle+0x2fa/0x3b0
[   35.659746]  default_idle_call+0x6d/0xb0
[   35.659746]  do_idle+0x2fa/0x3b0
[   35.659746]  ? __pfx_do_idle+0x10/0x10
[   35.659746]  cpu_startup_entry+0x4f/0x60
[   35.659746]  start_secondary+0x1bc/0x210
[   35.659746]  common_startup_64+0x12c/0x138
[   35.659746]  </TASK>

