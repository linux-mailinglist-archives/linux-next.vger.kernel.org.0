Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8244E31A1C2
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 16:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhBLPec (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 10:34:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:55872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232248AbhBLPeB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 10:34:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE72164E74;
        Fri, 12 Feb 2021 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613144000;
        bh=eHKAadsmBd1fO7UIdsFXiDdKBmGxRlbe1eHeIyb9E0w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GqB1bFfHPU//v13o12sxTWyqKKzPJhTfar56hm7l2N7YezwtkVFLPblGsuuiHBxnZ
         oCcbnbqwnkpxvM3Vo/3+KxBJG7WfYcoeaD+k5YmOD330m74KB3ovNMDb0no4bdCQ3M
         BmbpgDpXeGE9Ruk7DmMIGxL+wKN1x4aP4V19K9oOZUyj5oZ4qvu6U34qLKZ1jDZodr
         dIICRlCxAJJynGWvOwX/VRN0fr2oLO5c9ON6Hxf5WVLh2HEbrRDWtacCD3YfG/Yjbw
         JIAHtf6Rsmh9Rx6oj3w/ldwY3T+eBhQ+Mo4L8j/C6MHQSBpyp1tF75DZ1FMPc9NjYZ
         7jIVIEP/EGNpQ==
Date:   Fri, 12 Feb 2021 16:33:17 +0100
From:   Frederic Weisbecker <frederic@kernel.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the rcu tree with the block tree
Message-ID: <20210212153317.GE94816@lothringen>
References: <20210211164852.7489b87d@canb.auug.org.au>
 <20210212151853.GC94816@lothringen>
 <858e7874-83c9-e4b9-a0a9-31be5a0c853e@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <858e7874-83c9-e4b9-a0a9-31be5a0c853e@kernel.dk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 12, 2021 at 08:30:27AM -0700, Jens Axboe wrote:
> On 2/12/21 8:18 AM, Frederic Weisbecker wrote:
> > On Thu, Feb 11, 2021 at 04:48:52PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Today's linux-next merge of the rcu tree got conflicts in:
> >>
> >>   include/linux/rcupdate.h
> >>   kernel/rcu/tree.c
> >>   kernel/rcu/tree_plugin.h
> >>
> >> between commits:
> >>
> >>   3a7b5c87a0b2 ("rcu/nocb: Perform deferred wake up before last idle's need_resched() check")
> >>   e4234f21d2ea ("rcu: Pull deferred rcuog wake up to rcu_eqs_enter() callers")
> >>   14bbd41d5109 ("entry/kvm: Explicitly flush pending rcuog wakeup before last
> >>   rescheduling point")
> >> from the block tree and commits:
> > 
> > Isn't it tip:/sched/core instead of block?
> 
> It must be, maybe block just got merged first?

Yeah most likely.

> It's just sched/core in a topic branch, to satisfy a dependency.
> 
> But as mentioned in the previous email, I just need sched/smp to satisfy
> that dependency. So I've rebased that small topic branch with that
> pulled in instead. Won't solve the sched/core vs rcu tree conflict, but
> at least it's out of my hands now :-)

Ok, sounds good :)

Thanks.

> 
> -- 
> Jens Axboe
> 
