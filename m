Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD8D1007BB
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 15:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKRO4J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 09:56:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:34034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726909AbfKRO4I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 09:56:08 -0500
Received: from paulmck-ThinkPad-P72.home (199-192-87-166.static.wiline.com [199.192.87.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1601D2084D;
        Mon, 18 Nov 2019 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574088968;
        bh=EQfnQ11Ypu2J2QUInq51j21cMm+BEF8tDM+6DT2xExI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=L8IgnYIh+QayU3PkWbYDS2/SJqi0mqAxcwl725Xu+UhpAt3xqZpyv2Q6ukJ2kgXnZ
         cw77VPduS6hxy8bykcs8aWLWhuf4CgqvBewR+/n9bjhmITVgierZtsSCgxXwQ3aPlb
         4/fItK9DAvStKY5D5hP7zZ7kdgp9Z2CeDHUrPkhc=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id CC0CB3520BE9; Mon, 18 Nov 2019 06:56:07 -0800 (PST)
Date:   Mon, 18 Nov 2019 06:56:07 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Tejun Heo <tj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next: manual merge of the workqueues tree with the tip tree
Message-ID: <20191118145607.GI2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191118150858.1a436a12@canb.auug.org.au>
 <20191118090000.hpnibmk6xculuwii@linutronix.de>
 <20191118125046.GB74767@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191118125046.GB74767@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 18, 2019 at 01:50:46PM +0100, Ingo Molnar wrote:
> 
> * Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> 
> > On 2019-11-18 15:08:58 [+1100], Stephen Rothwell wrote:
> > > Hi all,
> > Hi,
> > 
> > > Today's linux-next merge of the workqueues tree got a conflict in:
> > > 
> > >   kernel/workqueue.c
> > > 
> > > between commit:
> > > 
> > >   5a6446626d7e ("workqueue: Convert for_each_wq to use built-in list check")
> > > 
> > > from the tip tree and commit:
> > > 
> > >   49e9d1a9faf2 ("workqueue: Add RCU annotation for pwq list walk")
> > > 
> > > from the workqueues tree.
> > 
> > urgh. So the RCU warning is introduced in commit
> >    28875945ba98d ("rcu: Add support for consolidated-RCU reader checking")
> > 
> > which was merged in v5.4-rc1. I enabled it around -rc7 and saw a few
> > warnings including in the workqueue code. I asked about this and posted
> > later a patch which was applied by Tejun. Now I see that the tip tree
> > has a patch for this warning…
> > I would vote for the patch in -tip since it also removes the
> > assert_rcu_or_wq_mutex() macro.
> > It would be nice if this could be part of v5.4 since once the RCU
> > warning is enabled it will yell.
> 
> So 5a6446626d7e is currently queued up for v5.5 as part of the RCU tree. 
> 
> I can cherry pick 5a6446626d7e into tip:core/urgent if Paul and Tejun 
> agree.

No objections here.

							Thanx, Paul
