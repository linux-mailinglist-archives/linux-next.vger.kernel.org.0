Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497A13EE6FE
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 09:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbhHQHKH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 03:10:07 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34159 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233996AbhHQHKG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 03:10:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gphwn5XMPz9sRN;
        Tue, 17 Aug 2021 17:09:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629184172;
        bh=qm33RC9Y9OXmRvrthX7DLYcC/gKyEOADied9xmhIhic=;
        h=Date:From:To:Cc:Subject:From;
        b=fByQg/9sVQWoyG4SHdvqymD/wcSrfev9g+/dOQqKZ+ePlVyjdulGVoYZu9EDTMKCK
         G25iXzCkGGYkD+DtOGVyoWbdxcCHdqz0RVFUezsybBT5GVf2sz6efG/KzAwvzT+6J7
         ND2kOoBP4Pib25cBnsMORmTNXWYRfJRlc5Q/lWbqmWVgGP9IENhkY0tB8AwcV7WCmo
         qyVefRnxZ2LpcAiGxaV3X5rskco6S7Cvo8xh3qWRkWuGPGIwLxR9rWf4xE4UGanT6X
         OXhoWbCXd3kQpT5/LV5gbxPvWAC7gfzX0WtcjBy9Fjd/JwUHQHF7CWnA86iTp54rsd
         MbLeCsTl/iydA==
Date:   Tue, 17 Aug 2021 17:09:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20210817170928.7980e4bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gfxi1fqkB2qv4WhiOFXhaTi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Gfxi1fqkB2qv4WhiOFXhaTi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/time/tick-internal.h

between commits:

  8c3b5e6ec0fe ("hrtimer: Ensure timerfd notification for HIGHRES=3Dn")
  a761a67f591a ("timekeeping: Distangle resume and clock-was-set events")
  17a1b8826b45 ("hrtimer: Add bases argument to clock_was_set()")

from the tip tree and commit:

  a5e8561a2bdf ("clocksource: Make clocksource-wdtest.c safe for slow-HZ sy=
stems")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/time/tick-internal.h
index 3548f0829e6d,5459bab2f4f7..000000000000
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@@ -166,14 -166,22 +166,34 @@@ DECLARE_PER_CPU(struct hrtimer_cpu_base
  extern u64 get_next_timer_interrupt(unsigned long basej, u64 basem);
  void timer_clear_idle(void);
 =20
 +#define CLOCK_SET_WALL							\
 +	(BIT(HRTIMER_BASE_REALTIME) | BIT(HRTIMER_BASE_REALTIME_SOFT) |	\
 +	 BIT(HRTIMER_BASE_TAI) | BIT(HRTIMER_BASE_TAI_SOFT))
 +
 +#define CLOCK_SET_BOOT							\
 +	(BIT(HRTIMER_BASE_BOOTTIME) | BIT(HRTIMER_BASE_BOOTTIME_SOFT))
 +
 +void clock_was_set(unsigned int bases);
 +void clock_was_set_delayed(void);
 +
 +void hrtimers_resume_local(void);
++
+ /* Since jiffies uses a simple TICK_NSEC multiplier
+  * conversion, the .shift value could be zero. However
+  * this would make NTP adjustments impossible as they are
+  * in units of 1/2^.shift. Thus we use JIFFIES_SHIFT to
+  * shift both the nominator and denominator the same
+  * amount, and give ntp adjustments in units of 1/2^8
+  *
+  * The value 8 is somewhat carefully chosen, as anything
+  * larger can result in overflows. TICK_NSEC grows as HZ
+  * shrinks, so values greater than 8 overflow 32bits when
+  * HZ=3D100.
+  */
+ #if HZ < 34
+ #define JIFFIES_SHIFT	6
+ #elif HZ < 67
+ #define JIFFIES_SHIFT	7
+ #else
+ #define JIFFIES_SHIFT	8
+ #endif

--Sig_/Gfxi1fqkB2qv4WhiOFXhaTi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEbYKkACgkQAVBC80lX
0GwRCQgAlfwRjSyLSg1JocmDzRtvUk3E1ylhZTUmVS+kXZbBco5nFaw6LtdVe96G
y0CodFaDYAMxJQgsKJUNQCoPbjXjjnmPKgNhxAi/540otk1y+Vm3pC9innhGbWwR
ahu0gw5fS86L4CrYd2W6etnE0vtUejUP1zg+EP+rXf12QmZkC5fF4yCIpJPBGXj+
Qlh10yaO+4AbLSc38q421W47bTa+dzVYZrSCtOORTqvThMt3Ub+ziOXb9j5FVV0J
AlFglYF8AfOgcD48L5Cm/HNjBYaCmvvx12piBmCzGhjBSb+0OI8Wz4MlhH0qtVtQ
Et7PGAwY6GS45ur+HJLL3yxRCY1Yxg==
=Spwn
-----END PGP SIGNATURE-----

--Sig_/Gfxi1fqkB2qv4WhiOFXhaTi--
