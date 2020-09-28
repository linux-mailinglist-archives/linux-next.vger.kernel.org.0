Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA1627B34A
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 19:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgI1RdO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 13:33:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbgI1RdO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 13:33:14 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 030F82083B;
        Mon, 28 Sep 2020 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601314394;
        bh=x7A7JcYB4k1uuOLNpLJbXIeiahwcbTalHktGMazaCYc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=0gXWVoumy/Gr1lugNenFb+SfqzWGd0nlVYYuDj5MJs6PoeFK+pQb32V0Ao1xRC4iQ
         xt4fqzSumJ8AWla0pXiHoTUUulGSusrNMlj518mXhkmnZ+VQRzp89m1J6ID5ZU0rOz
         N3mg+wfJDlfHDtfuO/qsh+CSj3TTqipl5g6dIikg=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id C15CE352183A; Mon, 28 Sep 2020 10:33:13 -0700 (PDT)
Date:   Mon, 28 Sep 2020 10:33:13 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20200928173313.GP29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200917132652.738c4cc2@canb.auug.org.au>
 <20200917180005.GM29330@paulmck-ThinkPad-P72>
 <20200928075729.GC2611@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928075729.GC2611@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 09:57:29AM +0200, Peter Zijlstra wrote:
> On Thu, Sep 17, 2020 at 11:00:05AM -0700, Paul E. McKenney wrote:
> > On Thu, Sep 17, 2020 at 01:26:52PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Commit
> > > 
> > >   903c5302fa2d ("sched/core: Allow try_invoke_on_locked_down_task() with irqs disabled")
> > > 
> > > is missing a Signed-off-by from its author and committer.
> > > 
> > > I didn't complain about this when it was first present because I figured
> > > it was just a debugging commit that would be removed quickly.  However,
> > > there are now quite a few follow up commits ...
> > 
> > Without Peter's Signed-off-by, I clearly won't be submitting it to the
> > upcoming merge window.
> > 
> > Peter, this is now quite close to your original patch.  May I please
> > add your Signed-off-by?
> 
> Sure!

Much appreciated!!!

But I already replaced that commit with one that moves the call to
try_invoke_on_locked_down_task() an interrupts-enabled region of code.
Which is probably what I should have done to start with...  :-/

							Thanx, Paul
