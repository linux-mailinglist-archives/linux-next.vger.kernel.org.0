Return-Path: <linux-next+bounces-8493-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D01BA00D5
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 16:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8929324CCC
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 14:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125D82DEA86;
	Thu, 25 Sep 2025 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cypQLsTQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD882DEA67;
	Thu, 25 Sep 2025 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758811190; cv=none; b=RHP+FIcaSTEDz1yVu4UHiLFRYMPx9n6Fv5aphsgkwdA8njLsvSDovyy1g1pbKaMCPVwRPcYbLrl7GnByvXl5RQupHMfX//ucMVVKKmz4bNZWw0U9uA9G+nNMYfzfm553YzwXcTeS4vYMn9pzOIYsXsm3UgG6HOOf927IKs4FWI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758811190; c=relaxed/simple;
	bh=KCWgb74c/CGFgfp/1smK75zzYg6w78M/SEP8uUs4fiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UH+ZE5VZQmvnOBY2+jDp2j1nlSuxgVVrz1EiNbgjKm8rbDowTiJhl4HRzEv4pX89olms7AlaBPi/Qe9Yn0DuyeQsX9EWzqOHwaotx4PyVLB1cHRmC9d0YqZ14R1iOL3CjySVpW6EHXpGZamc/ENgOuZU32gHVJ7rhRFyWizpPbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cypQLsTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31549C4CEF0;
	Thu, 25 Sep 2025 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758811188;
	bh=KCWgb74c/CGFgfp/1smK75zzYg6w78M/SEP8uUs4fiU=;
	h=Date:From:To:Cc:Subject:From;
	b=cypQLsTQzAhu4TxqAyaM7ZVVKjxrt4o23gwRneoiXF5jo7Ck4FyeSwcvp6B8RvRSt
	 83f4auBfH6hC6BVpFdn3W7pwK0Ja56PomfKawzr0oK9rrU3YJBOCWw/7Ah5oK1QL/1
	 F9Ri28TQQ6Uk8Rn6HH6/RnSO9hFYibmsL/cFDE+DFJHwMhgXYk4C1oO78Eqvgg7Tvy
	 68QpnxfUuijonghrCIjfzmhaFyFtyf0uZMS2whp3idys2KGtzgEJ5RLiOdykjR/BG0
	 SGzs5pW1bjNGf0skIr1aQF8oa6V3IiNjGs4Av/0njBCl0vNyiJs3MPm9UI0A2QQ8cC
	 UuRV76ApqEKTg==
Date: Thu, 25 Sep 2025 15:39:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kspp tree with the s390 tree
Message-ID: <aNVUMLnpNVGWz7Pb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iyqCpx4w4xR71n71"
Content-Disposition: inline


--iyqCpx4w4xR71n71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/s390/include/asm/bitops.h

between commits:

  de88e74889a30 ("s390/bitops: Slightly optimize ffs() and fls64()")
  7b80a23c0e33a ("s390/bitops: Switch to generic fls(), fls64(), etc.")
  6c4e0cb3d87ad ("s390/bitops: Switch to generic ffs() if supported by comp=
iler")

=66rom the s390 tree and commit:

  b77fee88bfdfc ("s390: Add __attribute_const__ to ffs()-family implementat=
ions")

=66rom the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/s390/include/asm/bitops.h
index 1564dd3a5a826,fbcc3e1cc7769..0000000000000
--- a/arch/s390/include/asm/bitops.h
+++ b/arch/s390/include/asm/bitops.h
@@@ -189,26 -191,58 +189,26 @@@ static __always_inline __attribute_cons
   * This is defined the same way as the libc and
   * compiler builtin ffs routines (man ffs).
   */
- static __always_inline __flatten int ffs(int word)
 -static inline __attribute_const__ int ffs(int word)
++static __always_inline __flatten __attribute_const__ int ffs(int word)
  {
 -	unsigned long mask =3D 2 * BITS_PER_LONG - 1;
  	unsigned int val =3D (unsigned int)word;
 =20
 -	return (1 + (__flogr(-val & val) ^ (BITS_PER_LONG - 1))) & mask;
 +	return BITS_PER_LONG - __flogr(-val & val);
  }
 =20
 -/**
 - * __fls - find last (most-significant) set bit in a long word
 - * @word: the word to search
 - *
 - * Undefined if no set bit exists, so code should check against 0 first.
 - */
 -static inline __attribute_const__ unsigned long __fls(unsigned long word)
 -{
 -	return __flogr(word) ^ (BITS_PER_LONG - 1);
 -}
 +#else /* CONFIG_CC_HAS_BUILTIN_FFS */
 =20
 -/**
 - * fls64 - find last set bit in a 64-bit word
 - * @word: the word to search
 - *
 - * This is defined in a similar way as the libc and compiler builtin
 - * ffsll, but returns the position of the most significant set bit.
 - *
 - * fls64(value) returns 0 if value is 0 or the position of the last
 - * set bit if value is nonzero. The last (most significant) bit is
 - * at position 64.
 - */
 -static inline __attribute_const__ int fls64(unsigned long word)
 -{
 -	unsigned long mask =3D 2 * BITS_PER_LONG - 1;
 +#include <asm-generic/bitops/builtin-ffs.h>
 =20
 -	return (1 + (__flogr(word) ^ (BITS_PER_LONG - 1))) & mask;
 -}
 -
 -/**
 - * fls - find last (most-significant) bit set
 - * @word: the word to search
 - *
 - * This is defined the same way as ffs.
 - * Note fls(0) =3D 0, fls(1) =3D 1, fls(0x80000000) =3D 32.
 - */
 -static inline __attribute_const__ int fls(unsigned int word)
 -{
 -	return fls64(word);
 -}
 +#endif /* CONFIG_CC_HAS_BUILTIN_FFS */
 =20
 +#include <asm-generic/bitops/builtin-__ffs.h>
 +#include <asm-generic/bitops/ffz.h>
 +#include <asm-generic/bitops/builtin-__fls.h>
 +#include <asm-generic/bitops/builtin-fls.h>
 +#include <asm-generic/bitops/fls64.h>
  #include <asm/arch_hweight.h>
  #include <asm-generic/bitops/const_hweight.h>
 -#include <asm-generic/bitops/ffz.h>
  #include <asm-generic/bitops/sched.h>
  #include <asm-generic/bitops/le.h>
  #include <asm-generic/bitops/ext2-atomic-setbit.h>

--iyqCpx4w4xR71n71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVVC8ACgkQJNaLcl1U
h9DeyAf+LTOGFuR4QJFQSpyX1l6xtC9Rna12EM10VfZf/lgJmq0YILsLjzxilL5Z
6kqlcZLxeT8KTeewVNpuOEA9uq9+EA40+k53GMiYi2TVW13xLapBTIL/SSaWmR1o
lyrb0gUpYUGpqhUlEmwBajrkMwkI/4IOJWwlo2LV9c3NvSF0asZe/frCdnCxDdPJ
fSx96lWFHxk0xf/zlvKp5pcB+IKYyvuvlWWeKbASPHpg05pJV/71EW9Chbxi6onO
twHyY9YYsiz3vIoxBTbINcj33JWZOqOd2fqnW9JF75GLRSIBwUNj1P9O376MeuRS
a8U8VCu9RNSKxZaFg0qsYbtkrK4m7w==
=Xnft
-----END PGP SIGNATURE-----

--iyqCpx4w4xR71n71--

