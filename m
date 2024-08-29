Return-Path: <linux-next+bounces-3502-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9F9647AF
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 16:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEEB61C2220D
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 14:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734221AC44C;
	Thu, 29 Aug 2024 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKDPeKAx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DD01922F1;
	Thu, 29 Aug 2024 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940788; cv=none; b=G3mR0A5T3gJP97r90VlaFX7H/v/3t8uqHIwc91SFjl2iz9DPLxHpkHQCii/jzb4+6cqXXExovJvdiwirApEQRJk/5w9V29YGjb6pGulwkFaa0T1Ut8qGcZ3XNt7xjBZ6dBi5cOJFTmz0VyqZ+SPK/BOv+6kB/hKVFP+w6sFt6eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940788; c=relaxed/simple;
	bh=wikrjUYm6ht0GXMRmrfI/hwREovczAOww8garv3xPv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/0lvtU508BHEoJM4Xw2d32UwRc8USVq3F/eWFhdx9dlYzZlMnrcZaBaGcvrgVVYbnE6zO1LDZ7pgAW7X954NG0eH5Tz89T4/HGmfffrfg0/ApBcIDRxIGZeidu+2pOkEswqdiY1l3AL6kZoyRKfzuwtJ+hZ/A1wRQp67YawCxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKDPeKAx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEA8C4CEC1;
	Thu, 29 Aug 2024 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724940787;
	bh=wikrjUYm6ht0GXMRmrfI/hwREovczAOww8garv3xPv8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=oKDPeKAxdZLRgN1V/SVFNSCRYhgfPF5RA0Gj5HmDRrG+gL6UgkfIzBb6D7Ijd/M4C
	 Br3JPw7wxd9safB9mZVVSMnP1iY3vo5ymjAdk7PvJmvuWTqWBjVgoNUig3Jkx+3zPb
	 z1etPw8+SgHqqCu75Ms6RLYabTuQ3YrvgKGDuH1N4+qsu63nocdNPdoNRlr/B3xJLC
	 3PejvV17X7dyhkEjdq18kAzz9KTHIH4Wkly2PQ0xGUXsp7NJSiV7+TgHE2JQ/23xzT
	 th2if/PMOPwCUpSLMeLlQeemwmjC67oNfqMzlWDFLDjOQqDCR29N8/jVr/b8NazfPw
	 BRYGC4OidyFOg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7A0C9CE0D9C; Thu, 29 Aug 2024 07:13:07 -0700 (PDT)
Date: Thu, 29 Aug 2024 07:13:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <cc537207-68a3-4dda-a8ec-6dda2fc1985d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <xhsmhcyltogin.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <a19308ed-7252-4119-b891-2a61791bb6e5@paulmck-laptop>
 <xhsmha5gwome6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zs8pqJjIYOFuPDiH@chenyu5-mobl2>
 <xhsmh7cc0ogza.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <5ea3658b-5aec-4969-92c5-49a2d23171c3@paulmck-laptop>
 <xhsmh4j74o6l9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <8094db32-5c81-4537-8809-ddfe92a0ac6c@paulmck-laptop>
 <4b93e5cf-c71e-4c64-9369-4ab3f43d9693@paulmck-laptop>
 <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xhsmh1q27o2us.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Thu, Aug 29, 2024 at 03:50:03PM +0200, Valentin Schneider wrote:
> On 29/08/24 03:28, Paul E. McKenney wrote:
> > On Wed, Aug 28, 2024 at 11:39:19AM -0700, Paul E. McKenney wrote:
> >>
> >> The 500*TREE03 run had exactly one failure that was the dreaded
> >> enqueue_dl_entity() failure, followed by RCU CPU stall warnings.
> >>
> >> But a huge improvement over the prior state!
> >>
> >> Plus, this failure is likely unrelated (see earlier discussions with
> >> Peter).  I just started a 5000*TREE03 run, just in case we can now
> >> reproduce this thing.
> >
> > And we can now reproduce it!  Again, this might an unrelated bug that
> > was previously a one-off (OK, OK, a two-off!).  Or this series might
> > have made it more probably.  Who knows?
> >
> > Eight of those 5000 runs got us this splat in enqueue_dl_entity():
> >
> >       WARN_ON_ONCE(on_dl_rq(dl_se));
> >
> > Immediately followed by this splat in __enqueue_dl_entity():
> >
> >       WARN_ON_ONCE(!RB_EMPTY_NODE(&dl_se->rb_node));
> >
> > These two splats always happened during rcutorture's testing of
> > RCU priority boosting.  This testing involves spawning a CPU-bound
> > low-priority real-time kthread for each CPU, which is intended to starve
> > the non-realtime RCU readers, which are in turn to be rescued by RCU
> > priority boosting.
> >
> 
> Thanks!
> 
> > I do not entirely trust the following rcutorture diagnostic, but just
> > in case it helps...
> >
> > Many of them also printed something like this as well:
> >
> > [  111.279575] Boost inversion persisted: No QS from CPU 3
> >
> > This message means that rcutorture has decided that RCU priority boosting
> > has failed, but not because a low-priority preempted task was blocking
> > the grace period, but rather because some CPU managed to be running
> > the same task in-kernel the whole time without doing a context switch.
> > In some cases (but not this one), this was simply a side-effect of
> > RCU's grace-period kthread being starved of CPU time.  Such starvation
> > is a surprise in this case because this kthread is running at higher
> > real-time priority than the kthreads that are intended to force RCU
> > priority boosting to happen.
> >
> > Again, I do not entirely trust this rcutorture diagnostic, just in case
> > it helps.
> >
> >                                                       Thanx, Paul
> >
> > ------------------------------------------------------------------------
> >
> > [  287.536845] rcu-torture: rcu_torture_boost is stopping
> > [  287.536867] ------------[ cut here ]------------
> > [  287.540661] WARNING: CPU: 4 PID: 132 at kernel/sched/deadline.c:2003 enqueue_dl_entity+0x50d/0x5c0
> > [  287.542299] Modules linked in:
> > [  287.542868] CPU: 4 UID: 0 PID: 132 Comm: kcompactd0 Not tainted 6.11.0-rc1-00051-gb32d207e39de #1701
> > [  287.544335] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> > [  287.546337] RIP: 0010:enqueue_dl_entity+0x50d/0x5c0
> > [  287.603245]  ? __warn+0x7e/0x120
> > [  287.603752]  ? enqueue_dl_entity+0x54b/0x5c0
> > [  287.604405]  ? report_bug+0x18e/0x1a0
> > [  287.604978]  ? handle_bug+0x3d/0x70
> > [  287.605523]  ? exc_invalid_op+0x18/0x70
> > [  287.606116]  ? asm_exc_invalid_op+0x1a/0x20
> > [  287.606765]  ? enqueue_dl_entity+0x54b/0x5c0
> > [  287.607420]  dl_server_start+0x31/0xe0
> > [  287.608013]  enqueue_task_fair+0x218/0x680
> > [  287.608643]  activate_task+0x21/0x50
> > [  287.609197]  attach_task+0x30/0x50
> > [  287.609736]  sched_balance_rq+0x65d/0xe20
> > [  287.610351]  sched_balance_newidle.constprop.0+0x1a0/0x360
> > [  287.611205]  pick_next_task_fair+0x2a/0x2e0
> > [  287.611849]  __schedule+0x106/0x8b0
> 
> 
> Assuming this is still related to switched_from_fair(), since this is hit
> during priority boosting then it would mean rt_mutex_setprio() gets
> involved, but that uses the same set of DQ/EQ flags as
> __sched_setscheduler().
> 
> I don't see any obvious path in
> 
> dequeue_task_fair()
> `\
>   dequeue_entities()
> 
> that would prevent dl_server_stop() from happening when doing the
> class-switch dequeue_task()... I don't see it in the TREE03 config, but can
> you confirm CONFIG_CFS_BANDWIDTH isn't set in that scenario?
> 
> I'm going to keep digging but I'm not entirely sure yet whether this is
> related to the switched_from_fair() hackery or not, I'll send the patch I
> have as-is and continue digging for a bit.

Makes sense to me, thank you, and glad that the diagnostics helped.

Looking forward to further fixes.  ;-)

							Thanx, Paul

