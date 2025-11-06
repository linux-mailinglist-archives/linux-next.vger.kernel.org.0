Return-Path: <linux-next+bounces-8863-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F1C38C8F
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 03:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9285B3A45C6
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 02:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C7221146C;
	Thu,  6 Nov 2025 02:01:56 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF7F1EB1A4;
	Thu,  6 Nov 2025 02:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762394516; cv=none; b=p4f1ktMHbMFXwYpCfR6EOZFLEO17pqHBc18/9YgllXSeDdLXvJ837WTK8Nins+EJgtaUgaTC5RYXrMoraZwGXuSZ+cJErR1vj+MwHbjFcu8UhLl7fEO8hL6RmbtOIGKpD2IUWyZSTMLmmJfIuCmB9JvpX14aBBrnvJxIslChLng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762394516; c=relaxed/simple;
	bh=dO4FE21Zua9R4vz9RM9/cPVMk1N63kCDv91oB1BEKbU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kq6Q7nKQx5WGBAQvzuUvYjKMMdYV8cQsKBfsX6TUIHXZr8mYLSnJLRklUDWpM0kj7tbkwumF0nMoM2RnUaJIAGTVAwDbO7ZNVeTah2wOfk3Au+89Yz4xWKfiSSQDSC+UNNurjlMLom9ewHRnig3OX8TToQQbKVLHaSceqp+e+tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 66ECF14050B;
	Thu,  6 Nov 2025 02:01:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id ABB3120025;
	Thu,  6 Nov 2025 02:01:50 +0000 (UTC)
Date: Wed, 5 Nov 2025 21:01:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20251105210159.2334ba3c@gandalf.local.home>
In-Reply-To: <20251106123317.217e24ed@canb.auug.org.au>
References: <20251106123317.217e24ed@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: ABB3120025
X-Stat-Signature: 5w9samtco698mhw199fgimuxugexy6f8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+6k4fUAW9Fg4Wmq7JiUW6tey5kHaShdu8=
X-HE-Tag: 1762394510-850612
X-HE-Meta: U2FsdGVkX1+8dDZho369NEeDVMgwQNQ7xG712XN8KUpgDfN8b+FuU2BFRm+r3rAq8Oo2mcQlgNOHGLTY9Q696DluJ9RP4ohfG3aJ2gv3rfrByJvZi44djB4Z/dyJkDhXzgwq7F3z815QgyPtCF2yt15SHZAvh65L7rNt2CdgPVagc9eSR5x0HiLfyx0mwnAJTFwTKnUlt7iVf4qLtsRCSTduIB5BvFoq6cyV0+MafVPOvF0tY9tvtWqoUTfIIC9GdOMLyLdVrAnZesPr2rN8+y+cEexpz4fzDwS3kTPQEt2ECKmpHtRb9UbLUIAAkk1CACapG4NLKPN2NdQx6JffTXkvn+2178cAf3W/EVVWfEz5NbMydzkulrn19JgiRjmK

On Thu, 6 Nov 2025 12:33:17 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/trace/trace_syscalls.c: In function 'print_syscall_enter':
> kernel/trace/trace_syscalls.c:267:48: error: 'TRACE_ITER_VERBOSE' undeclared (first use in this function); did you mean 'TRACE_ITER_VERBOSE_BIT'?
>   267 |                 if (!tr || !(tr->trace_flags & TRACE_ITER_VERBOSE))
>       |                                                ^~~~~~~~~~~~~~~~~~
>       |                                                TRACE_ITER_VERBOSE_BIT
> kernel/trace/trace_syscalls.c:267:48: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit
> 
>   64b627c8da9a ("tracing: Add parsing of flags to the sys_enter_openat trace event")
> 
> interacting with commit
> 
>   bbec8e28cac5 ("tracing: Allow tracer to add more than 32 options")
> 
> which should have been fixed up in commit
> 
>   2021eabbdb41 ("Merge probes/for-next")
> 
> I have used the ftrace tree from next-20251105 for today.
> 

Ah, Masami made a branch that I had to merge with a fix and I'm still
testing that. But my scripts merged it without the fix. Hopefully I'll have
that fixed soon.

-- Steve

