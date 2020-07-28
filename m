Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813AC22FF23
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 03:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgG1Bvc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 21:51:32 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:53540 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgG1Bvc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 21:51:32 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k0Elz-0000lp-Tb; Tue, 28 Jul 2020 11:51:21 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 28 Jul 2020 11:51:19 +1000
Date:   Tue, 28 Jul 2020 11:51:19 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200728015119.GA11428@gondor.apana.org.au>
References: <20200728114927.4590731f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728114927.4590731f@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 28, 2020 at 11:49:27AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the printk tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/printk.h:10,
>                  from include/linux/kernel.h:15,
>                  from include/linux/list.h:9,
>                  from include/linux/lockdep.h:43,
>                  from include/linux/spinlock_types.h:18,
>                  from include/linux/genalloc.h:32,
>                  from drivers/soc/fsl/qe/qe_common.c:16:
> include/linux/ratelimit_types.h:16:2: error: unknown type name 'raw_spinlock_t'
>    16 |  raw_spinlock_t lock;  /* protect the state */
>       |  ^~~~~~~~~~~~~~
> In file included from include/linux/wait.h:9,
>                  from include/linux/pid.h:6,
>                  from include/linux/sched.h:14,
>                  from include/linux/ratelimit.h:6,
>                  from include/linux/dev_printk.h:16,
>                  from include/linux/device.h:15,
>                  from include/linux/node.h:18,
>                  from include/linux/cpu.h:17,
>                  from include/linux/of_device.h:5,
>                  from drivers/soc/fsl/qe/qe_common.c:19:
> include/linux/ratelimit.h: In function 'ratelimit_state_init':
> include/linux/ratelimit.h:14:21: error: passing argument 1 of '__raw_spin_lock_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
>    14 |  raw_spin_lock_init(&rs->lock);
> include/linux/spinlock.h:102:24: note: in definition of macro 'raw_spin_lock_init'
>   102 |  __raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN); \
>       |                        ^~~~
> include/linux/spinlock.h:95:52: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'int *'
>    95 |   extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
>       |                                    ~~~~~~~~~~~~~~~~^~~~
> 
> Caused by commit
> 
>   b4a461e72bcb ("printk: Make linux/printk.h self-contained")
> 
> This *may* be interacting with other include file changes in linux-next.
> 
> I have reverted that commit for today.

This patch depends on two patches in the tips tree.  I presume
this build test was done without the tips tree, right?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
