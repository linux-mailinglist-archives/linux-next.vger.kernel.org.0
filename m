Return-Path: <linux-next+bounces-6092-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E67A75D50
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 01:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC873A8FEC
	for <lists+linux-next@lfdr.de>; Sun, 30 Mar 2025 23:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFE919DF52;
	Sun, 30 Mar 2025 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MDAM7VgE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECBF2B2CF;
	Sun, 30 Mar 2025 23:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743377091; cv=none; b=c2JF8h3ATCkcs2fM+5LnkNLwxsq959rn+ofyrckxlkJ9wDgnsPd/8N5599+ACFgBloA48l7EYtzbZZNrFde0YktYku9KvBJjiHRdclKddFja27z49RuQhosDbsjLpTxTB4MFyTpEzuzP80bvjf5rWub60/FcnJf5NXXqpGSv3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743377091; c=relaxed/simple;
	bh=X+K8LQleM2oRNpUyRd/A5YYVm0yxDI3J1FT7KELmfc4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6fN5Mv4kNoS/j64iB+TQk0e7qKIYn8Q3kFnzyQp0wkPXXqkaQyqsQlgwluWzOrYSm6jevvn8tQRrKPb9d71juvTz1Njv9rzA3uwOrUImJjBvjUgRVvhfXi8htzIjGU/W5phH8rWMzWuF3cQ9vK3hjN8vNeojhUoLYwQYXiyAco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MDAM7VgE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743377085;
	bh=5fc7G9PHwX96lqYFb+HmgAi/zCf70NtX+vWgl2cLk88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MDAM7VgEFdg4e7ojp2+BTlgfhtowX7CNfVEoHlclIbooq64DOBM/1tZ9Td0dhxFBs
	 +Hxps3yfpmPV2+ZHlV5v/CPFK5fkh7HmTXn0u8wgIYrKXDW7K/ZlapsU4F8UPMVXLV
	 rDFItoqLcKSLor2N8k4Hp7lHJIiL94T2DE7RsBirq4JWK7/9puLlxHRSEmb7vz52xG
	 iH0bc8zV29IZZLMVQZfsCW/0PcZ3u6IAvR/0V6QOMJNU4/uHt0LIuqW9J8GQ1vIBbY
	 4AKS8Xqgiul+m00fF9pOzM05N/9w4h3JXrjjjjpzMRK1dbrYhkREBQk25XHKKGWcBM
	 VhHJ9JC91sm7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQr2P0Vmdz4wcT;
	Mon, 31 Mar 2025 10:24:44 +1100 (AEDT)
Date: Mon, 31 Mar 2025 10:24:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: linux-next: manual merge of the s390 tree with the mm tree
Message-ID: <20250331102443.163c94b3@canb.auug.org.au>
In-Reply-To: <20250312120734.4a1e4f4f@canb.auug.org.au>
References: <20250312120734.4a1e4f4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a6IyS96WRFGHMFmiUNrWxoh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a6IyS96WRFGHMFmiUNrWxoh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 Mar 2025 12:07:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the s390 tree got a conflict in:
>=20
>   arch/s390/include/asm/io.h
>=20
> between commit:
>=20
>   08a7874a8e6f ("mm/ioremap: pass pgprot_t to ioremap_prot() instead of u=
nsigned long")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   c94bff63e493 ("s390: Remove ioremap_wt() and pgprot_writethrough()")
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
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/s390/include/asm/io.h
> index 82f1043a4fc3,251e0372ccbd..000000000000
> --- a/arch/s390/include/asm/io.h
> +++ b/arch/s390/include/asm/io.h
> @@@ -33,9 -33,7 +33,7 @@@ void unxlate_dev_mem_ptr(phys_addr_t ph
>   #define _PAGE_IOREMAP pgprot_val(PAGE_KERNEL)
>  =20
>   #define ioremap_wc(addr, size)  \
>  -	ioremap_prot((addr), (size), pgprot_val(pgprot_writecombine(PAGE_KERNE=
L)))
>  +	ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
> - #define ioremap_wt(addr, size)  \
> - 	ioremap_prot((addr), (size), pgprot_writethrough(PAGE_KERNEL))
>  =20
>   static inline void __iomem *ioport_map(unsigned long port, unsigned int=
 nr)
>   {

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/a6IyS96WRFGHMFmiUNrWxoh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfp0rsACgkQAVBC80lX
0GwPHggAlQDXxxMp802HAbmddxT+NdPlEPq+KYq6z9nzS9G2wPv9ZQT6JRbtkHzQ
t60YlxWqzjz4hbUK2BYbJ7mVZQS3eN8q3aEjAh5jB1yw8aYE/NuvjAx6V7KBzJCs
kBZ5ay73O+QCqjwKo9UZrM3m96G7IFs9D/EiZywueXcY8vAF6x8FzMIEzd59ScSY
YP4M+FW7ZVYjKk/zDU0XAUbFh8rLwkqhl2JbYUN/GhBLg4OB5FPWzfxfrspGkG4T
4gi9g2hu7pZxUjzJWCkKL8VWeqDjeO0olrgpaJoWhCzpRwlRFNLBF7NkxICGl2Zl
iKjRCxr44WQ7XdbphrFhgW+qdz2igw==
=NSj6
-----END PGP SIGNATURE-----

--Sig_/a6IyS96WRFGHMFmiUNrWxoh--

