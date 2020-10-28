Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327F629D351
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 22:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgJ1VmZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 17:42:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgJ1VmY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 17:42:24 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19729246CD;
        Wed, 28 Oct 2020 21:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603918949;
        bh=+Cj4JDv/9Kdz/kOl1C3lm3VVi/UOikFi55ZuJNA/YoI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=us4bztrI2KapLmU1CUulDdhGbWUnIfT0eq/O/r7fhD/uj1XbHv/m0fp59fI6Q6/ru
         b9toWkeNm6ZmXCQHNgJQkal5IBZV89lV/0ZK5Xdn6K8bdbVp8uLd5lEhjPX7erC+Ub
         AZ3EziopAvHlTGvy2wkA7iesN2CZyU4nwB2Kke6Q=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id B408435229CE; Wed, 28 Oct 2020 14:02:28 -0700 (PDT)
Date:   Wed, 28 Oct 2020 14:02:28 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Qian Cai <cai@redhat.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201028210228.GI3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <1db80eb9676124836809421e85e1aa782c269a80.camel@redhat.com>
 <20201028030130.GB3249@paulmck-ThinkPad-P72>
 <8194dca3b2e871f04c7f6e49672837f8df22546f.camel@redhat.com>
 <20201028155328.GC3249@paulmck-ThinkPad-P72>
 <7cd579ccdacb4f672cf2dc3a0d4553d1845e7ebf.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cd579ccdacb4f672cf2dc3a0d4553d1845e7ebf.camel@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 28, 2020 at 04:08:59PM -0400, Qian Cai wrote:
> On Wed, 2020-10-28 at 08:53 -0700, Paul E. McKenney wrote:
> > On Wed, Oct 28, 2020 at 10:39:47AM -0400, Qian Cai wrote:
> > > On Tue, 2020-10-27 at 20:01 -0700, Paul E. McKenney wrote:
> > > > If I have the right email thread associated with the right fixes, these
> > > > commits in -rcu should be what you are looking for:
> > > > 
> > > > 73b658b6b7d5 ("rcu: Prevent lockdep-RCU splats on lock
> > > > acquisition/release")
> > > > 626b79aa935a ("x86/smpboot:  Move rcu_cpu_starting() earlier")
> > > > 
> > > > And maybe this one as well:
> > > > 
> > > > 3a6f638cb95b ("rcu,ftrace: Fix ftrace recursion")
> > > > 
> > > > Please let me know if these commits do not fix things.
> > > While those patches silence the warnings for x86. Other arches are still
> > > suffering. It is only after applying the patch from Boqun below fixed
> > > everything.
> > 
> > Fair point!
> > 
> > > Is it a good idea for Boqun to write a formal patch or we should fix all
> > > arches
> > > individually like "x86/smpboot: Move rcu_cpu_starting() earlier"?
> > 
> > By Boqun's patch, you mean the change to debug_lockdep_rcu_enabled()
> > shown below?  Peter Zijlstra showed that real failures can happen, so we
> 
> Yes.
> 
> > do not want to cover them up.  So we are firmly in "fix all architectures"
> > space here, sorry!
> > 
> > I am happy to accumulate those patches, but cannot commit to creating
> > or testing them.
> 
> Okay, I posted 3 patches for each arch and CC'ed you.

Very good!  I have acked them.

>                                                       BTW, it looks like
> something is wrong on @vger.kernel.org today where I received many of those,
> 
> 4.7.1 Hello [216.205.24.124], for recipient address <linux-kernel@vger.kernel.org> the policy analysis reported: zpostgrey: connect: Connection refused
> 
> and I can see your previous mails did not even reach there either.
> 
> https://lore.kernel.org/lkml/

It does seem to be having some difficulty, and some people are looking
into it.  Hopefully soon someone who can actually make the needed
changes.  ;-)

							Thanx, Paul
