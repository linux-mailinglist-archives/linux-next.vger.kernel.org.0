Return-Path: <linux-next+bounces-9328-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DABBCA270A
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 06:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4730830443FE
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 05:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7D72FBE1D;
	Thu,  4 Dec 2025 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GZgZ/iXP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEEE305953;
	Thu,  4 Dec 2025 05:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764827775; cv=none; b=PqeSCuFSlvdFQspIleQMOfZyiWxer2Kula6DvwlXI+WKsKamVd+ca7p6XOgzboaNpj+TDlWPG28voyVmJAWKa0FxJMRZK6+Cqf2xeibKeLe+Ak5/Cu1cGs5MdD9Pe/PpSSu6JOa0Rdh+RAIm55o4BDEh3sRbW5vwQdEK7DtWTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764827775; c=relaxed/simple;
	bh=ZS9Ihwd5iNKQeB/u5qMZt9tIe9qxWNYbV3p5HLN7R4A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0XeMgMV3ifSIG9dSd8LO0MfTh5p1ayUu+tMzlaHKE76YPZKrzQVp+WzvA8luSE/x1KYlh9vaMf6n+sBVUqpuU1yctKR0nGuiJhVSGT35QokS/19ZasSNjPse/JyC/uiwGbtTKuyRXj3r2Lk/hsZnExXIXwKxN6bfj4kRr3/D2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GZgZ/iXP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764827770;
	bh=MK92OjQK4HEi4uo71eaKwfQe+Si+0CxR7MQHlY+4nio=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GZgZ/iXPynXxDPMw+hu7fQsOQdo3Yl6t2gfK7d8XXRPIfkXZqynFGhl41zyKlrDg8
	 Ql9p3GQbrlJYsg6aIVrJOej2Vzx1o+GGY7h5Zm9BbQrMu6w0ELVTvUIyWEUDEWv3Km
	 euh3oXKkv6MOhgOWVmIgYG485deqTnXRwoY0s8gd9FfrsNwAGZqVy2bt+AZkwicxzN
	 ITlWJGP93Jw8n4wgheUaxRL1TsdhMfLoXIheD5heAlfP+DIWg56duYT7/HRt+gDCZO
	 KyRi4Mk0/tShKUkayLjPnibYP17qLcDyfV35z5aal3dG6ABG6Jykafn5s2UOwi9Khx
	 r+tera/JuX49Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMNzZ2qLfz4wDR;
	Thu, 04 Dec 2025 16:56:09 +1100 (AEDT)
Date: Thu, 4 Dec 2025 16:56:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Chaitanya S
 Prakash <chaitanyas.prakash@arm.com>, Linu Cherian <linu.cherian@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm-unstable
 tree
Message-ID: <20251204165609.11bd70d4@canb.auug.org.au>
In-Reply-To: <90164a38-2aa5-4d3d-85b3-29a9a8b6d9b7@arm.com>
References: <20251114112144.366698c7@canb.auug.org.au>
	<20251204130051.30f0604b@canb.auug.org.au>
	<90164a38-2aa5-4d3d-85b3-29a9a8b6d9b7@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dX3c+O5/3DOQOwDEjJtIqhv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dX3c+O5/3DOQOwDEjJtIqhv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anshuman,

On Thu, 4 Dec 2025 08:55:54 +0530 Anshuman Khandual <anshuman.khandual@arm.=
com> wrote:
>
> On 04/12/25 7:30 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Fri, 14 Nov 2025 11:21:44 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>
> >> Today's linux-next merge of the arm64 tree got a conflict in:
> >>
> >>   arch/arm64/mm/mmu.c
> >>
> >> between commit:
> >>
> >>   2b9cdb805fcd ("mm: make INVALID_PHYS_ADDR a generic macro")
> >>
> >> from the mm-unstable tree and commit:
> >>
> >>   bfc184cb1ba7 ("arm64/mm: Allow __create_pgd_mapping() to propagate p=
gtable_alloc() errors")
> >>
> >> from the arm64 tree.
> >>
> >> I fixed it up (the latter moved the INVALID_PHYS_ADDR define so I remo=
ved
> >> it from its new place, and there was no conflict left) and can carry t=
he
> >> fix as necessary. This is now fixed as far as linux-next is concerned,
> >> but any non trivial conflicts should be mentioned to your upstream
> >> maintainer when your tree is submitted for merging.  You may also want
> >> to consider cooperating with the maintainer of the conflicting tree to
> >> minimise any particularly complex conflicts. =20
> >=20
> > This is now a conflict between the mm-stable tree and Linus' tree. =20
>=20
> Should this be rebased against Linus's tree in mm-stable first before the=
 pull request ?

No, it should just be mentioned to Linus in he PR.  He would figure it
out anyway.

--=20
Cheers,
Stephen Rothwell

--Sig_/dX3c+O5/3DOQOwDEjJtIqhv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkxInkACgkQAVBC80lX
0GwAOgf/ZDtUhUE5uULAgUa3qHTLeCC3i47Riz+45Jxx1+WNIHZbYWeUyjiTAm6P
d0EaA6t3e2PgZ492FT0DngXo0xZ7imnBQWFHu8P301W7GGQeihOsHPxxVL5kqJ/8
xWcneDAXki1B+80hKyy4JpAFrT9sRdGrVpOKM/ZYd2itx69sDqp3DLWlfYBCELod
b+1xPc6Jkcp3eGx07d2oESoGOWQcauYdFsf08vRflTKORVVr2Nk/LfwPW5/QsEos
mD19l6rtLrtyGr4Tu3E//NtR/Z15hzUVzC3u4B58oiSg+YVooT7j33dyQPQvdtV4
BWO+KltIg3zt1/REqLR/4HAZZieMiw==
=Lgk/
-----END PGP SIGNATURE-----

--Sig_/dX3c+O5/3DOQOwDEjJtIqhv--

