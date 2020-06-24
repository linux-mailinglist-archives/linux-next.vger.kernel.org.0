Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEA42068F0
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 02:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387831AbgFXAVY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 20:21:24 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:47114 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387693AbgFXAVX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 20:21:23 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jnt9u-0007Sc-28; Wed, 24 Jun 2020 10:20:59 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 24 Jun 2020 10:20:58 +1000
Date:   Wed, 24 Jun 2020 10:20:58 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200624002057.GA12716@gondor.apana.org.au>
References: <20200621131554.5a662afe@canb.auug.org.au>
 <20200623102655.6d16e610@canb.auug.org.au>
 <20200623121637.GA8444@alley>
 <20200623121937.GA9671@gondor.apana.org.au>
 <20200623142858.GB8444@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623142858.GB8444@alley>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 23, 2020 at 04:28:58PM +0200, Petr Mladek wrote:
>
> It is similar cycle:
> 
> spinlock_types.h -> lockdep.h -> printk.h -> ratelimit.h -> spinlock_types.h
> 
> But this time it happens via list.h -> kernel.h ->printk.h.
> Where list.h needs READ_ONCE() stuff from compiler.h.

But this is exactly the loop that's fixed by the lockdep_types
patch.  Did you get a compile failure with *just* the lockdep
patch?

> PS: And yes, it makes sense to push both patches via a single tree to
> make sure that the lockdep.h split is done first.

OK, can I repost this patch with your ack then?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
