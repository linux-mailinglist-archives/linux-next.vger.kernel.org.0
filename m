Return-Path: <linux-next+bounces-8746-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7995C151C2
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 15:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D41E71C271AB
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 14:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448EC230D0F;
	Tue, 28 Oct 2025 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N0dl+8q0"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49351337688;
	Tue, 28 Oct 2025 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660498; cv=none; b=EQlryAI4MfjsmToR6ciJZ///SZXqOixT6wQfiH6WIHlT5PqjeAQuc5U6T9Y28WGasHkKxp9z6QSk+MkCwXM1oxS5YP6uwvcGCB4+1erI/Ep0tGzxPLdGC5eWagveDVDnkUxE/57XRa42gRj1jKGt00HHwYp6xfXaNF+a7g7lz5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660498; c=relaxed/simple;
	bh=80GVU+KEcGEzhiawu3SE2Yj1JPq4yN4YExDM54LgnIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2W04JA8l0fXBXD+1qlE8A3xOlAkKf4Fn6M4+BDSgF8zbiafaWzSzJ/uFgWcVgD2fUcIVShrMOx0mT/xTrFQJbBynanA5K3yOh8Hk3ws1E+UYLaHmbH3EoQOdma/8AxeihZoW/dqt53wD5t8yvevvYfi7AA+R0Uid/LN5SiYD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N0dl+8q0; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=egKIBcM1r3rVKidn5mxv810VXintHraWDp0dW5Ht2GM=; b=N0dl+8q0JA4fa4L4Cx2BjjcqSZ
	yQ8rMJW/u0dN3Wan0FmtwqEQWf9s5A0KbYjYcxwcEJSfOwBgqdwnL1PPmiysK3lbasy/if7n1jmx2
	+DrQLkUbEp2h2e12xwxJOFBUT0Zeb1gbUKPIQFQSiWfXERYQZQSGWU6xTWzXhX0nda8+rDm1MpSzE
	jy3LJQ7qFEStjHJJXvcWrdHc2a1v5wbbZVZPRYFdu7ZN/P3FoK1KRzZOfCkq2xA94B9VY08QWPUaB
	lKB3yxXLFJf3uZpIBxZT4UrGdYn7XMQgq7085mhOd4G9Qj+EPP12k0s0MFU8Iz/HbKPZRDe+/QYH3
	gKEhSxsA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDjV7-00000004W4V-0tv7;
	Tue, 28 Oct 2025 13:12:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 99484300220; Tue, 28 Oct 2025 15:08:07 +0100 (CET)
Date: Tue, 28 Oct 2025 15:08:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	"Emil Tsalapatis (Meta)" <emil@etsalapatis.com>,
	Emil Tsalapatis <etsal@meta.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20251028140807.GM3245006@noisy.programming.kicks-ass.net>
References: <20251028112205.47129816@canb.auug.org.au>
 <aQAYE_X9XJ9RgJb3@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQAYE_X9XJ9RgJb3@slm.duckdns.org>

On Mon, Oct 27, 2025 at 03:10:43PM -1000, Tejun Heo wrote:
> On Tue, Oct 28, 2025 at 11:22:05AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the tip tree got a conflict in:
> > 
> >   kernel/sched/ext.c
> > 
> > between commit:
> > 
> >   a8ad873113d3 ("sched_ext: defer queue_balance_callback() until after ops.dispatch")
> > 
> > from Linus' tree and commit:
> > 
> >   4c95380701f5 ("sched/ext: Fold balance_scx() into pick_task_scx()")
> > 
> > from the tip tree.
> > 
> > I fixed it up (see below - but I was not sure if the
> > "maybe_queue_balance_callback(rq);" is positioned correctly) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> 
> I resolved this in sched_ext/for-6.19 by pulling for-6.18-fixes but yeah the
> conflict is through tip/sched/core. I think your resolution is correct and
> matches sched_ext/for-6.19 (sans whitespaces).
> 
> I don't know how tip tree resolves these conflicts but either way - leaving
> it as-is until the merge window, or pulling master and resolving in tip - is
> fine from sched_ext POV. I can sync with tip/sched/core as necessary.

tip/sched/core should now have that merge resolved properly too.

Thanks!

