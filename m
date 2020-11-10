Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84362AD027
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 08:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgKJHAA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 02:00:00 -0500
Received: from ozlabs.org ([203.11.71.1]:55111 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbgKJHAA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Nov 2020 02:00:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CVdyx538Jz9sTK;
        Tue, 10 Nov 2020 17:59:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604991594;
        bh=ZJOazbvgbgI8csWOeSUsJER/roLWuNbaS+r+T2y0N+c=;
        h=Date:From:To:Cc:Subject:From;
        b=G96tRA6WNJqxMviIzcPPjr0yqLBch11ltNdJfm/btpGmTKnnGEaeGzdVjEitcHE3d
         zSdZ4N/R0KCVk2DhofltE+QLYChodpF66EQgRdQvp+HEk2wbo2QLe6hr8okXos9B1W
         UUhe071H5fhkdXTcp52S1VwDUPBERURIkcpJOgJRXmRgCOBCRJlwN1l3Rl+e2CO9Q2
         +jk2a/kDNf5J9cpSV/+AoUfX1+G0nZUgNXj/PHvFSSkvHrn8JHC8gz7gquq9RZzzZm
         AauY1aZT8uCqHXT/NxTNEz1/fyi773NdTCbFELh1+w0XSExtiAOBolPqGIqYeJX/ou
         xO600jtn6jLzg==
Date:   Tue, 10 Nov 2020 17:59:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: linux-next: build warnings after merge of the rcu tree
Message-ID: <20201110175952.062ff5dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t.qS+Iba5YHAsTxXR+Te.fK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t.qS+Iba5YHAsTxXR+Te.fK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/RCU/Design/Requirements/Requirements.rst:119: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Wait a minute! You said that updaters can make useful forward         |
| progress concurrently with readers, but pre-existing readers will     |
| block synchronize_rcu()!!!                                        |
| Just who are you trying to fool???                                    |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| First, if updaters do not wish to be blocked by readers, they can use |
| call_rcu() or kfree_rcu(), which will be discussed later.     |
| Second, even when using synchronize_rcu(), the other update-side  |
| code does run concurrently with readers, whether pre-existing or not. |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:178: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Why is the synchronize_rcu() on line=C2=A028 needed?                   |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| Without that extra grace period, memory reordering could result in    |
| do_something_dlm() executing do_something() concurrently with |
| the last bits of recovery().                                      |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:289: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| But rcu_assign_pointer() does nothing to prevent the two          |
| assignments to ``p->a`` and ``p->b`` from being reordered. Can't that |
| also cause problems?                                                  |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| No, it cannot. The readers cannot see either of these two fields      |
| until the assignment to ``gp``, by which time both fields are fully   |
| initialized. So reordering the assignments to ``p->a`` and ``p->b``   |
| cannot possibly cause any problems.                                   |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:430: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Without the rcu_dereference() or the rcu_access_pointer(),    |
| what destructive optimizations might the compiler make use of?        |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| Let's start with what happens to do_something_gp() if it fails to |
| use rcu_dereference(). It could reuse a value formerly fetched    |
| from this same pointer. It could also fetch the pointer from ``gp``   |
| in a byte-at-a-time manner, resulting in *load tearing*, in turn      |
| resulting a bytewise mash-up of two distinct pointer values. It might |
| even use value-speculation optimizations, where it makes a wrong      |
| guess, but by the time it gets around to checking the value, an       |
| update has changed the pointer to match the wrong guess. Too bad      |
| about any dereferences that returned pre-initialization garbage in    |
| the meantime!                                                         |
| For remove_gp_synchronous(), as long as all modifications to      |
| ``gp`` are carried out while holding ``gp_lock``, the above           |
| optimizations are harmless. However, ``sparse`` will complain if you  |
| define ``gp`` with ``__rcu`` and then access it without using either  |
| rcu_access_pointer() or rcu_dereference().                    |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:513: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Given that multiple CPUs can start RCU read-side critical sections at |
| any time without any ordering whatsoever, how can RCU possibly tell   |
| whether or not a given RCU read-side critical section starts before a |
| given instance of synchronize_rcu()?                              |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| If RCU cannot tell whether or not a given RCU read-side critical      |
| section starts before a given instance of synchronize_rcu(), then |
| it must assume that the RCU read-side critical section started first. |
| In other words, a given instance of synchronize_rcu() can avoid   |
| waiting on a given RCU read-side critical section only if it can      |
| prove that synchronize_rcu() started first.                       |
| A related question is =E2=80=9CWhen rcu_read_lock() doesn't generate any =
 |
| code, why does it matter how it relates to a grace period?=E2=80=9D The  =
     |
| answer is that it is not the relationship of rcu_read_lock()      |
| itself that is important, but rather the relationship of the code     |
| within the enclosed RCU read-side critical section to the code        |
| preceding and following the grace period. If we take this viewpoint,  |
| then a given RCU read-side critical section begins before a given     |
| grace period when some access preceding the grace period observes the |
| effect of some access within the critical section, in which case none |
| of the accesses within the critical section may observe the effects   |
| of any access following the grace period.                             |
|                                                                       |
| As of late 2016, mathematical models of RCU take this viewpoint, for  |
| example, see slides=C2=A062 and=C2=A063 of the `2016 LinuxCon            =
       |
| EU <http://www2.rdrop.com/users/paulmck/scalability/paper/LinuxMM.201 |
| 6.10.04c.LCE.pdf>`__                                                  |
| presentation.                                                         |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:548: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| The first and second guarantees require unbelievably strict ordering! |
| Are all these memory barriers *really* required?                      |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| Yes, they really are required. To see why the first guarantee is      |
| required, consider the following sequence of events:                  |
|                                                                       |
| #. CPU 1: rcu_read_lock()                                         |
| #. CPU 1: ``q =3D rcu_dereference(gp); /* Very likely to return p. */`` |
| #. CPU 0: ``list_del_rcu(p);``                                        |
| #. CPU 0: synchronize_rcu() starts.                               |
| #. CPU 1: ``do_something_with(q->a);``                                |
|    ``/* No smp_mb(), so might happen after kfree(). */``              |
| #. CPU 1: rcu_read_unlock()                                       |
| #. CPU 0: synchronize_rcu() returns.                              |
| #. CPU 0: ``kfree(p);``                                               |
|                                                                       |
| Therefore, there absolutely must be a full memory barrier between the |
| end of the RCU read-side critical section and the end of the grace    |
| period.                                                               |
|                                                                       |
| The sequence of events demonstrating the necessity of the second rule |
| is roughly similar:                                                   |
|                                                                       |
| #. CPU 0: ``list_del_rcu(p);``                                        |
| #. CPU 0: synchronize_rcu() starts.                               |
| #. CPU 1: rcu_read_lock()                                         |
| #. CPU 1: ``q =3D rcu_dereference(gp);``                                |
|    ``/* Might return p if no memory barrier. */``                     |
| #. CPU 0: synchronize_rcu() returns.                              |
| #. CPU 0: ``kfree(p);``                                               |
| #. CPU 1: ``do_something_with(q->a); /* Boom!!! */``                  |
| #. CPU 1: rcu_read_unlock()                                       |
|                                                                       |
| And similarly, without a memory barrier between the beginning of the  |
| grace period and the beginning of the RCU read-side critical section, |
| CPU=C2=A01 might end up accessing the freelist.                          =
  |
|                                                                       |
| The =E2=80=9Cas if=E2=80=9D rule of course applies, so that any implement=
ation that   |
| acts as if the appropriate memory barriers were in place is a correct |
| implementation. That said, it is much easier to fool yourself into    |
| believing that you have adhered to the as-if rule than it is to       |
| actually adhere to it!                                                |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:597: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| You claim that rcu_read_lock() and rcu_read_unlock() generate |
| absolutely no code in some kernel builds. This means that the         |
| compiler might arbitrarily rearrange consecutive RCU read-side        |
| critical sections. Given such rearrangement, if a given RCU read-side |
| critical section is done, how can you be sure that all prior RCU      |
| read-side critical sections are done? Won't the compiler              |
| rearrangements make that impossible to determine?                     |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| In cases where rcu_read_lock() and rcu_read_unlock() generate |
| absolutely no code, RCU infers quiescent states only at special       |
| locations, for example, within the scheduler. Because calls to        |
| schedule() had better prevent calling-code accesses to shared     |
| variables from being rearranged across the call to schedule(), if |
| RCU detects the end of a given RCU read-side critical section, it     |
| will necessarily detect the end of all prior RCU read-side critical   |
| sections, no matter how aggressively the compiler scrambles the code. |
| Again, this all assumes that the compiler cannot scramble code across |
| calls to the scheduler, out of interrupt handlers, into the idle      |
| loop, into user-mode code, and so on. But if your kernel build allows |
| that sort of scrambling, you have broken far more than just RCU!      |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:738: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Can't the compiler also reorder this code?                            |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| No, the volatile casts in READ_ONCE() and WRITE_ONCE()        |
| prevent the compiler from reordering in this particular case.         |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:793: WARNING: Malfor=
med table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Suppose that synchronize_rcu() did wait until *all* readers had       |
| completed instead of waiting only on pre-existing readers. For how    |
| long would the updater be able to rely on there being no readers?     |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| For no time at all. Even if synchronize_rcu() were to wait until  |
| all readers had completed, a new reader might start immediately after |
| synchronize_rcu() completed. Therefore, the code following        |
| synchronize_rcu() can *never* rely on there being no readers.     |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:1087: WARNING: Malfo=
rmed table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| What about sleeping locks?                                            |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| These are forbidden within Linux-kernel RCU read-side critical        |
| sections because it is not legal to place a quiescent state (in this  |
| case, voluntary context switch) within an RCU read-side critical      |
| section. However, sleeping locks may be used within userspace RCU     |
| read-side critical sections, and also within Linux-kernel sleepable   |
| RCU `(SRCU) <#Sleepable%20RCU>`__ read-side critical sections. In     |
| addition, the -rt patchset turns spinlocks into a sleeping locks so   |
| that the corresponding critical sections can be preempted, which also |
| means that these sleeplockified spinlocks (but not other sleeping     |
| locks!) may be acquire within -rt-Linux-kernel RCU read-side critical |
| sections.                                                             |
| Note that it *is* legal for a normal RCU read-side critical section   |
| to conditionally acquire a sleeping locks (as in                      |
| mutex_trylock()), but only as long as it does not loop            |
| indefinitely attempting to conditionally acquire that sleeping locks. |
| The key point is that things like mutex_trylock() either return   |
| with the mutex held, or return an error indication if the mutex was   |
| not immediately available. Either way, mutex_trylock() returns    |
| immediately without sleeping.                                         |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:1295: WARNING: Malfo=
rmed table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Why does line=C2=A019 use rcu_access_pointer()? After all,             |
| call_rcu() on line=C2=A025 stores into the structure, which would      |
| interact badly with concurrent insertions. Doesn't this mean that     |
| rcu_dereference() is required?                                    |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| Presumably the ``->gp_lock`` acquired on line=C2=A018 excludes any       =
  |
| changes, including any insertions that rcu_dereference() would    |
| protect against. Therefore, any insertions will be delayed until      |
| after ``->gp_lock`` is released on line=C2=A025, which in turn means that=
  |
| rcu_access_pointer() suffices.                                    |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:1351: WARNING: Malfo=
rmed table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Earlier it was claimed that call_rcu() and kfree_rcu()        |
| allowed updaters to avoid being blocked by readers. But how can that  |
| be correct, given that the invocation of the callback and the freeing |
| of the memory (respectively) must still wait for a grace period to    |
| elapse?                                                               |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| We could define things this way, but keep in mind that this sort of   |
| definition would say that updates in garbage-collected languages      |
| cannot complete until the next time the garbage collector runs, which |
| does not seem at all reasonable. The key point is that in most cases, |
| an updater using either call_rcu() or kfree_rcu() can proceed |
| to the next update as soon as it has invoked call_rcu() or        |
| kfree_rcu(), without having to wait for a subsequent grace        |
| period.                                                               |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:1893: WARNING: Malfo=
rmed table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| Wait a minute! Each RCU callbacks must wait for a grace period to     |
| complete, and rcu_barrier() must wait for each pre-existing       |
| callback to be invoked. Doesn't rcu_barrier() therefore need to   |
| wait for a full grace period if there is even one callback posted     |
| anywhere in the system?                                               |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| Absolutely not!!!                                                     |
| Yes, each RCU callbacks must wait for a grace period to complete, but |
| it might well be partly (or even completely) finished waiting by the  |
| time rcu_barrier() is invoked. In that case, rcu_barrier()    |
| need only wait for the remaining portion of the grace period to       |
| elapse. So even if there are quite a few callbacks posted,            |
| rcu_barrier() might well return quite quickly.                    |
|                                                                       |
| So if you need to wait for a grace period as well as for all          |
| pre-existing callbacks, you will need to invoke both                  |
| synchronize_rcu() and rcu_barrier(). If latency is a concern, |
| you can always use workqueues to invoke them concurrently.            |
+-----------------------------------------------------------------------+
Documentation/RCU/Design/Requirements/Requirements.rst:2220: WARNING: Malfo=
rmed table.

+-----------------------------------------------------------------------+
| **Quick Quiz**:                                                       |
+-----------------------------------------------------------------------+
| But what if my driver has a hardware interrupt handler that can run   |
| for many seconds? I cannot invoke schedule() from an hardware     |
| interrupt handler, after all!                                         |
+-----------------------------------------------------------------------+
| **Answer**:                                                           |
+-----------------------------------------------------------------------+
| One approach is to do ``rcu_irq_exit();rcu_irq_enter();`` every so    |
| often. But given that long-running interrupt handlers can cause other |
| problems, not least for response time, shouldn't you work to keep     |
| your interrupt handler's runtime within reasonable bounds?            |
+-----------------------------------------------------------------------+

Introduced by commit

  c0a41bf9dbc7 ("docs: Remove redundant "``" from Requirements.rst")

--=20
Cheers,
Stephen Rothwell

--Sig_/t.qS+Iba5YHAsTxXR+Te.fK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+qOmgACgkQAVBC80lX
0GyWngf+ORSRh8eDXsV4Jhjx+dszTG8ovxyi22k9WQ/BuxbM8pWFHHjw+pbiIPKD
R53YG+StLF0d9kC/6WkXQ/yCguZrZ2OCa4etHERV1ZmVXk+2My+UuXYK7JvXdN3o
6haMfsM9lvm8Obw6Jrp9FbH6zHSN6O2AMW5x2MdelBWKL/BRwbW10+3FXaMk+ZHy
SHIp32kdEXfYpkPDqEwGfE9TXAy8tV3wHj04PcDey1uHNAymIYER4xZLGcPHykTc
OTIwvdppv03ZPwRm5Y3RDK5cVVEWgdkuuYHj0+xJJEQw+hWIEIWlOWPmEv3ZgM8B
Ug/2jNTZQyncreYqqgC9RCK1gsItfA==
=6fpM
-----END PGP SIGNATURE-----

--Sig_/t.qS+Iba5YHAsTxXR+Te.fK--
