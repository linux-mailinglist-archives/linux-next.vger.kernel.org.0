Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195E6231ECF
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 14:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgG2MwB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 08:52:01 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:60260 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG2MwA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 08:52:00 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k0lYf-00014G-0e; Wed, 29 Jul 2020 22:51:46 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 29 Jul 2020 22:51:44 +1000
Date:   Wed, 29 Jul 2020 22:51:44 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     peterz@infradead.org
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
Message-ID: <20200729125144.GA7184@gondor.apana.org.au>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <20200729124744.GC2638@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729124744.GC2638@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 02:47:44PM +0200, peterz@infradead.org wrote:
>
> How did you run into this, I haven't seen any build failures due to
> this.

I didn't, Stephen ran into it after merging the printk tree together
with the powerpc tree:

https://lore.kernel.org/lkml/20200729210311.425d0e9b@canb.auug.org.au/

> Anyway, the patches look sane enough, I'll go stick them in
> tip/locking/core or somesuch.

Perhaps add them on top of the other two patches in locking/header?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
