Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70F726CDE8
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 23:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgIPVG5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 17:06:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21519 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726399AbgIPQOd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2020 12:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600272841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=npu0gC9sM6MERj6/pQxIj4SF007TuYAcmo+pEdbn1Ho=;
        b=iL8S8PmjXIVw1TgxYpr+urdNDrIYQgLBptRxFNVrBOPk6yhq4t/2hmJsYZiLD1twexKgPC
        IFhrqWwLM2LRD5IbcuM5rT9yTCkRHoGWjAm2IoqII9zm/9/MnboUCAFY8G0xsH6BMHmgmp
        A/+Nt4PYU/GYEoYK5/OSaeydE+1jsms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-dl85R3dsOhO1R8aT0Wv52g-1; Wed, 16 Sep 2020 09:01:02 -0400
X-MC-Unique: dl85R3dsOhO1R8aT0Wv52g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FFE10BBEC8;
        Wed, 16 Sep 2020 13:01:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BC285DE77;
        Wed, 16 Sep 2020 13:01:00 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id 031D118408A0;
        Wed, 16 Sep 2020 13:01:00 +0000 (UTC)
Date:   Wed, 16 Sep 2020 09:00:59 -0400 (EDT)
From:   Qian Cai <caiqian@redhat.com>
To:     peterz@infradead.org
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
Message-ID: <1750732498.13475000.1600261259894.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200916125402.GR2674@hirez.programming.kicks-ass.net>
References: <20200904153231.11994-1-a.darwish@linutronix.de> <224bd11b533dd2acff3f6cce51ab4ca676eb4f9f.camel@redhat.com> <20200915124817.GA127490@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net> <20200915143028.GB2674@hirez.programming.kicks-ass.net> <32bfdec1ad4e11cfecd840e1b83d95ba2bab1abc.camel@redhat.com> <20200916125402.GR2674@hirez.programming.kicks-ass.net>
Subject: Re: [PATCH v2 0/5] seqlock: Introduce PREEMPT_RT support
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.66.86, 10.4.195.1]
Thread-Topic: seqlock: Introduce PREEMPT_RT support
Thread-Index: Tg6sDWWWIDujY6pd6Ow2PSYcTCsq5g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



----- Original Message -----
> On Wed, Sep 16, 2020 at 08:52:07AM -0400, Qian Cai wrote:
> > On Tue, 2020-09-15 at 16:30 +0200, peterz@infradead.org wrote:
> > > On Tue, Sep 15, 2020 at 08:48:17PM +0800, Boqun Feng wrote:
> > > > I think this happened because seqcount_##lockname##_init() is defined
> > > > at
> > > > function rather than macro, so when the seqcount_init() gets expand in
> > > 
> > > Bah! I hate all this :/
> > > 
> > > I suspect the below, while more verbose than I'd like is the best
> > > option.
> > 
> > Stephen, can you add this patch for now until Peter beats you to it?
> 
> Did you verify it works? I only wrote it..

Yes, I did.

