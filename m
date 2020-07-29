Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D70C231EE1
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 15:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2NAW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 09:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2NAW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 09:00:22 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC12C061794;
        Wed, 29 Jul 2020 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=mcOIpDV+M0J7I0XahrK1k+ttDow4udPrlYyfrvSqrgw=; b=WXnUyM2x0YUnf9vWlcN4s4rAp3
        XxAAC613sO+oN9wfGq0W+ZInj32Thfp2EM37673G+FpBFuscZOQkIzG6z7Tjr9dO5XoGXCFYuci97
        zU7PX3wpvs4Fm/nB8B/4xujyTeDfeKWEbl0yiM+Qt4fGFk5XCnVIKOhAGVVJqsRO0UNga8o/wATbj
        2hfBtkNKMQFQNrK1sszdGoCqEdtRYKj3HQIXCjbFahuHUjE61JJuHd984oXWSBPHDmG4FY7P7otCb
        fpJGtkGn0dM8vp4/7BKyGkYYpXrp+DifY5QsteI1PgI1rrTraJ9iveW+mLz8Prm08ATsaTWtj7mve
        MCwqcfZA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k0lgh-0001xP-7t; Wed, 29 Jul 2020 13:00:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1FDA7304D28;
        Wed, 29 Jul 2020 15:00:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 0C4C7203D0689; Wed, 29 Jul 2020 15:00:01 +0200 (CEST)
Date:   Wed, 29 Jul 2020 15:00:00 +0200
From:   peterz@infradead.org
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Message-ID: <20200729130000.GA2655@hirez.programming.kicks-ass.net>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <20200729124744.GC2638@hirez.programming.kicks-ass.net>
 <20200729125144.GA7184@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729125144.GA7184@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 10:51:44PM +1000, Herbert Xu wrote:
> On Wed, Jul 29, 2020 at 02:47:44PM +0200, peterz@infradead.org wrote:
> >
> > How did you run into this, I haven't seen any build failures due to
> > this.
> 
> I didn't, Stephen ran into it after merging the printk tree together
> with the powerpc tree:
> 
> https://lore.kernel.org/lkml/20200729210311.425d0e9b@canb.auug.org.au/
> 
> > Anyway, the patches look sane enough, I'll go stick them in
> > tip/locking/core or somesuch.
> 
> Perhaps add them on top of the other two patches in locking/header?

Can do,
