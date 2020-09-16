Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE7D26C786
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 20:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgIPS32 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 14:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgIPS2w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 14:28:52 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9B4C0A8895;
        Wed, 16 Sep 2020 05:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=3fsuI9w5GdoIgxeD1xv5qa75sHOHCTimKxD8QqBKKvM=; b=jlXXu49/jB89TDAuiJwrD8HRAS
        SHqt4hS3yNU6uPG9WnxXbo1RnlYY+wGBcvWMQ+XvDifTL8dN472JqW6xcTzUcnohkmbcE9EINw1Ov
        Bg2kT+yGHOg6OYKgEQMwWL+H/JezTCFvZmrnycvcyBtJcQ8IZ/t72tN8cTYFoKbhLvmYHZtGv4yLq
        DqJNdcmUHWBzshsvkiEgRQWzNr84Q+Iqx2ENzvimsHDuRbYz6X0qa5Da8l6mDWHdp6cNHo0h8IkLe
        PEqqaKlvKomk7GUQygg9XTNPDm+F9WoABVU00pS3fgEzjCQ8cN9Uohn+oRvUkr/ikmgfCODioV0Ca
        d7MTghBg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIWwn-0002Cn-1a; Wed, 16 Sep 2020 12:54:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 85BC13011FE;
        Wed, 16 Sep 2020 14:54:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id CD1522B9285CC; Wed, 16 Sep 2020 14:54:02 +0200 (CEST)
Date:   Wed, 16 Sep 2020 14:54:02 +0200
From:   peterz@infradead.org
To:     Qian Cai <cai@redhat.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>,
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
Message-ID: <20200916125402.GR2674@hirez.programming.kicks-ass.net>
References: <20200904153231.11994-1-a.darwish@linutronix.de>
 <224bd11b533dd2acff3f6cce51ab4ca676eb4f9f.camel@redhat.com>
 <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20200915143028.GB2674@hirez.programming.kicks-ass.net>
 <32bfdec1ad4e11cfecd840e1b83d95ba2bab1abc.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32bfdec1ad4e11cfecd840e1b83d95ba2bab1abc.camel@redhat.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 16, 2020 at 08:52:07AM -0400, Qian Cai wrote:
> On Tue, 2020-09-15 at 16:30 +0200, peterz@infradead.org wrote:
> > On Tue, Sep 15, 2020 at 08:48:17PM +0800, Boqun Feng wrote:
> > > I think this happened because seqcount_##lockname##_init() is defined at
> > > function rather than macro, so when the seqcount_init() gets expand in
> > 
> > Bah! I hate all this :/
> > 
> > I suspect the below, while more verbose than I'd like is the best
> > option.
> 
> Stephen, can you add this patch for now until Peter beats you to it?

Did you verify it works? I only wrote it..
