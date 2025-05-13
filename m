Return-Path: <linux-next+bounces-6748-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B17AB5AA9
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 19:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C55E43A1CB8
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 17:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F651188713;
	Tue, 13 May 2025 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0nDm1Q3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233C429CE8;
	Tue, 13 May 2025 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155671; cv=none; b=SRlVmMWQjCkWWpcvlS0KuaGSXN3gqR/QsdgBvFTM8SWrbrzCPvrZVUYxdWAIAhH+tzh++/oFAMIPFMnMt/HBGQkfVf9ZBbADc26anuIoNkBMYkv37KvXwHfHIEFy58OKrXuZ6PR+wEPnpblaCbAs0eW6K3okQIgOTNZep5UDKlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155671; c=relaxed/simple;
	bh=KL7v0CO4UIR2kqWvkCdmkotvA3GHjTu2qidhkJQiM7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNyhO70OQZ++Vrq3lOeiubQUQNupnNUnrsS9+sCdEJCEDN24gPgYgl9tG5KAtJELeRwmPWy/dcEr1Gg2RhZKbrLuGQq88So+7gj8MjMsQVQ0gC2zsurBeXSb3eYcyhAVAwGI2ph9ONHNCffNC3LpBPjFhX/GLwT0ulivk9I/UnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0nDm1Q3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9910DC4CEE4;
	Tue, 13 May 2025 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747155670;
	bh=KL7v0CO4UIR2kqWvkCdmkotvA3GHjTu2qidhkJQiM7A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=E0nDm1Q3+QKZKT8MhJFHz04dLv2RwgRA4fEoTUB8QdK6t2Ezm8FBZzM94ksq8cXc8
	 0EJNQhR7V4PkvslWDz/keVbe9yns7wjpTgXBegOjgoig2JGgjmJtSUdc1XDr5KkQwR
	 Z1M6Yqxp0zyyq4O69hJJ+QVdr4qlZkqbS7b0mPwSpMaIQVbCMblAOFWE4VPRRJ4gP0
	 51KT9KSXf3vclWj+qnVq9t7q8lCR6W4VPx9IuVO8UAreRGBss+EkhOWfLH/fet1Xwv
	 avIS30+/dYBhuOomDG/csL6YKfTeYsXboLzXPdGI5oMYhBkOCb2oPHbW/rCoQ2ZwQo
	 53bzK5c14mgxA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 438B7CE0908; Tue, 13 May 2025 10:01:10 -0700 (PDT)
Date: Tue, 13 May 2025 10:01:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [BUG] sleeping function called from invalid context at
 ./include/linux/sched/mm.h:321
Message-ID: <8a3b5e43-5d2a-4205-a24e-27148c968278@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a5c939c4-b123-4b2f-8a22-130e508cbcce@paulmck-laptop>
 <87o6vxj6wu.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6vxj6wu.ffs@tglx>

On Tue, May 13, 2025 at 09:39:45AM +0200, Thomas Gleixner wrote:
> On Mon, May 12 2025 at 16:47, Paul E. McKenney wrote:
> > I ran this on x86 with clang version 19.1.7 (CentOS 19.1.7-1.el9).
> >
> > See below for the full splat.  The TINY02 and SRCU-T scenarios are unique
> > in setting both CONFIG_SMP=n and CONFIG_PROVE_LOCKING=y.
> >
> > Bisection converges here:
> >
> > c836e5a70c59 ("genirq/chip: Rework irq_set_msi_desc_off()")
> >
> > The commit reverts cleanly, but results in the following build error:
> >
> > kernel/irq/chip.c:98:26: error: call to undeclared function 'irq_get_desc_lock'
> >
> > Thoughts?
> 
> Smells like what the top commit of the irq/core branch fixes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/core

OK, that is this one:

47af06c9d31f ("genirq: Consistently use '%u' format specifier for unsigned int variables")

This is printk() format change, which seems unlikely, but what do I
know?  Can't hurt to run a two-minute test...  Which fails.

Ah, you sent this email at 9:39AM your time, and that commit was queued
at 9:34AM your time.  The top of the stack at 9:39AM was this one:

b5fcb6898202 ("genirq: Ensure flags in lock guard is consistently initialized")

OK, early enabling of interrupts could be a bad thing, so I guess that I
don't feel so bad about failing to have spotted the problem by inspection.
And the test passes for both rcutorture scenarios, thank you!

I have to ask...  Will you be rebasing the fixes into the offending
commits for bisectability?

							Thanx, Paul

