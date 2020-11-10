Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591E22ADA3C
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 16:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732232AbgKJPV1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 10:21:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730368AbgKJPV1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Nov 2020 10:21:27 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4F482076E;
        Tue, 10 Nov 2020 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605021684;
        bh=18dC78Al9dSp7ZEY5nvrb7dCxWkKGvi51pt1aXBJfv0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=VinXIPkzhMS9GW1Iit5vds0rwLTH2BNRo1+5Stcuk7ZI8q6Heqa/7LzsvpjBX65YG
         xqU1td/4bc07pEE1agW9VOftbOs7LYo2ryb9RvsD3Ccb3A68HL9kQdKn67ULbrxvXi
         qm9Xk+VkLx26rxUl06muIliKeesaZhISYOuapBnk=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 3DD69352266B; Tue, 10 Nov 2020 07:21:24 -0800 (PST)
Date:   Tue, 10 Nov 2020 07:21:24 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warnings after merge of the rcu tree
Message-ID: <20201110152124.GR3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201110175952.062ff5dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110175952.062ff5dd@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 10, 2020 at 05:59:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> Documentation/RCU/Design/Requirements/Requirements.rst:119: WARNING: Malformed table.

My bad, apologies, queuing an alleged fix.

							Thanx, Paul

> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Wait a minute! You said that updaters can make useful forward         |
> | progress concurrently with readers, but pre-existing readers will     |
> | block synchronize_rcu()!!!                                        |
> | Just who are you trying to fool???                                    |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | First, if updaters do not wish to be blocked by readers, they can use |
> | call_rcu() or kfree_rcu(), which will be discussed later.     |
> | Second, even when using synchronize_rcu(), the other update-side  |
> | code does run concurrently with readers, whether pre-existing or not. |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:178: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Why is the synchronize_rcu() on line 28 needed?                   |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | Without that extra grace period, memory reordering could result in    |
> | do_something_dlm() executing do_something() concurrently with |
> | the last bits of recovery().                                      |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:289: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | But rcu_assign_pointer() does nothing to prevent the two          |
> | assignments to ``p->a`` and ``p->b`` from being reordered. Can't that |
> | also cause problems?                                                  |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | No, it cannot. The readers cannot see either of these two fields      |
> | until the assignment to ``gp``, by which time both fields are fully   |
> | initialized. So reordering the assignments to ``p->a`` and ``p->b``   |
> | cannot possibly cause any problems.                                   |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:430: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Without the rcu_dereference() or the rcu_access_pointer(),    |
> | what destructive optimizations might the compiler make use of?        |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | Let's start with what happens to do_something_gp() if it fails to |
> | use rcu_dereference(). It could reuse a value formerly fetched    |
> | from this same pointer. It could also fetch the pointer from ``gp``   |
> | in a byte-at-a-time manner, resulting in *load tearing*, in turn      |
> | resulting a bytewise mash-up of two distinct pointer values. It might |
> | even use value-speculation optimizations, where it makes a wrong      |
> | guess, but by the time it gets around to checking the value, an       |
> | update has changed the pointer to match the wrong guess. Too bad      |
> | about any dereferences that returned pre-initialization garbage in    |
> | the meantime!                                                         |
> | For remove_gp_synchronous(), as long as all modifications to      |
> | ``gp`` are carried out while holding ``gp_lock``, the above           |
> | optimizations are harmless. However, ``sparse`` will complain if you  |
> | define ``gp`` with ``__rcu`` and then access it without using either  |
> | rcu_access_pointer() or rcu_dereference().                    |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:513: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Given that multiple CPUs can start RCU read-side critical sections at |
> | any time without any ordering whatsoever, how can RCU possibly tell   |
> | whether or not a given RCU read-side critical section starts before a |
> | given instance of synchronize_rcu()?                              |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | If RCU cannot tell whether or not a given RCU read-side critical      |
> | section starts before a given instance of synchronize_rcu(), then |
> | it must assume that the RCU read-side critical section started first. |
> | In other words, a given instance of synchronize_rcu() can avoid   |
> | waiting on a given RCU read-side critical section only if it can      |
> | prove that synchronize_rcu() started first.                       |
> | A related question is “When rcu_read_lock() doesn't generate any  |
> | code, why does it matter how it relates to a grace period?” The       |
> | answer is that it is not the relationship of rcu_read_lock()      |
> | itself that is important, but rather the relationship of the code     |
> | within the enclosed RCU read-side critical section to the code        |
> | preceding and following the grace period. If we take this viewpoint,  |
> | then a given RCU read-side critical section begins before a given     |
> | grace period when some access preceding the grace period observes the |
> | effect of some access within the critical section, in which case none |
> | of the accesses within the critical section may observe the effects   |
> | of any access following the grace period.                             |
> |                                                                       |
> | As of late 2016, mathematical models of RCU take this viewpoint, for  |
> | example, see slides 62 and 63 of the `2016 LinuxCon                   |
> | EU <http://www2.rdrop.com/users/paulmck/scalability/paper/LinuxMM.201 |
> | 6.10.04c.LCE.pdf>`__                                                  |
> | presentation.                                                         |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:548: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | The first and second guarantees require unbelievably strict ordering! |
> | Are all these memory barriers *really* required?                      |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | Yes, they really are required. To see why the first guarantee is      |
> | required, consider the following sequence of events:                  |
> |                                                                       |
> | #. CPU 1: rcu_read_lock()                                         |
> | #. CPU 1: ``q = rcu_dereference(gp); /* Very likely to return p. */`` |
> | #. CPU 0: ``list_del_rcu(p);``                                        |
> | #. CPU 0: synchronize_rcu() starts.                               |
> | #. CPU 1: ``do_something_with(q->a);``                                |
> |    ``/* No smp_mb(), so might happen after kfree(). */``              |
> | #. CPU 1: rcu_read_unlock()                                       |
> | #. CPU 0: synchronize_rcu() returns.                              |
> | #. CPU 0: ``kfree(p);``                                               |
> |                                                                       |
> | Therefore, there absolutely must be a full memory barrier between the |
> | end of the RCU read-side critical section and the end of the grace    |
> | period.                                                               |
> |                                                                       |
> | The sequence of events demonstrating the necessity of the second rule |
> | is roughly similar:                                                   |
> |                                                                       |
> | #. CPU 0: ``list_del_rcu(p);``                                        |
> | #. CPU 0: synchronize_rcu() starts.                               |
> | #. CPU 1: rcu_read_lock()                                         |
> | #. CPU 1: ``q = rcu_dereference(gp);``                                |
> |    ``/* Might return p if no memory barrier. */``                     |
> | #. CPU 0: synchronize_rcu() returns.                              |
> | #. CPU 0: ``kfree(p);``                                               |
> | #. CPU 1: ``do_something_with(q->a); /* Boom!!! */``                  |
> | #. CPU 1: rcu_read_unlock()                                       |
> |                                                                       |
> | And similarly, without a memory barrier between the beginning of the  |
> | grace period and the beginning of the RCU read-side critical section, |
> | CPU 1 might end up accessing the freelist.                            |
> |                                                                       |
> | The “as if” rule of course applies, so that any implementation that   |
> | acts as if the appropriate memory barriers were in place is a correct |
> | implementation. That said, it is much easier to fool yourself into    |
> | believing that you have adhered to the as-if rule than it is to       |
> | actually adhere to it!                                                |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:597: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | You claim that rcu_read_lock() and rcu_read_unlock() generate |
> | absolutely no code in some kernel builds. This means that the         |
> | compiler might arbitrarily rearrange consecutive RCU read-side        |
> | critical sections. Given such rearrangement, if a given RCU read-side |
> | critical section is done, how can you be sure that all prior RCU      |
> | read-side critical sections are done? Won't the compiler              |
> | rearrangements make that impossible to determine?                     |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | In cases where rcu_read_lock() and rcu_read_unlock() generate |
> | absolutely no code, RCU infers quiescent states only at special       |
> | locations, for example, within the scheduler. Because calls to        |
> | schedule() had better prevent calling-code accesses to shared     |
> | variables from being rearranged across the call to schedule(), if |
> | RCU detects the end of a given RCU read-side critical section, it     |
> | will necessarily detect the end of all prior RCU read-side critical   |
> | sections, no matter how aggressively the compiler scrambles the code. |
> | Again, this all assumes that the compiler cannot scramble code across |
> | calls to the scheduler, out of interrupt handlers, into the idle      |
> | loop, into user-mode code, and so on. But if your kernel build allows |
> | that sort of scrambling, you have broken far more than just RCU!      |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:738: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Can't the compiler also reorder this code?                            |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | No, the volatile casts in READ_ONCE() and WRITE_ONCE()        |
> | prevent the compiler from reordering in this particular case.         |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:793: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Suppose that synchronize_rcu() did wait until *all* readers had       |
> | completed instead of waiting only on pre-existing readers. For how    |
> | long would the updater be able to rely on there being no readers?     |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | For no time at all. Even if synchronize_rcu() were to wait until  |
> | all readers had completed, a new reader might start immediately after |
> | synchronize_rcu() completed. Therefore, the code following        |
> | synchronize_rcu() can *never* rely on there being no readers.     |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:1087: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | What about sleeping locks?                                            |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | These are forbidden within Linux-kernel RCU read-side critical        |
> | sections because it is not legal to place a quiescent state (in this  |
> | case, voluntary context switch) within an RCU read-side critical      |
> | section. However, sleeping locks may be used within userspace RCU     |
> | read-side critical sections, and also within Linux-kernel sleepable   |
> | RCU `(SRCU) <#Sleepable%20RCU>`__ read-side critical sections. In     |
> | addition, the -rt patchset turns spinlocks into a sleeping locks so   |
> | that the corresponding critical sections can be preempted, which also |
> | means that these sleeplockified spinlocks (but not other sleeping     |
> | locks!) may be acquire within -rt-Linux-kernel RCU read-side critical |
> | sections.                                                             |
> | Note that it *is* legal for a normal RCU read-side critical section   |
> | to conditionally acquire a sleeping locks (as in                      |
> | mutex_trylock()), but only as long as it does not loop            |
> | indefinitely attempting to conditionally acquire that sleeping locks. |
> | The key point is that things like mutex_trylock() either return   |
> | with the mutex held, or return an error indication if the mutex was   |
> | not immediately available. Either way, mutex_trylock() returns    |
> | immediately without sleeping.                                         |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:1295: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Why does line 19 use rcu_access_pointer()? After all,             |
> | call_rcu() on line 25 stores into the structure, which would      |
> | interact badly with concurrent insertions. Doesn't this mean that     |
> | rcu_dereference() is required?                                    |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | Presumably the ``->gp_lock`` acquired on line 18 excludes any         |
> | changes, including any insertions that rcu_dereference() would    |
> | protect against. Therefore, any insertions will be delayed until      |
> | after ``->gp_lock`` is released on line 25, which in turn means that  |
> | rcu_access_pointer() suffices.                                    |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:1351: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Earlier it was claimed that call_rcu() and kfree_rcu()        |
> | allowed updaters to avoid being blocked by readers. But how can that  |
> | be correct, given that the invocation of the callback and the freeing |
> | of the memory (respectively) must still wait for a grace period to    |
> | elapse?                                                               |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | We could define things this way, but keep in mind that this sort of   |
> | definition would say that updates in garbage-collected languages      |
> | cannot complete until the next time the garbage collector runs, which |
> | does not seem at all reasonable. The key point is that in most cases, |
> | an updater using either call_rcu() or kfree_rcu() can proceed |
> | to the next update as soon as it has invoked call_rcu() or        |
> | kfree_rcu(), without having to wait for a subsequent grace        |
> | period.                                                               |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:1893: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | Wait a minute! Each RCU callbacks must wait for a grace period to     |
> | complete, and rcu_barrier() must wait for each pre-existing       |
> | callback to be invoked. Doesn't rcu_barrier() therefore need to   |
> | wait for a full grace period if there is even one callback posted     |
> | anywhere in the system?                                               |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | Absolutely not!!!                                                     |
> | Yes, each RCU callbacks must wait for a grace period to complete, but |
> | it might well be partly (or even completely) finished waiting by the  |
> | time rcu_barrier() is invoked. In that case, rcu_barrier()    |
> | need only wait for the remaining portion of the grace period to       |
> | elapse. So even if there are quite a few callbacks posted,            |
> | rcu_barrier() might well return quite quickly.                    |
> |                                                                       |
> | So if you need to wait for a grace period as well as for all          |
> | pre-existing callbacks, you will need to invoke both                  |
> | synchronize_rcu() and rcu_barrier(). If latency is a concern, |
> | you can always use workqueues to invoke them concurrently.            |
> +-----------------------------------------------------------------------+
> Documentation/RCU/Design/Requirements/Requirements.rst:2220: WARNING: Malformed table.
> 
> +-----------------------------------------------------------------------+
> | **Quick Quiz**:                                                       |
> +-----------------------------------------------------------------------+
> | But what if my driver has a hardware interrupt handler that can run   |
> | for many seconds? I cannot invoke schedule() from an hardware     |
> | interrupt handler, after all!                                         |
> +-----------------------------------------------------------------------+
> | **Answer**:                                                           |
> +-----------------------------------------------------------------------+
> | One approach is to do ``rcu_irq_exit();rcu_irq_enter();`` every so    |
> | often. But given that long-running interrupt handlers can cause other |
> | problems, not least for response time, shouldn't you work to keep     |
> | your interrupt handler's runtime within reasonable bounds?            |
> +-----------------------------------------------------------------------+
> 
> Introduced by commit
> 
>   c0a41bf9dbc7 ("docs: Remove redundant "``" from Requirements.rst")
> 
> -- 
> Cheers,
> Stephen Rothwell


