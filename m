Return-Path: <linux-next+bounces-4460-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC43B9B217E
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 01:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AA1EB20C85
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 00:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C03636D;
	Mon, 28 Oct 2024 00:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iNuWMQLe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25641C14;
	Mon, 28 Oct 2024 00:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730074265; cv=none; b=t6cRVUCj/jSWx2SoMAOH3pngndmZDDmBTCGQjt9QycViqMyRPWcbROZA3bSEe9KGyqGCCKR3JgCaq8YF0C1IB2Nl2OSXm6A5wGMdF396/2ggqu1OFEu318nG8l7he9CmooAL4J9Fu3EusKJQSVbbozq26fDHD/nllLgcw0i53t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730074265; c=relaxed/simple;
	bh=PC9bKQALiYZTqF0bok6kbzuPsfj/mgFgbQFZm68W64o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=duXjvNDkdZIpl4lpU4yOE70ju5VVc16DhGIxpE4YdzVWKgbebTXbJ3hx33KCyUZiogaV42Kp/x6kGv6D0dZnv12GuQ8IBU9T9r2mKWXnv1YtCjl0gcdjeRzK6UaEd8wc8XlKTGV8Otf9izmhOB7PLUrVpzQtrLwJxisuewFS6zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iNuWMQLe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730074257;
	bh=hbGF7aUiGqIVN2g21lq8oiyVZdqqDcJaXyUQHQXXHwQ=;
	h=Date:From:To:Cc:Subject:From;
	b=iNuWMQLe1CYX3lJB5aL+RJ54KvdwD/BFoQOWCzFh8j5kf5lRKB6v97zhscm+xjW6J
	 LMRDYFdFXNY7YLxPpegocK0RKd8pnTYAcCUF9wgF3NCcx/fp09rE0i1oUazTqnGA2I
	 VI6zxkk3Y/h2CMfyv6tKV+dqnVxRUIAfpxE7i2IDF5zfzX3Fmu2xMBA7/koQzxQCvu
	 9CUhXNmiLLiVZHtJl2BMFjjWfoVGaJ6jdGOAFhrwzrHiQD98tsaSDv01ZpBEFeOmRR
	 tbzb6hOaDc/XnRF2idmDF/2eTL+U33Cwtj9ysKRF5kKfFRyFkZijy8xx3BKKjlYq5L
	 QF3K3zC1bat2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcDLn47L5z4wc4;
	Mon, 28 Oct 2024 11:10:57 +1100 (AEDT)
Date: Mon, 28 Oct 2024 11:10:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>
Subject: linux-next: manual merge of the arm64 tree with the mm tree
Message-ID: <20241028111058.4419a9ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0mrtXIushRlvIHX=G.X+.AB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0mrtXIushRlvIHX=G.X+.AB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  include/linux/mm.h

between commit:

  e87ec503cf2e ("mm/codetag: uninline and move pgalloc_tag_copy and pgalloc=
_tag_split")

from the mm-unstable branch of the mm tree and commit:

  91e102e79740 ("prctl: arch-agnostic prctl for shadow stack")

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

diff --cc include/linux/mm.h
index 086ba524d3ba,8852c39c7695..000000000000
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@@ -4166,4 -4174,65 +4178,8 @@@ static inline int do_mseal(unsigned lon
  }
  #endif
 =20
 -#ifdef CONFIG_MEM_ALLOC_PROFILING
 -static inline void pgalloc_tag_split(struct folio *folio, int old_order, =
int new_order)
 -{
 -	int i;
 -	struct alloc_tag *tag;
 -	unsigned int nr_pages =3D 1 << new_order;
 -
 -	if (!mem_alloc_profiling_enabled())
 -		return;
 -
 -	tag =3D pgalloc_tag_get(&folio->page);
 -	if (!tag)
 -		return;
 -
 -	for (i =3D nr_pages; i < (1 << old_order); i +=3D nr_pages) {
 -		union codetag_ref *ref =3D get_page_tag_ref(folio_page(folio, i));
 -
 -		if (ref) {
 -			/* Set new reference to point to the original tag */
 -			alloc_tag_ref_set(ref, tag);
 -			put_page_tag_ref(ref);
 -		}
 -	}
 -}
 -
 -static inline void pgalloc_tag_copy(struct folio *new, struct folio *old)
 -{
 -	struct alloc_tag *tag;
 -	union codetag_ref *ref;
 -
 -	tag =3D pgalloc_tag_get(&old->page);
 -	if (!tag)
 -		return;
 -
 -	ref =3D get_page_tag_ref(&new->page);
 -	if (!ref)
 -		return;
 -
 -	/* Clear the old ref to the original allocation tag. */
 -	clear_page_tag_ref(&old->page);
 -	/* Decrement the counters of the tag on get_new_folio. */
 -	alloc_tag_sub(ref, folio_nr_pages(new));
 -
 -	__alloc_tag_ref_set(ref, tag);
 -
 -	put_page_tag_ref(ref);
 -}
 -#else /* !CONFIG_MEM_ALLOC_PROFILING */
 -static inline void pgalloc_tag_split(struct folio *folio, int old_order, =
int new_order)
 -{
 -}
 -
 -static inline void pgalloc_tag_copy(struct folio *new, struct folio *old)
 -{
 -}
 -#endif /* CONFIG_MEM_ALLOC_PROFILING */
 -
+ int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __u=
ser *status);
+ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long sta=
tus);
+ int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st=
atus);
+=20
  #endif /* _LINUX_MM_H */

--Sig_/0mrtXIushRlvIHX=G.X+.AB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce1pIACgkQAVBC80lX
0GyySwf7BrPsHhFOn5msLSZWyyZX3T3cJ+9BFSTKLmhvKjWWvIIDM/CTRIfEvq7u
lsqOTQ92SncGpw2j1uMd31NFQCYoL92mvJLcFSSG79ymIGBrAUSvz9fqqddjL1ZI
uKdhsNlA0LNQbUWgLCEddcujSJ9jDtdzoAFYb2y6lEWpU0LPPTlPDgx1E7FyQ349
m1Er01Qgn2OFkfjzSgqEFpN9Bpw4hmm5zMLNUcM9vKzMJzncLePL/xujAXGeIUwV
Am3Fomjy2Wnr1Ms/nLCKACXSIMxfAqELeYo84d2aSMgY/k7bFcZzlx+XgEIz1hbh
GX4gBSDw1YPs4WbaTNno7wZe8t+Umg==
=5HvN
-----END PGP SIGNATURE-----

--Sig_/0mrtXIushRlvIHX=G.X+.AB--

