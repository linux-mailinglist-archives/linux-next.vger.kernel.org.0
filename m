Return-Path: <linux-next+bounces-8998-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A3C5E2CA
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 17:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9163542441
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 16:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08952246BB6;
	Fri, 14 Nov 2025 16:01:31 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831023D29F;
	Fri, 14 Nov 2025 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763136090; cv=none; b=QgtoneD4N5L2pzfj4HhtKfLk592w1PCUPA/59iU6IiwGy1KedoawpfsTXL+9mtVq655a7bMzUut+IifXHZl5iTyTkBeYQEMoi8UTW4enAxueecHrYv/2W7GMI6QNmYYqUOAJ3qijtuRQQ3lCBB8WmMT5QOarnFjIlR5WvlRtwsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763136090; c=relaxed/simple;
	bh=LATlFsUmvWjGbtk+vKsmnn74V8kV0yNoLNOq9P26XK4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAQeAD74+vuengWu4Vu8XD4QccxGXFXOL8PsBmVa22blA/X4N1W/WNozR0h5GwGBxLIc0uqs2aSrq79oAHr5xO9NH3uYAi2LZf71dYyC9p29G8dICA+jw/YHU6OT7NSSPSXssuLjTCXNfM7aE0yxCIuS5J4/z53SXF+oHhyGL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 2FC924CFE6;
	Fri, 14 Nov 2025 16:01:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id D1EEA20029;
	Fri, 14 Nov 2025 16:01:18 +0000 (UTC)
Date: Fri, 14 Nov 2025 11:01:36 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Paul E. McKenney"
 <paulmck@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <20251114110136.3d36deca@gandalf.local.home>
In-Reply-To: <aRdBVFSmgvPWuY2k@localhost.localdomain>
References: <20251114135226.64831207@canb.auug.org.au>
	<20251114074255.3e535084@gandalf.local.home>
	<aRdBVFSmgvPWuY2k@localhost.localdomain>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: pzyb5wcpnayrt6u1m78ue5ib6xzkzcdp
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: D1EEA20029
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+NYK+TZl6Dns84jPZ7UpVKO1abFYMH95s=
X-HE-Tag: 1763136078-74247
X-HE-Meta: U2FsdGVkX1+PTG0bdZMn5r1L3ZvfHw4AKcjpwpFST07FOnanTCq4II/cH1n9aeolGA0vXJvprnkMOnwv70C8ImpLCYjQoQ0kU295jBx+uNhDlnt5VGXUr3rafWb9725nZXMAZPdE976eeC4zNjC3njaSOfC0amJcAgk4GPXVk+Xnvzd5ARx8AfQIRXy50SXJZg87lHte3EkHyK3SSGPH9yuMB4z3kZ72v1N3hPuhJt+4PqQEbhXL9QeDs92X1PboHFOc5MwxQilWzmqsaQ0cVUC+Qdt6SY2ckiEEkF3MVdjPX662/mQ0dVOUKIGJO9SH88dJnShyZode9BwAO1WoNbh2DNEj/iqD

On Fri, 14 Nov 2025 15:48:52 +0100
Frederic Weisbecker <frederic@kernel.org> wrote:

> > 
> > Paul, can you change it so that you *do not* touch this file?  
> 
> Ok, I've zapped the commit for now until we sort this out.

You can put it back. It's actually code I wrote to make sure this doesn't
conflict. The "preempt_rt_guard()" was supposed to be about "preempt_rt"
and I took it now as being "preempt" :-p

I need a vacation.

-- Steve

