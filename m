Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648F1231D29
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 13:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgG2LDV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 07:03:21 -0400
Received: from ozlabs.org ([203.11.71.1]:47827 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726813AbgG2LDR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 07:03:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGrHj0XyZz9sTX;
        Wed, 29 Jul 2020 21:03:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596020594;
        bh=07mQBOz7qrnx+2vo/gVHnaaJOI9SWGGvMUEeqEWYWTA=;
        h=Date:From:To:Cc:Subject:From;
        b=kf7GmQiSXllWX5+ZnQ90Q+QDN+q6YOsZZKWBxUttGn1RshDVuGqoyGx4kkT+cY5sQ
         40hkBI9HIn+fEiINV+zCib25dGjPZdHRIGa75MoQ6ZVI6HARn5DFXF8D3BdOfpdIua
         Y3YofiU/+CVgt5miWSB3hv0tEzxCWkyH5hh3zvMVHyKotrqkfSc9vahHPj0y7MACYA
         AE2v9SsDI+DNpHhHvR8JvCeKAdRfhC9yMSFreolG2nfe5M68q/mXl6JnFsqnghHDLk
         rcTp35zsAWQP8YnRiCB8/KaD3oNJLh/VLBBvQHed1EJSF6+wvzFf1GCQsGRl0iBK8M
         1gyRJedCQ/f9w==
Date:   Wed, 29 Jul 2020 21:03:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: linux-next: build failure after merge of the printk tree
Message-ID: <20200729210311.425d0e9b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rw.MDYd6k9eKg6.2Li0UlAT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rw.MDYd6k9eKg6.2Li0UlAT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the printk tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/printk.h:10,
                 from include/linux/kernel.h:15,
                 from include/asm-generic/bug.h:20,
                 from arch/powerpc/include/asm/bug.h:109,
                 from include/linux/bug.h:5,
                 from arch/powerpc/include/asm/cmpxchg.h:8,
                 from arch/powerpc/include/asm/atomic.h:11,
                 from include/linux/atomic.h:7,
                 from include/asm-generic/qspinlock_types.h:19,
                 from arch/powerpc/include/asm/spinlock_types.h:10,
                 from include/linux/spinlock_types.h:13,
                 from include/linux/genalloc.h:32,
                 from drivers/soc/fsl/qe/qe_common.c:16:
include/linux/ratelimit_types.h:16:2: error: unknown type name 'raw_spinloc=
k_t'
   16 |  raw_spinlock_t lock;  /* protect the state */
      |  ^~~~~~~~~~~~~~
In file included from include/linux/wait.h:9,
                 from include/linux/pid.h:6,
                 from include/linux/sched.h:14,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/node.h:18,
                 from include/linux/cpu.h:17,
                 from include/linux/of_device.h:5,
                 from drivers/soc/fsl/qe/qe_common.c:19:
include/linux/ratelimit.h: In function 'ratelimit_state_init':
include/linux/ratelimit.h:14:21: error: passing argument 1 of '__raw_spin_l=
ock_init' from incompatible pointer type [-Werror=3Dincompatible-pointer-ty=
pes]
   14 |  raw_spin_lock_init(&rs->lock);
include/linux/spinlock.h:103:24: note: in definition of macro 'raw_spin_loc=
k_init'
  103 |  __raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN); \
      |                        ^~~~
include/linux/spinlock.h:96:52: note: expected 'raw_spinlock_t *' {aka 'str=
uct raw_spinlock *'} but argument is of type 'int *'
   96 |   extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char=
 *name,
      |                                    ~~~~~~~~~~~~~~~~^~~~
In file included from arch/powerpc/include/asm/cmpxchg.h:8,
                 from arch/powerpc/include/asm/atomic.h:11,
                 from include/linux/atomic.h:7,
                 from include/asm-generic/qspinlock_types.h:19,
                 from arch/powerpc/include/asm/spinlock_types.h:10,
                 from include/linux/spinlock_types.h:13,
                 from include/linux/ratelimit_types.h:7,
                 from include/linux/printk.h:10,
                 from include/linux/kernel.h:15,
                 from include/asm-generic/bug.h:20,
                 from arch/powerpc/include/asm/bug.h:109,
                 from drivers/block/drbd/drbd_interval.c:2:
include/linux/bug.h:34:47: warning: 'struct bug_entry' declared inside para=
meter list will not be visible outside of this definition or declaration
   34 | static inline int is_warning_bug(const struct bug_entry *bug)
      |                                               ^~~~~~~~~
include/linux/bug.h: In function 'is_warning_bug':
include/linux/bug.h:36:12: error: dereferencing pointer to incomplete type =
'const struct bug_entry'
   36 |  return bug->flags & BUGFLAG_WARNING;
      |            ^~

And another similar.

Caused by commit

  b4a461e72bcb ("printk: Make linux/printk.h self-contained")

This is becoming a bit of a whack-a-mole :-(

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/rw.MDYd6k9eKg6.2Li0UlAT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8hV28ACgkQAVBC80lX
0GwfUwf9GJmsq4p2Pf+GWaPtGIZSqFGUG6zRsF4igB/jYIFraWIUXOB4sb1ekrGG
2QXCNwxCjEWeuaGBpFgn9i9mTGvBcvAbvPyJ6K66wCbcdj/x2V4OWlGq7D421+MR
GwJpZuwKx3YN07aAhonJS9c+8aZytZwJM8qposJvglEVhEb98gtEQzS5mUnm5bSD
YfLVi58DmRrRtp9qNXaxNMdGvdv7gsEq2uLYe3xMA7fhVPcGhW/Vg02h3ytqR4S2
XoRJ21wj2HGOs41Atckv3+ktdlpazNbxou1Eedg3qI07BVkaCNqwqAvh5D1mFi8P
5VR73cqYFHJAyckcpe29UAAys4X6jQ==
=tcEF
-----END PGP SIGNATURE-----

--Sig_/rw.MDYd6k9eKg6.2Li0UlAT--
