Return-Path: <linux-next+bounces-4954-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FF9F255D
	for <lists+linux-next@lfdr.de>; Sun, 15 Dec 2024 19:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B282163C9F
	for <lists+linux-next@lfdr.de>; Sun, 15 Dec 2024 18:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC694174EE4;
	Sun, 15 Dec 2024 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/nXpsNK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3645F9D6;
	Sun, 15 Dec 2024 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734287488; cv=none; b=Ac420rRs/d0BOeosKMSYZLxhLsnr3Ce7IpJWQkrfGXm0wcsf7IScLkzTpEX83mqwaHsEdmAxCUzAHt38b6tzEEHVI9AszGnha4wNOzfcaDNo3UGkDQkKLndRjM5U5sMKvf2FGzksjf407wMFaiJD87th/SgCnbZnKweFuY9ReX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734287488; c=relaxed/simple;
	bh=2iN0kSe0uP782LnBpBWzGUk/6m6gbioeqyGoNrCNLZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSlpqR9LOrIvrp6oh5HPTJcRyDiiRXfyUsHoHPyvYHv9wiPpcLEccOa9ANMJKVVWVSm3s2/Mm0383iSStnWDNP4yzvUSbiXvKwRvneRodHvVVE8+7VL2eXKecjDqgZsQ/bg25YfwcHGxonPIte8ZEYMAzgWpTGkgxPHsO9LWnAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/nXpsNK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E3EC4CECE;
	Sun, 15 Dec 2024 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734287488;
	bh=2iN0kSe0uP782LnBpBWzGUk/6m6gbioeqyGoNrCNLZI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=J/nXpsNK33fGpf6C0CZtParPHhb4Bdi1FTnlAlSIJ0NliXWM+tV5d2RgFl7ArIcbI
	 4naDVr+opV+l2T8tTTLpAVBapz0O2lzTBNoGi41Fm6MmyZm70svR5uEyw2JjNo9rFo
	 Xf3WSAiVtCWC346shq0JKpQ2Ak3/NscdGGr5QNPD42H9Zu2nkJJPDkJBdT8szXuQRO
	 BE+wCozU/TXvrOQNs5BE1eYP88m4fO0o8jKLTpARDqvMhCesKseHmujyTAnKOy1S9f
	 xogjSU3cxbiEI0H+0pZ0jD3K07Lu5uLuT1BPQBDRwiAQxDykg76H7vHMW13Luy4xlt
	 OpGI01pdqiewQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D3BEECE0E58; Sun, 15 Dec 2024 10:31:27 -0800 (PST)
Date: Sun, 15 Dec 2024 10:31:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tomas Glozar <tglozar@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <2cd70642-86de-4b26-87c2-94bde7441ce8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
 <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
 <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
 <CAP4=nvTeawTjhWR0jKNGweeQFvcTr8S=bNiLsSbaKiz=od+EOA@mail.gmail.com>
 <35e44f60-0a2f-49a7-b44b-c6537544a888@paulmck-laptop>
 <fe2262ff-2c3d-495a-8ebb-c34485cb62a2@paulmck-laptop>
 <b9064ed8-387d-47ce-ad0a-7642ad180fc3@paulmck-laptop>
 <7cdc0f04-819d-429c-9a2c-9ad25d85db55@paulmck-laptop>
 <6e3fce44-1072-4720-bf91-33bb22ebbd21@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e3fce44-1072-4720-bf91-33bb22ebbd21@paulmck-laptop>

On Thu, Nov 14, 2024 at 10:16:12AM -0800, Paul E. McKenney wrote:
> On Mon, Oct 21, 2024 at 12:25:41PM -0700, Paul E. McKenney wrote:
> > On Mon, Oct 14, 2024 at 11:55:05AM -0700, Paul E. McKenney wrote:
> 
> [ . . . ]
> 
> > > But no big wins thus far, so this will be a slow process.  My current test
> > > disables CPU hotplug.  I will be disabling other things in the hope of
> > > better identifying the code paths that should be placed under suspicion.
> 
> The "this will be a slow process" was no joke...

[ . . . ]

> Back to beating on it.  More info than anyone needs is available here:
> 
> https://docs.google.com/document/d/1-JQ4QYF1qid0TWSLa76O1kusdhER2wgm0dYdwFRUzU8/edit?usp=sharing

And the fix for the TREE03 too-short grace periods is finally in, at
least in prototype form:

https://lore.kernel.org/all/da5065c4-79ba-431f-9d7e-1ca314394443@paulmck-laptop/

Or this commit on -rcu:

22bee20913a1 ("rcu: Fix get_state_synchronize_rcu_full() GP-start detection")

This passes more than 30 hours of 400 concurrent instances of rcutorture's
TREE03 scenario, with modifications that brought the bug reproduction
rate up to 50 per hour.  I therefore have strong reason to believe that
this fix is a real fix.

With this fix in place, a 20-hour run of 400 concurrent instances
of rcutorture's TREE03 scenario resulted in 50 instances of the
enqueue_dl_entity() splat pair.  One (untrimmed) instance of this pair
of splats is shown below.

You guys did reproduce this some time back, so unless you tell me
otherwise, I will assume that you have this in hand.  I would of course
be quite happy to help, especially with adding carefully chosen debug
(heisenbug and all that) or testing of alleged fixes.

Just let me know!

							Thanx, Paul

------------------------------------------------------------------------

------------[ cut here ]------------
smpboot: Booting Node 0 Processor 3 APIC 0x3
WARNING: CPU: 1 PID: 29304 at kernel/sched/deadline.c:1995 enqueue_dl_entity+0x511/0x5d0
Modules linked in:
CPU: 1 UID: 0 PID: 29304 Comm: kworker/1:2 Not tainted 6.13.0-rc1-00063-ga51301a307ab-dirty #2355
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
Workqueue: rcu_gp sync_rcu_do_polled_gp
RIP: 0010:enqueue_dl_entity+0x511/0x5d0
Code: ff 48 89 ef e8 10 cf ff ff 0f b6 4d 54 e9 0e fc ff ff 85 db 0f 84 d0 fe ff ff 5b 44 89 e6 48 89 ef 5d 41 5c e9 30 d6 ff ff 90 <0f> 0b 90 e9 fa fa ff ff 48 8b bb f8 09 00 00 48 39 fe 0f 89 de fb
RSP: 0018:ffff9b88c13ebaf0 EFLAGS: 00010086
RAX: 0000000000000001 RBX: ffff893a5f4ac8e8 RCX: 0000000000000002
RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff893a5f4ac8e8
RBP: ffff893a5f4ac8e8 R08: 0000000000000001 R09: 0000000000000197
R10: 0000000000000000 R11: ffff893a4181bb90 R12: 0000000000000001
R13: 000000000016e360 R14: ffff893a5f4ac040 R15: ffff893a5f4ac080
FS:  0000000000000000(0000) GS:ffff893a5f480000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000001d06000 CR4: 00000000000006f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ? __warn+0x83/0x130
 ? enqueue_dl_entity+0x511/0x5d0
 ? report_bug+0x18e/0x1a0
 ? handle_bug+0x54/0x90
 ? exc_invalid_op+0x18/0x70
 ? asm_exc_invalid_op+0x1a/0x20
 ? enqueue_dl_entity+0x511/0x5d0
 dl_server_start+0x31/0xe0
 enqueue_task_fair+0x21b/0x6b0
 enqueue_task+0x2c/0x70
 activate_task+0x21/0x50
 attach_task+0x30/0x50
 sched_balance_rq+0x654/0xdf0
 sched_balance_newidle.constprop.0+0x190/0x360
 pick_next_task_fair+0x2a/0x340
 __schedule+0x1f3/0x8f0
 schedule+0x22/0xd0
 synchronize_rcu_expedited+0x1bf/0x350
 ? __pfx_autoremove_wake_function+0x10/0x10
 ? __pfx_wait_rcu_exp_gp+0x10/0x10
 sync_rcu_do_polled_gp+0x4f/0x110
 process_one_work+0x163/0x390
 worker_thread+0x293/0x3b0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xd1/0x100
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2f/0x50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
WARNING: CPU: 1 PID: 29304 at kernel/sched/deadline.c:1971 enqueue_dl_entity+0x54f/0x5d0
Modules linked in:
CPU: 1 UID: 0 PID: 29304 Comm: kworker/1:2 Tainted: G        W          6.13.0-rc1-00063-ga51301a307ab-dirty #2355
Tainted: [W]=WARN
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
Workqueue: rcu_gp sync_rcu_do_polled_gp
RIP: 0010:enqueue_dl_entity+0x54f/0x5d0
Code: de fb ff ff e9 66 ff ff ff 89 c1 45 84 d2 0f 84 ce fb ff ff a8 20 0f 84 c6 fb ff ff 84 c0 0f 89 20 fe ff ff e9 b9 fb ff ff 90 <0f> 0b 90 e9 f4 fb ff ff 84 d2 0f 85 e3 fa ff ff 48 89 ea 48 8d b5
RSP: 0018:ffff9b88c13ebaf0 EFLAGS: 00010086
RAX: 00000000ffffff00 RBX: ffff893a5f4ac040 RCX: 0000000000000000
RDX: 0000000000000001 RSI: 0000000b1a2986b8 RDI: 0000000b1a268bc8
RBP: ffff893a5f4ac8e8 R08: ffff893a5f4ac880 R09: 000000003b9aca00
R10: 0000000000000001 R11: 00000000000ee6b2 R12: 0000000000000001
R13: 000000000016e360 R14: ffff893a5f4ac040 R15: ffff893a5f4ac080
FS:  0000000000000000(0000) GS:ffff893a5f480000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000001d06000 CR4: 00000000000006f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ? __warn+0x83/0x130
 ? enqueue_dl_entity+0x54f/0x5d0
 ? report_bug+0x18e/0x1a0
 ? handle_bug+0x54/0x90
 ? exc_invalid_op+0x18/0x70
 ? asm_exc_invalid_op+0x1a/0x20
 ? enqueue_dl_entity+0x54f/0x5d0
 dl_server_start+0x31/0xe0
 enqueue_task_fair+0x21b/0x6b0
 enqueue_task+0x2c/0x70
 activate_task+0x21/0x50
 attach_task+0x30/0x50
 sched_balance_rq+0x654/0xdf0
 sched_balance_newidle.constprop.0+0x190/0x360
 pick_next_task_fair+0x2a/0x340
 __schedule+0x1f3/0x8f0
 schedule+0x22/0xd0
 synchronize_rcu_expedited+0x1bf/0x350
 ? __pfx_autoremove_wake_function+0x10/0x10
 ? __pfx_wait_rcu_exp_gp+0x10/0x10
 sync_rcu_do_polled_gp+0x4f/0x110
 process_one_work+0x163/0x390
 worker_thread+0x293/0x3b0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xd1/0x100
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x2f/0x50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
---[ end trace 0000000000000000 ]---

