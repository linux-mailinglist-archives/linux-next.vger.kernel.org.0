Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC2E1E6D10
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 23:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407449AbgE1VDd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 17:03:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:59928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407418AbgE1VDV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 17:03:21 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 228402075F;
        Thu, 28 May 2020 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590699801;
        bh=agEaof6MpDGFOPjG017BhHJsuSFW58ckIR+2SITSxqQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QYVLb6ZnCegT+zMGUCQyyBTtCThMi0d4hJ3yn4hDlU3jVf4GlLXfISHfQltE8ebvM
         P+GiIdO3RWSFtgbhHK0oOlZZYPPG0ZLH1rvUiRlULUBgmleIjLTz8C+oYal4n9bzil
         GTXoqE2MlDpZ/o/ezZDHYc9OUjutBg4eX3pdK1i8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 0BC5C35229BA; Thu, 28 May 2020 14:03:21 -0700 (PDT)
Date:   Thu, 28 May 2020 14:03:21 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20200528210320.GA22278@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200528190501.10135e9f@canb.auug.org.au>
 <20200528163358.GK2869@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528163358.GK2869@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 28, 2020 at 09:33:59AM -0700, Paul E. McKenney wrote:
> On Thu, May 28, 2020 at 07:05:01PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the rcu tree, today's linux-next build (powercp
> > allyesconfig) failed like this:
> > 
> > ld: kernel/rcu/refperf.o:(.discard+0x0): multiple definition of `__pcpu_unique_srcu_ctl_perf_srcu_data'; kernel/rcu/rcuperf.o:(.discard+0x0): first defined here
> > 
> > Caused by commit
> > 
> >   786a25497743 ("refperf: Add a test to measure performance of read-side synchronization")
> > 
> > From srcutree.h:
> > 
> >  * Note that although DEFINE_STATIC_SRCU() hides the name from other
> >  * files, the per-CPU variable rules nevertheless require that the
> >  * chosen name be globally unique.
> > 
> > I have applied the following patch for today.
> 
> I have a patch queued, but it is currently blocked by other broken
> commits which I expect to have straightened out today.
> 
> Yet again, please accept my apologies for the hassle!

And this is now in rcu/next.

							Thanx, Paul
