Return-Path: <linux-next+bounces-4815-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F262C9D31DC
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 02:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABEE81F235D3
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 01:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C87168DA;
	Wed, 20 Nov 2024 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CWrJvMkK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB7EED8;
	Wed, 20 Nov 2024 01:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065609; cv=none; b=Zdnb+Lu6aiER7FjB8HVMZjp54u9YM42FnlaUYM2JEqH1eqoGEilUhKbWjS9VXKChyk0Dn1mXdQG36VsiMRoOVXRfapd0j+C8RmkP3lyeh52jZJT8JWzWNlAwxtc7SWkM6CGUUPCsSdLQDKW5lucJ55V1gAtqliKXwqtL1nnLTIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065609; c=relaxed/simple;
	bh=IJ1MYQeEStQoTeW52aS7iwwtNzVJbKWAwJZO6s1lDwc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qq0BX0Vv9KIMPOb2Vh6u44bnyTRE3dTcYq6+wnve8fkf+iIeqWHy0Mtpw4nUZ7kiCJGrsS9DGlzI1vBqhDoBo5VxKPQjhDV7AWsjIckgGhEgHuok/yE1h0qIg+QST6HBGaOAxnIM7mpnKzoZITsJLJb4shhjUsdlSHTQ1WzqRN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CWrJvMkK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732065601;
	bh=IpG8tDW9URWR1Td9JTIYwXZIcSQ4SdxH/NBzMahil7s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CWrJvMkKHqAtbtCGdIFmUb0t66zG9BZeJ3MIrkp6LgUmVBEQZ3Q+m/5K46C6qOcZQ
	 VGH2Fm2ed+xkzhiFF2mWhRWbtR7y0it9Fu5io4fNGJiBD33O1G1XpCsWLSMeAleK1b
	 DlcMHQ7YcUHrSyryF3G3e/C2XqwhoCSP/MOBIwREA+7s1QspEGv+W26hHoBmvznt+j
	 +Mhqbj0X58uVfP1N/S+3dXwBBXPJmGcdjH02p/94Jr1AZ7jdLzHADKPhy6GBuWcHNk
	 sUhcV93QHlOWDz35HiwACxYCk/aFAQlugrh6U94rO/ARbeq7Cp68Kx+qI7Th/3VExT
	 sRboDzn+WFSjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtNns611Yz4wc3;
	Wed, 20 Nov 2024 12:20:01 +1100 (AEDT)
Date: Wed, 20 Nov 2024 12:20:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the s390 tree with the mm-stable
 tree
Message-ID: <20241120122004.3131dcc2@canb.auug.org.au>
In-Reply-To: <20241114101639.282d82a8@canb.auug.org.au>
References: <20241114101639.282d82a8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i4VGi9YVWCK7o4==be+_/fh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i4VGi9YVWCK7o4==be+_/fh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 14 Nov 2024 10:16:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the s390 tree got a conflict in:
>=20
>   arch/s390/mm/pageattr.c
>=20
> between commit:
>=20
>   0c6378a71574 ("arch: introduce set_direct_map_valid_noflush()")
>=20
> from the mm-stable tree and commit:
>=20
>   2835f8bf5530 ("s390/pageattr: Implement missing kernel_page_present()")
>=20
> from the s390 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/s390/mm/pageattr.c
> index 4c7ee74aa130,4a0f422cfeb6..000000000000
> --- a/arch/s390/mm/pageattr.c
> +++ b/arch/s390/mm/pageattr.c
> @@@ -406,17 -407,21 +407,33 @@@ int set_direct_map_default_noflush(stru
>   	return __set_memory((unsigned long)page_to_virt(page), 1, SET_MEMORY_D=
EF);
>   }
>  =20
>  +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool v=
alid)
>  +{
>  +	unsigned long flags;
>  +
>  +	if (valid)
>  +		flags =3D SET_MEMORY_DEF;
>  +	else
>  +		flags =3D SET_MEMORY_INV;
>  +
>  +	return __set_memory((unsigned long)page_to_virt(page), nr, flags);
>  +}
> ++
> + bool kernel_page_present(struct page *page)
> + {
> + 	unsigned long addr;
> + 	unsigned int cc;
> +=20
> + 	addr =3D (unsigned long)page_address(page);
> + 	asm volatile(
> + 		"	lra	%[addr],0(%[addr])\n"
> + 		CC_IPM(cc)
> + 		: CC_OUT(cc, cc), [addr] "+a" (addr)
> + 		:
> + 		: CC_CLOBBER);
> + 	return CC_TRANSFORM(cc) =3D=3D 0;
> + }
> +=20
>   #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
>  =20
>   static void ipte_range(pte_t *pte, unsigned long address, int nr)

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/i4VGi9YVWCK7o4==be+_/fh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9OUQACgkQAVBC80lX
0GwlYgf/YuG5QOLqpG3v1vtjGVRH5hRxpa3w0bd6Q8kvWvh0vUv4vpuUzZdvR3BW
BBXN1x+34bjdJ0SADlzmupdjrGY4S2lwgN0XOBcntEtgOEbLpK5p9Seg961tyY+A
NcjqUpXPCP3MoilXjTEWJwXdPzS8iMnAV7yrj2VQlRLdFssYD77Dl6Ojs/OVOt+1
rdT7YH0uxVI6HLJV56/WrUZRoFoH6F5zavb4cYwZfg/pKK/9Md2dl2nO03Wgrow4
QhZB9UZlDKKhgiwQtZLBLHp5jVJrjBMZNdk8sMFerEYU8vrtDUf9JnzwWLTfX0wW
Fk7EKDwiIZN+OksrPKqh0iztPX/vvQ==
=lXNm
-----END PGP SIGNATURE-----

--Sig_/i4VGi9YVWCK7o4==be+_/fh--

