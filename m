Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53021121F01
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 00:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfLPXhS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Dec 2019 18:37:18 -0500
Received: from ozlabs.org ([203.11.71.1]:50483 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726655AbfLPXhS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Dec 2019 18:37:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47cHk23HHWz9sPh;
        Tue, 17 Dec 2019 10:37:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576539435;
        bh=G71sop5UaLdUnYi8cQz16SaASgMtWmRlQ3ORAt698l8=;
        h=Date:From:To:Cc:Subject:From;
        b=p/fOZvQGIVIb8Vn0r2Igpzv8+NUlW1B1VdP1tejF8w91w/7z1wY/jZAEfokfc6K/G
         xqTVCwjHiXKgQGRPCi7sl6qmAos4qlHcfqjdJ/GlBeGPaxV35AEKVlz6500czImoGS
         vj451TOwTi5cUGZs6UiZuTYbYWAA/0nDXLHdOynft/U3eZbz0XFaFE5sLm7+tkhloj
         Gv5EhMc4TAL+Xbk3okLTu7tJlo+7NeyzFAil9pP86AyerRztQ4qJNCGyZHR1eKnWIh
         xGahJMApSD3FUc/w7XaZjYsrPkeaj+iZmaAuat3SsQiUXUZM9jY7fDX+DEtqv6ptAW
         31MTCyY7AY9ig==
Date:   Tue, 17 Dec 2019 10:37:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marco Elver <elver@google.com>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20191217103713.172e2853@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jcad.TDfOn0BNoxTTB4.Fyj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jcad.TDfOn0BNoxTTB4.Fyj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got conflicts in:

  kernel/kcsan/core.c
  kernel/kcsan/encoding.h

between commit:

  5cbaefe9743b ("kcsan: Improve various small stylistic details")

from the tip tree and commit:

  b524b53678c6 ("kcsan: Prefer __always_inline for fast-path")

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

diff --cc kernel/kcsan/core.c
index 3314fc29e236,69870645b631..000000000000
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@@ -78,10 -78,8 +78,10 @@@ static atomic_long_t watchpoints[CONFIG
   */
  static DEFINE_PER_CPU(long, kcsan_skip);
 =20
- static inline atomic_long_t *find_watchpoint(unsigned long addr,
- 					     size_t size,
- 					     bool expect_write,
- 					     long *encoded_watchpoint)
 -static __always_inline atomic_long_t *
 -find_watchpoint(unsigned long addr, size_t size, bool expect_write, long =
*encoded_watchpoint)
++static __always_inline atomic_long_t *find_watchpoint(unsigned long addr,
++						      size_t size,
++						      bool expect_write,
++						      long *encoded_watchpoint)
  {
  	const int slot =3D watchpoint_slot(addr);
  	const unsigned long addr_masked =3D addr & WATCHPOINT_ADDR_MASK;
@@@ -146,10 -149,11 +146,10 @@@ insert_watchpoint(unsigned long addr, s
   *	2. the thread that set up the watchpoint already removed it;
   *	3. the watchpoint was removed and then re-used.
   */
- static inline bool
+ static __always_inline bool
  try_consume_watchpoint(atomic_long_t *watchpoint, long encoded_watchpoint)
  {
 -	return atomic_long_try_cmpxchg_relaxed(watchpoint, &encoded_watchpoint,
 -					       CONSUMED_WATCHPOINT);
 +	return atomic_long_try_cmpxchg_relaxed(watchpoint, &encoded_watchpoint, =
CONSUMED_WATCHPOINT);
  }
 =20
  /*
@@@ -157,13 -161,14 +157,13 @@@
   */
  static inline bool remove_watchpoint(atomic_long_t *watchpoint)
  {
 -	return atomic_long_xchg_relaxed(watchpoint, INVALID_WATCHPOINT) !=3D
 -	       CONSUMED_WATCHPOINT;
 +	return atomic_long_xchg_relaxed(watchpoint, INVALID_WATCHPOINT) !=3D CON=
SUMED_WATCHPOINT;
  }
 =20
- static inline struct kcsan_ctx *get_ctx(void)
+ static __always_inline struct kcsan_ctx *get_ctx(void)
  {
  	/*
 -	 * In interrupt, use raw_cpu_ptr to avoid unnecessary checks, that would
 +	 * In interrupts, use raw_cpu_ptr to avoid unnecessary checks, that would
  	 * also result in calls that generate warnings in uaccess regions.
  	 */
  	return in_task() ? &current->kcsan_ctx : raw_cpu_ptr(&kcsan_cpu_ctx);
diff --cc kernel/kcsan/encoding.h
index b63890e86449,e527e83ce825..000000000000
--- a/kernel/kcsan/encoding.h
+++ b/kernel/kcsan/encoding.h
@@@ -59,10 -58,8 +59,10 @@@ encode_watchpoint(unsigned long addr, s
  		      (addr & WATCHPOINT_ADDR_MASK));
  }
 =20
- static inline bool decode_watchpoint(long watchpoint,
- 				     unsigned long *addr_masked,
- 				     size_t *size,
- 				     bool *is_write)
 -static __always_inline bool
 -decode_watchpoint(long watchpoint, unsigned long *addr_masked, size_t *si=
ze, bool *is_write)
++static __always_inline bool decode_watchpoint(long watchpoint,
++					      unsigned long *addr_masked,
++					      size_t *size,
++					      bool *is_write)
  {
  	if (watchpoint =3D=3D INVALID_WATCHPOINT ||
  	    watchpoint =3D=3D CONSUMED_WATCHPOINT)

--Sig_/jcad.TDfOn0BNoxTTB4.Fyj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl34FSkACgkQAVBC80lX
0GyBVwf7B1ynxOMoU93xikYEj56T1usgY4ZxHRli3Mey1hvESGgD2HncS56WwFcZ
7mitXSFHOu5n3iQM/aWjBPoxiovqKbqDSH1k4BKgcpoUk8h8it6GJrkR3w2IEa5m
lqXUINLPjuP0XY5GMW9kUnLT+EvJUOAtgHTcBizxUW/jNB9mv2jk8F6j9yTHjqR/
7H4mtqHV9v0zOmbkrj2DY0zqPpdlONHC85GrbntPVUkcnMk/QhL1SyqAOSkZeUzf
+TeXQJDEc9KxA4UZCxm3hyklTidGofHl4x3dtSbxUmPbdOiWtXVojNkllLYnQ7r+
lAn0hd/UsYkoN8Q0TMBtVuCHHKD6bA==
=q6Bm
-----END PGP SIGNATURE-----

--Sig_/jcad.TDfOn0BNoxTTB4.Fyj--
