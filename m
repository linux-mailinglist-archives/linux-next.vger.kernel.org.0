Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB64A3010F5
	for <lists+linux-next@lfdr.de>; Sat, 23 Jan 2021 00:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbhAVXY2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jan 2021 18:24:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:46326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728270AbhAVXYZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Jan 2021 18:24:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0971923B51;
        Fri, 22 Jan 2021 23:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611357820;
        bh=gBpq+x+WrBcMxLANHAJZem6iOs03mqvdVd0gvK3+OyI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QOsTrl7lxfr1poYM95xiUaJij33Pip75daCvAm+iZOO8v3sYwJbm8LsRit9VjiJNV
         WL83gM6kvXnS7LIYkKWu/T4D43d52jY3rhLgzVuRZJ028lyCm0QdEVz+VyF0TrApct
         1iM2ihJcofHiUv0/jOtX59GaZS1O0rElYmQAYfqs2B71ci4+xlt4yrykgM9bzX9t2h
         ef6KP4+baiDX5W9wx7Roq1hjuAh21P/xp4V+jQ7TZoVa3ieoR+uAnIalRd/bF8opfW
         YLWm+HbyL2c+/bref1hEprUEXhpuYFLY9Mwd1+JE45oCHk9pbEgRUruwNEeMyZp9Hl
         RvjOrAbRcuk2Q==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id DA940352267C; Fri, 22 Jan 2021 15:23:39 -0800 (PST)
Date:   Fri, 22 Jan 2021 15:23:39 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Will Deacon <will@kernel.org>, rcu@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: rcu-torture: Internal error: Oops: 96000006
Message-ID: <20210122232339.GI2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+G9fYvV5SZ47M-XpABya11okgR7BJQk-3dDuFWzgVmGN3Lurg@mail.gmail.com>
 <20210121185521.GQ2743@paulmck-ThinkPad-P72>
 <20210121213110.GB23234@willie-the-truck>
 <20210121214314.GW2743@paulmck-ThinkPad-P72>
 <CA+G9fYvZ5oE2bAkZqTYE87N0ONWoo2Q6VZBXihu4NQ_+C07qgA@mail.gmail.com>
 <20210122153704.GG2743@paulmck-ThinkPad-P72>
 <CA+G9fYt=waJnq7N=109eapXZkz-xNWg91Yno6fKXmovvFUVpsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt=waJnq7N=109eapXZkz-xNWg91Yno6fKXmovvFUVpsQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 22, 2021 at 09:16:38PM +0530, Naresh Kamboju wrote:
> On Fri, 22 Jan 2021 at 21:07, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Fri, Jan 22, 2021 at 03:21:07PM +0530, Naresh Kamboju wrote:
> > > On Fri, 22 Jan 2021 at 03:13, Paul E. McKenney <paulmck@kernel.org> wrote:
> > > >
> > > > On Thu, Jan 21, 2021 at 09:31:10PM +0000, Will Deacon wrote:
> > > > > On Thu, Jan 21, 2021 at 10:55:21AM -0800, Paul E. McKenney wrote:
> > > > > > On Thu, Jan 21, 2021 at 10:37:21PM +0530, Naresh Kamboju wrote:
> > > > > > > While running rcu-torture test on qemu_arm64 and arm64 Juno-r2 device
> > > > > > > the following kernel crash noticed. This started happening from Linux next
> > > > > > > next-20210111 tag to next-20210121.
> > > > > > >
> > > > > > > metadata:
> > > > > > >   git branch: master
> > > > > > >   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> > > > > > >   git describe: next-20210111
> > > > > > >   kernel-config: https://builds.tuxbuild.com/1muTTn7AfqcWvH5x2Alxifn7EUH/config
> > > > > > >
> > > > > > > output log:
> > > > > > >
> > > > > > > [  621.538050] mem_dump_obj() slab test: rcu_torture_stats =
> > > > > > > ffff0000c0a3ac40, &rhp = ffff800012debe40, rhp = ffff0000c8cba000, &z
> > > > > > > = ffff8000091ab8e0
> > > > > > > [  621.546662] mem_dump_obj(ZERO_SIZE_PTR):
> > > > > > > [  621.546696] Unable to handle kernel NULL pointer dereference at
> > > > > > > virtual address 0000000000000008
> > > > >
> > > > > [...]
> > > > >
> > > > > > Huh.  I am relying on virt_addr_valid() rejecting NULL pointers and
> > > > > > things like ZERO_SIZE_PTR, which is defined as ((void *)16).  It looks
> > > > > > like your configuration rejects NULL as an invalid virtual address,
> > > > > > but does not reject ZERO_SIZE_PTR.  Is this the intent, given that you
> > > > > > are not allowed to dereference a ZERO_SIZE_PTR?
> > > > > >
> > > > > > Adding the ARM64 guys on CC for their thoughts.
> > > > >
> > > > > Spooky timing, there was a thread _today_ about that:
> > > > >
> > > > > https://lore.kernel.org/r/ecbc7651-82c4-6518-d4a9-dbdbdf833b5b@arm.com
> > > >
> > > > Very good, then my workaround (shown below for Naresh's ease of testing)
> > > > is only a short-term workaround.  Yay!  ;-)
> > >
> > > Paul, thanks for your (short-term workaround) patch.
> > >
> > > I have applied your patch and tested rcu-torture test on qemu_arm64 and
> > > the reported issues has been fixed.
> >
> > May I add your Tested-by?
> 
> Yes.  Please add Reported-by and Tested-by.

Very good!  I have added:

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Because I folded the workaround into the first commit in the series,
instead of adding your Reported-by, I added the following to that commit:

[ paulmck: Explicitly check for small pointers per Naresh Kamboju. ]

> > And before I forget again, good to see the rcutorture testing on a
> > non-x86 platform!
> 
> We are running rcutorture tests on arm, arm64, i386 and x86_64.

Nice!!!

Some ARMv8 people are getting bogus (but harmless) error messages
because parts of rcutorture think that all the world is an x86.
I am looking at a fix, but need to work out what the system is.
To that end, coul you please run the following on the arm, arm64,
and i386 systems and tell me what the output is?

	gcc -dumpmachine

> Happy to test !

And thank you very much for your testing efforts!!!

							Thanx, Paul
