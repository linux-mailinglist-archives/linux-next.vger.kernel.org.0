Return-Path: <linux-next+bounces-3903-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E0897B679
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 02:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4723B1F21E27
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 00:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155D7291E;
	Wed, 18 Sep 2024 00:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nMrnuoKz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3188475;
	Wed, 18 Sep 2024 00:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726619659; cv=none; b=B0aecwCtb7mepGZ3SeKEq86wM+kV80VuVZAsO59ydvbYFqJOgODHeLIcAwAkTnuk6fvEj/2z7QQA25pDPEEThYFlKIdqrt1Nh5fbUMJpiviv6LbT6NgSrANDPaTPH7a9b0ladePUG/pg5hK7PMie0YyYwcSm0xxS1XwGes9cFIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726619659; c=relaxed/simple;
	bh=a+BlwGFG+5s4JkwvEWk2YmHRSIaS4zNTEg8TgUmJXD0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oglL58STehSWKLuVE/f3v7nPSB1AEQfX1OduFaCq45irPVsASpbWNXhNt+n/xO/to2TeJo/BpJeF4Y88reMzCEP0lXvHLjSCEmhXB+HZ6HD6T2DJZApkwR/neI/ZFm0lI7tmEeVNSFLYctQXzaTqFY29OFTcv+y2uXFdN9MKNmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nMrnuoKz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726619653;
	bh=Y7RdCaCJSpI7y4dZYGtBSZyboY8YFXb+BALw4dYH4hs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nMrnuoKzCrIUR6mSkQinwuHj9CkRIxJCHXFcdNpL+6TLG5h0ujMkLStgItlfbjp6O
	 4sJ5dUjJMRMIJ4uEG+ltCeP/VXt8Hck3r7HegYI/4POsTEU4fsWePG8NDdSJZ2MrLC
	 SZtcMq4yYS/9glZGzLQ4CHd/Qdn9JIiIxW5QLM1+hu207aK2bz7zbIlbMVtaZga0Y4
	 wmFoc6lUi2SfRK7wCZDa/0OMwM2rka77pA5sZl16hzTNnrLKM0RL4BqCj4H2WUGPZ9
	 xQd+7qtx1lE91t6i/tGjz79gE93S5dZXqnWw4trtD8buK6Nk+x7J2mZR/fz9HtzMNl
	 H3NS7tafch/9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7fm46h4Yz4xWm;
	Wed, 18 Sep 2024 10:34:12 +1000 (AEST)
Date: Wed, 18 Sep 2024 10:34:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>, Usama Arif
 <usamaarif642@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the mm
 tree
Message-ID: <20240918103412.0ce158d9@canb.auug.org.au>
In-Reply-To: <20240902112101.2728f045@canb.auug.org.au>
References: <20240902112101.2728f045@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hSuACRlSa+dU/oh.351E_vK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hSuACRlSa+dU/oh.351E_vK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 2 Sep 2024 11:21:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the fs-next tree got a conflict in:
>=20
>   include/linux/huge_mm.h
>=20
> between commit:
>=20
>   bc47772ebe8b ("mm: introduce a pageflag for partially mapped folios")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   fd031210c9ce ("mm: split a folio in minimum folio order chunks")
>=20
> from the vfs-brauner tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/huge_mm.h
> index 0b0539f4ee1a,7c50aeed0522..000000000000
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@@ -326,14 -316,15 +328,15 @@@ unsigned long thp_get_unmapped_area_vmf
>   		unsigned long len, unsigned long pgoff, unsigned long flags,
>   		vm_flags_t vm_flags);
>  =20
>  -bool can_split_folio(struct folio *folio, int *pextra_pins);
>  +bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_=
pins);
>   int split_huge_page_to_list_to_order(struct page *page, struct list_hea=
d *list,
>   		unsigned int new_order);
> + int split_folio_to_list(struct folio *folio, struct list_head *list);
>   static inline int split_huge_page(struct page *page)
>   {
> - 	return split_huge_page_to_list_to_order(page, NULL, 0);
> + 	return split_folio(page_folio(page));
>   }
>  -void deferred_split_folio(struct folio *folio);
>  +void deferred_split_folio(struct folio *folio, bool partially_mapped);
>  =20
>   void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
>   		unsigned long address, bool freeze, struct folio *folio);
> @@@ -502,7 -487,13 +505,13 @@@ static inline int split_huge_page(struc
>   {
>   	return 0;
>   }
> +=20
> + static inline int split_folio_to_list(struct folio *folio, struct list_=
head *list)
> + {
> + 	return 0;
> + }
> +=20
>  -static inline void deferred_split_folio(struct folio *folio) {}
>  +static inline void deferred_split_folio(struct folio *folio, bool parti=
ally_mapped) {}
>   #define split_huge_pmd(__vma, __pmd, __address)	\
>   	do { } while (0)
>  =20

This is now a conflict between the vfs-brauner tree and the mm-stable
tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hSuACRlSa+dU/oh.351E_vK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbqIAQACgkQAVBC80lX
0Gw5Fwf/XExhKQhqzDndTG6HNeyd4+1EzAgpEsQk2DImaLBEFZDkp8wrbdP0DdLu
pP89BRyetN9D8el1wQOLktpuEnKgZPUnTe8Ga2r/4zMct6/xcQY0lBu5YgKTQra6
45Vg454Kun6oQ77CCv9adMJNPuOWAhxwSq7KO44brbxURpj+MMPYfxyqjXvVK4Cj
5JGli/6PCful+hDAw5pCK/X4FZfPDDOqPBqxLJ3PcGDyFRZCOY9VnCdSIPMqJUkl
75WV+aBLuOsF345N9WRflYIzLqm3pWqKd0Fd0mEB4Q4aZWuH8diBs1mjHeZdUxbF
aCocdxaRcuc0+CMmIEkVcuMFCWrpyw==
=PVJe
-----END PGP SIGNATURE-----

--Sig_/hSuACRlSa+dU/oh.351E_vK--

