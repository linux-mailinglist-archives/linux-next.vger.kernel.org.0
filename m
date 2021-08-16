Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B963ECC7E
	for <lists+linux-next@lfdr.de>; Mon, 16 Aug 2021 03:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhHPBsT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Aug 2021 21:48:19 -0400
Received: from ozlabs.org ([203.11.71.1]:56695 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhHPBsT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Aug 2021 21:48:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gnxqz4Flgz9sWS;
        Mon, 16 Aug 2021 11:47:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629078466;
        bh=c/2C+vdCGFA8g89X2f92vW44WIybflUIqf07FJolzCY=;
        h=Date:From:To:Cc:Subject:From;
        b=pRNpMXzrQ6KhzS1xsWzTppCYB8z9WYYxHk1U97UdOpOBxy9NpMJ62MZK3aUlNLyxR
         EvCz9npwTqUIwXHrTxAUdvYi0o/0a1Z3I6hKNxztNznbf38toqO8hl+CQGwIrGU0UG
         XHs7K5JAGWv5Y+5knT8/i5Ovha4piTi0bF+CuUS7ulreCZ+1XzIb4pfiNh6L+K6ETa
         NY5wLjvGXYzzY0aNPDDpz7JPQF6fvh3H7rRwh/x7IWeoU3HWVLDVVaiBa9ic5YA3Gv
         LK1hvnIgBnl46YHRJQGaFOsdvmozjcbheuI1+swGqWWuprc02ZWhZDhC4CSYp9iBZ4
         78jDz3eN3+ZoA==
Date:   Mon, 16 Aug 2021 11:47:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        Vineet Gupta <vgupta@synopsys.com>
Subject: linux-next: manual merge of the tip tree with the asm-generic tree
Message-ID: <20210816114740.77c20b3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EAN+MLN86T.3TaRVBaQkfZ/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EAN+MLN86T.3TaRVBaQkfZ/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/asm-generic/bitops/non-atomic.h

between commit:

  8f76f9c46952 ("bitops/non-atomic: make @nr unsigned to avoid any DIV")

from the asm-generic tree and commit:

  cf3ee3c8c29d ("locking/atomic: add generic arch_*() bitops")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/asm-generic/bitops/non-atomic.h
index c5a7d8eb9c2b,365377fb104b..000000000000
--- a/include/asm-generic/bitops/non-atomic.h
+++ b/include/asm-generic/bitops/non-atomic.h
@@@ -13,15 -13,18 +13,18 @@@
   * If it's called on the same region of memory simultaneously, the effect
   * may be that only one operation succeeds.
   */
- static inline void __set_bit(unsigned int nr, volatile unsigned long *add=
r)
+ static __always_inline void
 -arch___set_bit(int nr, volatile unsigned long *addr)
++arch___set_bit(unsigned int nr, volatile unsigned long *addr)
  {
  	unsigned long mask =3D BIT_MASK(nr);
  	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
 =20
  	*p  |=3D mask;
  }
+ #define __set_bit arch___set_bit
 =20
- static inline void __clear_bit(unsigned int nr, volatile unsigned long *a=
ddr)
+ static __always_inline void
 -arch___clear_bit(int nr, volatile unsigned long *addr)
++arch___clear_bit(unsigned int nr, volatile unsigned long *addr)
  {
  	unsigned long mask =3D BIT_MASK(nr);
  	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
@@@ -38,7 -42,8 +42,8 @@@
   * If it's called on the same region of memory simultaneously, the effect
   * may be that only one operation succeeds.
   */
- static inline void __change_bit(unsigned int nr, volatile unsigned long *=
addr)
+ static __always_inline
 -void arch___change_bit(int nr, volatile unsigned long *addr)
++void arch___change_bit(unsigned int nr, volatile unsigned long *addr)
  {
  	unsigned long mask =3D BIT_MASK(nr);
  	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
@@@ -55,7 -61,8 +61,8 @@@
   * If two examples of this operation race, one can appear to succeed
   * but actually fail.  You must protect multiple accesses with a lock.
   */
- static inline int __test_and_set_bit(unsigned int nr, volatile unsigned l=
ong *addr)
+ static __always_inline int
 -arch___test_and_set_bit(int nr, volatile unsigned long *addr)
++arch___test_and_set_bit(unsigned int nr, volatile unsigned long *addr)
  {
  	unsigned long mask =3D BIT_MASK(nr);
  	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
@@@ -74,7 -82,8 +82,8 @@@
   * If two examples of this operation race, one can appear to succeed
   * but actually fail.  You must protect multiple accesses with a lock.
   */
- static inline int __test_and_clear_bit(unsigned int nr, volatile unsigned=
 long *addr)
+ static __always_inline int
 -arch___test_and_clear_bit(int nr, volatile unsigned long *addr)
++arch___test_and_clear_bit(unsigned int nr, volatile unsigned long *addr)
  {
  	unsigned long mask =3D BIT_MASK(nr);
  	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
@@@ -83,10 -92,11 +92,11 @@@
  	*p =3D old & ~mask;
  	return (old & mask) !=3D 0;
  }
+ #define __test_and_clear_bit arch___test_and_clear_bit
 =20
  /* WARNING: non atomic and it can be reordered! */
- static inline int __test_and_change_bit(unsigned int nr,
- 					    volatile unsigned long *addr)
+ static __always_inline int
 -arch___test_and_change_bit(int nr, volatile unsigned long *addr)
++arch___test_and_change_bit(unsigned int nr, volatile unsigned long *addr)
  {
  	unsigned long mask =3D BIT_MASK(nr);
  	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
@@@ -101,7 -112,8 +112,8 @@@
   * @nr: bit number to test
   * @addr: Address to start counting from
   */
- static inline int test_bit(unsigned int nr, const volatile unsigned long =
*addr)
+ static __always_inline int
 -arch_test_bit(int nr, const volatile unsigned long *addr)
++arch_test_bit(unsigned int nr, const volatile unsigned long *addr)
  {
  	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
  }

--Sig_/EAN+MLN86T.3TaRVBaQkfZ/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEZw7wACgkQAVBC80lX
0GzpeAf/S2d/wOvD5aWH5TmNuztA3JFMGa1ilaQlnXCym/sqpiz9ZMUMHB+9v8J0
JcI+QeVspl8WaqxYEbsw6UU/UY6RAeOjYY2NHDpUYlVMe2M9VnRFUuMIeDNZrO0Z
jhuJF2pd/A2I/s/GNe5CVrN0DOrMHCfTBmB49RVfug9yv9A8y0hLjAfPvRW7RXt0
m9zTT286kPsvU4vWAfJqANjupHnudqPOz8lUPv3LTtO8Ht0i7+1I5qX5I3vPRAnN
vW//zIXTX/kaYhzzIxBVL+CC/srXXRoEvg9P3H3gx51isqdhE6fb8GiwbR4WqxHq
QyQK1HB3AH1UK1a34Q45855ZEgKPBA==
=Ffv/
-----END PGP SIGNATURE-----

--Sig_/EAN+MLN86T.3TaRVBaQkfZ/--
