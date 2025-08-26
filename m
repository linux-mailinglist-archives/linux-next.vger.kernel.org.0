Return-Path: <linux-next+bounces-8099-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F619B355F0
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 09:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7F927A2C9F
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 07:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8A71EBA07;
	Tue, 26 Aug 2025 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TBPN00xq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD101F8AC5;
	Tue, 26 Aug 2025 07:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756194247; cv=none; b=S9sEmU9R0lrpMePSWp+unNy9LluPrcDACcMXGVFOgfJzKzQ5E2HvVFzrupec5SiFe+fvtwttOnUC5TuRcWuMT/8rX6TbXyPWdCzRahyNEbWCdDy/gi+pCe1FYob0nGX51kmYLQ26yJsUla7xbqmJsnhGM+9RLM8ax4UIb5VrUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756194247; c=relaxed/simple;
	bh=Xbuj/Jne+2+1agm5wbBpnWdlskflyBul0lPIRP9Yd6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tr0amRcj2mUFF5/t5jwLaxElijB89gF7L5Vz71wqgn0QcBBD8yZqqsQmIJhJG+PKSp5nvp94XX72RZCKSm8qaz5UWkhYL8FhPPZmdZPTZqfQX7buYFswvOdhw8jR6XqBlfnyG2F7T3MaVeHN+YADBSm0ExRaAGQVWJt/LgckfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TBPN00xq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756194242;
	bh=TJgOPP+dBX0nmIaXZy8DB8qcVP78wlRjmiQVIvlQqls=;
	h=Date:From:To:Cc:Subject:From;
	b=TBPN00xqeQYajk7uAxXiogDsgtkuaDq8gfz8cZ3cvnu1HHzvi37C3s0m2BE8FCBQK
	 7d8qf3YgjaeFQYVy2v+Z7TLcf3F6j1991meuHZn/iN1euSGI93Bu+uq2w7/tCcpZW/
	 o2Myh7Dazv4dMnM2rsURufl6lyBn3yWoKxldj0K9E1ljOth8aXAzFQL5A9HDHTPPc5
	 DEH9N5+aebdN9OZ8VUmBy+QsDaGdf9wXIlai23V/QFexP/3h1S9rOAMeDYzqZRqXqA
	 9yKWyXT0IK8XmkW/MzKTNHJFbie7ZII4nat1ze2fUnrAUXY0fjLcqah4Nc4Hf8wQtw
	 y97a/Px7LrVrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cB0696pzbz4x3N;
	Tue, 26 Aug 2025 17:44:01 +1000 (AEST)
Date: Tue, 26 Aug 2025 17:44:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Juergen Christ
 <jchrist@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kspp tree with the s390 tree
Message-ID: <20250826174401.37803a3a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EkUfQqqLzR1LhcrT72cNYVN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EkUfQqqLzR1LhcrT72cNYVN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/s390/include/asm/bitops.h

between commits:

  de88e74889a3 ("s390/bitops: Slightly optimize ffs() and fls64()")
  669bc57e7016 ("s390/bitops: Optimize inlining")

from the s390 tree and commit:

  5f8ee21b8fb2 ("s390: Add __attribute_const__ to ffs()-family implementati=
ons")

from the kspp tree.

I fixed it up (Maybe - see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,

diff --cc arch/s390/include/asm/bitops.h
index 9dfb687ba620,fbcc3e1cc776..000000000000
--- a/arch/s390/include/asm/bitops.h
+++ b/arch/s390/include/asm/bitops.h
@@@ -179,7 -179,7 +179,7 @@@ static __always_inline unsigned char __
   *
   * Undefined if no bit exists, so code should check against 0 first.
   */
- static __always_inline __flatten unsigned long __ffs(unsigned long word)
 -static inline __attribute_const__ unsigned long __ffs(unsigned long word)
++static __always_inline __flatten __attribute_const__ unsigned long __ffs(=
unsigned long word)
  {
  	return __flogr(-word & word) ^ (BITS_PER_LONG - 1);
  }
@@@ -191,11 -191,12 +191,11 @@@
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
  /**
@@@ -204,7 -205,7 +204,7 @@@
   *
   * Undefined if no set bit exists, so code should check against 0 first.
   */
- static __always_inline __flatten unsigned long __fls(unsigned long word)
 -static inline __attribute_const__ unsigned long __fls(unsigned long word)
++static __always_inline __flatten __attribute_const__ unsigned long __fls(=
unsigned long word)
  {
  	return __flogr(word) ^ (BITS_PER_LONG - 1);
  }
@@@ -220,9 -221,11 +220,9 @@@
   * set bit if value is nonzero. The last (most significant) bit is
   * at position 64.
   */
- static __always_inline __flatten int fls64(unsigned long word)
 -static inline __attribute_const__ int fls64(unsigned long word)
++static __always_inline __flatten __attribute_const__ int fls64(unsigned l=
ong word)
  {
 -	unsigned long mask =3D 2 * BITS_PER_LONG - 1;
 -
 -	return (1 + (__flogr(word) ^ (BITS_PER_LONG - 1))) & mask;
 +	return BITS_PER_LONG - __flogr(word);
  }
 =20
  /**
@@@ -232,7 -235,7 +232,7 @@@
   * This is defined the same way as ffs.
   * Note fls(0) =3D 0, fls(1) =3D 1, fls(0x80000000) =3D 32.
   */
- static __always_inline __flatten int fls(unsigned int word)
 -static inline __attribute_const__ int fls(unsigned int word)
++static __always_inline __flatten __attribute_const__ int fls(unsigned int=
 word)
  {
  	return fls64(word);
  }
Stephen Rothwell

--Sig_/EkUfQqqLzR1LhcrT72cNYVN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmitZcEACgkQAVBC80lX
0GxcaAgAkmKpn+1IXulc0z2Oc130gH8jOu1KJECuoKnW6fGzgruXpNm5otGGiF7L
ZTieOcjOnDcsbmrURC+IznHEZPvAgk/51CVNf3pEg6XV7B22BJ1220gZgE5RJCH5
FKUTHydqMnpqpCSiAWEsb0EysWedSZL0Ge7OnNauoTV9lXY0agSah1s9xS4kEFoD
x49uFmfM6E0bWZIlyXTDZ1MDwPGcpG4I3BZT+E8bUX3Oy3vhJv2hKWaHXBEh70na
lvrVf+NyvryQCZSp2JUAPvBNKmMcnA/sXcr0ma7A1cIl/1VztBk9UT/vwfIoJUNX
cM/gM01NwGF69JvR+KMp5QVPl/i+6w==
=sfXS
-----END PGP SIGNATURE-----

--Sig_/EkUfQqqLzR1LhcrT72cNYVN--

