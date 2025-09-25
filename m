Return-Path: <linux-next+bounces-8488-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA16B9F633
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 14:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C9DE167E39
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 12:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D501F4168;
	Thu, 25 Sep 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSZCFFfg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B31010A1E;
	Thu, 25 Sep 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805150; cv=none; b=LsSQYtzNm5vFlYOpUYY1vWofJl+qDwCaKAzScKHOPfzSWpOic9GXA8E6Tf4jD14QTx+093koG5UUzoS1qtkIjwaXmUi0ubwe1U3NRGQWTf1GgTkTM+70FxeXUiw+qPpiAwOuiT6sbpsimY11S1E9VzNAEDvYvhbe4APb58STmBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805150; c=relaxed/simple;
	bh=F6XColUgIhkBhPw+h2oNdyvwqh8JeLOvELcUxYdZ3ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sO4ohYI6aIrKllGH/AaREiIvtgHT8q5GC9omUtwqfZam7MeFNoUkdEN4DHaZ9LciDQwMLwFVOsPXjpcvEjW81hVj7gQLKOPDybDAhdZCdlLhOYPRtXOS7xF81LpBDj890vc/ni4LNHhAzBCnVmd7ZOQGVcrPIW2hVy2PQnQQ73U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSZCFFfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1294DC4CEF0;
	Thu, 25 Sep 2025 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758805150;
	bh=F6XColUgIhkBhPw+h2oNdyvwqh8JeLOvELcUxYdZ3ak=;
	h=Date:From:To:Cc:Subject:From;
	b=HSZCFFfg0v6b5YNh9Y2Ri5NTzu+x1VdN80AHcTAIpXQWRyt/4RG4Kj6zy+sBbGVvc
	 hydqAA9qkkojIv95arAZ2DIu4XZPfenwgki+vhMlzMM3Glzz0xhKUhApNJqx/Z1WQl
	 iruCii3wlA2mYaDezunSXtKfXbVoDkfJq8JRhUwYulTEaYerIYF2NGWZbOVklE0hSi
	 ts1MAumV5Nuobu2rZX380QtZGGIFgYqr0eiydR5CEM8G9T/zVBDvWdkvN+jibKaDIz
	 p0q8t4aWJmVUCzW76AEwhCz3FJoNfF94s0WsfBWJShJBiYJP4e2SMGaPaiGwTN5CtX
	 qWabP0GDh6DZg==
Date: Thu, 25 Sep 2025 13:59:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the mm-stable tree with the mm-hotfixes
 tree
Message-ID: <aNU8moQVmqvduSPU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3efV7VqFbuT2mjeH"
Content-Disposition: inline


--3efV7VqFbuT2mjeH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-stable tree got a conflict in:

  arch/riscv/include/asm/pgtable.h

between commit:

  668208b161a0b ("riscv: use an atomic xchg in pudp_huge_get_and_clear()")

=66rom the mm-hotfixes tree and commit:

  546e42c8c6d94 ("riscv: Use an atomic xchg in pudp_huge_get_and_clear()")

=66rom the mm-stable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/include/asm/pgtable.h
index 8150677429398,e69346307e786..0000000000000
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@@ -944,15 -944,9 +944,15 @@@ static inline int pudp_test_and_clear_y
 =20
  #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
  static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
- 					    unsigned long address,  pud_t *pudp)
+ 					    unsigned long address, pud_t *pudp)
  {
 +#ifdef CONFIG_SMP
- 	pud_t pud =3D __pud(xchg(&pudp->pud, 0));
+ 	pud_t pud =3D __pud(atomic_long_xchg((atomic_long_t *)pudp, 0));
 +#else
 +	pud_t pud =3D *pudp;
 +
 +	pud_clear(pudp);
 +#endif
 =20
  	page_table_check_pud_clear(mm, pud);
 =20

--3efV7VqFbuT2mjeH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVPJkACgkQJNaLcl1U
h9DqSAf+ICid/kRUg8jcphA0mKa5fYuP6j56xb9xEvwTo05XdjeJ8suSW9OOinz6
0Qsbz5NqfN1qPaE8wEplKOB3j6m4q2lvn2c+7ZiKMmvnaNxLyxvakSvEdsab9zs3
7FGDKxQ/SoSi1ZMgGwmGp2DkoWwkhjNvUHzmInItsv1r42iTEbC6KhETbeaG4xk2
d9hnY/6bjXpxdFVZj/DCEd+w9su1bC3tToAc/VshSFeWtU4UNAwy1IaojhQRBv4h
X4r5akZG7NPExKSlDeDYc8SU7nMIja20x/SayLwmRNolfc+b1pv+s9j4UhOfzP4M
JYYA4qUZQpjsEWUd+ToNJikab/I4zQ==
=7VIj
-----END PGP SIGNATURE-----

--3efV7VqFbuT2mjeH--

