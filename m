Return-Path: <linux-next+bounces-3917-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A946097C223
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2024 01:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC2CB1C21CB6
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 23:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51841BF33E;
	Wed, 18 Sep 2024 23:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Xd42YF+L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2CE17BEB7;
	Wed, 18 Sep 2024 23:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700653; cv=none; b=Xms3SAobH9non4p26AqqSPmbFeEyau0+2sFmoLCsl7AQPigmSOM0kMdsVINm49NMi/a3j1oOCS9oyky9OSkOHHC5C1jw6pNprFdGKUIUFwAF5dUwxrHt7GnpBO9Zv3YREXAxow88XHo/2yk7Y0vv0sEOBaKUhbWnvubQ792/SBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700653; c=relaxed/simple;
	bh=esnSunhQqIePqw8T82wJhKYUg7vAtVonlRyNWfy26nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhuULjmfBjSPnGaKcyvPSemmNeLf4ml5zeIjGeN6brmKH0w59GOJgW4wDyJtFyBZ6mdvrZLn+VKPfZPbiaMLu3/kK/rTLZU4wiBOmui2tIzcDFMcyhHZQZB/N2pGIJWIsKuobZgjdZ7hIwitlnJxnW77XxXJV0gUW2rrt8YBjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Xd42YF+L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726700649;
	bh=w5ZUe2n66+HmOGjMNMZO7YmCadAXr8Vgiuzi7WmcYHs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xd42YF+LzDxEL1j5k9xCIb8Uk3mPau3f/w8CgofByNP0D/yQAmfRLN2Ts891V0XIx
	 1kC1xs/ROepWBMbb6Yei3Y+hPGazlKxvhSfCzio6ryEkPz88ViQ1U1c5Y0vLMSILGm
	 AuQcks2ZSN5VIUxMHq0DQxVtManharQYWfMmh+SQJsM/HgJAqSl0+KhQDGygoL43Tx
	 CgE9j7gEIiDPimcXQenkATOy0ASJ4zQba5yDTYQtoK1jq3+6Vi8OQ0ULEYYhJRvUN6
	 8MLriQ2c3XzoTNjpWrex2fpZqHJ5PuKfRaGsgrOqdlao45qAM9042c5SJa4WAjqyki
	 unlV1laIcN/NA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8Djh5ycBz4x2g;
	Thu, 19 Sep 2024 09:04:08 +1000 (AEST)
Date: Thu, 19 Sep 2024 09:04:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Jeff Xu <jeffxu@chromium.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yu Zhao <yuzhao@google.com>
Subject: Re: linux-next: manual merge of the execve tree with the mm tree
Message-ID: <20240919090407.30c30759@canb.auug.org.au>
In-Reply-To: <20240909171843.78c294da@canb.auug.org.au>
References: <20240909171843.78c294da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O4sf0IwIek/e2XnMQTbZopU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/O4sf0IwIek/e2XnMQTbZopU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 9 Sep 2024 17:18:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the execve tree got a conflict in:
>=20
>   include/linux/mm.h
>=20
> between commits:
>=20
>   99ab6f0a6854 ("mm/codetag: fix pgalloc_tag_split()")
>   4d42ecdbd2fb ("mm/codetag: add pgalloc_tag_copy()")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   44f65d900698 ("binfmt_elf: mseal address zero")
>=20
> from the execve tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/mm.h
> index 79d69e998649,a178c15812eb..000000000000
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@@ -4148,61 -4201,14 +4148,71 @@@ void vma_pgtable_walk_end(struct vm_are
>  =20
>   int reserve_mem_find_by_name(const char *name, phys_addr_t *start, phys=
_addr_t *size);
>  =20
>  +#ifdef CONFIG_MEM_ALLOC_PROFILING
>  +static inline void pgalloc_tag_split(struct folio *folio, int old_order=
, int new_order)
>  +{
>  +	int i;
>  +	struct alloc_tag *tag;
>  +	unsigned int nr_pages =3D 1 << new_order;
>  +
>  +	if (!mem_alloc_profiling_enabled())
>  +		return;
>  +
>  +	tag =3D pgalloc_tag_get(&folio->page);
>  +	if (!tag)
>  +		return;
>  +
>  +	for (i =3D nr_pages; i < (1 << old_order); i +=3D nr_pages) {
>  +		union codetag_ref *ref =3D get_page_tag_ref(folio_page(folio, i));
>  +
>  +		if (ref) {
>  +			/* Set new reference to point to the original tag */
>  +			alloc_tag_ref_set(ref, tag);
>  +			put_page_tag_ref(ref);
>  +		}
>  +	}
>  +}
>  +
>  +static inline void pgalloc_tag_copy(struct folio *new, struct folio *ol=
d)
>  +{
>  +	struct alloc_tag *tag;
>  +	union codetag_ref *ref;
>  +
>  +	tag =3D pgalloc_tag_get(&old->page);
>  +	if (!tag)
>  +		return;
>  +
>  +	ref =3D get_page_tag_ref(&new->page);
>  +	if (!ref)
>  +		return;
>  +
>  +	/* Clear the old ref to the original allocation tag. */
>  +	clear_page_tag_ref(&old->page);
>  +	/* Decrement the counters of the tag on get_new_folio. */
>  +	alloc_tag_sub(ref, folio_nr_pages(new));
>  +
>  +	__alloc_tag_ref_set(ref, tag);
>  +
>  +	put_page_tag_ref(ref);
>  +}
>  +#else /* !CONFIG_MEM_ALLOC_PROFILING */
>  +static inline void pgalloc_tag_split(struct folio *folio, int old_order=
, int new_order)
>  +{
>  +}
>  +
>  +static inline void pgalloc_tag_copy(struct folio *new, struct folio *ol=
d)
>  +{
>  +}
>  +#endif /* CONFIG_MEM_ALLOC_PROFILING */
>  +
> + #ifdef CONFIG_64BIT
> + int do_mseal(unsigned long start, size_t len_in, unsigned long flags);
> + #else
> + static inline int do_mseal(unsigned long start, size_t len_in, unsigned=
 long flags)
> + {
> + 	/* noop on 32 bit */
> + 	return 0;
> + }
> + #endif
> +=20
>   #endif /* _LINUX_MM_H */

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/O4sf0IwIek/e2XnMQTbZopU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrXGcACgkQAVBC80lX
0GyqWAf/fVu0zg1L5AHxhN3quMiMz2pb0CBTfFdzZaPQBHwCIPYb4QZBt6kTm9N9
nDxAIg8aK06yxrd2iiYkc4hyvIGFZxp6QB8zS3WMx79VkcNu3CZggc8xQA0tX2H8
qt5xObP4vOT1LwMPPxz9QoBDLPaO+0Ome27Gkb/76LsmCQhTulvoTDgUhPDjvzbz
Crz8bTCCTJtKWj9RbrLjLE0sw5OhIngAC5LdwsKoDb16Hy8Xb9uJ9tkyeR7unw9a
YZ4YX75jjRgS/DF9iBNodLym39DyI3gKJnN4cMGUe03bJv8P/0A+AT2SSDSsKYNu
BEuTbtNcBfCRTzcKfOF+D6wKG7k52w==
=zRLY
-----END PGP SIGNATURE-----

--Sig_/O4sf0IwIek/e2XnMQTbZopU--

