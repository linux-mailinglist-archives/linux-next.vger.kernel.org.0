Return-Path: <linux-next+bounces-4781-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5AA9C7EB6
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 00:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F89EB21F92
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 23:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C731E4A9;
	Wed, 13 Nov 2024 23:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P59TzV2x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E30918A6C4;
	Wed, 13 Nov 2024 23:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731539807; cv=none; b=RPkC2JkqEJ8bGX/i3ESqATk2FgEKeqKRO8IIlJ0lAh5kWED5xaa5fMQynI/ucbGn33bWt2kk9de2DeRCNEuhHuNitOYdM5Q8xGpccb6FDmUgDuZRcXy8eOzkvukG0MIWg4+Dyndz8dF0AsL8EEb5FB9wQGhCu2yHciRymovUvt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731539807; c=relaxed/simple;
	bh=eLPZySAr5ah2jWNF5m9y++XIhrhlgHyxsVGI9ViP0K4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ucCzdmSY9FaN2u/OdPG1nvVRMkZZsirpHjFpzqPy7xeULf49QOFvxZbuEl8S/2Cdr7otRH9p9v4EIJLeUEWPLZAofExfk50FOsKif/8wRXaQEvWCFU/jTL+Pf/ihCJKoO70P43kfQJvAzUrqQ/7Em78Z30d9maP+pXa2vtZrtyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P59TzV2x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731539797;
	bh=Vn0ei+bDcFq/ypZJSEZEfF0uK78HGJye4JovPySGCGY=;
	h=Date:From:To:Cc:Subject:From;
	b=P59TzV2x84U9aUdqtboqn8HRkEjI4ou0KH6TPDzJccOaUrZtFqeT8aPaC87CTHNwd
	 n+6uNVWxPtqLYXKyV8MWj2j65AJe0jViXh4yb4Sj84tdO/KfRjZL5INoND39ppb896
	 fVXhtShNa7lJfmSRIUsrgBNq/8qywv/s189fksnuCaYCFrqOUxeXEjXbByw0aizKhR
	 dzb7qbn8T9S3y660C1zQx7er1JLHQUO5mERJk+GGMS2AH48AgAiXT30NL5I9Y9QjH0
	 WvxPUfLqJkp041wID/jk/Bem0A0hWLkJMg5dKZ0frdZDCyCTq4fjnB2GrH1rioVwD1
	 N7MdndPJ/o06w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpfLF3Mpbz4w2L;
	Thu, 14 Nov 2024 10:16:37 +1100 (AEDT)
Date: Thu, 14 Nov 2024 10:16:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>
Subject: linux-next: manual merge of the s390 tree with the mm-stable tree
Message-ID: <20241114101639.282d82a8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jr2Zt0+3flw8=sSB3i.jmWK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jr2Zt0+3flw8=sSB3i.jmWK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  arch/s390/mm/pageattr.c

between commit:

  0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")

from the mm-stable tree and commit:

  2835f8bf5530 ("s390/pageattr: Implement missing kernel_page_present()")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/mm/pageattr.c
index 4c7ee74aa130,4a0f422cfeb6..000000000000
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@@ -406,17 -407,21 +407,33 @@@ int set_direct_map_default_noflush(stru
  	return __set_memory((unsigned long)page_to_virt(page), 1, SET_MEMORY_DEF=
);
  }
 =20
 +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool val=
id)
 +{
 +	unsigned long flags;
 +
 +	if (valid)
 +		flags =3D SET_MEMORY_DEF;
 +	else
 +		flags =3D SET_MEMORY_INV;
 +
 +	return __set_memory((unsigned long)page_to_virt(page), nr, flags);
 +}
++
+ bool kernel_page_present(struct page *page)
+ {
+ 	unsigned long addr;
+ 	unsigned int cc;
+=20
+ 	addr =3D (unsigned long)page_address(page);
+ 	asm volatile(
+ 		"	lra	%[addr],0(%[addr])\n"
+ 		CC_IPM(cc)
+ 		: CC_OUT(cc, cc), [addr] "+a" (addr)
+ 		:
+ 		: CC_CLOBBER);
+ 	return CC_TRANSFORM(cc) =3D=3D 0;
+ }
+=20
  #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 =20
  static void ipte_range(pte_t *pte, unsigned long address, int nr)

--Sig_/jr2Zt0+3flw8=sSB3i.jmWK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc1M1cACgkQAVBC80lX
0GxFiQf/cCowSzsRqfCBCF315T+w9C8dEJCwRxvQOr1/yBmS/vSOErR3gZStUipv
hKKp5AnskqBxwNd9xGNxsUH/0idnFpAcwhkT0+xeOaPCCuQkD7tyAoW1jyAE8Aeg
8pIiinZcN4OdnCVWYGf5O7f3DtxU8xYc30FGNEcPkNueb2ot9Fkcab0tMeZtrP/7
4+/cVWyrRPNpkpcIoWaHsJv+z9xvkh9ioT3ZNR6UPQz5nfDJekEeKfCznMBCd2co
8mhW3qtP1ujofJ1CeXx4IT9GnC7lMU7+1QbuK/1B9FgQEtJlLy28uhfvej7OqcnL
By5O1N3UUiDAzoBEmJY0l3kebMs54g==
=WeCS
-----END PGP SIGNATURE-----

--Sig_/jr2Zt0+3flw8=sSB3i.jmWK--

