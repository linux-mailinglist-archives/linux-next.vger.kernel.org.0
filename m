Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1AE3FD1B5
	for <lists+linux-next@lfdr.de>; Wed,  1 Sep 2021 05:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241746AbhIADVk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Aug 2021 23:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbhIADVf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Aug 2021 23:21:35 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE217C061575;
        Tue, 31 Aug 2021 20:20:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gzq7g66fpz9sW4;
        Wed,  1 Sep 2021 13:20:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630466435;
        bh=Lko5GSlWpTiW1R514Rp94a8HK9SOo8wHzd+U1TS8PtE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m9pAO0u5qO7cL/5pjXc4WFe3dGWG8ZyvAqrlab7zhX+oFqLcdQK14SubohLnN1HfV
         S3guu+bbY0UXKeNqi9WHq0R4PNCf0tZMl4EwrDVWvbD71kCopN5Z5gCPm+GogFxLoQ
         3ZxhadQSJq/Taw4KR0CbeKOdYql5pjT2VcvGum6aESWqC7EaJLRevJL/kEf93jLR2W
         W6mdUA1XyRRFKJ0BFNC59oSCoctzPsz6LD3NtGDvYkTiOYfInMeV3j/xWLc0EllMvX
         ADcPrlaLOuN9FUfcpY0439lX9qJd4oAQvV9O/sMvg8yLuOM5AgJ1yP/EfF5+V5HypB
         dUkEl9CX+xIZA==
Date:   Wed, 1 Sep 2021 13:20:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        Vineet Gupta <vgupta@synopsys.com>
Subject: Re: linux-next: manual merge of the tip tree with the asm-generic
 tree
Message-ID: <20210901132018.1fc8ec5d@canb.auug.org.au>
In-Reply-To: <20210816114740.77c20b3c@canb.auug.org.au>
References: <20210816114740.77c20b3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w9YMOJeofzoq.TrKzaRkUcX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w9YMOJeofzoq.TrKzaRkUcX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Aug 2021 11:47:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   include/asm-generic/bitops/non-atomic.h
>=20
> between commit:
>=20
>   8f76f9c46952 ("bitops/non-atomic: make @nr unsigned to avoid any DIV")
>=20
> from the asm-generic tree and commit:
>=20
>   cf3ee3c8c29d ("locking/atomic: add generic arch_*() bitops")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/asm-generic/bitops/non-atomic.h
> index c5a7d8eb9c2b,365377fb104b..000000000000
> --- a/include/asm-generic/bitops/non-atomic.h
> +++ b/include/asm-generic/bitops/non-atomic.h
> @@@ -13,15 -13,18 +13,18 @@@
>    * If it's called on the same region of memory simultaneously, the effe=
ct
>    * may be that only one operation succeeds.
>    */
> - static inline void __set_bit(unsigned int nr, volatile unsigned long *a=
ddr)
> + static __always_inline void
>  -arch___set_bit(int nr, volatile unsigned long *addr)
> ++arch___set_bit(unsigned int nr, volatile unsigned long *addr)
>   {
>   	unsigned long mask =3D BIT_MASK(nr);
>   	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
>  =20
>   	*p  |=3D mask;
>   }
> + #define __set_bit arch___set_bit
>  =20
> - static inline void __clear_bit(unsigned int nr, volatile unsigned long =
*addr)
> + static __always_inline void
>  -arch___clear_bit(int nr, volatile unsigned long *addr)
> ++arch___clear_bit(unsigned int nr, volatile unsigned long *addr)
>   {
>   	unsigned long mask =3D BIT_MASK(nr);
>   	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
> @@@ -38,7 -42,8 +42,8 @@@
>    * If it's called on the same region of memory simultaneously, the effe=
ct
>    * may be that only one operation succeeds.
>    */
> - static inline void __change_bit(unsigned int nr, volatile unsigned long=
 *addr)
> + static __always_inline
>  -void arch___change_bit(int nr, volatile unsigned long *addr)
> ++void arch___change_bit(unsigned int nr, volatile unsigned long *addr)
>   {
>   	unsigned long mask =3D BIT_MASK(nr);
>   	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
> @@@ -55,7 -61,8 +61,8 @@@
>    * If two examples of this operation race, one can appear to succeed
>    * but actually fail.  You must protect multiple accesses with a lock.
>    */
> - static inline int __test_and_set_bit(unsigned int nr, volatile unsigned=
 long *addr)
> + static __always_inline int
>  -arch___test_and_set_bit(int nr, volatile unsigned long *addr)
> ++arch___test_and_set_bit(unsigned int nr, volatile unsigned long *addr)
>   {
>   	unsigned long mask =3D BIT_MASK(nr);
>   	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
> @@@ -74,7 -82,8 +82,8 @@@
>    * If two examples of this operation race, one can appear to succeed
>    * but actually fail.  You must protect multiple accesses with a lock.
>    */
> - static inline int __test_and_clear_bit(unsigned int nr, volatile unsign=
ed long *addr)
> + static __always_inline int
>  -arch___test_and_clear_bit(int nr, volatile unsigned long *addr)
> ++arch___test_and_clear_bit(unsigned int nr, volatile unsigned long *addr)
>   {
>   	unsigned long mask =3D BIT_MASK(nr);
>   	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
> @@@ -83,10 -92,11 +92,11 @@@
>   	*p =3D old & ~mask;
>   	return (old & mask) !=3D 0;
>   }
> + #define __test_and_clear_bit arch___test_and_clear_bit
>  =20
>   /* WARNING: non atomic and it can be reordered! */
> - static inline int __test_and_change_bit(unsigned int nr,
> - 					    volatile unsigned long *addr)
> + static __always_inline int
>  -arch___test_and_change_bit(int nr, volatile unsigned long *addr)
> ++arch___test_and_change_bit(unsigned int nr, volatile unsigned long *add=
r)
>   {
>   	unsigned long mask =3D BIT_MASK(nr);
>   	unsigned long *p =3D ((unsigned long *)addr) + BIT_WORD(nr);
> @@@ -101,7 -112,8 +112,8 @@@
>    * @nr: bit number to test
>    * @addr: Address to start counting from
>    */
> - static inline int test_bit(unsigned int nr, const volatile unsigned lon=
g *addr)
> + static __always_inline int
>  -arch_test_bit(int nr, const volatile unsigned long *addr)
> ++arch_test_bit(unsigned int nr, const volatile unsigned long *addr)
>   {
>   	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
>   }

This is now a conflict between the asm-generic tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/w9YMOJeofzoq.TrKzaRkUcX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEu8XMACgkQAVBC80lX
0GyIUgf/XYFOTexPjokTCue3/dyvsfC6tNZe677XlYoqnAQ03DMsLolliQL5WlCV
42UvkB1TQyliSJQYzc3aqfTVHuMQjsEVRhcyezwqN8AYwAoDa3ZvN8nnAZRuHopW
z4TCl2LLI/7GMoLLy515jaSh4sU0HAQYagabwSXtnBRTDnwYZqCTednsVoZG0ZOZ
7QoYf2g6xLloOR6tbw++AbDXA9bwm6T6bN1U2ShTOnRdSmqneHTo6uzGMGBA1C8C
HRdeTrw3bE2vJ/jwj8rxP8gNtrFJb87asUCs+zYUvB08xvRMiSt+6M0d2VqtG/D6
BpdmFsjPN/ZGUENNgQGA32LjIsdHLA==
=u4GC
-----END PGP SIGNATURE-----

--Sig_/w9YMOJeofzoq.TrKzaRkUcX--
