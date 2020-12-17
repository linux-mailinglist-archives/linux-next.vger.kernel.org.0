Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B61F2DD418
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 16:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbgLQPYr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 10:24:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:38916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbgLQPYr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Dec 2020 10:24:47 -0500
Date:   Thu, 17 Dec 2020 07:24:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608218646;
        bh=yMe3veOahro7VmdOxa0bC0jngxcArMPyCHlJwvNyGow=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=gFgy9Unu2q4or8Rmw6mChqWsoCErNrr6Qzqn+sLPG7IgoEspllkli5kvViZuqyS0k
         bpMLWdKPd8deLwVXKApJ4fsqdoeWtjPaWy3Af2UYc90NbuhXFsVebs/I8JWIageGKI
         X6x6upmYurYcm9Ne++cs+MV7jL/wutLOEL9eZXHkg+tkVCDaBrEkBf6xRApjeBoP/3
         85XS2yRIIexHMGJeP2k8ddYiMg+IaFmhnWSa7/HRcKI7ZlOallEokfhot/UgXoNy7F
         6p0jadVrcFIr+8C9Ri/FIReBK1m7XZAjNquWE75bfbaVCTeqcI+/N8IM4matlAATER
         q1xE3WdZ0genQ==
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     rcu@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: i386: rcu-torture: WARNING: at kernel/rcu/rcutorture.c:1169
 rcu_torture_writer [rcutorture]
Message-ID: <20201217152406.GS2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+G9fYsVud9EmeDnijucxAN49a8S5zjnML6LSmmnPTG3cO5-Hg@mail.gmail.com>
 <20201216160330.GG2657@paulmck-ThinkPad-P72>
 <CA+G9fYsqcSjzEfGerJ_bJJJ3e00Cnqe0zE9yjqfQQYM78UQgtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsqcSjzEfGerJ_bJJJ3e00Cnqe0zE9yjqfQQYM78UQgtg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 17, 2020 at 04:18:52PM +0530, Naresh Kamboju wrote:
> Hi Paul,
> 
> Thanks for your inputs.
> 
> On Wed, 16 Dec 2020 at 21:33, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Wed, Dec 16, 2020 at 03:40:04PM +0530, Naresh Kamboju wrote:
> > > Linux Kernel Functional Testing (LKFT) started running rcu-torture tests on
> > > qemu_arm64, qemu_arm qemu_x86_64 and qemu_i386 from our CI build systems.
> > >
> > > The following warning(s) noticed on qemu_i386 while running rcu-torture test
> > > on Linux mainline and Linux -next master branch. Since we do not have baseline
> > > results i can not comment this as regression but when compared with
> > > stable-rc 5.4 kernel this warning is new on mainline and next.
> >
> > The rcutorture testing "stutters", that is, it periodically intentionally
> > drops the test load down to zero for a few seconds.  The expectation is
> > that with no load, rcutorture will have no trouble finishing any needed
> > grace periods within that zero-load period.  If at the end of the stutter
> > period, RCU work remains undone, then this warning is emitted.
> >
> > This warning can be a false positive in the following situations:
> >
> > 1.      The system on which you are running rcutorture is under
> >         additional heavy load.
> 
> The DUT is running the test - rcutorture - only.
> 
> > 2.      You are running multiple guest OSes, each of which is running
> >         rcutorture, and vCPUs from each of the guest OSes ends up
> >         sharing a core with a vCPU from one of the other guests.  This
> >         can cause the zero-load period to not be so unloaded.
> >
> > 3.      You built rcutorture into your kernel, so that rcutorture starts
> >         immediately at boot time (CONFIG_RCU_TORTURE_TEST=y).  If your
> >         boot takes long enough, rcutorture can massively overload the
> >         single boot CPU, which can in turn result in this warning.
> 
> The test was built as a module.
> CONFIG_RCU_TORTURE_TEST=m
> 
> >
> > If you are in situation #1, I suggest disabling stuttering using the
> > rcutorture.stutter=0 kernel boot parameter.
> >
> > If you are in situation #2, I suggest binding the guest-OS vCPUs
> > to avoid them sharing cores with each other.
> >
> > If you are in situation #3, I have patches that I expect to submit
> > upstream in the v5.12 merge window that can help.  Hey, they work for me!
> > If you would like to test them before then, please let me know.
> >
> > If something else is going on, please let me know what it is so that
> > I can fix it one way or another.
> 
> We were running on qemu_i386 today. I have tested on real hardware
> and the reported problem has been reproduced.
> 
> > This warning has been present for quite some time, but I continually
> > make rcutorture more aggressive, and this could well be part of the
> > fallout of additional rcutorture aggression.
> >
> > And either way, thank you for trying out rcutorture!
> 
> We are happy to test :)

Is this reproducible?  If so, could you please try bisection?

							Thanx, Paul
