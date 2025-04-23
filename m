Return-Path: <linux-next+bounces-6363-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBABA98D00
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 16:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A040E173688
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 14:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738BB1A239D;
	Wed, 23 Apr 2025 14:27:12 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574AE1EB36;
	Wed, 23 Apr 2025 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418432; cv=none; b=hQep/EtOfZtK1or31WsWiAB49oGrT8ecgr3xJOchpfhwFFX4zQ4aAWaE42qf5BFVCTxLcjvrB9KX70rVn/Rmsj1Lj67KuWe6gIyk4/be2cYAMK+J5UP7gwy9a3XkX49YlxXLNFh8rokjVTB6NPUTYT8NaNLy9UY0ux9p+hNYWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418432; c=relaxed/simple;
	bh=uMHXSwcg72zCvhbyW76m/LnxmFsNay0uZwkdWYLLm7o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0/ilcq6zKenA36VdBt6hjd2QTQ4W+oxI1trQXJVJ4oPsjxJ0GGto4SLf9k2WYpbVDz8g7gUA75i+sg7RK5mjeisVT/MmaDhyqwMTkW20zyjrzVVVROUJpTu1kA+/x9UEK+QEsYgoITVWfOEXceOJIEtdPkw8SPoXzFZn5pUPW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D710C4CEE2;
	Wed, 23 Apr 2025 14:27:11 +0000 (UTC)
Date: Wed, 23 Apr 2025 10:29:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Libo Chen <libo.chen@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: runtime warning after merge of the mm-unstable tree
Message-ID: <20250423102903.37f9d07c@gandalf.local.home>
In-Reply-To: <20250422192816.03eaac09@batman.local.home>
References: <20250422205740.02c4893a@canb.auug.org.au>
	<5628676b-e1ff-4570-a1ee-c87742e5363c@oracle.com>
	<20250423091656.6068c090@canb.auug.org.au>
	<20250422192816.03eaac09@batman.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 19:28:16 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Wed, 23 Apr 2025 09:16:56 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > On Tue, 22 Apr 2025 11:05:10 -0700 Libo Chen <libo.chen@oracle.com> wrote:  
> > > 
> > > Just to verify, does the build have commit 'tracing: Verify event
> > > formats that have "%*p.."'[1] or not? I do see linux-next/master has
> > > it but just want to first confirm that.     
> > 
> > Yes, it does have that commit (since it has been in Linus' tree since
> > April 4).  
> 
> Looks like we need to teach the verifier about nodemask_pr_args() :-/
> 

No, actually, the verifier found a bug!

The event is:

> TRACE_EVENT(sched_skip_cpuset_numa,
> 
> 	TP_PROTO(struct task_struct *tsk, nodemask_t *mem_allowed_ptr),
> 
> 	TP_ARGS(tsk, mem_allowed_ptr),
> 
> 	TP_STRUCT__entry(
> 		__array( char,		comm,		TASK_COMM_LEN	)
> 		__field( pid_t,		pid				)
> 		__field( pid_t,		tgid				)
> 		__field( pid_t,		ngid				)
> 		__field( nodemask_t *,	mem_allowed_ptr			)
> 	),
> 
> 	TP_fast_assign(
> 		memcpy(__entry->comm, tsk->comm, TASK_COMM_LEN);
> 		__entry->pid		 = task_pid_nr(tsk);
> 		__entry->tgid		 = task_tgid_nr(tsk);
> 		__entry->ngid		 = task_numa_group_id(tsk);
> 		__entry->mem_allowed_ptr = mem_allowed_ptr;

Here, we copy the address of mem_allowed_ptr into the ring buffer. The
address is copied, not the mask itself.

> 	),
> 
> 	TP_printk("comm=%s pid=%d tgid=%d ngid=%d mem_nodes_allowed=%*pbl",
> 		  __entry->comm,
> 		  __entry->pid,
> 		  __entry->tgid,
> 		  __entry->ngid,
> 		  nodemask_pr_args(__entry->mem_allowed_ptr))
> );

The above nodemask_ptr_args() is defined as:

> #define nodemask_pr_args(maskp)	__nodemask_pr_numnodes(maskp), \
> 				__nodemask_pr_bits(maskp)
> static __always_inline unsigned int __nodemask_pr_numnodes(const nodemask_t *m)
> {
> 	return m ? MAX_NUMNODES : 0;
> }
> static __always_inline const unsigned long *__nodemask_pr_bits(const nodemask_t *m)
> {
> 	return m ? m->bits : NULL;
> }

Here we see it dereferences the pointer to get bits.

The TP_fast_assign() can happen seconds, minutes, days, months and possibly
years! before the TP_printk() is executed.

There's no guarantee that the mem_allowed_ptr will still be around when
printed and can cause a kernel crash! This is exactly what the verifier is
looking for.

The real fix is not to dereference the pointer and do the conversion in the
TP_fast_assign().

-- Steve

