Return-Path: <linux-next+bounces-3109-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98293A9AF
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 01:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E489FB22B88
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 23:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55DF148312;
	Tue, 23 Jul 2024 23:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="W+8H03OG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12E914885D;
	Tue, 23 Jul 2024 23:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721776559; cv=none; b=mXDizz7AyTu6yid0IOVBJzjksOTBFX82/bnrwOXeR/ZCKVijPENQhb7b+eZKzNReLoBdyh4zRF1aO1r6Nh5qk72bz2go43DL15sm6YrDjjmizeghIZrPJDJ1TI412wMx6G6pzYLMrIzAH7EQXDUYoELzuOe7WdsqZER0v32I+3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721776559; c=relaxed/simple;
	bh=CyYzwpdVWfTfXLgu/yla8MlhCX9Ps1DJTbNrZi5Ew1s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8FrFQVnBdc28iHJOZcPmwVpiYSXTsLakIeURmfRYGWpE5M7+uJadFrJpSflssH4bpFG36TTS0IXVKDZpBt8nQK3EKm2I1GxwaWB0rjF61bDvJrO86TxQyxRNFhRF9FRYuqOEiAeaaiWo6Q7BiEUVXNRB27ENHRGOYhPZXrz6xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=W+8H03OG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721776556;
	bh=gg6BnTcQIoW83jNpgXswR9Cycsf32qwRpl2HDMIOddk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W+8H03OG4ILaPxTNqht32ECKD4786zSmKChODfca19jxGCptO+S8lPZ91MexLJjuB
	 a/hYmB4QZQQ0++td5tMcsObwYkbj7C+LZWRQUUXlP0iqXMch+WweUabfeaUqZ5TrVo
	 V/VgK9YMbwGjlK8nVIzK9aaoHXuOxF+bhd0VnGFDnEcBF6IWWKrMbjvbVeLupyiKJS
	 rm6V34MD1G3cpy8/R+ogPZ2qKSfOeTah4GqrVp3eDvkL0+jm62FRaCM0Ksipmywp+j
	 kSgwmJ+t7ws08kUVhpxogyIHBi3j7U35roicjsPjjYhiTA3HVKs/+a24JF691zvIXZ
	 jdOB/Ja2DBkMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTCgb0TyHz4w2K;
	Wed, 24 Jul 2024 09:15:55 +1000 (AEST)
Date: Wed, 24 Jul 2024 09:15:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song
 <baohua@kernel.org>, Barry Song <v-songbaohua@oppo.com>, Lance Yang
 <ioworker0@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the random tree with the mm-stable
 tree
Message-ID: <20240724091554.497bfed4@canb.auug.org.au>
In-Reply-To: <20240709174053.051a46a4@canb.auug.org.au>
References: <20240709174053.051a46a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yoH4g1BNxiS2m2j.KhhvkY/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yoH4g1BNxiS2m2j.KhhvkY/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 17:40:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the random tree got a conflict in:
>=20
>   mm/rmap.c
>=20
> between commits:
>=20
>   26d21b18d971 ("mm/rmap: remove duplicated exit code in pagewalk loop")
>   15bde4abab73 ("mm: extend rmap flags arguments for folio_add_new_anon_r=
map")
>=20
> from the mm-stable tree and commit:
>=20
>   94beef29e110 ("mm: add MAP_DROPPABLE for designating always lazily free=
able mappings")
>=20
> from the random tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc mm/rmap.c
> index 8616308610b9,1f9b5a9cb121..000000000000
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@@ -1394,27 -1384,26 +1394,30 @@@ void folio_add_anon_rmap_pmd(struct fol
>    *
>    * Like folio_add_anon_rmap_*() but must only be called on *new* folios.
>    * This means the inc-and-test can be bypassed.
>  - * The folio does not have to be locked.
>  + * The folio doesn't necessarily need to be locked while it's exclusive
>  + * unless two threads map it concurrently. However, the folio must be
>  + * locked if it's shared.
>    *
>  - * If the folio is pmd-mappable, it is accounted as a THP.  As the folio
>  - * is new, it's assumed to be mapped exclusively by a single process.
>  + * If the folio is pmd-mappable, it is accounted as a THP.
>    */
>   void folio_add_new_anon_rmap(struct folio *folio, struct vm_area_struct=
 *vma,
>  -		unsigned long address)
>  +		unsigned long address, rmap_t flags)
>   {
>  -	int nr =3D folio_nr_pages(folio);
>  +	const int nr =3D folio_nr_pages(folio);
>  +	const bool exclusive =3D flags & RMAP_EXCLUSIVE;
>  +	int nr_pmdmapped =3D 0;
>  =20
>   	VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
>  +	VM_WARN_ON_FOLIO(!exclusive && !folio_test_locked(folio), folio);
>   	VM_BUG_ON_VMA(address < vma->vm_start ||
>   			address + (nr << PAGE_SHIFT) > vma->vm_end, vma);
> -=20
> - 	if (!folio_test_swapbacked(folio))
> + 	/*
> + 	 * VM_DROPPABLE mappings don't swap; instead they're just dropped when
> + 	 * under memory pressure.
> + 	 */
>  -	if (!(vma->vm_flags & VM_DROPPABLE))
> ++	if (!folio_test_swapbacked(folio) && !(vma->vm_flags & VM_DROPPABLE))
>   		__folio_set_swapbacked(folio);
>  -	__folio_set_anon(folio, vma, address, true);
>  +	__folio_set_anon(folio, vma, address, exclusive);
>  =20
>   	if (likely(!folio_test_large(folio))) {
>   		/* increment count (starts at -1) */
> @@@ -1858,8 -1862,15 +1867,13 @@@ static bool try_to_unmap_one(struct fol
>   				 * discarded. Remap the page to page table.
>   				 */
>   				set_pte_at(mm, address, pvmw.pte, pteval);
> - 				folio_set_swapbacked(folio);
> + 				/*
> + 				 * Unlike MADV_FREE mappings, VM_DROPPABLE ones
> + 				 * never get swap backed on failure to drop.
> + 				 */
> + 				if (!(vma->vm_flags & VM_DROPPABLE))
> + 					folio_set_swapbacked(folio);
>  -				ret =3D false;
>  -				page_vma_mapped_walk_done(&pvmw);
>  -				break;
>  +				goto walk_abort;
>   			}
>  =20
>   			if (swap_duplicate(entry) < 0) {

This is now a conflict between the random tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/yoH4g1BNxiS2m2j.KhhvkY/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagOaoACgkQAVBC80lX
0GxKJQf/ZzR40VzIkyAgCtZLTvs4uJmdf7/bHvC1MyJlCWLRDmpJEUU82OZlb46w
q89w/gEJJCcvoO62afhEY9YHoPEiBgztAyS4TWteSHS/wfabUqO74pv1bpoQyggu
YxFfzSjxXWHo8ell99Vdql/dDKYaYTj5+beWT2mEU+7C4IKZ/1CPYI22JWK8Th1m
VPJXgZDAiwQNqeK9uV3gWcUBkHZYg33mBOtzEu4R3APHjGSU/1I67kvpdcB5i8k2
7YbeIAhyuK7xFNioK1ahW/3JAjP99Xc60lQHdJfnWaJb0eFhEmDfQbmnuNnJWgPY
k8MXRSIfO4AzKVFJfK4hkyxcorJevQ==
=lJCZ
-----END PGP SIGNATURE-----

--Sig_/yoH4g1BNxiS2m2j.KhhvkY/--

