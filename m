Return-Path: <linux-next+bounces-8223-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43967B48625
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 09:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576773B1955
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 07:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E7B2E6CC3;
	Mon,  8 Sep 2025 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Znt2jp8P"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0579443;
	Mon,  8 Sep 2025 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757318164; cv=none; b=ujczEt+u+4J+rYv4OG7cc1toDaLPtXn4rTAhdBMv8EhG71V46hHbDhdzsC8aXPEUfm8EWEeS6ede/RWBtDy8xw8S15CibyNNR9LnLCxTsRO5CYVrvZhIKloFo41pqysF8ahhTEydOh8s9LnxMcCt5sK2MyytccK9x7v9zdDQqnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757318164; c=relaxed/simple;
	bh=icI4jZ5rsucdv3zdPn92jnO/h9TtJF1MKJQP+1yT/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDMQoscbJc9g7tPEAAaECl5dxJwAlnKmWauY047i4RpgdtrVCDBP7F+djmThJnXYIacWBlR1ZqdvbMaRbRHIT52N53TSMb5NktkVFAqBnArRyX1XQzI6KwkrCcyTb6DLxIfdZrVZUl1xnAtkPASfRogffoj4lvI3zKOdqLuQdf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Znt2jp8P; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757318160;
	bh=yXG2epjQ3QGR43Mj6wrKIZUueXwEPFbJBEdQ4neIMWk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Znt2jp8PmH3Pzb/0L8ATg+If6ICJEXul9uUT1D6fgEe/6urJLH4XMr3GLACBqQBVq
	 N8/H5zqPxpncdZV+9hG+iE7RUkAgSD7cXnEmMLevs7QMwI6nfxEtWTRV10iYbQPLVN
	 qQ+flHdIibNv/HgSElog+H4cRmHJGC1+ryN6Cjc1CqEG7nc1jGXQHVsw4Wt5oC9qhj
	 be9O6EPUh8mF+3hjgvnq0fJpyDDiX31FDCzvLw+pr/ud34uHehLHELQjGG4jd1FvKc
	 3g6mkDmqN+YElN1uBkC1LfUAygKfd0nAG+c12/sWAb4ar+y5GWlH/lIcz3y8A5KqjV
	 gpFBkLmEkvjlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKzly5ND3z4wBC;
	Mon,  8 Sep 2025 17:55:58 +1000 (AEST)
Date: Mon, 8 Sep 2025 17:55:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Vitaly Wool <vitaly.wool@konsulko.se>, Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: linux-next: manual merge of the rust-alloc tree with the
 mm-unstable tree
Message-ID: <20250908175557.7a5dc2e1@canb.auug.org.au>
In-Reply-To: <20250818122053.355aab17@canb.auug.org.au>
References: <20250818122053.355aab17@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/04/E8vSJVXXKwOjtvRZ0i6y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/04/E8vSJVXXKwOjtvRZ0i6y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Aug 2025 12:20:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust-alloc tree got a conflict in:
>=20
>   rust/kernel/alloc.rs
>=20
> between commit:
>=20
>   defab7872312 ("rust: add support for NUMA ids in allocations")
>=20
> from the mm-unstable tree and commit:
>=20
>   1b1a946dc2b5 ("rust: alloc: specify the minimum alignment of each alloc=
ator")
>=20
> from the rust-alloc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc rust/kernel/alloc.rs
> index b39c279236f5,907301334d8c..000000000000
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@@ -164,7 -137,15 +164,15 @@@ impl NumaNode=20
>   /// - Implementers must ensure that all trait functions abide by the gu=
arantees documented in the
>   ///   `# Guarantees` sections.
>   pub unsafe trait Allocator {
> +     /// The minimum alignment satisfied by all allocations from this al=
locator.
> +     ///
> +     /// # Guarantees
> +     ///
> +     /// Any pointer allocated by this allocator is guaranteed to be ali=
gned to `MIN_ALIGN` even if
> +     /// the requested layout has a smaller alignment.
> +     const MIN_ALIGN: usize;
> +=20
>  -    /// Allocate memory based on `layout` and `flags`.
>  +    /// Allocate memory based on `layout`, `flags` and `nid`.
>       ///
>       /// On success, returns a buffer represented as `NonNull<[u8]>` tha=
t satisfies the layout
>       /// constraints (i.e. minimum size and alignment as specified by `l=
ayout`).

This is now a conflict between the rust tree and the mm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/04/E8vSJVXXKwOjtvRZ0i6y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+jA0ACgkQAVBC80lX
0GxZiwf+IyoIcf2GK8K9fK+6EbAEC2ksVJEUg89l4YzTkXDBXKzQXFlQl+lOxP7e
see3EK1tfROz2IvdcHTrHAQDdMi2FsCmHsdvOqFYR7YfVwKPmLWdkZGO13Rma7IJ
3zXOVdXiXwKHINpa+oiWTHV+bJD8sZcsSJvnpW5OV6lHkrkhQXm1ECpwllcEBN3t
jyiMxbor8xsthGFxwMXVcO1A8Sz46RfP6TuTZzd6ef3jyApTuI+gLgTm2b57Rq23
vBlEVNc95lfjM7q1W8jivzuWD6GsvODVftzq0XH5A24mtFlF+xMBat9N30Kg25mY
aMTcVIk/0yzQnZOJInflraQp6DlXjg==
=HlM2
-----END PGP SIGNATURE-----

--Sig_/04/E8vSJVXXKwOjtvRZ0i6y--

