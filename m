Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6432B31A1A1
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 16:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhBLP0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 10:26:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:54660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231564AbhBLPZX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 10:25:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0639D64E57;
        Fri, 12 Feb 2021 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613143482;
        bh=IePrd8o9nI25cN5ZsixsVHyRqKUoOqz5S90PT+YFB/w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KbRlUjf06Nm6p1gKJHm6w5+8Vk8xEAZ2PEolUmaZ9iHLcKIiTET7dehDS8yD+VFW1
         RyupUXxXgTu6/WNKWbPB+RvWmwO4owD0YsQiaY7emnWM5dr+O0mbKNqWIzWferNC8Z
         eGJS5Jgmtw3aqswKGg+4taDY2UNSgenxXQehHffcfchts9Wq1qJpZhyX5KXoF3pSaA
         vdzNR1DGL9jyHxSs/evQ3/+yg3VsMH95yKEyTpB9BB3OckTv+yioJBRawJ5Nv0TRGs
         jYg+tgxHHVXv65YDztLjsAhJnCG4FFtlN6wwrcr8ErXpM2GAZZNLMX/ydV0yB5ULOM
         ceVRI5LK/ASJA==
Date:   Fri, 12 Feb 2021 16:24:40 +0100
From:   Frederic Weisbecker <frederic@kernel.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the rcu tree with the block tree
Message-ID: <20210212152440.GD94816@lothringen>
References: <20210211164852.7489b87d@canb.auug.org.au>
 <20210211173802.GM2743@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211173802.GM2743@paulmck-ThinkPad-P72>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 11, 2021 at 09:38:02AM -0800, Paul E. McKenney wrote:
> On Thu, Feb 11, 2021 at 04:48:52PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the rcu tree got conflicts in:
> > 
> >   include/linux/rcupdate.h
> >   kernel/rcu/tree.c
> >   kernel/rcu/tree_plugin.h
> > 
> > between commits:
> > 
> >   3a7b5c87a0b2 ("rcu/nocb: Perform deferred wake up before last idle's need_resched() check")
> >   e4234f21d2ea ("rcu: Pull deferred rcuog wake up to rcu_eqs_enter() callers")
> >   14bbd41d5109 ("entry/kvm: Explicitly flush pending rcuog wakeup before last rescheduling point")
> 
> Frederic had me move these out of the section of the -rcu commits for
> the v5.12 merge window, saying that they were not yet ready.

Actually those are the latest series applied in tip:sched/core

> 
> Jens, are these needed to prevent failures in the block tree?  If so,
> there were some commits added late in v5.11 that might also get rid
> of your failures.  If those v5.11 commits don't help the block tree,
> let's figure out what we need to do here...  ;-)

I'm surprised those are in the block tree. Perhaps some commits there
depend on sched/core

Thanks!
