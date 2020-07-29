Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CFD232051
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 16:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgG2O2h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 10:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2O2h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 10:28:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B12DC061794;
        Wed, 29 Jul 2020 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=j7J+8IFHz7tKb8YkkQrUNb0ussI4BwqU+bhTdxZABRY=; b=aHnINAFJCdMeYdT5R1b1cHYnSI
        Pypc7Ju4dMlan2jHmHRngCIUvi2QD4+Rl2Gzkdow2zO2iiybiHotaTxsV8cZG/8bo2jfoN0R/j7kW
        zfVBGV8uFXIw9gQH4wPUWy3gAB+X4Th+v5wKN88ROCcn2ZXwUXSyF+/ciDCHCsBzXgPwDfGK+5awW
        +ovU03Vz+FLvkTKbeEJoFAX16Bl9pUyV4NYGi8cpQBvJXVr94wzveFSDSlunl0F1Tu2BP6ASnc2Q6
        cf3i5G+88//EUtRySMyrcbfzR4VKDmyKHLJ7D+eIJrfI2X4xRO+eTC2rg6Qjlft7cKFfhrSRZOYZv
        nj4HWmAg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k0n41-0002T4-TP; Wed, 29 Jul 2020 14:28:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 289B1304B6D;
        Wed, 29 Jul 2020 16:28:13 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 13E01203AADC0; Wed, 29 Jul 2020 16:28:13 +0200 (CEST)
Date:   Wed, 29 Jul 2020 16:28:13 +0200
From:   peterz@infradead.org
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Message-ID: <20200729142813.GD2638@hirez.programming.kicks-ass.net>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <20200729124744.GC2638@hirez.programming.kicks-ass.net>
 <20200729125144.GA7184@gondor.apana.org.au>
 <20200729130000.GA2655@hirez.programming.kicks-ass.net>
 <20200729132849.GA1160@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729132849.GA1160@jagdpanzerIV.localdomain>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 10:28:49PM +0900, Sergey Senozhatsky wrote:
> On (20/07/29 15:00), peterz@infradead.org wrote:
> > On Wed, Jul 29, 2020 at 10:51:44PM +1000, Herbert Xu wrote:
> > > On Wed, Jul 29, 2020 at 02:47:44PM +0200, peterz@infradead.org wrote:
> > > >
> [..]
> > > > Anyway, the patches look sane enough, I'll go stick them in
> > > > tip/locking/core or somesuch.
> > > 
> > > Perhaps add them on top of the other two patches in locking/header?
> > 
> > Can do,
> 
> locking/header would be better

Done.
