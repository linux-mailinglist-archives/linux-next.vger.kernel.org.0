Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EA413C9D4
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 17:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgAOQmL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 11:42:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:34748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgAOQmK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Jan 2020 11:42:10 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 470312081E;
        Wed, 15 Jan 2020 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579106529;
        bh=vjko50FmDt2UVx7s7dkC4h+TY7ecAco1ZYFz1nhr/Q0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CrJcrB++nluNYKf/mwXWojkgdHPndUFdi30j3DWcEtQX+IjkjDKekXcJVeM3iZrot
         Wb1PfwS8oTXRhB751jRhOSLmfIQWUxetR5Hv/v8WZHbN5MQ7bnrTw3feD27iMCdvvC
         I0a5cTUF0382tLyvOBAoWVOuYRpxlrRrG63htL5c=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id F25083520BAE; Wed, 15 Jan 2020 08:42:08 -0800 (PST)
Date:   Wed, 15 Jan 2020 08:42:08 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Eric Dumazet <edumazet@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20200115164208.GA14832@paulmck-ThinkPad-P72>
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

On Wed, Dec 11, 2019 at 10:57:24PM -0800, Eric Dumazet wrote:
> On Wed, Dec 11, 2019 at 10:38 PM Eric Dumazet <edumazet@google.com> wrote:
> > On Wed, Dec 11, 2019 at 10:02 PM Paul E. McKenney <paulmck@kernel.org> wrote:
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

Apologies for the delay, fat fingers and holidays...  :-/

I folded this into your earlier patch, resulting in the patch at the
end.  Could you please let me know whether this matches your intent?

							Thanx, Paul

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
> 
------------------------------------------------------------------------

commit 704c46852c8f8c15cc0ecb45b19f8d3cd983faa6
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Nov 7 11:37:38 2019 -0800

    timer: Use hlist_unhashed_lockless() in timer_pending()
    
    The timer_pending() function is mostly used in lockless contexts, so
    Without proper annotations, KCSAN might detect a data-race [1].
    
    Using hlist_unhashed_lockless() instead of hand-coding it seems
    appropriate (as suggested by Paul E. McKenney).
    
    [1]
    
    BUG: KCSAN: data-race in del_timer / detach_if_pending
    
    write to 0xffff88808697d870 of 8 bytes by task 10 on cpu 0:
     __hlist_del include/linux/list.h:764 [inline]
     detach_timer kernel/time/timer.c:815 [inline]
     detach_if_pending+0xcd/0x2d0 kernel/time/timer.c:832
     try_to_del_timer_sync+0x60/0xb0 kernel/time/timer.c:1226
     del_timer_sync+0x6b/0xa0 kernel/time/timer.c:1365
     schedule_timeout+0x2d2/0x6e0 kernel/time/timer.c:1896
     rcu_gp_fqs_loop+0x37c/0x580 kernel/rcu/tree.c:1639
     rcu_gp_kthread+0x143/0x230 kernel/rcu/tree.c:1799
     kthread+0x1d4/0x200 drivers/block/aoe/aoecmd.c:1253
     ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:352
    
    read to 0xffff88808697d870 of 8 bytes by task 12060 on cpu 1:
     del_timer+0x3b/0xb0 kernel/time/timer.c:1198
     sk_stop_timer+0x25/0x60 net/core/sock.c:2845
     inet_csk_clear_xmit_timers+0x69/0xa0 net/ipv4/inet_connection_sock.c:523
     tcp_clear_xmit_timers include/net/tcp.h:606 [inline]
     tcp_v4_destroy_sock+0xa3/0x3f0 net/ipv4/tcp_ipv4.c:2096
     inet_csk_destroy_sock+0xf4/0x250 net/ipv4/inet_connection_sock.c:836
     tcp_close+0x6f3/0x970 net/ipv4/tcp.c:2497
     inet_release+0x86/0x100 net/ipv4/af_inet.c:427
     __sock_release+0x85/0x160 net/socket.c:590
     sock_close+0x24/0x30 net/socket.c:1268
     __fput+0x1e1/0x520 fs/file_table.c:280
     ____fput+0x1f/0x30 fs/file_table.c:313
     task_work_run+0xf6/0x130 kernel/task_work.c:113
     tracehook_notify_resume include/linux/tracehook.h:188 [inline]
     exit_to_usermode_loop+0x2b4/0x2c0 arch/x86/entry/common.c:163
    
    Reported by Kernel Concurrency Sanitizer on:
    CPU: 1 PID: 12060 Comm: syz-executor.5 Not tainted 5.4.0-rc3+ #0
    Hardware name: Google Google Compute Engine/Google Compute Engine,
    
    Signed-off-by: Eric Dumazet <edumazet@google.com>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    [ paulmck: Pulled in Eric's later amendments. ]
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 1e6650e..0dc19a8 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -164,7 +164,7 @@ static inline void destroy_timer_on_stack(struct timer_list *timer) { }
  */
 static inline int timer_pending(const struct timer_list * timer)
 {
-	return timer->entry.pprev != NULL;
+	return !hlist_unhashed_lockless(&timer->entry);
 }
 
 extern void add_timer_on(struct timer_list *timer, int cpu);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4820823..568564a 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -944,6 +944,7 @@ static struct timer_base *lock_timer_base(struct timer_list *timer,
 
 #define MOD_TIMER_PENDING_ONLY		0x01
 #define MOD_TIMER_REDUCE		0x02
+#define MOD_TIMER_NOTPENDING		0x04
 
 static inline int
 __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int options)
@@ -960,7 +961,7 @@ __mod_timer(struct timer_list *timer, unsigned long expires, unsigned int option
 	 * the timer is re-modified to have the same timeout or ends up in the
 	 * same array bucket then just return:
 	 */
-	if (timer_pending(timer)) {
+	if (!(options & MOD_TIMER_NOTPENDING) && timer_pending(timer)) {
 		/*
 		 * The downside of this optimization is that it can result in
 		 * larger granularity than you would get from adding a new
@@ -1133,7 +1134,7 @@ EXPORT_SYMBOL(timer_reduce);
 void add_timer(struct timer_list *timer)
 {
 	BUG_ON(timer_pending(timer));
-	mod_timer(timer, timer->expires);
+	__mod_timer(timer, timer->expires, MOD_TIMER_NOTPENDING);
 }
 EXPORT_SYMBOL(add_timer);
 
@@ -1891,7 +1892,7 @@ signed long __sched schedule_timeout(signed long timeout)
 
 	timer.task = current;
 	timer_setup_on_stack(&timer.timer, process_timeout, 0);
-	__mod_timer(&timer.timer, expire, 0);
+	__mod_timer(&timer.timer, expire, MOD_TIMER_NOTPENDING);
 	schedule();
 	del_singleshot_timer_sync(&timer.timer);
 
