Return-Path: <linux-next+bounces-4814-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D49D31DA
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 02:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFBB51F238D7
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 01:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6B317C91;
	Wed, 20 Nov 2024 01:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i98xjEL4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED2AEED8;
	Wed, 20 Nov 2024 01:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065556; cv=none; b=Vz7TVHbADvVuufvpX0Y5a/caM910boNdfbOSwSUnl7BwXL0fNsRx+QEo1KFfkI/ougTuBmuJHC+KJ938zJ3gwvDragoLVqSA+sJwlgqU15yYbx+d4Sm/n8zwWv4FlP59S3iUFDD53unkXhlsV8Shs7b/OxV5oP+9sQExT2NFMcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065556; c=relaxed/simple;
	bh=LS36WzC1vHM1bDQEy88QOgHxaM80RcL9ebChJUr95U8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4O9FV2mm8RDN9lU8zkH1AHWvx9F6sY3ipG15pEmSukkMUBGWEIiwYLk5DdAxu5H21o6zKeFyVPuWnUJ+JTjn9k/3a570AMFcsbDfoFVW+9S+eHbH4aENzTgcaF6JM1zsTeCMGw6joxFCiqy53HfOfk1jmcMjZk2Fj4Wy6yCCZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i98xjEL4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732065546;
	bh=oQWAyMlcER0yyskUI8rGHrgY1NmCDuDpMSytMU+quK4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i98xjEL4h45TS2qYTonEl+117Gzt6evwz5+wOQedigokDh6QyPys2I/7+kYQZ0MSM
	 TR4DnXvoEXd8kL6RsjYUF3G1nNOu7xJ71Qp7tcSvcWCtx1E5ls8BYm+KVJxX05ThtE
	 tnPuoyFlmF6uxAmKi7Du8UaUAKz2vltZXgL3aeS/Mf49129aRub/t2xjnEmgNJEyUz
	 BhTZsSZpi75F2inyGEMCMyL9uxGhmCgb7IAc6yRu0lBAQ8K/jsEdrRN8GMc8C94NW/
	 fZWLrQWaTCe4MjY4E4S4zdwmclNJWtruJHCiufTeaKOOazv+169OVLjAzobE2c95DH
	 UJ2FmXNhFzWZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtNmp2Q5Rz4xfJ;
	Wed, 20 Nov 2024 12:19:06 +1100 (AEDT)
Date: Wed, 20 Nov 2024 12:19:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: linux-next: manual merge of the s390 tree with the mm tree
Message-ID: <20241120121908.15749360@canb.auug.org.au>
In-Reply-To: <20241028111606.5c009055@canb.auug.org.au>
References: <20241028111606.5c009055@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZNdjOeeaWv6U66hhL68/gG+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZNdjOeeaWv6U66hhL68/gG+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Oct 2024 11:16:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the s390 tree got conflicts in:
>=20
>   arch/s390/include/asm/set_memory.h
>   arch/s390/mm/pageattr.c
>=20
> between commit:
>=20
>   4c5768ef0fd7 ("arch: introduce set_direct_map_valid_noflush()")
>=20
> from the mm-unstable branch of the mm tree and commit:
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
> diff --cc arch/s390/include/asm/set_memory.h
> index 240bcfbdcdce,cb4cc0f59012..000000000000
> --- a/arch/s390/include/asm/set_memory.h
> +++ b/arch/s390/include/asm/set_memory.h
> @@@ -62,6 -62,6 +62,7 @@@ __SET_MEMORY_FUNC(set_memory_4k, SET_ME
>  =20
>   int set_direct_map_invalid_noflush(struct page *page);
>   int set_direct_map_default_noflush(struct page *page);
>  +int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool v=
alid);
> + bool kernel_page_present(struct page *page);
>  =20
>   #endif
> diff --cc arch/s390/mm/pageattr.c
> index 4c7ee74aa130,aec9eb16b6f7..000000000000
> --- a/arch/s390/mm/pageattr.c
> +++ b/arch/s390/mm/pageattr.c
> @@@ -406,17 -406,21 +406,33 @@@ int set_direct_map_default_noflush(stru
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
> + 		"	ipm	%[cc]\n"
> + 		: [cc] "=3Dd" (cc), [addr] "+a" (addr)
> + 		:
> + 		: "cc");
> + 	return (cc >> 28) =3D=3D 0;
> + }
> +=20
>   #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
>  =20
>   static void ipte_range(pte_t *pte, unsigned long address, int nr)

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZNdjOeeaWv6U66hhL68/gG+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9OQwACgkQAVBC80lX
0Gwuagf/fmX9crxO87s++/cJmh++kbLunB5oHj1sc27uO2xoWe1iksoMMaSrTMdw
/ouOq3cxdqKtgDqEmxHgSbRFqCeAFwR7zBgGsHbfI0ywGLv+TrAhKel4DvFLC5Bv
HWAa9Sw/5IRoFc5T0kN5nhPmF/DElC56f/gExJpxOXl9oKvmsDnnxMFpatVPZ5qW
GbMYMevpEZjbA18BFGIBs5DRoWtRbJZhOamreP1kg2K+SDSZNWqt2Vss1QmUMu0d
eTEjxOvvxmKm/1GKUJbxUYxS+kpE6y5vwIv0GOqp0aS0+C9W85Mej0HSQRAjWnrc
/2HhdELwtlCTsiqinwRUovp1nGxqKw==
=SZIH
-----END PGP SIGNATURE-----

--Sig_/ZNdjOeeaWv6U66hhL68/gG+--

