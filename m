Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2194030077E
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 16:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbhAVPhs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jan 2021 10:37:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:53288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729036AbhAVPhq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Jan 2021 10:37:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE0E121D81;
        Fri, 22 Jan 2021 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611329825;
        bh=5lUEVa9PLDcanPTqWiXyf4Bt1OUsW3C1JiiAQUQkAQ0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HZCy4Jp80NfNKEEkvvZTGGy1RRUqAm8otgYs9H/jDw785nwvA219LiXDNK1cF6vco
         EkMWsaFpNL5qFVNU8c4ftIb/vsU7/blRLRXx2v0A+X1QAgR7H5MKh5u8ITcdBjJY7y
         6CnAQiJatUt2YGH/Ef+Pk59y8gWyjtDwvKVDlKPBTMQx8aICHZeD3gc3TCWFG3ZRv9
         QYnrlaZRhZLxef8SRRtc3wbI/yIt9aLWPNcKL193Zmq/njtER8gampIKESbswH3uuy
         DxgHDTXKFR6yAITXikTvLHSBTgGXJ9VyJ2yhYlWqIfjUObV2+M+5BB2lzZakCRm2C+
         wRUmWW4P3cnyA==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id B038F3522649; Fri, 22 Jan 2021 07:37:04 -0800 (PST)
Date:   Fri, 22 Jan 2021 07:37:04 -0800
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
Message-ID: <20210122153704.GG2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+G9fYvV5SZ47M-XpABya11okgR7BJQk-3dDuFWzgVmGN3Lurg@mail.gmail.com>
 <20210121185521.GQ2743@paulmck-ThinkPad-P72>
 <20210121213110.GB23234@willie-the-truck>
 <20210121214314.GW2743@paulmck-ThinkPad-P72>
 <CA+G9fYvZ5oE2bAkZqTYE87N0ONWoo2Q6VZBXihu4NQ_+C07qgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvZ5oE2bAkZqTYE87N0ONWoo2Q6VZBXihu4NQ_+C07qgA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 22, 2021 at 03:21:07PM +0530, Naresh Kamboju wrote:
> On Fri, 22 Jan 2021 at 03:13, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Thu, Jan 21, 2021 at 09:31:10PM +0000, Will Deacon wrote:
> > > On Thu, Jan 21, 2021 at 10:55:21AM -0800, Paul E. McKenney wrote:
> > > > On Thu, Jan 21, 2021 at 10:37:21PM +0530, Naresh Kamboju wrote:
> > > > > While running rcu-torture test on qemu_arm64 and arm64 Juno-r2 device
> > > > > the following kernel crash noticed. This started happening from Linux next
> > > > > next-20210111 tag to next-20210121.
> > > > >
> > > > > metadata:
> > > > >   git branch: master
> > > > >   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> > > > >   git describe: next-20210111
> > > > >   kernel-config: https://builds.tuxbuild.com/1muTTn7AfqcWvH5x2Alxifn7EUH/config
> > > > >
> > > > > output log:
> > > > >
> > > > > [  621.538050] mem_dump_obj() slab test: rcu_torture_stats =
> > > > > ffff0000c0a3ac40, &rhp = ffff800012debe40, rhp = ffff0000c8cba000, &z
> > > > > = ffff8000091ab8e0
> > > > > [  621.546662] mem_dump_obj(ZERO_SIZE_PTR):
> > > > > [  621.546696] Unable to handle kernel NULL pointer dereference at
> > > > > virtual address 0000000000000008
> > >
> > > [...]
> > >
> > > > Huh.  I am relying on virt_addr_valid() rejecting NULL pointers and
> > > > things like ZERO_SIZE_PTR, which is defined as ((void *)16).  It looks
> > > > like your configuration rejects NULL as an invalid virtual address,
> > > > but does not reject ZERO_SIZE_PTR.  Is this the intent, given that you
> > > > are not allowed to dereference a ZERO_SIZE_PTR?
> > > >
> > > > Adding the ARM64 guys on CC for their thoughts.
> > >
> > > Spooky timing, there was a thread _today_ about that:
> > >
> > > https://lore.kernel.org/r/ecbc7651-82c4-6518-d4a9-dbdbdf833b5b@arm.com
> >
> > Very good, then my workaround (shown below for Naresh's ease of testing)
> > is only a short-term workaround.  Yay!  ;-)
> 
> Paul, thanks for your (short-term workaround) patch.
> 
> I have applied your patch and tested rcu-torture test on qemu_arm64 and
> the reported issues has been fixed.

May I add your Tested-by?

And before I forget again, good to see the rcutorture testing on a
non-x86 platform!

							Thanx, Paul
