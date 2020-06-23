Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A4C205232
	for <lists+linux-next@lfdr.de>; Tue, 23 Jun 2020 14:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732487AbgFWMQk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 08:16:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:49116 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732458AbgFWMQk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 08:16:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9D3BCAD5D;
        Tue, 23 Jun 2020 12:16:38 +0000 (UTC)
Date:   Tue, 23 Jun 2020 14:16:38 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200623121637.GA8444@alley>
References: <20200621131554.5a662afe@canb.auug.org.au>
 <20200623102655.6d16e610@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623102655.6d16e610@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 2020-06-23 10:26:55, Stephen Rothwell wrote:
> Hi Stephen,
> 
> On Sun, 21 Jun 2020 13:15:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > After merging the printk tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > In file included from include/linux/printk.h:10,
> >                  from include/linux/kernel.h:15,
> >                  from include/linux/list.h:9,
> >                  from include/linux/lockdep.h:43,
> >                  from include/linux/spinlock_types.h:18,
> >                  from include/linux/genalloc.h:32,
> >                  from drivers/soc/fsl/qe/qe_common.c:16:
> > include/linux/ratelimit_types.h:16:2: error: unknown type name 'raw_spinlock_t'
> >    16 |  raw_spinlock_t lock;  /* protect the state */
> >       |  ^~~~~~~~~~~~~~
> > In file included from include/linux/wait.h:9,
> >                  from include/linux/pid.h:6,
> >                  from include/linux/sched.h:14,
> >                  from include/linux/ratelimit.h:6,
> >                  from include/linux/dev_printk.h:16,
> >                  from include/linux/device.h:15,
> >                  from include/linux/node.h:18,
> >                  from include/linux/cpu.h:17,
> >                  from include/linux/of_device.h:5,
> >                  from drivers/soc/fsl/qe/qe_common.c:19:
> > include/linux/ratelimit.h: In function 'ratelimit_state_init':
> > include/linux/ratelimit.h:14:21: error: passing argument 1 of '__raw_spin_lock_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
> >    14 |  raw_spin_lock_init(&rs->lock);
> > include/linux/spinlock.h:102:24: note: in definition of macro 'raw_spin_lock_init'
> >   102 |  __raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN); \
> >       |                        ^~~~
> > include/linux/spinlock.h:95:52: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'int *'
> >    95 |   extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
> >       |                                    ~~~~~~~~~~~~~~~~^~~~
> > 
> > Caused by commit
> > 
> >   494c8512c90e ("printk: Make linux/printk.h self-contained")
> > 
> > changing include files is hadrer than it loooks :-(
> > 
> > I have used the printk tree from next-20200618 for today.
> 
> I am still getting this failure.

I have removed the problematic commit for now. It tried to remove
some cyclic dependencies from heavily used include files. It clearly
needs more love.

I am sorry for the late reaction. I have semi-lost mails from last 4 days.
I am still trying to recover them.

Best Regards,
Petr
