Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEEC12C608F
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 08:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbgK0Hja (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 02:39:30 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgK0Hja (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Nov 2020 02:39:30 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cj62j2kXHz9sRR;
        Fri, 27 Nov 2020 18:39:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606462767;
        bh=XqstoATTx85DR373vr3xHTpQpMMloM7zoMkPbUSq8JA=;
        h=Date:From:To:Cc:Subject:From;
        b=k5bTjA+5GkIELs+i16zbE4KZHqFsSRgf966aFjepL/enh8tTOgtlsisc/eMyClLUW
         COm08kIB36MxpNzTtpFR56k6mxF74hzvDfttj8iyrTIXDK4zCkSVjkEIIRLxGEYV5o
         Qz4ZH91yNybYBVKwNV9XRHrE7G+SL1nTp47eni1nh0O8g05WY/TYZR8/MYdaxuEr+I
         0xRA+0eSgqazQiYrWa3lkFSlzyFAuxb4NeKPe+S4jMrpOv2vS37aT/bscTQ+zneUqp
         u59Bh/tAZphze+tYTlOQum4YenArN7TZXCAkW/5BxvIR3+QSM3LIIwtXqmL1E0V2sk
         T2puIzaMK2Bcw==
Date:   Fri, 27 Nov 2020 18:39:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20201127183924.36696fb0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JAcalZRK1OeJkm7R4ecfnAO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JAcalZRK1OeJkm7R4ecfnAO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/kernel.h

between commit:

  74d862b682f5 ("sched: Make migrate_disable/enable() independent of RT")

from the tip tree and commit:

  761ace49e56f ("kernel.h: Split out mathematical helpers")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/kernel.h
index dbf6018fc312,f97ab3283a8b..000000000000
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@@ -272,48 -145,13 +159,6 @@@ extern void __cant_migrate(const char *
 =20
  #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
 =20
- /**
-  * abs - return absolute value of an argument
-  * @x: the value.  If it is unsigned type, it is converted to signed type=
 first.
-  *     char is treated as if it was signed (regardless of whether it real=
ly is)
-  *     but the macro's return type is preserved as char.
-  *
-  * Return: an absolute value of x.
-  */
- #define abs(x)	__abs_choose_expr(x, long long,				\
- 		__abs_choose_expr(x, long,				\
- 		__abs_choose_expr(x, int,				\
- 		__abs_choose_expr(x, short,				\
- 		__abs_choose_expr(x, char,				\
- 		__builtin_choose_expr(					\
- 			__builtin_types_compatible_p(typeof(x), char),	\
- 			(char)({ signed char __x =3D (x); __x<0?-__x:__x; }), \
- 			((void)0)))))))
-=20
- #define __abs_choose_expr(x, type, other) __builtin_choose_expr(	\
- 	__builtin_types_compatible_p(typeof(x),   signed type) ||	\
- 	__builtin_types_compatible_p(typeof(x), unsigned type),		\
- 	({ signed type __x =3D (x); __x < 0 ? -__x : __x; }), other)
-=20
- /**
-  * reciprocal_scale - "scale" a value into range [0, ep_ro)
-  * @val: value
-  * @ep_ro: right open interval endpoint
-  *
-  * Perform a "reciprocal multiplication" in order to "scale" a value into
-  * range [0, @ep_ro), where the upper interval endpoint is right-open.
-  * This is useful, e.g. for accessing a index of an array containing
-  * @ep_ro elements, for example. Think of it as sort of modulus, only that
-  * the result isn't that of modulo. ;) Note that if initial input is a
-  * small value, then result will return 0.
-  *
-  * Return: a result based on @val in interval [0, @ep_ro).
-  */
- static inline u32 reciprocal_scale(u32 val, u32 ep_ro)
- {
- 	return (u32)(((u64) val * ep_ro) >> 32);
- }
 -#ifndef CONFIG_PREEMPT_RT
 -# define cant_migrate()		cant_sleep()
 -#else
 -  /* Placeholder for now */
 -# define cant_migrate()		do { } while (0)
 -#endif
--
  #if defined(CONFIG_MMU) && \
  	(defined(CONFIG_PROVE_LOCKING) || defined(CONFIG_DEBUG_ATOMIC_SLEEP))
  #define might_fault() __might_fault(__FILE__, __LINE__)

--Sig_/JAcalZRK1OeJkm7R4ecfnAO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ArSwACgkQAVBC80lX
0Gy8fQf/WDYe2yptL2VPqJIj7xT2YgGxJKl0kcjtZNGs3uH6DzogOt/7ilIFr+o3
VdCrMnF12y7gGYZ/VYBp5x0yFeWGBnANMoG9jsma1FL7+rja0w/66acjij3uAytX
b3mA3qE32urhnHo4l9o/X5UbVcI3jtbxF66v/xjqO0P2soOihlCP1LPw5YJTzUca
oPsA6ajacoVdmORvg7ZN8qpcyNqZeEJedXdApZK0brAxfDgVFAtShUTiYiKU/NFI
wc5UOOmZnmddZDSXW+F0EpqwMWDMx5FoQ7yc2Y7hToimLWFVL5rLiv/+bBSxPx8q
Quqj29BrEryZgFbDtYcwhQQhdW8TxQ==
=BrHP
-----END PGP SIGNATURE-----

--Sig_/JAcalZRK1OeJkm7R4ecfnAO--
