Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6EAB2FF787
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 22:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbhAUVp0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 16:45:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:40698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727286AbhAUVoj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 16:44:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A78D923A56;
        Thu, 21 Jan 2021 21:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611265438;
        bh=tYYWE4pXBYgJiVQbHPNuH4bTBYvHpqbYdDRF8lYnB6s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=liu8wzDXnkRgcXAWnTvlsopRARgJJt+SEtmo3fLAh+G3Yu/uAUIoOxolzRF0SDio6
         HhKt2jHMvaLIYftcpZzPhu4WjRUHtKbkOo6Nes0AyKu0BDofUFhcAG457EfQeWTnpJ
         WdQM3SeA3vu0j7Xhc8kj3EPxlnUfJCgsyH+6Yy32QZQdHU3/jgEIS4fTP/Po4fyCaH
         p20bZsHurxWvVHuy3nQqHIxyXglB4Y4Kr9vzX1SMJNnS1XOO4BMqarin7+j9haHIYk
         IADOWwhbJDgBtXJGkgxEqedve/J40mnThssxewjixo4TU3TbJyHy5GcMXr/3i42Q0z
         7JngHprjTc0uQ==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 61D2435226D8; Thu, 21 Jan 2021 13:43:58 -0800 (PST)
Date:   Thu, 21 Jan 2021 13:43:58 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sven Schnelle <svens@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH] s390: allow reschedule on syscall restart
Message-ID: <20210121214358.GX2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210121143926.21440-1-svens@linux.ibm.com>
 <20210121143926.21440-2-svens@linux.ibm.com>
 <20210122083249.60d29c33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122083249.60d29c33@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 22, 2021 at 08:32:49AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 21 Jan 2021 15:39:26 +0100 Sven Schnelle <svens@linux.ibm.com> wrote:
> >
> > Commit 845f44e8ef28 ("sched: Report local wake up on resched blind zone
> > within idle loop") from next-20210121 causes a warning because s390
> > doesn't call sched_resched_local_allow() when restarting a syscall.
> > 
> > Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> > ---
> >  arch/s390/kernel/syscall.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
> > index bc8e650e377d..2b39ac40f970 100644
> > --- a/arch/s390/kernel/syscall.c
> > +++ b/arch/s390/kernel/syscall.c
> > @@ -162,6 +162,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
> >  		do_syscall(regs);
> >  		if (!test_pt_regs_flag(regs, PIF_SYSCALL_RESTART))
> >  			break;
> > +		sched_resched_local_allow();
> >  		local_irq_enable();
> >  	}
> >  	exit_to_user_mode();
> 
> I add that today as a merge fixup patch to the merge of the rcu tree
> (which contains commit 845f44e8ef28 ("sched: Report local wake up on
> resched blind zone within idle loop") ).

If Frederic has no objections, I will fold this in with attribution.

Either way, good catch!

							Thanx, Paul
