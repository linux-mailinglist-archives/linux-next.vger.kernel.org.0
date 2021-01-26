Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFEC3041E6
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 16:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406151AbhAZPNG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 10:13:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:39240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406146AbhAZPND (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 10:13:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7643022D58;
        Tue, 26 Jan 2021 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611673937;
        bh=w5ozOYZ3HxfzVfJmXXR2CxVeoHVuWxUEYSte4Jx+PkE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Poong0rJYeogSdCf8+uThGqrNP1E3P3YunCLcazrTkIbq4Pe6S9i49f7NbgSx4PTW
         K9Auj81dwa3zYS6KM7lzlJ1n24Hq+QPN+40Ym93BGqbsSUi5SDIuMwokpzEoPyrxHs
         zZZhfClQzzBRApJ/RIAMQGcoJV/uh9yWouGXZdGvv3m70qlYhDehLRp6xKXJxF9OaP
         8nsKuSWmo9lHaoPcrXBt27AShXWqD+8K1JEXn+8zbkvivT/Lpsw/9LqxM9QpS5ojY0
         2nWn0aRJxwl9fny6/TH8fNuduxdJFO1yWetp/RX6hl4dCyYGCi1A7QHM1Ul+R9CIw6
         ru+noguW8IZWw==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 44C67352268C; Tue, 26 Jan 2021 07:12:17 -0800 (PST)
Date:   Tue, 26 Jan 2021 07:12:17 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH] s390: allow reschedule on syscall restart
Message-ID: <20210126151217.GD2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210121143926.21440-1-svens@linux.ibm.com>
 <20210121143926.21440-2-svens@linux.ibm.com>
 <a522c1ac-703a-ba99-c44c-3dd09e4cc4be@de.ibm.com>
 <20210126212553.5d5a21b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126212553.5d5a21b8@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 26, 2021 at 09:25:53PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 26 Jan 2021 07:59:51 +0100 Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> >
> > On 21.01.21 15:39, Sven Schnelle wrote:
> > > Commit 845f44e8ef28 ("sched: Report local wake up on resched blind zone
> > > within idle loop") from next-20210121 causes a warning because s390
> > > doesn't call sched_resched_local_allow() when restarting a syscall.
> > > 
> > > Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> > > ---
> > >  arch/s390/kernel/syscall.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
> > > index bc8e650e377d..2b39ac40f970 100644
> > > --- a/arch/s390/kernel/syscall.c
> > > +++ b/arch/s390/kernel/syscall.c
> > > @@ -162,6 +162,7 @@ void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
> > >  		do_syscall(regs);
> > >  		if (!test_pt_regs_flag(regs, PIF_SYSCALL_RESTART))
> > >  			break;
> > > +		sched_resched_local_allow();
> > >  		local_irq_enable();
> > >  	}
> > >  	exit_to_user_mode();  
> > 
> > Yesterdays next now fails with
> > 
> > 
> > arch/s390/kernel/syscall.c: In function '__do_syscall':
> > arch/s390/kernel/syscall.c:165:3: error: implicit declaration of function 'sched_resched_local_allow' [-Werror=implicit-function-declaration]
> >   165 |   sched_resched_local_allow();
> >       |   ^~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: some warnings being treated as errors
> > make[2]: *** [scripts/Makefile.build:288: arch/s390/kernel/syscall.o] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [scripts/Makefile.build:530: arch/s390/kernel] Error 2
> > make[1]: *** Waiting for unfinished jobs....
> 
> I have now removed the merge fix up for tomorrow.  It seems that the
> commits that needed it have been removed :-(

Review comments mean that they need rework, apologies for the hassle!

							Thanx, Paul
