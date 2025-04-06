Return-Path: <linux-next+bounces-6168-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA844A7D132
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 01:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 900F67A3F94
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 23:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755A719D890;
	Sun,  6 Apr 2025 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hRBLFgNX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EA68462;
	Sun,  6 Apr 2025 23:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743982553; cv=none; b=pYsBXR7djq1dLbktk4XIKmbSVG2FBU/Au67/dDjUKe3Fy1z4XDtFiqNXazuVWUiY8hxhl1MmrGnCmFr0lGLFdZdpcAvE0x34P4Hf4F7dYaRSzHIryuj6dqt+nfNEFH64OTpbDYlrrpUaIRtAEpMx3MBsSDtxiK9J2VO4Uf2z8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743982553; c=relaxed/simple;
	bh=Zo3AurB0Y7UfI0hPzYuWrTj0ZSUqgs9BG06IpLWL77k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EooXa+tMDqovKjmBY2eR4S2aKRxiSl+dxJOI7kSrtc/yAaa+lgw/RDX4EzoIkbMFP4pPFc/cNIjzU9Je77uCqOmOqbuWOQcES154rZN6VV4gwtzG5AkVnARQMIjHmxvpGQdhZzKhZ54rPohr7Wfb/rweH3JYsi+35vGjpsfKxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hRBLFgNX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743982548;
	bh=nTKXdUwJNILspVzayqodxDO7MlDO8j1A2PuIb4luFi0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hRBLFgNXGpb9mDfl+1f/Gm4qnDNq0YprXkmUCl909VeyU2zKdgDt3vCwKAkcjc+kZ
	 oScCmjRsv/FsRQ+xxMg2Qd9tpGiZmJKGemG4uiSME5T7b5f2plxZCu47KxviN9YjAU
	 JsD1Qjy1vJlDn+s5tew9wEmECRlL3zmxQ1gM07rLBVu/L/pCtXO33/qOBEzX637UHH
	 StLPwI/+cag76/VO7VT29SB1lkXLfFWG/W0bmICdIfcFEKfcm1O696cCeeyIQl915q
	 WKIFp21G9Y1jd5pBmhZaEWWylew/zk2Ju7gzDbWbPrkYp+n/TmBbaVudu9RN3bM5gF
	 q5T1qVwTQvWYQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZW7xv1Z50z4wxh;
	Mon,  7 Apr 2025 09:35:47 +1000 (AEST)
Date: Mon, 7 Apr 2025 09:35:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Bresticker
 <abrestic@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>
Subject: Re: linux-next: manual merge of the risc-v tree with the mm tree
Message-ID: <20250407093546.72a7030c@canb.auug.org.au>
In-Reply-To: <20250404105440.16e0f73b@canb.auug.org.au>
References: <20250404105440.16e0f73b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6/7ZO3jR33hqDP4usGskolM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6/7ZO3jR33hqDP4usGskolM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 4 Apr 2025 10:54:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the risc-v tree got a conflict in:
>=20
>   arch/riscv/include/asm/pgtable.h
>=20
> between commit:
>=20
>   012d57e6ee75 ("mm: introduce a common definition of mk_pte()")
>=20
> from the mm tree and commit:
>=20
>   03dc00a2b678 ("riscv: Support huge pfnmaps")
>=20
> from the risc-v tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc arch/riscv/include/asm/pgtable.h
> index 293a7776fe07,428e48e5f57d..000000000000
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@@ -339,6 -343,16 +343,14 @@@ static inline pte_t pfn_pte(unsigned lo
>   	return __pte((pfn << _PAGE_PFN_SHIFT) | prot_val);
>   }
>  =20
>  -#define mk_pte(page, prot)       pfn_pte(page_to_pfn(page), prot)
>  -
> + #define pte_pgprot pte_pgprot
> + static inline pgprot_t pte_pgprot(pte_t pte)
> + {
> + 	unsigned long pfn =3D pte_pfn(pte);
> +=20
> + 	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
> + }
> +=20
>   static inline int pte_present(pte_t pte)
>   {
>   	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE));


This is now a conflict between the mm tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/6/7ZO3jR33hqDP4usGskolM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfzD9IACgkQAVBC80lX
0GyMdAgAkDRiJAjDzQ7UWJQHbiJAUSbHgRf3uIVcpbeleAGBqF9TeqNjYhXG1XrQ
sHGy6ngNoDzJ4di9Qc03WayOquByx/KtO0xaymutDqehKfHOTOWHMTHP6I649IYq
/5PQLgo/uLrAJJOWwOe1a3XIIaev/JQXdu6T+RSJICtdu22WzDY+ilW/aPqSZ1nq
o7mGxkPveSIVesWP8gFnaUgftgU/1X6F2FB5vfJDuhVCuuYSOlyvY6Zs86lmrgpe
dfY0cfxkXkMr11ITwBwTDNSXhO2JwKqsQGevTqtKPp+Rn7FHACsuCLzOBvJLd5/8
cTejyGOAu9IrxNX896LZv+B1js04Rw==
=3GDS
-----END PGP SIGNATURE-----

--Sig_/6/7ZO3jR33hqDP4usGskolM--

