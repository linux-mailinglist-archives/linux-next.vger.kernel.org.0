Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC3E26C92C
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 21:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgIPTEG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 15:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbgIPRrx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 13:47:53 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F402C0A891E;
        Wed, 16 Sep 2020 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=os9g7IJhG068W8FYbVYgpSmom7qPddzCscd5KjEoqmE=; b=s7X9z9XhVbynzB3MjsNIvtvFZj
        UNElMOO1w93zGD0GMm1bGna7yo0goX8Fqzo3XzjSt20qk1J2yC0KpvETxyM9r2g652/tacSDnmcwD
        vv78RjNByw6TkL0NZInrmNl3Z4U3AXf3EdbMb6aMNsYUBsnKCMAsvbOpgqLqajV9Bvd4gp+YxOF0d
        XIqSU7Q3mGqErbzJmP8qkqIJDtUuHzT8ae1KZK/4b0snlCPNppEAvUX+CuBZ7/2Qh6Tg4AYmORBvS
        TOjHiEYZVyRYDEpmaSl/LOFhTfbtPyL7H9ILDVnIsTrFj0UVe1cSvsebruRsEnobwBM9RjXEMv2nj
        DbGZmYkQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIX51-0002q3-5A; Wed, 16 Sep 2020 13:02:35 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B51F83011FE;
        Wed, 16 Sep 2020 15:02:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 604F42B9285C6; Wed, 16 Sep 2020 15:02:33 +0200 (CEST)
Date:   Wed, 16 Sep 2020 15:02:33 +0200
From:   peterz@infradead.org
To:     Qian Cai <caiqian@redhat.com>
Cc:     Qian Cai <cai@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Sebastian A. Siewior" <bigeasy@linutronix.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
        Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 0/5] seqlock: Introduce PREEMPT_RT support
Message-ID: <20200916130233.GS2674@hirez.programming.kicks-ass.net>
References: <20200904153231.11994-1-a.darwish@linutronix.de>
 <224bd11b533dd2acff3f6cce51ab4ca676eb4f9f.camel@redhat.com>
 <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20200915143028.GB2674@hirez.programming.kicks-ass.net>
 <32bfdec1ad4e11cfecd840e1b83d95ba2bab1abc.camel@redhat.com>
 <20200916125402.GR2674@hirez.programming.kicks-ass.net>
 <1750732498.13475000.1600261259894.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1750732498.13475000.1600261259894.JavaMail.zimbra@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 16, 2020 at 09:00:59AM -0400, Qian Cai wrote:
> 
> 
> ----- Original Message -----
> > On Wed, Sep 16, 2020 at 08:52:07AM -0400, Qian Cai wrote:
> > > On Tue, 2020-09-15 at 16:30 +0200, peterz@infradead.org wrote:
> > > > On Tue, Sep 15, 2020 at 08:48:17PM +0800, Boqun Feng wrote:
> > > > > I think this happened because seqcount_##lockname##_init() is defined
> > > > > at
> > > > > function rather than macro, so when the seqcount_init() gets expand in
> > > > 
> > > > Bah! I hate all this :/
> > > > 
> > > > I suspect the below, while more verbose than I'd like is the best
> > > > option.
> > > 
> > > Stephen, can you add this patch for now until Peter beats you to it?
> > 
> > Did you verify it works? I only wrote it..
> 
> Yes, I did.

Excellent, I'll stick a Tested-by from you on then.
