Return-Path: <linux-next+bounces-6008-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DB5A70E55
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 02:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BED03B7A76
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 01:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FE21B808;
	Wed, 26 Mar 2025 01:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mDAz1LST"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DCC323D;
	Wed, 26 Mar 2025 01:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742951139; cv=none; b=NUOaM9YhGGm7TsICUpiPzE7eZuBcxJ96mlQHx1ml4bhSylMxp+wA8A9ORo+rFuHaZAZVaBo3cO5Et0VxWWR/Qtt6T4BHAlVivkz8ZqMdfX9wvMwjb6x4470nncfhWxcV3ZRg5ajGyCbmxmArTLHUOrIe8Qm+Djlen/fe0j5DXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742951139; c=relaxed/simple;
	bh=U9NBiCstNUgUTxaCNgYNABEHnJGjR8vxPu+/4mkhAeE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5fdTPit7i2YoouNnB7OAsc3Y8+yrccw3U1gb+ny8+CkerXAnpASmVAgQexsQkLrpb2ZPLVVEvwF/FQ2RJMA+Dpr8ixjpzMTR6o3Eo3kbDG0PxaD+TnNpqE5SVytRUgjcWAKwtJ67sx4zrVXN1UCzyH7YiKwqt219JnN2e8+y6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mDAz1LST; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742951132;
	bh=k3DaJkcx2aRF37DuwIDfqFNpa/vapeRbTd1K/WZxRk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mDAz1LST/mg4QxvmMMjc4aHtBIKHHzH+MQo4UQ0Os76BWF1VjLrG+2rJfkVcoyqV/
	 EYiHC3a+FJ7ydZNFKxBPMN1E2O4mHGPmAKy72MGT9SuLAmsB/s8ZvmtS6cg70no09G
	 DW8SSf7SDmToRXEe1CQg3JcL5fBaJvl6gbGwlxDhBpSysdWrU+9R1Oj7MbhQe70Ckf
	 Crva5wpqkqJKfOniFsGaa5eJVsf2jsgfCStN7OdUQ+CPvBgZc74aVRga/74eCj+KbM
	 0zf5de4ny/mWRCt/x6TJ3FfVTHqqMylGed4lMAWZ/6KVxCMxaXv210vGzrRuta+Fm7
	 Nto5VNm1oS+nw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMpVz2gkHz4x2g;
	Wed, 26 Mar 2025 12:05:31 +1100 (AEDT)
Date: Wed, 26 Mar 2025 12:05:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Ingo Molnar
 <mingo@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20250326120530.34cc9b24@canb.auug.org.au>
In-Reply-To: <20250224144240.7b5bca3f@canb.auug.org.au>
References: <20250224144240.7b5bca3f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aBHRsqnA61Q.TOyq1XYdzAI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aBHRsqnA61Q.TOyq1XYdzAI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Feb 2025 14:42:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/riscv/include/asm/io.h
>=20
> between commit:
>=20
>   85731f537aaf ("mm/ioremap: pass pgprot_t to ioremap_prot() instead of u=
nsigned long")
>=20
> from th mm-unstable breanch of the mm tree and commit:
>=20
>   a9ebcb88136c ("mm/memremap: Pass down MEMREMAP_* flags to arch_memremap=
_wb()")
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
> diff --cc arch/riscv/include/asm/io.h
> index 0536846db9b6,0257f4aa7ff4..000000000000
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@@ -136,8 -136,8 +136,8 @@@ __io_writes_outs(outs, u64, q, __io_pbr
>   #include <asm-generic/io.h>
>  =20
>   #ifdef CONFIG_MMU
> - #define arch_memremap_wb(addr, size)	\
> + #define arch_memremap_wb(addr, size, flags)	\
>  -	((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
>  +	((__force void *)ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL)))
>   #endif
>  =20
>   #endif /* _ASM_RISCV_IO_H */

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aBHRsqnA61Q.TOyq1XYdzAI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjUtoACgkQAVBC80lX
0GweDAf+NA+XxdnP8yHScYo0IGj0rVUcgDnb+dujJcHqIvOAVz1pK8YlpZd4AVBR
Mgb6upMTfGqlZDOAhV1eTWp7xhHUVvoMSA5d0lsHWkqS+rNR3AEnNCDq68XXa+XO
ky4ivosvh5gU2XA8tpmTKImvRc+h3aMOHM2LsJ5WlspvHyNjl/5N68/bi6DmVbOq
2aduL1zA+NiuVf3WE7HJ9v9/aVntsz9DS3lAVXvJEGR4Vt0NG3ecVEgOKxdHbiLa
9XExVN0E598jNttTDB2f1otCs0KqOCHlvC610qRq6OH0AFqnhLhY9yQkXEI9/7py
Ekj2Iyzfw+PzR9kmoDCFqPiipBHWYg==
=FIpJ
-----END PGP SIGNATURE-----

--Sig_/aBHRsqnA61Q.TOyq1XYdzAI--

