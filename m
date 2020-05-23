Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7AE1DF367
	for <lists+linux-next@lfdr.de>; Sat, 23 May 2020 02:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731182AbgEWAMY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 20:12:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:36598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731169AbgEWAMY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 May 2020 20:12:24 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EFBD2206B6;
        Sat, 23 May 2020 00:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590192744;
        bh=i2mVo27EQF4lNBS9IayQbm5SwyNaYxnGrl/yPkcM4iY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nTcstaV27D3miCiaUjMLPYQNjsOV2zjv9IVJEjCxOvFHc+7X0m5O7zN8t8W+JIABN
         B8SaMwegapCgvtM+btv3jc9iY4SqC5Lp51+XjWN9/vbN62LJbOIfl0U+hl9gIaSr+O
         3a7KjDpOAIVOYbjPt5t/Sk3o8W2OTu+t9w4y2njw=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id D57973521294; Fri, 22 May 2020 17:12:23 -0700 (PDT)
Date:   Fri, 22 May 2020 17:12:23 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        elver@google.com, bp@alien8.de
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200523001223.GA23921@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200522033119.1bbd99c5@canb.auug.org.au>
 <20200521173520.GL6608@willie-the-truck>
 <20200522171708.5f392fde@canb.auug.org.au>
 <20200522174944.1a1732fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522174944.1a1732fa@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 22, 2020 at 05:49:44PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 22 May 2020 17:17:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 21 May 2020 18:35:22 +0100 Will Deacon <will@kernel.org> wrote:
> > >
> > > [+Marco and Boris]
> > > 
> > > On Fri, May 22, 2020 at 03:31:19AM +1000, Stephen Rothwell wrote:  
> > > > After merging the tip tree, all my linux-next builds took signficantly
> > > > longer and used much more memory.  In some cases, builds would seg fault
> > > > due to running out of memory :-(
> > > > 
> > > > I have eventaully bisected it to commit
> > > > 
> > > >   cdd28ad2d811 ("READ_ONCE: Use data_race() to avoid KCSAN instrumentation")
> > > > 
> > > > For my (e.g.) x86_64 allmodconfig builds (cross compiled on PowerPC le,
> > > > -j80) the elapsed time went from around 9 minutes to over 17 minutes
> > > > and the maximum resident size (as reported by /usr/bin/time) from around
> > > > 500M to around 2G (I saw lots of cc1 processes over 2G in size).
> > > > 
> > > > For tomorrow's linux-next (well, later today :-() I will revert that
> > > > commit (and its child) when I merge the tip tree.    
> > > 
> > > Sorry about that, seems we can't avoid running into compiler problems with
> > > this lot. The good news is that there's a series to fix this here:
> > > 
> > > https://lore.kernel.org/r/20200521142047.169334-1-elver@google.com
> > > 
> > > so hopefully this be fixed in -tip soon (but I agree that reverting the
> > > thing in -next in the meantime makes sense).  
> > 
> > Unfortunately, the revert didn't work, so instead I have used the tip
> > tree from next-20200518 for today (hopefully this will all be sorted
> > out by Monday).
> 
> And the rcu tree has merged part of the tip tree that contains the
> offending commits, so I have used the version fo the rcu tree from
> next-20200519 for today.

Please accept my apologies for my part of this problem!  I don't see
the slowdowns on my normal test system (possibly due to gcc 4.8.5),
but I do see them on my laptop.

Marco, Thomas, is there any better setup I can provide Stephen?  Or
is the next-20200519 -rcu tree the best we have right now?

							Thanx, Paul
