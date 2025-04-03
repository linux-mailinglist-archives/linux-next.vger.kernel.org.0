Return-Path: <linux-next+bounces-6155-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0BA7B296
	for <lists+linux-next@lfdr.de>; Fri,  4 Apr 2025 01:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC573B6045
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 23:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1931D1DE8A5;
	Thu,  3 Apr 2025 23:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lToLS+wr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55B1A5B86;
	Thu,  3 Apr 2025 23:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743724495; cv=none; b=t4Pz05fEFZ8kqS3/PrHsODU6HQ/2jFnOPTjF+GoSP/CUsxHVMB6YQYFYeFfUVo83TfCIScuwhUnLN6wFBlNlx9VHxvxswaUBDucIWuYjWeJjN3iPBa8hQCdfulAXAkJvvC8u/TuYSilC53p4p1s+mBNr5RNUL+AShyAKYFKQDIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743724495; c=relaxed/simple;
	bh=J/A9kkXZMWbK2k+Fc9/43oK2fXE6cA2yT12yWm6JO+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fEbTayqPks0vS/6wsWiXK+PtkFJiqFfKytzJgBTj/icdKIxv2i6ba/pZIzAI9LgjXYq8UMj4WdjiFg+6XUyvZ3vJfyUUe8bz8JqJ4hQ5DIFimyrEOonSRPFJ8o1BIS77QTuzUiDdQo2lDEjiQbM9iYtzWLYdH2LrCdrrl3+wArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lToLS+wr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743724482;
	bh=JGdpOJNTPd2/w43vm3vTfI8G+tDkXJCjTgFRlHSNunA=;
	h=Date:From:To:Cc:Subject:From;
	b=lToLS+wrsr7cKAYJdvaxZ23qiledMaPzG0+yN1jRzxk9aHLjNZThUndcdZwmZUlLD
	 0bjy2NEHZgEeO0bcpCyifrlrDxhmdfKUmXQMRwX0BZhymxoCWX4S34AE8fG3So3vmv
	 jz2r4d1RKzJAsuYCpisXeP9q7rqbAnxmpLX6sgUX04FPvfhbkQoQ2SrWTCUA30xv/x
	 Fs4NerRZYxZ6Rxxy1STAoOFXmL8fEl88/X+uKwHDOd77FWcT+RH48oV3DZFxjDcP3E
	 C5jc51oqiA//J9yM/N4LoZnkl4Q4mr6dK61HVudnDf/qLEGR64Y2Nla+ZC1vFXeBBt
	 6GBWkZJDqAxFw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZTJW53MSJz4x0s;
	Fri,  4 Apr 2025 10:54:41 +1100 (AEDT)
Date: Fri, 4 Apr 2025 10:54:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Bresticker
 <abrestic@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>
Subject: linux-next: manual merge of the risc-v tree with the mm tree
Message-ID: <20250404105440.16e0f73b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xrKDit.M39_M00voE6feKGB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xrKDit.M39_M00voE6feKGB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/include/asm/pgtable.h

between commit:

  012d57e6ee75 ("mm: introduce a common definition of mk_pte()")

from the mm tree and commit:

  03dc00a2b678 ("riscv: Support huge pfnmaps")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/include/asm/pgtable.h
index 293a7776fe07,428e48e5f57d..000000000000
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@@ -339,6 -343,16 +343,14 @@@ static inline pte_t pfn_pte(unsigned lo
  	return __pte((pfn << _PAGE_PFN_SHIFT) | prot_val);
  }
 =20
 -#define mk_pte(page, prot)       pfn_pte(page_to_pfn(page), prot)
 -
+ #define pte_pgprot pte_pgprot
+ static inline pgprot_t pte_pgprot(pte_t pte)
+ {
+ 	unsigned long pfn =3D pte_pfn(pte);
+=20
+ 	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
+ }
+=20
  static inline int pte_present(pte_t pte)
  {
  	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE));

--Sig_/xrKDit.M39_M00voE6feKGB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfvH8AACgkQAVBC80lX
0GwNNwf+LztRSEn/zyGUYDHUtXGLPxETFMbj7oJbzPyc9/xo1KNOqNNtjwUbj9Rq
rxOGYSdGVjWJZJgvIwrhdu6BYwDh+nMrgLoAqaO/MIRKl2N300CVIvj67ZXXbOEj
2Bv+um1hAH110vZiduwvi50lD9B/j1ll6cbBw6tVxWvkzAMCWB/nr9ZuvzbriOwL
aJ0+DxJuh+Lah1HqIjeybxx7Svlez38vdYiyknK3rYOF6qFKiQ8I0xUu3tGsTUh1
F0xpm/RZDXgq5qiysRR9hX5tUT43tH2gThXLzbzmfIp80IBFQoMjxLGrBzCQ+qAF
vfc3IavxofVo+5Uir58iEE2JDxynSw==
=YyOo
-----END PGP SIGNATURE-----

--Sig_/xrKDit.M39_M00voE6feKGB--

