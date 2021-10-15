Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD26942EDA8
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 11:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236608AbhJOJbU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 05:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236564AbhJOJbT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 05:31:19 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF42C061570;
        Fri, 15 Oct 2021 02:29:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW1Dk090rz4xR9;
        Fri, 15 Oct 2021 20:29:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634290150;
        bh=7GqkQ7tth30ccHhXqkGcQA8QUVx0fnB7MfpG8nGmJ3U=;
        h=Date:From:To:Cc:Subject:From;
        b=EYMVeGjHq+Y3vZmC0F1uWkLp7HsoBRnYSpKtPai8BIFJw0kIIvaXyJVl8HMutIRYL
         TVD4KAw2T4g+uGud2WdmMzPA//yjx/iHAyFgSSCKLPkOkPGMfA6qyTy2qhn6dPoqgy
         Dc1oWBdm4yfegccAX4Z6XtnVUOzWF/MFT5LZ5/A343m03dBdsMAk3r+Du3xf4mMW3Z
         +/8PrMzsfmSCaKtDz8I6Sq1gV0ME/+TL5NDvTQo4DBQT/heQXkS3cYVdSs7mV9RykH
         0M98eOubgYBICWKhaYW9BP++uIWTbJgdj5HE8dBhIgeZp7sgI97lWeeiC+/hO4ix5v
         IYQmQ8zPdqaWw==
Date:   Fri, 15 Oct 2021 20:29:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20211015202908.1c417ae2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RZJ=1uZs0TSMOKMPHcf29Js";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RZJ=1uZs0TSMOKMPHcf29Js
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/rcupdate.h:28,
                 from include/linux/rculist.h:11,
                 from include/linux/pid.h:5,
                 from include/linux/sched.h:14,
                 from arch/arm/kernel/asm-offsets.c:11:
include/linux/bottom_half.h: In function 'local_bh_disable':
include/linux/bottom_half.h:19:24: error: '_THIS_IP_' undeclared (first use=
 in this function)
   19 |  __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFFSET);
      |                        ^~~~~~~~~
include/linux/bottom_half.h:19:24: note: each undeclared identifier is repo=
rted only once for each function it appears in
include/linux/bottom_half.h: In function 'local_bh_enable':
include/linux/bottom_half.h:32:23: error: '_THIS_IP_' undeclared (first use=
 in this function)
   32 |  __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFFSET);
      |                       ^~~~~~~~~

Presumably caused by a commit in the series that starts with

  dcaf7a5f413b ("kernel.h: drop unneeded <linux/kernel.h> inclusion from ot=
her headers")

I have applied the following patch for today (though there may be a
better solution).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 Oct 2021 19:58:46 +1100
Subject: [PATCH] bottom_half.h needs kernel.h

for _THIS_IP_ on arm at least

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/bottom_half.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/bottom_half.h b/include/linux/bottom_half.h
index eed86eb0a1de..11d107d88d03 100644
--- a/include/linux/bottom_half.h
+++ b/include/linux/bottom_half.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_BH_H
 #define _LINUX_BH_H
=20
+#include <linux/kernel.h>
 #include <linux/preempt.h>
=20
 #if defined(CONFIG_PREEMPT_RT) || defined(CONFIG_TRACE_IRQFLAGS)
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/RZJ=1uZs0TSMOKMPHcf29Js
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpSeQACgkQAVBC80lX
0GyJvAf9FUW0khFFz/QMKVd64XLKSgObmDc4CbSGkxMUmX623t+Z4aJlRSGfCA9a
8WSea0SC/8fqSnp56jvR5U3KOIiUvC5CtJG5isVRkkn4DN7aoDu0uK5QZPifJihl
E3C0mu8v2FcNYGnzK4g2tU9SxoSmvmALfEc0g9lXtBsIrV1jU/RJ7O6iaeIVZ9p8
8pCs9867OTW0fOvEzkXqKZpEz89XLvNzOXVGd33GjcFJlhBCNjuPM5jZt3F2Fg0i
kAhghjyMMLRP0dmNkaDHsXJxrWGZ8Y3wGVOF3craZHMnz3PXfy2FMAW1w3+6Q2eT
afxYDfpoNyTnufdXpmGxgxY8tRXyjQ==
=AQOb
-----END PGP SIGNATURE-----

--Sig_/RZJ=1uZs0TSMOKMPHcf29Js--
