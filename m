Return-Path: <linux-next+bounces-5036-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91361A01E10
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 04:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21B1B3A4F78
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 03:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAA478F2F;
	Mon,  6 Jan 2025 03:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F5h+0/vg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB13D69;
	Mon,  6 Jan 2025 03:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132979; cv=none; b=gs0uvW9Avow1V5WtoXjCKYp3Kas0fnn6gzjZXUWz5pNF7AN7ZztDm7HR7BVbhqEn1PYnNg8u5VkMUJ1LJ3SulAvdQHm7Ul79o8u8zg8tcW55UdPxiNz/MMEi/OvNpMKCANhoiNxrr7k292Hn0t+oBIMnqN9O3wadvrRT5ACuYMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132979; c=relaxed/simple;
	bh=1fKuf5tCIA07T7uP0hby637bkNQdcJ70kZB8SCkkaOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fu4EjUGFjnIguK2aqCNA4PqTKfT4oFQrmuMVBkdrGczveciMuNHs56JZQmEOU5juiAnfh51nw6ZsOVofu+ZToQ6KMUbU4iC6CcnDUf85Tm6EnuM7HZmMyfcPpsL2q44HuaARtTMdXDKUnKmQ+EFk6ZmxJtzWUBlW14jGd9rC9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F5h+0/vg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736132963;
	bh=GLdh3mNJ20XsJe1cVfVLWwYPjbqOD9haQe5s49WEWkA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F5h+0/vg7FmnouyNleI1zDC7WnTK7qZkJXelA1c9I1GW3Z2q2/VlWtpsEb6WqfdKP
	 ApsxYM0zPrNL4CtjcLlQ9Ki3fjT62YSFPQUQE/3kvghlVoQkpJ8lrsmsNvKPbEcU1K
	 p7fG6qpdXAzDY1oBaOohrKEEWT3tB10HelD26R5PQjffqPiCTb4EDBlr8ilmpnhjeu
	 9kd3SSO5BZLdTpH1VA1ZRxLT6fM1Ptj6sGOHV1rwS3kNK7IOhujwgfbaNLeof/9jki
	 TK/KU6W9qAluLLjTxIA/MAGMGuUkycxLD7qRgjFHD4gO1jcous4bajsaxXaaYTjHPy
	 EkGMFM8F5cbMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRK0L63YKz4w2H;
	Mon,  6 Jan 2025 14:09:22 +1100 (AEDT)
Date: Mon, 6 Jan 2025 14:09:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Suren Baghdasaryan
 <surenb@google.com>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20250106140928.50569876@canb.auug.org.au>
In-Reply-To: <20241209132446.77fcb14b@canb.auug.org.au>
References: <20241209132446.77fcb14b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//r9g2Ki3jJp_PbT3qFKHPdY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//r9g2Ki3jJp_PbT3qFKHPdY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 9 Dec 2024 13:24:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the tip tree got conflicts in:
>=20
>   include/linux/mm.h
>   include/linux/mm_types.h
>   kernel/fork.c
>   tools/testing/vma/vma_internal.h
>=20
> between commits:
>=20
>   5f0d64389e1f ("mm: convert mm_lock_seq to a proper seqcount")
>   062111898568 ("mm: move per-vma lock into vm_area_struct")
>   85ad413389ae ("mm: make vma cache SLAB_TYPESAFE_BY_RCU")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   eb449bd96954 ("mm: convert mm_lock_seq to a proper seqcount")
>=20
> from the tip tree.
>=20
> Note that commits 5f0d64389e1f and eb449bd96954 are identical patches.
>=20
> I fixed it up (I used the mm tree version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

I got 2 more conflicts today due to the duplicate patch above.

--=20
Cheers,
Stephen Rothwell

--Sig_//r9g2Ki3jJp_PbT3qFKHPdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7SWgACgkQAVBC80lX
0GzSlQf+L9HeH1z7Vi1Zaw9t/4GAbti4Vsx7A+J/eonjTjndLbExsp/zBz2veAQW
tQKw5/MYEBUPoEmWL0CLMCpgCWNflr/S5AXTXNJDxLo8ynPqSrzk3h/Fz8940Wzy
OPKIuzdJZ8B0MeryBgeQYmxpGnSdLGv9Hv+zERcQRMe5Ybdj0JcGQ7m3wAVMpt/E
6StXlaI5DIJVxo/RlEES5VpyruZ8ZXzwTKJMm9XmbeIpD51SRwTfv/58lovSS8Lt
Xgps+u1yA0M59B0U+0hToumsWxxCh2vWIu//AROMCkXZVc4stwUCSinvwzmslYJh
YBn4WvF4zL46oA1qe9c9UcOxE3aO8w==
=ut8X
-----END PGP SIGNATURE-----

--Sig_//r9g2Ki3jJp_PbT3qFKHPdY--

