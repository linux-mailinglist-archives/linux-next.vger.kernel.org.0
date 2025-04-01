Return-Path: <linux-next+bounces-6135-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2452AA78532
	for <lists+linux-next@lfdr.de>; Wed,  2 Apr 2025 01:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3B0A16CB6D
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 23:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0AE1FBCBD;
	Tue,  1 Apr 2025 23:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BD3FPvlm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0DF1A5BB0;
	Tue,  1 Apr 2025 23:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743549631; cv=none; b=P87Ha43dK02u7/RiTb4N/eX6iC/uwGA6wIaBOa55Ol1hrl6JS235hHfmczh8q7bq++cqJ87dHFq2errTrnQCn3u4WU2vebCRBpsFYe8kL7j0uMfVOIod/cUURd8Y/m8pwzwid+RXKbyA4/mRucZqUOMsOzech0gMfJnzzR43fNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743549631; c=relaxed/simple;
	bh=SdGfe4HdfJjIe9OI0mn7guY6sY3j7loryFLpiLoQOJM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YwX3M17ow6YiE99Hhoxw7wMQ9ScSd5RnctCod4y0WHJ0IrrVGisUc4EvOySXrNoWNRIDLSx5hkap49aYLjtTJZJDy0dGqLN0/14c+iAYcme4QnKDLGoBEZAeyn+OtlmHkLMb2sKRdTOXFEw9GeRvgr2YuTX7/TVw3akk98JqdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BD3FPvlm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743549618;
	bh=8Vs0Q1M7JCePHwzjAATmXva0xwwPXX+W8jZzUx7dQSs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BD3FPvlmbMbRqOc5QymvffGVe6S+lZuRa0UuvGvimIT/GNaPvw7rdaKuKOO7AZQsq
	 +B8K6c11JOXNOYrTn4nVVqizgW3eC27+hWv/qf8eIa88y8NK7epOjTvHeQ8OFaxtB6
	 uBNdVYF1z/Ii4bHK56xlpvGNwfa/BvmuLIHjVpDpWAnNN7wy32fuyb6qSi/39x0Ys2
	 OWcYCgdmIs+3ISXnPeR/rJpai9mW9E2ChmnkfYwgL6uptImUBh+CLdkebdNVH78UqZ
	 3G9Jg56nmRsOfEPr0ZTY+CnVvnavAA9JTIhKxvY5T5tsm/Wo1xrTh2wAoVMlcXMFMK
	 uHXMvVK5XImMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZS3rK6tgRz4wcT;
	Wed,  2 Apr 2025 10:20:17 +1100 (AEDT)
Date: Wed, 2 Apr 2025 10:20:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard@nod.at>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Johannes Berg <johannes.berg@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>, Tiwei Bie <tiwei.btw@antgroup.com>
Subject: Re: linux-next: manual merge of the uml tree with the mm-stable
 tree
Message-ID: <20250402102016.6ab2367d@canb.auug.org.au>
In-Reply-To: <20250319105554.2e2f3aab@canb.auug.org.au>
References: <20250319105554.2e2f3aab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6jRmPQ=VKeP4uWTcAj2n0_m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6jRmPQ=VKeP4uWTcAj2n0_m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Mar 2025 10:55:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the uml tree got a conflict in:
>=20
>   arch/um/kernel/mem.c
>=20
> between commits:
>=20
>   0d98484ee333 ("arch, mm: introduce arch_mm_preinit")
>   8afa901c147a ("arch, mm: make releasing of memory to page allocator mor=
e explicit")
>=20
> from the mm-stable tree and commit:
>=20
>   e82cf3051e61 ("um: Update min_low_pfn to match changes in uml_reserved")
>=20
> from the uml tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
>=20
> diff --cc arch/um/kernel/mem.c
> index 379f33a1babf,61b5a5ede01c..000000000000
> --- a/arch/um/kernel/mem.c
> +++ b/arch/um/kernel/mem.c
> @@@ -66,11 -68,11 +68,12 @@@ void __init arch_mm_preinit(void
>   	map_memory(brk_end, __pa(brk_end), uml_reserved - brk_end, 1, 1, 0);
>   	memblock_free((void *)brk_end, uml_reserved - brk_end);
>   	uml_reserved =3D brk_end;
> + 	min_low_pfn =3D PFN_UP(__pa(uml_reserved));
>  -
>  -	/* this will put all low memory onto the freelists */
>  -	memblock_free_all();
>   	max_pfn =3D max_low_pfn;
>  +}
>  +
>  +void __init mem_init(void)
>  +{
>   	kmalloc_ok =3D 1;
>   }
>  =20

This is nw a conflict between the uml tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6jRmPQ=VKeP4uWTcAj2n0_m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfsdLAACgkQAVBC80lX
0GzLFAgAjSvEglF9TcUJNM5ZgLelGVRac0nLh45FFPQ+AcKEbJnAl9xBLG6zrKsi
zNm659QWp8jSNWyGrrAdlHrIOl/NaPLtIDOc6gcz0WuPzTk3o11PDCJg1bJl10KY
wm8yq2/poMycvxqBflJjkEtnQFhs9FQWbCHQri3m+Uv9zrdUvIb6WJx/r2j+TaNU
Nn3RzNspyl+f3MeHA7smCO5c3qe0qdKwIqYTx+7WXyMYSZNZBmLprCcCtmvMI7tg
T6N9jn5ot9XSMrzCgqiNjdsV2hqkiasvOmBUWtGrFI+6BwvLObon0u6SJaMnAhei
34fMgajwQFY3H4svOd6GrVh4qLcCJg==
=xrW5
-----END PGP SIGNATURE-----

--Sig_/6jRmPQ=VKeP4uWTcAj2n0_m--

