Return-Path: <linux-next+bounces-9009-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE27C5E9C3
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 18:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CBDF74E8A85
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD271328B60;
	Fri, 14 Nov 2025 17:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UukHJoCM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD05329AB15;
	Fri, 14 Nov 2025 17:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763141108; cv=none; b=fsssQr7W22xjtip+PPYmeR5VOIdjZbTvSo4AYM3iw/rpB1J/ztzgq8MATXE9/b+NUnPWN+7CDQVBQZHAfa7E07GyV1PEIW4O80/u+8M46h4AMjvqRzWWvBw6k/nNme9lA9fAO+D8ir7BVd9AoipEAy76MBHAeJ09smH7SjN/31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763141108; c=relaxed/simple;
	bh=FPig9IUQL8AvTKI0f/FZzikDfo3uKJvwdg6chKXpD88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rypQhTYkmAKDBrL3VlXqkF7L4JCxB3dyRDEGAo/ypW65+hZVTSDMAaQy7di66MetZvKAwL34ZdtaHyy6csiZdTFpSy0+qR33CrBaSXneaQetIbNSHstgfKBTz5H7b1F0IBdoT3M8rR6MMILohBNpYEbZZMk7Abim/KaaMu8uw3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UukHJoCM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154DFC4CEF1;
	Fri, 14 Nov 2025 17:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763141107;
	bh=FPig9IUQL8AvTKI0f/FZzikDfo3uKJvwdg6chKXpD88=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UukHJoCMQ6VmebPlHceYk9hXvF9XsHNbmpp7l3rVmXQtEwkIFnRgz85rJQENPX9L2
	 +cxvcgjh5nYfatFIF85cVfrZ8h9qaX2iAALm6QeJe6VQuMxFaP7SkZokRkJB8uQpZ3
	 3BoH2/TbFeU0KPqfqsnmLM8kMvArQWolOFHTR3dbzrJoi5Ti5F6qJyROy6DLYsVf1D
	 D13dfopb0RCmMI5U9lQ0K83tDTntvIXuU/iDzMhChomlSUGUA0jtjw8pHu0dQIcUPI
	 r0BkCO0MK+I2xFKkgaRohv6c5ZB21obYnBQqmk9h+S+vJtenfnX8wkY8/BiCVWIQu4
	 waxwHjiFIJEkA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A0E3DCE0CA7; Fri, 14 Nov 2025 09:25:06 -0800 (PST)
Date: Fri, 14 Nov 2025 09:25:06 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	yonghong.song@linux.dev
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <747d4324-55f9-495d-b1ec-ca23cc472f3f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <20251114133532.mmdi2dca@linutronix.de>
 <20251114104633.0721bdbe@gandalf.local.home>
 <20251114160017.CrDJHi5w@linutronix.de>
 <20251114112202.08e1e3c1@gandalf.local.home>
 <20251114163330.pi9Nm3Vb@linutronix.de>
 <348528a9-7e1a-4aa7-8219-5cad81969137@paulmck-laptop>
 <20251114171052.gJRc-2A3@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114171052.gJRc-2A3@linutronix.de>

On Fri, Nov 14, 2025 at 06:10:52PM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-11-14 09:00:21 [-0800], Paul E. McKenney wrote:
> > > > Where in PREEMPT_RT we do not disable preemption around the tracepoint
> > > > callback, but in non RT we do. Instead it uses a srcu and migrate disable.
> > > 
> > > I appreciate the effort. I really do. But why can't we have SRCU on both
> > > configs?
> > 
> > Due to performance concerns for non-RT kernels and workloads, where we
> > really need preemption disabled.
> 
> This means srcu_read_lock_notrace() is much more overhead compared to
> rcu_read_lock_sched_notrace()?
> I am a bit afraid of different bugs here and there.

No, the concern is instead overhead due to any actual preemption.  So the
goal is to actually disable preemption across the BPF program *except*
in PREEMPT_RT kernels.

> > > Also why does tracepoint_guard() need to disable migration? The BPF
> > > program already disables migrations (see for instance
> > > bpf_prog_run_array()).
> > > This is true for RT and !RT. So there is no need to do it here.
> > 
> > The addition of migration disabling was in response to failures, which
> > this fixed.  Or at least greatly reduced the probability of!  Let's see...
> > That migrate_disable() has been there since 2022, so the failures were
> > happening despite it.  Adding Yonghong on CC for his perspective.
> 
> Okay. In general I would prefer that we know why we do it. BPF had
> preempt_disable() which was turned into migrate_disable() for RT reasons
> since remaining on the same CPU was enough and preempt_disable() was the
> only way to enforce it at the time.
> And I think Linus requested migrate_disable() to work regardless of RT
> which PeterZ made happen (for different reasons, not BPF related).

Yes, migrate_disable() prevents migration either way, but it does not
prevent preemption, which is what was needed in non-PREEMPT_RT kernels
last I checked.

							Thanx, Paul

