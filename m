Return-Path: <linux-next+bounces-8990-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C8578C5D29F
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 13:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 465FF346FF4
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 12:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59C978F2F;
	Fri, 14 Nov 2025 12:42:45 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6600450F2;
	Fri, 14 Nov 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763124165; cv=none; b=eZJTdO60JhEgvJ0PMZIh4wsWEuWatv5ODsAPSKkJw2vzwE/tUoSYRDke0K3yt8sXLqd9oXKUuqTmpU6d5i9J8WXffGhON3LZM1zr7oofXjfUDIvB7EjtjTifFC41uLOagbM5iq+Ul7ZorEsI1DmGKs4fmRkoO7UyWvGlIQmdRmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763124165; c=relaxed/simple;
	bh=0STGUdU4M0TRGi4oVL2APW6LYNfJTyhhiJvD6RQ1EEM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D97hDSp0HoivA+hEpRtkNoT0escFJ6ZNzHJuT4Qyy1PzwzDydGoZr+wwdl8ZRmAfS+3/1WVdfxTB4m+9qOkmwHTiEOZWLgntF73U+i0rNQ4+izgRg0VXHd1qt8pMaZZaA2OgYa0r4nLeV+t6Iqt9Kys0jcYlMxe/fdTcsU7xBT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 960125888E;
	Fri, 14 Nov 2025 12:42:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 5B7BD18;
	Fri, 14 Nov 2025 12:42:38 +0000 (UTC)
Date: Fri, 14 Nov 2025 07:42:55 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114074255.3e535084@gandalf.local.home>
In-Reply-To: <20251114135226.64831207@canb.auug.org.au>
References: <20251114135226.64831207@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: x7nw3ttip955nnapki8progjgpgn4cxm
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 5B7BD18
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/gbqkvnVebVulN726leg4bARdYwMivKhE=
X-HE-Tag: 1763124158-959204
X-HE-Meta: U2FsdGVkX1/Wg8lD0hUT2NKXHGkzDAFHlFCue/pi42Lr/W9DDow0+9qK8zN3IQWg2j1/A/kXWSRXcaJmImXt2xG/xRti0y2WgGnglraM6CGcvKf27kuKt4BXqcVnsq1sHJtcRL/26QLEOcuiOFGo2u3Aq2/Dg0GP04/Su2+vazjHUxaN3uCOiQBgiO4NzOQZALOtgz9I8SEB8jBfKL8ghw8tzlvJE3BH5cF7A1Nh0vIoYXRInQoTlAxhjXqS0zvWpp0SHekoBcUr3ZpvkJJTSwnBZqjLdndITGuVA60eoHOlmpw9duf8cw9KzFqfdPu940uW+FB7QEyRYIAKEwtXZseLenWzWQ9DCNhMqa3me06CXQXqxW8PnhWrADP554qZ

On Fri, 14 Nov 2025 13:52:26 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/trace/trace_syscalls.c
> 
> between commit:
> 
>   a544d9a66bdf ("tracing: Have syscall trace events read user space string")
> 
> from the ftrace tree and commit:
> 
>   35587dbc58dd ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
> 
> from the rcu tree.
> 
> I fixed it up (Maybe - see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks for the update.

> 

> diff --cc kernel/trace/trace_syscalls.c
> index e96d0063cbcf,3f699b198c56..000000000000
> --- a/kernel/trace/trace_syscalls.c
> +++ b/kernel/trace/trace_syscalls.c
> @@@ -878,6 -322,8 +890,7 @@@ static void ftrace_syscall_enter(void *
>   	 * buffer and per-cpu data require preemption to be disabled.
>   	 */
>   	might_fault();
> + 	preempt_rt_guard();
>  -	guard(preempt_notrace)();

My code made it so that preemption is not needed here but is moved later
down for the logic that does the reading of user space data.

Note, it must have preemption disabled for all configs (including RT).
Otherwise, the data it has can get corrupted.

Paul, can you change it so that you *do not* touch this file?

Thanks,

-- Steve


>   
>   	syscall_nr = trace_get_syscall_nr(current, regs);
>   	if (syscall_nr < 0 || syscall_nr >= NR_syscalls)

