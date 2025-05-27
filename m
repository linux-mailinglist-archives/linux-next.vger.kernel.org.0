Return-Path: <linux-next+bounces-6945-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43194AC5DEE
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 01:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F374C4A14F1
	for <lists+linux-next@lfdr.de>; Tue, 27 May 2025 23:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C1D218EBF;
	Tue, 27 May 2025 23:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lnXWlQTu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6720D4E7;
	Tue, 27 May 2025 23:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748390249; cv=none; b=uCjAU5k7TQZET0fbJ1kdKdT8PGPw7p1YqqxIm9PCOmP0PPAHCSV3EtfTdeV0WaStAS2LqgRBYeyDGKdldEybHsIizcZVmSavNJqEoGlaUW9RwRQHX03krzflaMBVx69Bnjn9o9aF9ms/Q7M33xxqJeoRCIb3yTZPaiI1uJmouLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748390249; c=relaxed/simple;
	bh=4rzospWiM3I9VYJW5PpLvtlA+s826zPjqIS9HklwM6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0HcFRVb1uu6fOGGBWKjMqGNFwueb5kTMPcB7Lw2aDASTRW0S0CV6a2Jnt3Z+fN6g38Q8WSruc9FL1cUG+xaHrMmh18M/NHCHlNCqTKmgkm0X/uIRG7508amnl7O1vLs88li72xZVs25Jp7DpsMa7nIR5M/nG7HImkAZLGAjW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lnXWlQTu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748390243;
	bh=uE7goBOyHoByTcAKpFO+8N6kWoUoMhxzA8GrTQkKBuQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lnXWlQTuZtPeeAvbcPhiGPBxAuoXyjQ4laLjkyvLCvdYdHNSO3XgvGj1JM9V6A8EL
	 maQMmfG9aXjaW2Lk4EKxNzksRuyIyHDqsf9x7yRp5eRWiriPiN5VkBHuW+ixzGP1Fj
	 vHqPsTBVcxlc2e210rufZ7sQUnGpHzrW9xF7Hn/q6y/oWUGdpv2v+ZUgLLhNldvveb
	 zntb8BuPSH676yhrIutLidrw/3ZttMthRgsx0v5PQGW0UG4XMUmCjH0ntqxzLG9CKH
	 6lsbBq6DycvsuitO3UYdUANf7c/S3ikwco+9l/G3jgH+3aKWXftLcANBj8YWN+KEoz
	 lIdzwI5oRO1Aw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6V1G6p44z4wc3;
	Wed, 28 May 2025 09:57:22 +1000 (AEST)
Date: Wed, 28 May 2025 09:57:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the mm-unstable
 tree
Message-ID: <20250528095722.11a4bb16@canb.auug.org.au>
In-Reply-To: <20250515151102.5b0f9e4f@canb.auug.org.au>
References: <20250515151102.5b0f9e4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kLuN.o/neRA1gXKG9RIMQaE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kLuN.o/neRA1gXKG9RIMQaE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 15 May 2025 15:11:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/mm/pat/memtype.c
>=20
> between commit:
>=20
>   f387f960a89a ("x86/mm/pat: factor out setting cachemode into pgprot_set=
_cachemode()")
>=20
> from the mm-unstable tree and commit:
>=20
>   1b3f2bd04d90 ("x86/devmem: Remove duplicate range_is_allowed() definiti=
on")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/x86/mm/pat/memtype.c
> index ccc55c00b4c8,c97b527c66fe..000000000000
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@@ -773,39 -775,6 +775,12 @@@ pgprot_t phys_mem_access_prot(struct fi
>   	return vma_prot;
>   }
>  =20
> - #ifdef CONFIG_STRICT_DEVMEM
> - /* This check is done in drivers/char/mem.c in case of STRICT_DEVMEM */
> - static inline int range_is_allowed(unsigned long pfn, unsigned long siz=
e)
> - {
> - 	return 1;
> - }
> - #else
> - /* This check is needed to avoid cache aliasing when PAT is enabled */
> - static inline int range_is_allowed(unsigned long pfn, unsigned long siz=
e)
> - {
> - 	u64 from =3D ((u64)pfn) << PAGE_SHIFT;
> - 	u64 to =3D from + size;
> - 	u64 cursor =3D from;
> -=20
> - 	if (!pat_enabled())
> - 		return 1;
> -=20
> - 	while (cursor < to) {
> - 		if (!devmem_is_allowed(pfn))
> - 			return 0;
> - 		cursor +=3D PAGE_SIZE;
> - 		pfn++;
> - 	}
> - 	return 1;
> - }
> - #endif /* CONFIG_STRICT_DEVMEM */
> -=20
>  +static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache=
_mode pcm)
>  +{
>  +	*prot =3D __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
>  +			 cachemode2protval(pcm));
>  +}
>  +
>   int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
>   				unsigned long size, pgprot_t *vma_prot)
>   {

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/kLuN.o/neRA1gXKG9RIMQaE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2UWIACgkQAVBC80lX
0Gzpagf/dD1biF/kx5BhKiF1y1iONLJDxX7ExGyiIQR5nlRCUdQ3FjSeJUeUFYm8
XRN7Rl+LSXsngljetgn/ebpCMR8Z5Sl/YYZP0ynjcnFM2bKbKAbz3p9BTkBz0WOA
kK8+zYFzRarIFVrWEW+aXeW+rU26D6meQZXLzfhqmUmM1MY3L8nFAPmqpmHa+X9F
bxPGLFXVZoT0L9vAwWdFydayofIt4zNryeouw7eaCABgXu0z/w3zQDhINCHyZhEJ
Mba9sXCtL4NXf81+0AVvtZWBwXadUdIrArjySKY+9k35aruazbA9OMIhxe7lcvGp
w9ngUpLaUWnF1U6sSyIIo1rlt5F06g==
=n4GM
-----END PGP SIGNATURE-----

--Sig_/kLuN.o/neRA1gXKG9RIMQaE--

