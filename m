Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E78F22FF12
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 03:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgG1Bte (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 21:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgG1Btd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 21:49:33 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F01C061794;
        Mon, 27 Jul 2020 18:49:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG03F1lJKz9sRK;
        Tue, 28 Jul 2020 11:49:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595900970;
        bh=siEdff5mQDbkIBF1kUkUdhVbbO9uIBl+N3VQPmFUl3I=;
        h=Date:From:To:Cc:Subject:From;
        b=QcqK6rlhuSFFX8TeuTKeMetxzeZLzlACotqAAAk5Z+vRWI/7xuH3PD+QQoCZWcEof
         sr+HU5gFlELWWWlsnwloKFGrgxIYAAY73MCjk8heJ58ET92TIKF/ogUwXyFWHQQeo4
         qNSCMF6j7NJDpy38mK4A3DztKhSG5O+8in+PsfYKKx7o5vt47u3UcUBhAvde6cCOES
         aBatjAS+67JLEpstwnmT9AiH8BRIKjJ5trd/n3CIA8zRT3S+f0Dh55gBeT2TaPgkmQ
         QtO3hW1e+kP/rrPgSYsqHyyX36QYJKM6ezXKm3DOXQHMllFm9x+kU1zlLiODQ11qew
         5FMI6TKFTFxwg==
Date:   Tue, 28 Jul 2020 11:49:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: linux-next: build failure after merge of the printk tree
Message-ID: <20200728114927.4590731f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2pohUhHmPYtb7bJTjQQp3Br";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2pohUhHmPYtb7bJTjQQp3Br
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the printk tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/printk.h:10,
                 from include/linux/kernel.h:15,
                 from include/linux/list.h:9,
                 from include/linux/lockdep.h:43,
                 from include/linux/spinlock_types.h:18,
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
include/linux/spinlock.h:102:24: note: in definition of macro 'raw_spin_loc=
k_init'
  102 |  __raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN); \
      |                        ^~~~
include/linux/spinlock.h:95:52: note: expected 'raw_spinlock_t *' {aka 'str=
uct raw_spinlock *'} but argument is of type 'int *'
   95 |   extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char=
 *name,
      |                                    ~~~~~~~~~~~~~~~~^~~~

Caused by commit

  b4a461e72bcb ("printk: Make linux/printk.h self-contained")

This *may* be interacting with other include file changes in linux-next.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/2pohUhHmPYtb7bJTjQQp3Br
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8fhCcACgkQAVBC80lX
0Gwvhwf/Ux5nzDuL4JwduEQmLvUpGDukIvpHu0vcHsElXW+qLKan4FjFivxKqrAt
2T6+vpzFyc2xc0Ocypw64NBB3ikmKmW8on+9K2KGrpxR87Yi+N1uMNabrPgLpOgt
xhIFpF3fV9oioNLljn56BxElULM7PuNnuZu/FEdCDLR4g2PqG14gEXGBl9FIHWlJ
ITKHlXQXxLauB+y12gTnIP/zDobWE0vzn6kT9fkG8Ls3VJUcGu9JDsmi6gR5lThi
uRHxPS+NnwAcZXCwKPmzMEguyFgsohGjZrvmMgRxfaY/ErmLiBJqXMHaOo59vc1g
b6oRIDB737FIK8xNGyCLmpL3YPGXyg==
=MjCb
-----END PGP SIGNATURE-----

--Sig_/2pohUhHmPYtb7bJTjQQp3Br--
