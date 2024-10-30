Return-Path: <linux-next+bounces-4543-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558D99B703A
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 00:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13CF328120B
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 23:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495A61C461C;
	Wed, 30 Oct 2024 23:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7/0uMgG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DEE1BD9DF;
	Wed, 30 Oct 2024 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730329471; cv=none; b=mMDhZ8EtNPEJnUFet1KICvTWwmgJrIQgRYStwP2FF7BIgZRNFj3rVkylIviw6wHDTBQwONDsCA7g9Ig1TdqVGTVo8U6fBOLbyiBUEL9GEyNZsp8FgRa77crcSPnNZOi+q9FDxUkV5SjjLNioXqsseiB2Gtgs7Kzy0vex6YuEgxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730329471; c=relaxed/simple;
	bh=Ec4D5SyBdaBhg+W6wXsrh9nu22khEYqGIQhe+ODvsks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mw2h7fMOELVQogpHgPkr0frZpEsENMCa/Ktgu7/3AEpnob7jqRhogDeYtRSTJ7SzKpFcwpuSFrHG3Lhk2/Td3/hQg/ZcsQJIeSskxV7KNdotCDNVpLLqPm0MMWxo4hcJQAiOw94Hkqr5WkLbIFkeWHVZq/CI3HQIEiVuOuGG7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7/0uMgG; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4611abb6bd5so2618911cf.1;
        Wed, 30 Oct 2024 16:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730329468; x=1730934268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLJJBAKyQj+SNUNmxz2AeNTsEKRK6TwiIX+0O6pGNdQ=;
        b=l7/0uMgGhfsM/sdsI16tTA72CUkvAhvKgPrZE2zp/8y44vr0MEJ1TPM9X0lASO3mib
         KQPdeeZ5+XjVLXkqlZ/Gl+yEzIhFCmH3L0a16IHefazeI7BJ7pK6EBwTS3FljgmD7NKY
         PzkacNugcA3xpJSSJxJAXxZx1mX5p3mLnc/4WBva/T0naDfu1P7Y1ax4EBlWSQ9NgktO
         9si2CdGnO5US8jYkCSuQcRCJA5MXU3kkGtSow/ogjn1NHhWD1bhx1cG/Xpf6G3dduu4z
         AfjxacszyJdxLcSfIreB1vA41j/bJnoSkA2gHT130sUCkHYXStbEfqv0gevV8RQ6jceI
         Xo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730329468; x=1730934268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLJJBAKyQj+SNUNmxz2AeNTsEKRK6TwiIX+0O6pGNdQ=;
        b=F9EL/fTeq2wf7975Jb7FAbaWbVh8SIF1jLZaSIkLIMsGbABN1b4XjH3Q11Hg+zMdPH
         YXwVXqBo/yPmJDVgZfQHP5W8rsnGMI3AGjdFus9E8RyqtzqFtzCwiOmb9FCnHkr+5P0X
         C5BErKyx6lyiFwzoUFZpdmi8nWM0bBpsBULjqYrlS6gmJiH2l7RinYSPD4/jCU6T+5IF
         67t0S5IKRtgOJEePJ3o2NrBZJZDDPUSHKg5sJegtlFVGV/0YYuyhu+RZxCf16m6/K1se
         ba5cZMD+hIqFgqKxdefUKnSBCzniX/AzAyws7Q7C7NDUEMSqJMNLJcNtis9xbcqhz43G
         omgA==
X-Forwarded-Encrypted: i=1; AJvYcCVSd/ZdXR9gfWfJM0x+OF6YTxgLOKInYi92Kv+d0uf0c18q2JXABy197Kk5EAaqzKiq+RwaMUruPhrr3x8=@vger.kernel.org, AJvYcCXU3Mu9/ApjjQUbi0MWNeSY5ZSkiQmHI8rcAndfFTwYzCIH77kpNgle0YtDWkwkAGYp241ZDjTeT8V56w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOoegXuelpaPGu6BaRUUPgdBYAd8CGK6uZfJhCS78/6sxtgil
	NaGXPe0ng+E0nRnasBdwXQbp02vGq3bDxf9xjOCzLCXmeu87WjTF
X-Google-Smtp-Source: AGHT+IFMAcf+dFBcoD7SGdRauKrebHUvmAG2ECPiTluSnfadQE+H/b/qksVg722bKVaJXipBpbHcLw==
X-Received: by 2002:a05:622a:58e:b0:461:148b:1884 with SMTP id d75a77b69052e-4613bfd0547mr250096891cf.11.1730329467740;
        Wed, 30 Oct 2024 16:04:27 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad19b328sm1220441cf.85.2024.10.30.16.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 16:04:27 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 72ED31200066;
	Wed, 30 Oct 2024 19:04:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 30 Oct 2024 19:04:26 -0400
X-ME-Sender: <xms:ersiZx38nY2ghCYzRWWqgHa3CxJ8ukzFhWb1D2-I3W9RVVnspMWbTA>
    <xme:ersiZ4GCeBW-Vulbkr8qDM4UuWiVjCkdHBJgw-YzMszDOxocMSwKSjbIGM4CeEbqe
    H4eTna0cpq3SrGjwQ>
X-ME-Received: <xmr:ersiZx7P240Dmw5DHoWeDSgttVlOUid3ijnFMigJvHgOZEtIaJqieE4bzM0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeevgfejgfevfeevteegffdvhedtgfekvefgledv
    teffgeffveeiuedvieethfdugeenucffohhmrghinhepqhgvmhhurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvg
    hlvhgvrhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdr
    tgiipdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epkhgrshgrnhdquggvvhesghhoohhglhgvghhrohhuphhsrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtohepshhfrhestggrnhgsrd
    gruhhughdrohhrghdrrghupdhrtghpthhtohepsghighgvrghshieslhhinhhuthhrohhn
    ihigrdguvg
X-ME-Proxy: <xmx:ersiZ-2PNxt_8g4rxZhOfvGOkxDK_WrYHRcmNR_UcN51kjb6QqwqfQ>
    <xmx:ersiZ0H6tvJbvOp1Yq0VQ58WZoMXNeRa8YXDYiiDy1xBICrXxzWIkg>
    <xmx:ersiZ_-PkU9APVb4QIEFu-fjasOuj7NDUjW8bHId8-blUvHHtXUIAw>
    <xmx:ersiZxn7CvyI9URkKz8eoySlJ3n1HKFwvXMaND_xGj2HdiVA7_HLpg>
    <xmx:ersiZ4EsAmAZcD4QUT5YWF0wJIVnUb3L4DRyUgVUBYXId3xVFlLfY0hZ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Oct 2024 19:04:25 -0400 (EDT)
Date: Wed, 30 Oct 2024 16:04:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, paulmck@kernel.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	sfr@canb.auug.org.au, bigeasy@linutronix.de, longman@redhat.com,
	cl@linux.com, penberg@kernel.org, rientjes@google.com,
	iamjoonsoo.kim@lge.com, akpm@linux-foundation.org
Subject: Re: [BUG] -next lockdep invalid wait context
Message-ID: <ZyK7eGSWfEYzio_u@Boquns-Mac-mini.local>
References: <41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop>
 <e06d69c9-f067-45c6-b604-fd340c3bd612@suse.cz>
 <ZyK0YPgtWExT4deh@elver.google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyK0YPgtWExT4deh@elver.google.com>

On Wed, Oct 30, 2024 at 11:34:08PM +0100, Marco Elver wrote:
> On Wed, Oct 30, 2024 at 10:48PM +0100, Vlastimil Babka wrote:
> > On 10/30/24 22:05, Paul E. McKenney wrote:
> > > Hello!
> > 
> > Hi!
> > 
> > > The next-20241030 release gets the splat shown below when running
> > > scftorture in a preemptible kernel.  This bisects to this commit:
> > > 
> > > 560af5dc839e ("lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING")
> > > 
> > > Except that all this is doing is enabling lockdep to find the problem.
> > > 
> > > The obvious way to fix this is to make the kmem_cache structure's
> > > cpu_slab field's ->lock be a raw spinlock, but this might not be what
> > > we want for real-time response.
> > 
> > But it's a local_lock, not spinlock and it's doing local_lock_irqsave(). I'm
> > confused what's happening here, the code has been like this for years now.
> > 
> > > This can be reproduced deterministically as follows:
> > > 
> > > tools/testing/selftests/rcutorture/bin/kvm.sh --torture scf --allcpus --duration 2 --configs PREEMPT --kconfig CONFIG_NR_CPUS=64 --memory 7G --trust-make --kasan --bootargs "scftorture.nthreads=64 torture.disable_onoff_at_boot csdlock_debug=1"
> > > 
> > > I doubt that the number of CPUs or amount of memory makes any difference,
> > > but that is what I used.
> > > 
> > > Thoughts?
> > > 
> > > 							Thanx, Paul
> > > 
> > > ------------------------------------------------------------------------
> > > 
> > > [   35.659746] =============================
> > > [   35.659746] [ BUG: Invalid wait context ]
> > > [   35.659746] 6.12.0-rc5-next-20241029 #57233 Not tainted
> > > [   35.659746] -----------------------------
> > > [   35.659746] swapper/37/0 is trying to lock:
> > > [   35.659746] ffff8881ff4bf2f0 (&c->lock){....}-{3:3}, at: put_cpu_partial+0x49/0x1b0
> > > [   35.659746] other info that might help us debug this:
> > > [   35.659746] context-{2:2}
> > > [   35.659746] no locks held by swapper/37/0.
> > > [   35.659746] stack backtrace:
> > > [   35.659746] CPU: 37 UID: 0 PID: 0 Comm: swapper/37 Not tainted 6.12.0-rc5-next-20241029 #57233
> > > [   35.659746] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
> > > [   35.659746] Call Trace:
> > > [   35.659746]  <IRQ>
> > > [   35.659746]  dump_stack_lvl+0x68/0xa0
> > > [   35.659746]  __lock_acquire+0x8fd/0x3b90
> > > [   35.659746]  ? start_secondary+0x113/0x210
> > > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > > [   35.659746]  ? __pfx___lock_acquire+0x10/0x10
> > > [   35.659746]  lock_acquire+0x19b/0x520
> > > [   35.659746]  ? put_cpu_partial+0x49/0x1b0
> > > [   35.659746]  ? __pfx_lock_acquire+0x10/0x10
> > > [   35.659746]  ? __pfx_lock_release+0x10/0x10
> > > [   35.659746]  ? lock_release+0x20f/0x6f0
> > > [   35.659746]  ? __pfx_lock_release+0x10/0x10
> > > [   35.659746]  ? lock_release+0x20f/0x6f0
> > > [   35.659746]  ? kasan_save_track+0x14/0x30
> > > [   35.659746]  put_cpu_partial+0x52/0x1b0
> > > [   35.659746]  ? put_cpu_partial+0x49/0x1b0
> > > [   35.659746]  ? __pfx_scf_handler_1+0x10/0x10
> > > [   35.659746]  __flush_smp_call_function_queue+0x2d2/0x600
> > 
> > How did we even get to put_cpu_partial directly from flushing smp calls?
> > SLUB doesn't use them, it uses queue_work_on)_ for flushing and that
> > flushing doesn't involve put_cpu_partial() AFAIK.
> > 
> > I think only slab allocation or free can lead to put_cpu_partial() that
> > would mean the backtrace is missing something. And that somebody does a slab
> > alloc/free from a smp callback, which I'd then assume isn't allowed?
> 

I think in this particular case, it is queuing a callback for
smp_call_function_single() which doesn't have an interrupt handle
thread AKAICT, that means the callback will be executed in non-threaded
hardirq context, and that makes locks must be taken with real interrupt
disabled.

Using irq_work might be fine, because it has a handler thread (but the
torture is for s(mp) c(all) f(unction), so replacing with irq_work is
not really fixing it ;-)).

Regards,
Boqun

> Tail-call optimization is hiding the caller. Compiling with
> -fno-optimize-sibling-calls exposes the caller. This gives the full
> picture:
> 
> [   40.321505] =============================
> [   40.322711] [ BUG: Invalid wait context ]
> [   40.323927] 6.12.0-rc5-next-20241030-dirty #4 Not tainted
> [   40.325502] -----------------------------
> [   40.326653] cpuhp/47/253 is trying to lock:
> [   40.327869] ffff8881ff9bf2f0 (&c->lock){....}-{3:3}, at: put_cpu_partial+0x48/0x1a0
> [   40.330081] other info that might help us debug this:
> [   40.331540] context-{2:2}
> [   40.332305] 3 locks held by cpuhp/47/253:
> [   40.333468]  #0: ffffffffae6e6910 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0xe0/0x590
> [   40.336048]  #1: ffffffffae6e9060 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0xe0/0x590
> [   40.338607]  #2: ffff8881002a6948 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_remove_by_name_ns+0x78/0x100
> [   40.341454] stack backtrace:
> [   40.342291] CPU: 47 UID: 0 PID: 253 Comm: cpuhp/47 Not tainted 6.12.0-rc5-next-20241030-dirty #4
> [   40.344807] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   40.347482] Call Trace:
> [   40.348199]  <IRQ>
> [   40.348827]  dump_stack_lvl+0x6b/0xa0
> [   40.349899]  dump_stack+0x10/0x20
> [   40.350850]  __lock_acquire+0x900/0x4010
> [   40.360290]  lock_acquire+0x191/0x4f0
> [   40.364850]  put_cpu_partial+0x51/0x1a0
> [   40.368341]  scf_handler+0x1bd/0x290
> [   40.370590]  scf_handler_1+0x4e/0xb0
> [   40.371630]  __flush_smp_call_function_queue+0x2dd/0x600
> [   40.373142]  generic_smp_call_function_single_interrupt+0xe/0x20
> [   40.374801]  __sysvec_call_function_single+0x50/0x280
> [   40.376214]  sysvec_call_function_single+0x6c/0x80
> [   40.377543]  </IRQ>
> [   40.378142]  <TASK>
> 
> And scf_handler does indeed tail-call kfree:
> 
> 	static void scf_handler(void *scfc_in)
> 	{
> 	[...]
> 		} else {
> 			kfree(scfcp);
> 		}
> 	}

