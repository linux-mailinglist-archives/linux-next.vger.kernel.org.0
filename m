Return-Path: <linux-next+bounces-8225-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EC6B48642
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 10:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668E13B7C87
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4177B2EAD0C;
	Mon,  8 Sep 2025 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OPd0ZPmy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6E2E5427;
	Mon,  8 Sep 2025 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757318429; cv=none; b=lKag7HE4d8uSYA1yV3fiz/jEl/kIww8hCjeaTPia9Qv8f4bjWkeN0zL4EuQ4W6wdDDhge0PUXOs2R+qk407nZBgDkoKy76OxO4xGgFQP5bSS25BkuOXiKsxccItLzz29KTj05neLbdeeBK4WaSZGdCwaK/Trc7e9dreHJrcE1oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757318429; c=relaxed/simple;
	bh=3fEcJiKo7H92IyrFOIuGD2h2mqVUCgwC6yc3HaQSPxc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R5PP4ppKASSAJSZVSCCA9G5VMLrOUT++zImblGUXCcvb9cpuRSpKVTks9xeqKr4rvT5tndgC4LMbmc1icYJWKNxGAGcWQAAZ0XmVdwQLSvewt4mYZ/tl063creUduNgezyZAqRa5HD4m4yZZdkvEmZqft2nmN67agvZcG8hXf1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OPd0ZPmy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757318424;
	bh=reL7qUVIzMmswgdvza7CW5JmUC9zbeKHWOIROqiyz3Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OPd0ZPmyKNngO25kwZ3XQuD4aMKnT+B6x2nknnYMh1PDkhOHfVT/Sebr1yWOE54Cp
	 jfH4uYLOpdVwciw9ZBPjMLEoq5y+KR0BbI/xgFIu7H5rfw0Q42uTjAngfD5SRW/IKi
	 PHQNRU1fT+s39PY84yoI5mrDCHn/Em6/Fhv+KsA5xnj+AJfOrbnATlKDl0QUqyGFL3
	 oTJByai5SUa5SxDfbMVSZcjbaDyeuqbg4mTyOF4x9KF2IGOtpat2ztv7G2aKCJ3B5l
	 JvD/cId1kEiAhzSP1kIng5LuUhRbMns8WQ+TCpyXsKSoPlQ+RaAl4E4kcW1Uh3M8TA
	 rB2XSLIEbygfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKzs40mnsz4w9Q;
	Mon,  8 Sep 2025 18:00:23 +1000 (AEST)
Date: Mon, 8 Sep 2025 18:00:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: linux-next: manual merge of the rust-alloc tree with the
 drm-rust tree
Message-ID: <20250908180023.177539cd@canb.auug.org.au>
In-Reply-To: <20250905144449.437ef3cf@canb.auug.org.au>
References: <20250905144449.437ef3cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fqaSjs6i0iT3+e_ubGWpw+7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fqaSjs6i0iT3+e_ubGWpw+7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 5 Sep 2025 14:44:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the rust-alloc tree got a conflict in:
>=20
>   samples/rust/rust_dma.rs
>=20
> between commit:
>=20
>   5444799d701c ("samples: rust: dma: add sample code for SGTable")
>=20
> from the drm-rust tree and commit:
>=20
>   7e25d84f460c ("rust: dma: Update ARef and AlwaysRefCounted imports from=
 sync::aref")
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
> diff --cc samples/rust/rust_dma.rs
> index f55c6a37ccd9,997a9c4cf2b3..000000000000
> --- a/samples/rust/rust_dma.rs
> +++ b/samples/rust/rust_dma.rs
> @@@ -5,15 -5,14 +5,15 @@@
>   //! To make this driver probe, QEMU must be run with `-device pci-testd=
ev`.
>  =20
>   use kernel::{
>  -    bindings,
>       device::Core,
>  -    dma::{CoherentAllocation, Device, DmaMask},
>  -    pci,
>  +    dma::{CoherentAllocation, DataDirection, Device, DmaMask},
>  +    page, pci,
>       prelude::*,
>  +    scatterlist::{Owned, SGTable},
> -     types::ARef,
> +     sync::aref::ARef,
>   };
>  =20
>  +#[pin_data(PinnedDrop)]
>   struct DmaSampleDriver {
>       pdev: ARef<pci::Device>,
>       ca: CoherentAllocation<MyStruct>,

This is now a conflict between the rust tree and the drm-rust tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fqaSjs6i0iT3+e_ubGWpw+7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+jRcACgkQAVBC80lX
0Gz4CQf9HynwoyzFDpVE9/7xskNz4oksowhPBtlrfZEUiyiog9yI1eUgZPN9hOHe
b6/kXk2L0Wew6RiD2Ig9wr6AhH6pCDa/ZdoPlZnw0YbmZvXIppTLekcOumsWjbO1
7vbZTNyn3mWgohPPEpDWV8xrgW9gD71m9pBb3tto+kVr78sXpVF8DMC1XKjBEl2+
8piWnl+WbWUcJwgFWyolLDbUIWmgO/Z61aC0wSWw6WUsqyMBwP/+kVMaab8g1H1Z
lGi19eUxySOTtghLJfGLf2gnxx1npcdyRDjP5NNF65ruH1jabm8LpuNx0h+zOV9n
R2vb/gmGAWUnAAS0B8xLJzXJcQs75Q==
=u5Vs
-----END PGP SIGNATURE-----

--Sig_/fqaSjs6i0iT3+e_ubGWpw+7--

