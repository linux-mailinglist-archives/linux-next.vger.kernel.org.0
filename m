Return-Path: <linux-next+bounces-4545-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B909B70A1
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 00:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 113A71F22E37
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 23:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F5C215034;
	Wed, 30 Oct 2024 23:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lFz3Q/Gx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C191C4612;
	Wed, 30 Oct 2024 23:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730331783; cv=none; b=XizriBNGpU7mvwb1hxzWrRrwecmh/GX/rDtNWLW9oGzXr9cxKTDKIuAjXwEUF/ZPp362p1qKr7d3e9Me/JTnr2fvd97uDr8TqeBTTOiJmcz9CP/s4ERbEkRvZTlBdP9lNLLX4ReCk9/ktJ6ZTngrdjTe41IOPD53IAMcxweh0ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730331783; c=relaxed/simple;
	bh=qtcfWsrOn2NX4DBLEslNFsRGrjdjBKzPsPCBsB3+Z7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TRTEFzjZfvZjMk7lgbADkig4KuX3HpM7LLDhAP9Z9ePAqUWDoEerqAnSlMQJDrIo8BDfybdt3jOAjHUgahQouIMm9hRbcXygyl5HGhRb0bXW5r9Q/12cZAQky+IMVkfASJsLmyOD/7Y+pBjCFugaDp1D+P0N4I7gzeB8YubAmC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lFz3Q/Gx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730331768;
	bh=AXMx9nl2tLFImeFyGiVngs7AGi2aGD4bZUIkGqoZDag=;
	h=Date:From:To:Cc:Subject:From;
	b=lFz3Q/Gx7u37ZMUJzJNvJfED7q9dVVrZYP28OuFYtwlOg7U9ZZk9Jq3hetrL1ZtVx
	 iUHRfqwUK7TNWLmlvKI0/Y/U5iVbWsMe0nJqLdjSYAFte2OjwwLJm44p8Htkb6kDjb
	 zaWxqtIFt5Pt4vmp9VEhU8ZCP6mLDtkozyzqdHKQSiuQUXCLMXChfClDq+aAz9BSva
	 +rapeU23g8oEAaxOL8zo2bTtd38jZZ9NMAzibsM1Rep1EQft5E+WofWAMJDjXdIRWj
	 0OS+lncXuTn2FoDOf5Ww4vug0t6zBeS98++YdgwAppfhybjEMGCMsqBdr/xc4hGoud
	 BJOhECs4LvSKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xf3Zw0MTzz4xNG;
	Thu, 31 Oct 2024 10:42:47 +1100 (AEDT)
Date: Thu, 31 Oct 2024 10:42:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Yang Shi <yang@os.amperecomputing.com>
Subject: linux-next: manual merge of the arm64 tree with the mm-hotfixes
 tree
Message-ID: <20241031104247.65c76c00@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P0qTPTw8QTqhgdYeCKJ/JxU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P0qTPTw8QTqhgdYeCKJ/JxU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/include/asm/mman.h

between commit:

  5af5d93e04c1 ("mm: refactor arch_calc_vm_flag_bits() and arm64 MTE handli=
ng")

from the mm-hotfixes-unstable branch of the mm-hotfixes tree and commit:

  25c17c4b55de ("hugetlb: arm64: add mte support")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/mman.h
index 798d965760d4,1dbfb56cb313..000000000000
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@@ -42,7 -39,7 +42,7 @@@ static inline unsigned long arch_calc_v
  	 * filesystem supporting MTE (RAM-based).
  	 */
  	if (system_supports_mte() &&
- 	    ((flags & MAP_ANONYMOUS) || shmem_file(file)))
 -	    (flags & (MAP_ANONYMOUS | MAP_HUGETLB)))
++	    ((flags & (MAP_ANONYMOUS | MAP_HUGETLB)) || shmem_file(file)))
  		return VM_MTE_ALLOWED;
 =20
  	return 0;

--Sig_/P0qTPTw8QTqhgdYeCKJ/JxU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcixHgACgkQAVBC80lX
0Gzupgf/cHETjatJdrfa386wZWnW5YrOc6iQAArx/qir8mpCFrkqf5U0/e+s/ZJd
tkSrWqSplIAWYSsoLyl52G41u1kyF6688BMolfVGG/02AueSGRDheCnY5ogGadmL
27MoeDMUihM+HvBYIXpBQIOSq7Tp1sU/6Vy68mK8pNG3JvpqY+81j/T+fkImC6rW
jr4pycTa28ZCv0bJUTg1YrIwwB8WdbwAnrIQSR/oH+uhuLS48jOfb9Nm75iGHkXJ
52/dm/L3TcJItGeClwDFr43h6FQOm+/VqG5DCAtjKKbXhbRraeSZNAFXtYhFRQrO
tVOvr8eoazr2Z1JrkJMsY94V/zxnyA==
=PzvZ
-----END PGP SIGNATURE-----

--Sig_/P0qTPTw8QTqhgdYeCKJ/JxU--

