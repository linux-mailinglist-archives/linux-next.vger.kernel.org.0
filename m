Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840DF2027E5
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 04:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729111AbgFUCFG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Jun 2020 22:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbgFUCFF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 20 Jun 2020 22:05:05 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A2FC061794;
        Sat, 20 Jun 2020 19:05:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qG8F0fbQz9sT6;
        Sun, 21 Jun 2020 12:05:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592705102;
        bh=A/sartbikUxvj3P/RaZdP+nRhKASCdemhO49p9d0ES4=;
        h=Date:From:To:Cc:Subject:From;
        b=ABDlELBdCIaT2o8FUdGkhZ8sGC9fqL98HZ2RKEog/fwmIFuMZqeul1qdmiaN2cr63
         40XWUSqLFTFbBqTFFx66iYchTonncVFr684I9o9d83gTdd2iDbWagdGnLQznAnoJqC
         eWNG2bA4B456jPp0lb3pqWzuLO8WwDD6wL1tH8EUHfq/RCB7w1RHTDuvES68SN9RPh
         ZGqNTIO1icWi2M5DA7tGvr4ebYKKFhASVMhY9xGZcW9eIAbaoS/dPfeW3TTHSz8m75
         E+NKXnRTX3ikHXGVD5OAB5fi9b4OhYOYaDeK1pqPottTtJOegKZa2Dr4OmlE51kFy2
         DmKUWATqQLAng==
Date:   Sun, 21 Jun 2020 12:05:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20200621120500.1f215007@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g0VC9dqJhgvMlL9+YAZHgIN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/g0VC9dqJhgvMlL9+YAZHgIN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (x86_64 allmodcongig)
failed like this:

In file included from arch/x86/include/asm/atomic.h:5,
                 from include/linux/atomic.h:7,
                 from include/linux/llist.h:51,
                 from include/linux/irq_work.h:5,
                 from kernel/smp.c:10:
kernel/smp.c: In function 'smp_init':
include/linux/compiler.h:392:38: error: call to '__compiletime_assert_869' =
declared with attribute error: BUILD_BUG_ON failed: offsetof(struct task_st=
ruct, wake_entry_type) - offsetof(struct task_struct, wake_entry) !=3D offs=
etof(struct __call_single_data, flags) - offsetof(struct __call_single_data=
, llist)
  392 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |                                      ^
include/linux/compiler.h:373:4: note: in definition of macro '__compiletime=
_assert'
  373 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_a=
ssert'
  392 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |  ^~~~~~~~~~~~~~~~
kernel/smp.c:687:2: note: in expansion of macro 'BUILD_BUG_ON'
  687 |  BUILD_BUG_ON(offsetof(struct task_struct, wake_entry_type) - offse=
tof(struct task_struct, wake_entry) !=3D
      |  ^~~~~~~~~~~~

Caused by me starting to build with various GCC_PLUGIN config options set.

I have cherry-picked commit

  bfb9fbe0f7e7 ("sched: Fix RANDSTRUCT build fail")

from the tip tree until it is sent upstream to Linus.

--=20
Cheers,
Stephen Rothwell

--Sig_/g0VC9dqJhgvMlL9+YAZHgIN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7uwEwACgkQAVBC80lX
0Gz4Ygf9EkQFVzXLZm9ozdtow2/JfiVbBTc+CQSVSlejAPHGllmL2/uX74KPdjem
hklGZU4MClhFZodg2I7j8eZz8X6+nemSbmnPBXgTVZRgWDW7/UgHAbXNrEBMPk9L
T/Zc190L9BFI6p6CylY4DyM/GuCIu9Fr0T+JYkgZpYwMYdo5yQzV3eVxyz2cl0G5
Yl5hpIJ04sDF7JhrNVe4yjtxmL9u9eqLqINs1gc91n7ZWsXi5Z19XRR2Ifrh/dnZ
8STgjpc0yO+cjyDWAidbhaNvF/c8ntFDBxracbxyDFQunU4wkOH1ONW+VHgiqGm7
kig360KNdDtXjn5ymIwV6gRkGncD2w==
=ZIB2
-----END PGP SIGNATURE-----

--Sig_/g0VC9dqJhgvMlL9+YAZHgIN--
