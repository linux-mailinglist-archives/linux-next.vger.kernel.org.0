Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C47209C8A
	for <lists+linux-next@lfdr.de>; Thu, 25 Jun 2020 12:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390386AbgFYKLZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Jun 2020 06:11:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:42784 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389777AbgFYKLY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jun 2020 06:11:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id EE18AB020;
        Thu, 25 Jun 2020 10:11:21 +0000 (UTC)
Date:   Thu, 25 Jun 2020 12:11:19 +0200
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
Subject: Re: [PATCH] lockdep: Move list.h inclusion into lockdep.h
Message-ID: <20200625101119.GG8444@alley>
References: <20200621131554.5a662afe@canb.auug.org.au>
 <20200623102655.6d16e610@canb.auug.org.au>
 <20200623121637.GA8444@alley>
 <20200623121937.GA9671@gondor.apana.org.au>
 <20200623142858.GB8444@alley>
 <20200624124212.GA17350@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624124212.GA17350@gondor.apana.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 2020-06-24 22:42:12, Herbert Xu wrote:
> On Tue, Jun 23, 2020 at 04:28:58PM +0200, Petr Mladek wrote:
> >
> > My "allmodconfig" build has successfully finished with the following extra
> >  fix on top of the two patches:
> > 
> > diff --git a/include/linux/list.h b/include/linux/list.h
> > index aff44d34f4e4..6d606c4036ce 100644
> > --- a/include/linux/list.h
> > +++ b/include/linux/list.h
> > @@ -6,7 +6,7 @@
> >  #include <linux/stddef.h>
> >  #include <linux/poison.h>
> >  #include <linux/const.h>
> > -#include <linux/kernel.h>
> > +#include <linux/compiler.h>
> 
> Unfortunately this doesn't work because list.h actually does need
> kernel.h for container_of.

Ah, I see.

> However, we can easily fix the loop another way by removing list.h
> from lockdep.h as it doesn't actually use any list macros/functions
> but only the list type which is now in linux/types.h.
> 
> We could either fold this into the lockdep_types patch, or fold it
> into the printk patch, or just leave it as a standalone patch.
> What do you guys think?

It logically belongs to the lockdep_types area.

I think that separate patch is the best solution so that Peter does
not need to rebase tip/locking/header.

> 
> ---8<---
> Currently lockdep_types.h includes list.h without actually using any
> of its macros or functions.  All it needs are the type definitions
> which were moved into types.h long ago.  This potentially causes
> inclusion loops because both are included by many core header
> files.
> 
> This patch moves the list.h inclusion into lockdep.h.  Note that
> we could probably remove it completely but that could potentially
> result in compile failures should any end users not include list.h
> directly and also be unlucky enough to not get list.h via some other
> header file.
> 
> Reported-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

It works with allmodconfig here, so feel free to use:

Tested-by: Petr Mladek <pmladek@suse.com>

Of course, it does not have much value. There might still be another
configuration or architecture that does not work but I would leave
this for test bots.

Best Regards,
Petr

> 
> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> index 3b73cf84f77d..b1ad5c045353 100644
> --- a/include/linux/lockdep.h
> +++ b/include/linux/lockdep.h
> @@ -21,6 +21,7 @@ extern int lock_stat;
>  #ifdef CONFIG_LOCKDEP
>  
>  #include <linux/linkage.h>
> +#include <linux/list.h>
>  #include <linux/debug_locks.h>
>  #include <linux/stacktrace.h>
>  
> diff --git a/include/linux/lockdep_types.h b/include/linux/lockdep_types.h
> index 7b9350624577..bb35b449f533 100644
> --- a/include/linux/lockdep_types.h
> +++ b/include/linux/lockdep_types.h
> @@ -32,8 +32,6 @@ enum lockdep_wait_type {
>  
>  #ifdef CONFIG_LOCKDEP
>  
> -#include <linux/list.h>
> -
>  /*
>   * We'd rather not expose kernel/lockdep_states.h this wide, but we do need
>   * the total number of states... :-(
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
