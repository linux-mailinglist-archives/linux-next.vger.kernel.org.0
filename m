Return-Path: <linux-next+bounces-3669-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4A8970F76
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 09:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83B40281BC4
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 07:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766ED1AE048;
	Mon,  9 Sep 2024 07:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kEjNdvJH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E15C4C81;
	Mon,  9 Sep 2024 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725866329; cv=none; b=uiQguZ8WL44oVTlLT8ov38tPEw5ynPvR7o7X0WX/D2mrKACrUZatLy1rDIPvbyxh8nvIcVYIK21Q4HG9naM6D06Uc2zcmjfOxUGDsiMUNKAZGJSGz36yRjNjbgD4q/BeRzJW2XXPfeUpqW58eM86cqcmI5XAQz2F0FrCBwEXU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725866329; c=relaxed/simple;
	bh=uSBT+2ZS7N4sOrnksbRMtBqH2e+perNwHJltyYlV2ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hW6Y7XceHg0iq32AHK68FMOwx7UXjDOOK3uWPUvXHFrW2CkNPq6bblsLEm3KGXjZaS9iPa8uz18A7pR3CiAVtABFfr7qkklSxFaFQd2/7QmS4hhrc6DNC1g/IhF3GzbkBSzYZDoEi/0fPFjqSUKQvEKK4CsWj8wIigc9Qnd8KhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kEjNdvJH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725866324;
	bh=cZ9Ws7jwqU7Aoicrgkwssz4SkyhrfvULp6MxNh+/B3o=;
	h=Date:From:To:Cc:Subject:From;
	b=kEjNdvJHtkADEW6djyRzfrfT6gZ+KMA8A9eLclmpexKdh/+R7ypaDFv670IUUW+Kz
	 SPfgCSzGjdvGVC5PCcByMmoAWqoDp58bmFZ2gPMYUiGVfwhi11qWMbeED7uN9OAceS
	 drg7pksL3rQe+jH3jAqLpY8QWHSZgyYy5pnYIProBxOsT8w4vPWWRMne1evsXelHbd
	 OqyWAqKt9al8YiIZGRbrgi4/O2GCIgWpjQRBZMDmSl04/4dFsW5+oAdQ1ekSZO1bKM
	 66UbyA7+DdxNRQQaj+gnaKIdtTVPNGqsVHW7dUQKgvB+/qd1zDKKXZdOuFtU0uZGjJ
	 Cbe5ebbO+Mf4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2J903smjz4w2L;
	Mon,  9 Sep 2024 17:18:44 +1000 (AEST)
Date: Mon, 9 Sep 2024 17:18:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jeff Xu <jeffxu@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yu Zhao <yuzhao@google.com>
Subject: linux-next: manual merge of the execve tree with the mm tree
Message-ID: <20240909171843.78c294da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DxtzOtVfTsxkYrhrKc8U88d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DxtzOtVfTsxkYrhrKc8U88d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the execve tree got a conflict in:

  include/linux/mm.h

between commits:

  99ab6f0a6854 ("mm/codetag: fix pgalloc_tag_split()")
  4d42ecdbd2fb ("mm/codetag: add pgalloc_tag_copy()")

from the mm-unstable branch of the mm tree and commit:

  44f65d900698 ("binfmt_elf: mseal address zero")

from the execve tree.

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
index 79d69e998649,a178c15812eb..000000000000
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@@ -4148,61 -4201,14 +4148,71 @@@ void vma_pgtable_walk_end(struct vm_are
 =20
  int reserve_mem_find_by_name(const char *name, phys_addr_t *start, phys_a=
ddr_t *size);
 =20
 +#ifdef CONFIG_MEM_ALLOC_PROFILING
 +static inline void pgalloc_tag_split(struct folio *folio, int old_order, =
int new_order)
 +{
 +	int i;
 +	struct alloc_tag *tag;
 +	unsigned int nr_pages =3D 1 << new_order;
 +
 +	if (!mem_alloc_profiling_enabled())
 +		return;
 +
 +	tag =3D pgalloc_tag_get(&folio->page);
 +	if (!tag)
 +		return;
 +
 +	for (i =3D nr_pages; i < (1 << old_order); i +=3D nr_pages) {
 +		union codetag_ref *ref =3D get_page_tag_ref(folio_page(folio, i));
 +
 +		if (ref) {
 +			/* Set new reference to point to the original tag */
 +			alloc_tag_ref_set(ref, tag);
 +			put_page_tag_ref(ref);
 +		}
 +	}
 +}
 +
 +static inline void pgalloc_tag_copy(struct folio *new, struct folio *old)
 +{
 +	struct alloc_tag *tag;
 +	union codetag_ref *ref;
 +
 +	tag =3D pgalloc_tag_get(&old->page);
 +	if (!tag)
 +		return;
 +
 +	ref =3D get_page_tag_ref(&new->page);
 +	if (!ref)
 +		return;
 +
 +	/* Clear the old ref to the original allocation tag. */
 +	clear_page_tag_ref(&old->page);
 +	/* Decrement the counters of the tag on get_new_folio. */
 +	alloc_tag_sub(ref, folio_nr_pages(new));
 +
 +	__alloc_tag_ref_set(ref, tag);
 +
 +	put_page_tag_ref(ref);
 +}
 +#else /* !CONFIG_MEM_ALLOC_PROFILING */
 +static inline void pgalloc_tag_split(struct folio *folio, int old_order, =
int new_order)
 +{
 +}
 +
 +static inline void pgalloc_tag_copy(struct folio *new, struct folio *old)
 +{
 +}
 +#endif /* CONFIG_MEM_ALLOC_PROFILING */
 +
+ #ifdef CONFIG_64BIT
+ int do_mseal(unsigned long start, size_t len_in, unsigned long flags);
+ #else
+ static inline int do_mseal(unsigned long start, size_t len_in, unsigned l=
ong flags)
+ {
+ 	/* noop on 32 bit */
+ 	return 0;
+ }
+ #endif
+=20
  #endif /* _LINUX_MM_H */

--Sig_/DxtzOtVfTsxkYrhrKc8U88d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeoVMACgkQAVBC80lX
0Gxa9wf+LgzFtBA2glaByxbxFshjIzpX9VPJ83gTnG/dCNnHe07SBPz498q7bVF2
lR5it47/rBvE/5FNkqUWT8DXO0Czfs4P5Ols4gJ4FtDqNQhy/H6xZzawgVGmrj5W
lBq3htRsj5Ba7I5nh88jtKIWjz3kdqnksZ9aniGjqlWyPWyARRyQx5lnHj+GYeVG
cER0YLKkP5ZE2tXa0HIHkjHy6l04p1sH1uh7ViH/021VYdqIxiY5ZGJf4VJnfFKN
4CKJKFk95Fmky3RPlljPwMTPy14hkrHCcsGtBaF/OePUPXwTT2AuV9XvIrTqpNM+
fySt9IL2/s9t95Jm9Vi9693P3kJyHg==
=kHmE
-----END PGP SIGNATURE-----

--Sig_/DxtzOtVfTsxkYrhrKc8U88d--

