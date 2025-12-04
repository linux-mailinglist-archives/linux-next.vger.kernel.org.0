Return-Path: <linux-next+bounces-9319-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BACA2232
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 03:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3881230237A3
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 02:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BCE211706;
	Thu,  4 Dec 2025 02:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z8nRBSIw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BAD1A9F90;
	Thu,  4 Dec 2025 02:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764813657; cv=none; b=PV20BGZmFrCexYKPndxw40kESdorXk7xRESxPeXviXInYhsn8wo0rm8oAKzvnp/PDDNTOtUItlyIdE3uNZsLccvWO7nSc024epGcHFgupGoilVZv4FxlDCzH11idLBfXHr4YBiWd0SKB/NmlWqvOzDPEWOaUebWtk57uYR5FCOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764813657; c=relaxed/simple;
	bh=Elgk2WoPoEVzPG5Cr+YQEEm+xd9RU2u2oRpWIHHrRB0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CCF2Yupq4hv0R9QyYRq1qicCgYsNZDU4R4XbCk+RnJCphGDGQJSg4zL1Y4e/RGsUI+SlEnMA4wlwjPLYiI1wDzhP6m+SlVzCowrysTgjIWRMr8eV0QhLyke6mG3NmqZ9ySQ5bvTUyLhxDpR1gbxitzROm0ip2B9r537B83IwnZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z8nRBSIw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764813653;
	bh=q7Dfm0GiOxC796C2J2dxr/mQY4ceodA+naUXxf6lk2g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z8nRBSIwHdEhrvDa+IgMRqhJI33rjadaGy52WYyc/9UZhmVj6tS0RvzBbx9N/sGbI
	 VQyVu69jlwOoxzazONtu/aKQWZzwRksWN5SOW2jyxwk3oXj+m0yKvknSCMvEKf8+IL
	 bXThirCplPEqEfH+aCTsV18fjeaPsH60q9pFNrUaCimKyBjExOATyIBJPpw6DRHXPA
	 FT264X/vlmfWw6riCXWH+NdXtTwQ3nSnhz4UALH05cxoA9dklmx5hY2HuWth4iWyT/
	 53Rn9AF1tJmbFp2pOdXgA6Go48iurhouHRigt/vZdTEs7HSGWm6o0aIGj0Z5IkZN1q
	 37OPzZZyefaxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMHm5003Mz4w9r;
	Thu, 04 Dec 2025 13:00:52 +1100 (AEDT)
Date: Thu, 4 Dec 2025 13:00:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, "Cc: Andrew Morton" <akpm@linux-foundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Chaitanya S Prakash
 <chaitanyas.prakash@arm.com>, Linu Cherian <linu.cherian@arm.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm-unstable
 tree
Message-ID: <20251204130051.30f0604b@canb.auug.org.au>
In-Reply-To: <20251114112144.366698c7@canb.auug.org.au>
References: <20251114112144.366698c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/stJRIOI06_7ZbBgrpwi4.dY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/stJRIOI06_7ZbBgrpwi4.dY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 14 Nov 2025 11:21:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the arm64 tree got a conflict in:
>=20
>   arch/arm64/mm/mmu.c
>=20
> between commit:
>=20
>   2b9cdb805fcd ("mm: make INVALID_PHYS_ADDR a generic macro")
>=20
> from the mm-unstable tree and commit:
>=20
>   bfc184cb1ba7 ("arm64/mm: Allow __create_pgd_mapping() to propagate pgta=
ble_alloc() errors")
>=20
> from the arm64 tree.
>=20
> I fixed it up (the latter moved the INVALID_PHYS_ADDR define so I removed
> it from its new place, and there was no conflict left) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/stJRIOI06_7ZbBgrpwi4.dY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkw61MACgkQAVBC80lX
0GwKgwf/aenLbX2XOjtlidrCm1GAiqIJF56nR9zlv0dgZyXi8nCaYQVZU2sKRXDx
Sxkk/1zreaOMN7x1g1uXmrkiLBOx2NF6AX0ZO6xKzfn/fOcMl6PwOqu7ro3waNhZ
UWxjkVhPj4RQKBUM7jKU+0wBBLFDzdz9s3dsGexHn09LapHlafjduy1nFmFxp29Z
WAebksoCJFPxJ6vgY9t+58YPan/J6r/VTvnbhysq5UXY7dt3wiHJy/Q7lk+XUlK0
0rDwOoeaqQj1WTvqsLcpUr4urXEmx2biqjX49m9l0ExRFXh5skl+ktJNCp8OVijy
VoIMlkFQY1iax+uM9/fWh//X7+oXdg==
=inF6
-----END PGP SIGNATURE-----

--Sig_/stJRIOI06_7ZbBgrpwi4.dY--

