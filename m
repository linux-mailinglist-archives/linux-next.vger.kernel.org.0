Return-Path: <linux-next+bounces-8991-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29487C5D5ED
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 14:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311313B8211
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 13:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE58304BBC;
	Fri, 14 Nov 2025 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UGzbzH7P";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fPM5znWp"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E700919AD5C;
	Fri, 14 Nov 2025 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127337; cv=none; b=ufuXflyMIuhefbKuFTKW2nIobZTL3MATIuOGNQJHNXDgQX4ser/x2iTGBPiB7Q3gxGhtq0cLVmo2k35DSaiemVYMeAH5Tfim31pp2Re/QRHT5YkecBftzx3MQrfBcV92KnaTE3pn1RiWBxOSRBh/pAUvXJu350CghBBvFeCKa4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127337; c=relaxed/simple;
	bh=Zx4hd6s3i+gU1IDY3lWlx0Iy2NEJ6r2jhQRIqSrguvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=My1ZqxM4QAiCmjzXgs2zVw9iW5w1k3kK2lkDPJJ8Mg5S7IIjK9JH8R7Okui0R21RRf96XFfoNSJVKF3PPLDjlMhPel8ThPa9IkMT9cDkO3KsZ8ZLC9RvaJ0W7znHViBwGrNOGgyIQ7QFrbhDtoXZCAJYXkjRZSf3EnlEy1H7lTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UGzbzH7P; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fPM5znWp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 14:35:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763127334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mTHY+KJ0ksOh20N2pH17NSAH91mUxRktw5CnbHn2aj4=;
	b=UGzbzH7PO5CJObb5OtjPGe22gG4s+ge97N2OXiTnqPl6YjLTvAmTzJuzWdOh+sPbi/rdi8
	B3DyGEhP0xozKx5qtFWkmICrXPSY1Cq/xEt6YL5RgK39Lue9yWai+buBrHwunDXSsLZYZP
	dbEC6QVzhCW92ZUxsFeBBLjYX0x++6i6YKQ8d2m+4nenZ4xCOrFL2E/kCDZ58cw2C98f8V
	s+BQS2suCt9nUnucAQkpcfcL4skZj/Xz54FgDBvl/UKajlHAj4KFt8EQEVJq4zogXxzi7Y
	pFK/uqNMFW6gCvFKAgLIZbddSQsUDOxe57O2WBpvnOmSqYdrnXT3l6nT4fbC3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763127334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mTHY+KJ0ksOh20N2pH17NSAH91mUxRktw5CnbHn2aj4=;
	b=fPM5znWpDO3K9jZAzTIU3DsTFZYsrnnVnIvFuY3auStn7LyHqMkAwUTzqsGweUuEuGHrXw
	HceckqEDkxtRmKDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114133532.mmdi2dca@linutronix.de>
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114074255.3e535084@gandalf.local.home>

On 2025-11-14 07:42:55 [-0500], Steven Rostedt wrote:
> > diff --cc kernel/trace/trace_syscalls.c
> > index e96d0063cbcf,3f699b198c56..000000000000
> > --- a/kernel/trace/trace_syscalls.c
> > +++ b/kernel/trace/trace_syscalls.c
> > @@@ -878,6 -322,8 +890,7 @@@ static void ftrace_syscall_enter(void *
> >   	 * buffer and per-cpu data require preemption to be disabled.
> >   	 */
> >   	might_fault();
> > + 	preempt_rt_guard();
> >  -	guard(preempt_notrace)();
> 
> My code made it so that preemption is not needed here but is moved later
> down for the logic that does the reading of user space data.
> 
> Note, it must have preemption disabled for all configs (including RT).
> Otherwise, the data it has can get corrupted.
> 
> Paul, can you change it so that you *do not* touch this file?

Where is preempt_rt_guard() from?

> Thanks,
> 
> -- Steve

Sebastian

