Return-Path: <linux-next+bounces-4542-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A09B6FE1
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 23:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71DFF1C2100D
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 22:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F91B1D0F76;
	Wed, 30 Oct 2024 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ACFvFZQ9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B06A1925AE
	for <linux-next@vger.kernel.org>; Wed, 30 Oct 2024 22:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730327660; cv=none; b=cSu5vsVjjuX2VJSSpdm0nWXGjGbuSedKnVq67QeJw7hlGeDZbpVbkyNWnWldvkgFimgM6DvErq5Y8NawhjfW2SMb5xoHL4CbsVGzRO/CKG50GU11/wvCGqrZEcSDsT9CpVMdjOQcMbthz9e8hCVJIWSXtR6MRgfkKFBZt0H2OtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730327660; c=relaxed/simple;
	bh=XJkfmlNmNyiKNdso7eQQzn14nbdGf46/0jApNo7RLGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeEIW0dGLb4rnRX1WNVwZnrsGhcWhSQOf4nv2Xh9fMvkNmXgGayi5RNBx4yveuzXgY7zUeNQCgIqPQodQgl3PnrNN88NDHPix4ftoB3yw259l8w+9Yafoqk2hgxh5c9HMyRjRoWZ1e1oYBTnuF4GnemGUQ3QR8NELXyer7hVlmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ACFvFZQ9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315abed18aso2600785e9.2
        for <linux-next@vger.kernel.org>; Wed, 30 Oct 2024 15:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730327656; x=1730932456; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni3lKjy3PY8T0mBefZFxGJ1yDDh/2Xy0r8Ncbm02QOA=;
        b=ACFvFZQ99apX5bJNa/5Qcdvxh3fZxbbGkjmoTZE7M6Zi5bCUKg1QCmWwiaSeFpA18E
         Ls959AVTzDA268w/VVERznrunw3+CBez7tTmIS9N5XFiAAXcNfNbT7x4j9vyepXCN75c
         2jmpfpwkvz9FI89b7B9VpgNMI5gLomUqT9vdL4zbNCCgaX+bksiqysl2yRqTK3vBZMRR
         H2mBgxdb21N9g3DdSyQsLa1LxBwFGHB0GfbbcZwqL9ITSV/L7HPR1YYGr2KX6fCjZc2Q
         1uUKkFaKrUSWrovxwnL6sEdY/5Hg6anZ3+GU4+cT2stYv0jQxofCwKYlZQw5KE+vg3gv
         PhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730327656; x=1730932456;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ni3lKjy3PY8T0mBefZFxGJ1yDDh/2Xy0r8Ncbm02QOA=;
        b=lvMHjjp1IU5y9mlAML2GAGuAywp5onIzqUBfaHYKYmbTkCxW2WosnofBoNPCEdNZ6T
         lr6I+YljdrgPS3sKLczxXD/MGSwgxFkRLDoB4R9K9+Zevs5jxXYbXxIba52ijc1DBYuZ
         kqOWSYzC4ySD4DSGjhqprtiYuUzN1ZLm8a3N2AIHGyyMrvJZGXIs9Pz3GdnHJrjNU/UB
         g5W9A9h2B4GoW2iYKYPMVE15E0bt2M1lfXxj1dz9LvVpGwsTVir+2IKIxeWq15YhKlC/
         oIaSoOiNWrIOFng6w+FcdqN1s+OI8TKXi75897o/jllHkEyTISNCX9mr3fdJl/6o+6DJ
         hx1g==
X-Forwarded-Encrypted: i=1; AJvYcCWOp3DtEUrAmD9EsljKqi0pGsji/0mh7MO8Gua6uwLI1pwj0O4eHrgMzC4BU0GuF1grmv4hUubST8mF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8dw3ItBSkPHWTIUX9SFS3dvygLZI0X+6T9TN1VQZANmSFZVV9
	hgfQfdOZei+EEDjRq1OaQWb8vZwADle5PmqWQdp+r0Ch5fhZohl0LIf8JEl+8w==
X-Google-Smtp-Source: AGHT+IFmGsbAbkZzs0MbotIQ1EenBGrw3itupW8ZgVwCnUy7Fpt7cnZeTzVFA5Njzc0+8H3RJxO/QA==
X-Received: by 2002:a5d:494f:0:b0:37d:4846:3d29 with SMTP id ffacd0b85a97d-38061162e68mr11660878f8f.28.1730327656290;
        Wed, 30 Oct 2024 15:34:16 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:9c:201:ca43:df8b:ca42:54da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b75sm250245f8f.15.2024.10.30.15.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 15:34:14 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:34:08 +0100
From: Marco Elver <elver@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: paulmck@kernel.org, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, sfr@canb.auug.org.au, bigeasy@linutronix.de,
	longman@redhat.com, boqun.feng@gmail.com, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org
Subject: Re: [BUG] -next lockdep invalid wait context
Message-ID: <ZyK0YPgtWExT4deh@elver.google.com>
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
 <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Wed, Oct 30, 2024 at 10:48PM +0100, Vlastimil Babka wrote:
> On 10/30/24 22:05, Paul E. McKenney wrote:
> > Hello!
> 
> Hi!
> 
> > The next-20241030 release gets the splat shown below when running
> > scftorture in a preemptible kernel.  This bisects to this commit:
> > 
> > 560af5dc839e ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING")
> > 
> > Except that all this is doing is enabling lockdep to find the problem.
> > 
> > The obvious way to fix this is to make the kmem_cache structure's
> > cpu_slab field's ->lock be a raw spinlock, but this might not be what
> > we want for real-time response.
> 
> But it's a local_lock, not spinlock and it's doing local_lock_irqsave(). I'm
> confused what's happening here, the code has been like this for years now.
> 
> > This can be reproduced deterministically as follows:
> > 
> > tools/testing/selftests/rcutorture/bin/kvm.sh --torture scf --allcpus --duration 2 --configs PREEMPT --kconfig CONFIG_NR_CPUS=64 --memory 7G --trust-make --kasan --bootargs "scftorture.nthreads=64 torture.disable_onoff_at_boot csdlock_debug=1"
> > 
> > I doubt that the number of CPUs or amount of memory makes any difference,
> > but that is what I used.
> > 
> > Thoughts?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > [   35.659746] =============================
> > [   35.659746] [ BUG: Invalid wait context ]
> > [   35.659746] 6.12.0-rc5-next-20241029 #57233 Not tainted
> > [   35.659746] -----------------------------
> > [   35.659746] swapper/37/0 is trying to lock:
> > [   35.659746] ffff8881ff4bf2f0 (&c->lock){....}-{3:3}, at: put_cpu_partial+0x49/0x1b0
> > [   35.659746] other info that might help us debug this:
> > [   35.659746] context-{2:2}
> > [   35.659746] no locks held by swapper/37/0.
> > [   35.659746] stack backtrace:
> > [   35.659746] CPU: 37 UID: 0 PID: 0 Comm: swapper/37 Not tainted 6.12.0-rc5-next-20241029 #57233
> > [   35.659746] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
> > [   35.659746] Call Trace:
> > [   35.659746]  <IRQ>
> > [   35.659746]  dump_stack_lvl+0x68/0xa0
> > [   35.659746]  __lock_acquire+0x8fd/0x3b90
> > [   35.659746]  ? start_secondary+0x113/0x210
> > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > [   35.659746]  lock_acquire+0x19b/0x520
> > [   35.659746]  ? put_cpu_partial+0x49/0x1b0
> > [   35.659746]  ? __pfx_lock_acquire+0x10/0x10
> > [   35.659746]  ? __pfx_lock_release+0x10/0x10
> > [   35.659746]  ? lock_release+0x20f/0x6f0
> > [   35.659746]  ? __pfx_lock_release+0x10/0x10
> > [   35.659746]  ? lock_release+0x20f/0x6f0
> > [   35.659746]  ? kasan_save_track+0x14/0x30
> > [   35.659746]  put_cpu_partial+0x52/0x1b0
> > [   35.659746]  ? put_cpu_partial+0x49/0x1b0
> > [   35.659746]  ? __pfx_scf_handler_1+0x10/0x10
> > [   35.659746]  __flush_smp_call_function_queue+0x2d2/0x600
> 
> How did we even get to put_cpu_partial directly from flushing smp calls?
> SLUB doesn't use them, it uses queue_work_on)_ for flushing and that
> flushing doesn't involve put_cpu_partial() AFAIK.
> 
> I think only slab allocation or free can lead to put_cpu_partial() that
> would mean the backtrace is missing something. And that somebody does a slab
> alloc/free from a smp callback, which I'd then assume isn't allowed?

Tail-call optimization is hiding the caller. Compiling with
-fno-optimize-sibling-calls exposes the caller. This gives the full
picture:

[   40.321505] =============================
[   40.322711] [ BUG: Invalid wait context ]
[   40.323927] 6.12.0-rc5-next-20241030-dirty #4 Not tainted
[   40.325502] -----------------------------
[   40.326653] cpuhp/47/253 is trying to lock:
[   40.327869] ffff8881ff9bf2f0 (&c->lock){....}-{3:3}, at: put_cpu_partial+0x48/0x1a0
[   40.330081] other info that might help us debug this:
[   40.331540] context-{2:2}
[   40.332305] 3 locks held by cpuhp/47/253:
[   40.333468]  #0: ffffffffae6e6910 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0xe0/0x590
[   40.336048]  #1: ffffffffae6e9060 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0xe0/0x590
[   40.338607]  #2: ffff8881002a6948 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_remove_by_name_ns+0x78/0x100
[   40.341454] stack backtrace:
[   40.342291] CPU: 47 UID: 0 PID: 253 Comm: cpuhp/47 Not tainted 6.12.0-rc5-next-20241030-dirty #4
[   40.344807] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   40.347482] Call Trace:
[   40.348199]  <IRQ>
[   40.348827]  dump_stack_lvl+0x6b/0xa0
[   40.349899]  dump_stack+0x10/0x20
[   40.350850]  __lock_acquire+0x900/0x4010
[   40.360290]  lock_acquire+0x191/0x4f0
[   40.364850]  put_cpu_partial+0x51/0x1a0
[   40.368341]  scf_handler+0x1bd/0x290
[   40.370590]  scf_handler_1+0x4e/0xb0
[   40.371630]  __flush_smp_call_function_queue+0x2dd/0x600
[   40.373142]  generic_smp_call_function_single_interrupt+0xe/0x20
[   40.374801]  __sysvec_call_function_single+0x50/0x280
[   40.376214]  sysvec_call_function_single+0x6c/0x80
[   40.377543]  </IRQ>
[   40.378142]  <TASK>

And scf_handler does indeed tail-call kfree:

	static void scf_handler(void *scfc_in)
	{
	[...]
		} else {
			kfree(scfcp);
		}
	}

