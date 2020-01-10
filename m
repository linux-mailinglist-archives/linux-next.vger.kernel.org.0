Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61C1A1378C5
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 22:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgAJV6C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 16:58:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:43278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgAJV6B (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jan 2020 16:58:01 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8620F20721;
        Fri, 10 Jan 2020 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578693479;
        bh=SQdZq/p+dzGMDqi7hSyWDXx9xlXOCLYPTg0nUfBK3L8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=TuNDvWyDqmxhbw7f2e8GPUwsXFjAaNLs3mRSDlxPNfQjvoDf7hKuwVDTTWsa7bsZ5
         H7P7PKcfRcTxeZFNbi5RKs/NKoMearXMegPBzLfT6REHWSLKskoEZul7qPrXVJZZRd
         sCr3joS+Y/zavcTu8oS2Mve21wzOv//Gy2iGLIe8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 32D5E352274B; Fri, 10 Jan 2020 13:57:59 -0800 (PST)
Date:   Fri, 10 Jan 2020 13:57:59 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Eric Dumazet <edumazet@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20200110215759.GA2216@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191212160622.021517d3@canb.auug.org.au>
 <20191212060200.GW2889@paulmck-ThinkPad-P72>
 <CANn89iKJhsMLUBNbkXSr1+t+38POFU8jWrP+tU3JWLjs__HuPw@mail.gmail.com>
 <CANn89i+xomdo4HFqewrfNf_Z4Q5ayXuW6A4SjSkE46JXP9KuFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn89i+xomdo4HFqewrfNf_Z4Q5ayXuW6A4SjSkE46JXP9KuFw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Please accept my apologies for losing track of this one, and for
top-posting to any of you who might be sticklers for that sort of thing.
I must pull this commit out of my set for the next merge window, apply
it to the group for the next merge window, and try out Eric's suggested
changes.  Might still make the next merge window, but clearly not in
its current condition.

If it has taken some other path in the meantime, please do let me know!

							Thanx, Paul

On Wed, Dec 11, 2019 at 10:57:24PM -0800, Eric Dumazet wrote:
> On Wed, Dec 11, 2019 at 10:38 PM Eric Dumazet <edumazet@google.com> wrote:
> >
> > On Wed, Dec 11, 2019 at 10:02 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Thu, Dec 12, 2019 at 04:06:22PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > After merging the rcu (I think) tree, today's linux-next build (x86_64
> > > > allnoconfig) produced this warning:
> > > >
> > > > kernel/time/timer.c: In function 'schedule_timeout':
> > > > kernel/time/timer.c:969:20: warning: 'timer.expires' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > > >   969 |   long diff = timer->expires - expires;
> > > >       |               ~~~~~^~~~~~~~~
> > > >
> > > > Introduced by (bisected to) commit
> > > >
> > > >   c4127fce1d02 ("timer: Use hlist_unhashed_lockless() in timer_pending()")
> > > >
> > > > x86_64-linux-gnu-gcc (Debian 9.2.1-21) 9.2.1 20191130
> > >
> > > Well, if the timer is pending, then ->expires has to have been
> > > initialized, but off where the compiler cannot see it, such as during a
> > > previous call to __mod_timer().  And the change may have made it harder
> > > for the compiler to see all of these relationships, but...
> > >
> > > I don't see this warning with gcc version 7.4.0.  Just out of curiosity,
> > > what are you running, Stephen?
> > >
> > > Eric, any thoughts for properly educating the compiler on this one?
> >
> > Ah... the READ_ONCE() apparently turns off the compiler ability to
> > infer that this branch should not be taken.
> >
> > Since __mod_timer() is inlined we could perhaps add a new option
> >
> > diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> > index 4820823515e9..8bbce552568b 100644
> > --- a/kernel/time/timer.c
> > +++ b/kernel/time/timer.c
> > @@ -944,6 +944,7 @@ static struct timer_base *lock_timer_base(struct
> > timer_list *timer,
> >
> >  #define MOD_TIMER_PENDING_ONLY         0x01
> >  #define MOD_TIMER_REDUCE               0x02
> > +#define MOD_TIMER_NOTPENDING           0x04
> >
> >  static inline int
> >  __mod_timer(struct timer_list *timer, unsigned long expires, unsigned
> > int options)
> > @@ -960,7 +961,7 @@ __mod_timer(struct timer_list *timer, unsigned
> > long expires, unsigned int option
> >          * the timer is re-modified to have the same timeout or ends up in the
> >          * same array bucket then just return:
> >          */
> > -       if (timer_pending(timer)) {
> > +       if (!(options & MOD_TIMER_NOTPENDING) && timer_pending(timer)) {
> >                 /*
> >                  * The downside of this optimization is that it can result in
> >                  * larger granularity than you would get from adding a new
> > @@ -1891,7 +1892,7 @@ signed long __sched schedule_timeout(signed long timeout)
> >
> >         timer.task = current;
> >         timer_setup_on_stack(&timer.timer, process_timeout, 0);
> > -       __mod_timer(&timer.timer, expire, 0);
> > +       __mod_timer(&timer.timer, expire, MOD_TIMER_NOTPENDING);
> >         schedule();
> >         del_singleshot_timer_sync(&timer.timer);
> 
> 
> Also add_timer() can benefit from the same hint, since it seems inlined as well.
> 
> (untested patch)
> 
> diff --git a/kernel/time/timer.c b/kernel/time/timer.c
> index 4820823515e9..568564ae3597 100644
> --- a/kernel/time/timer.c
> +++ b/kernel/time/timer.c
> @@ -944,6 +944,7 @@ static struct timer_base *lock_timer_base(struct
> timer_list *timer,
> 
>  #define MOD_TIMER_PENDING_ONLY         0x01
>  #define MOD_TIMER_REDUCE               0x02
> +#define MOD_TIMER_NOTPENDING           0x04
> 
>  static inline int
>  __mod_timer(struct timer_list *timer, unsigned long expires, unsigned
> int options)
> @@ -960,7 +961,7 @@ __mod_timer(struct timer_list *timer, unsigned
> long expires, unsigned int option
>          * the timer is re-modified to have the same timeout or ends up in the
>          * same array bucket then just return:
>          */
> -       if (timer_pending(timer)) {
> +       if (!(options & MOD_TIMER_NOTPENDING) && timer_pending(timer)) {
>                 /*
>                  * The downside of this optimization is that it can result in
>                  * larger granularity than you would get from adding a new
> @@ -1133,7 +1134,7 @@ EXPORT_SYMBOL(timer_reduce);
>  void add_timer(struct timer_list *timer)
>  {
>         BUG_ON(timer_pending(timer));
> -       mod_timer(timer, timer->expires);
> +       __mod_timer(timer, timer->expires, MOD_TIMER_NOTPENDING);
>  }
>  EXPORT_SYMBOL(add_timer);
> 
> @@ -1891,7 +1892,7 @@ signed long __sched schedule_timeout(signed long timeout)
> 
>         timer.task = current;
>         timer_setup_on_stack(&timer.timer, process_timeout, 0);
> -       __mod_timer(&timer.timer, expire, 0);
> +       __mod_timer(&timer.timer, expire, MOD_TIMER_NOTPENDING);
>         schedule();
>         del_singleshot_timer_sync(&timer.timer);
