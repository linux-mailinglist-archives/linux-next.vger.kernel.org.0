Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62985206ED4
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 10:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389184AbgFXITc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 04:19:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:47504 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388296AbgFXITb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 04:19:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CBEDEB12D;
        Wed, 24 Jun 2020 08:19:29 +0000 (UTC)
Date:   Wed, 24 Jun 2020 10:19:29 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200624081929.GD8444@alley>
References: <20200621131554.5a662afe@canb.auug.org.au>
 <20200623102655.6d16e610@canb.auug.org.au>
 <20200623121637.GA8444@alley>
 <20200623121937.GA9671@gondor.apana.org.au>
 <20200623142858.GB8444@alley>
 <20200624002057.GA12716@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624002057.GA12716@gondor.apana.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 2020-06-24 10:20:58, Herbert Xu wrote:
> On Tue, Jun 23, 2020 at 04:28:58PM +0200, Petr Mladek wrote:
> >
> > It is similar cycle:
> > 
> > spinlock_types.h -> lockdep.h -> printk.h -> ratelimit.h -> spinlock_types.h
> > 
> > But this time it happens via list.h -> kernel.h ->printk.h.
> > Where list.h needs READ_ONCE() stuff from compiler.h.
> 
> But this is exactly the loop that's fixed by the lockdep_types
> patch.

I think that this problem is similar to the one on s390 that was
solved by compiler.h in arch/s390/include/asm/bug.h

It is related to
https://lore.kernel.org/r/20200613142901.65xieioomt6bbqa6@ltop.local

It seems that we need the same change also in list.h.


> Did you get a compile failure with *just* the lockdep
> patch?

No, I see the problem only with both patches.


> > PS: And yes, it makes sense to push both patches via a single tree to
> > make sure that the lockdep.h split is done first.
> 
> OK, can I repost this patch with your ack then?

Do you mean to repost the 2nd patch with the change in
include/linux/list.h?

This would be great.

Best Regards,
Petr
