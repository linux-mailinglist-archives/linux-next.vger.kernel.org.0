Return-Path: <linux-next+bounces-9353-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D8CA5FFF
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 04:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D171230CC005
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 03:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACAE243964;
	Fri,  5 Dec 2025 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="etyDw3zn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199C722F77B;
	Fri,  5 Dec 2025 03:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764905032; cv=none; b=kotDz91wDfUSmguIk/4VgJyhx3rg1IcrKLKzPtsgfPw9qdmvJHFYp5qRYRe6rlgCeERi1bIqGCKnu+vAcii2r5b3Wn8gyc82RFW59LY/bk3ikqiRLESqv50PgzXY0FIlPQA6rrj50NxUYu/jqmhHO87qKe3hsGh5a02SpzubitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764905032; c=relaxed/simple;
	bh=euOCBqwUyvnjNqj2CSFmdhrnX6FDCb/3mTR3PbL8mFg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=giQBWMGRGyrq2Cm4TzU87Vx7aQQ+tDsXi67d4oiTLvZpvEO0G253xnzxrnY5tXu9vs+P9DiBzRMEkqCJJj7REg7xKvsbRaMkpGO0CS8/MjE6kiIB45xIrsF4dWLVYZsqJGVAM85VNj3Zw30wpda4vmXVjf7j09zIJE7gGqGnxKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=etyDw3zn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764905029;
	bh=glY8asAEyOYXcsn4k6T1P4MW8y2OOlr2EF+23ptUm0I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=etyDw3znACL3Oa4uAZaVX2+brT+UHiaJ/7Q0wty8ZrUjgZZgr2Zpqg8eLhjrOfd/2
	 wrZuPHMpZTU7tpXctjpbDx5/O3LKJ6IEgnQ7MhxueYueYwHwd22PWFv9iezeQRKQxq
	 kje1GYhUOY6Diz4EtVp82Lku5WrL3QFdr+wqzweCQE29KDy83X2dDm6bfxTJNdiCX1
	 8owDWHnFv94n1odbP+H4ta3PLfPRNKxhFeIWeqqXuulBwg43XezldQiIlKkuc8HZjz
	 x3k2+ZS/fBgZRQHU3zBtUKg6TkHo9czVSHDrRQonvKKPCJNNfz5Z/18+DnJkM1wi6f
	 ElgPenDholY4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMxYK2kJmz4wHF;
	Fri, 05 Dec 2025 14:23:49 +1100 (AEDT)
Date: Fri, 5 Dec 2025 14:23:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <20251205142348.01298356@canb.auug.org.au>
In-Reply-To: <20251114151803.7dd56f68@canb.auug.org.au>
References: <20251114151803.7dd56f68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DvlobeUib2TVbCfpzNq62Kh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DvlobeUib2TVbCfpzNq62Kh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 14 Nov 2025 15:18:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/kernel/pci/id.rs
>=20
> between commit:
>=20
>   d8407396f128 ("rust: pci: use "kernel vertical" style for imports")
>=20
> from the driver-core tree and commit:
>=20
>   0e947bc22b0b ("rust: pci: use `kernel::fmt`")
>=20
> from the rust tree.
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
> diff --cc rust/kernel/pci/id.rs
> index a1de70b2176a,5f5d59ff49fc..000000000000
> --- a/rust/kernel/pci/id.rs
> +++ b/rust/kernel/pci/id.rs
> @@@ -4,11 -4,7 +4,11 @@@
>   //!
>   //! This module contains PCI class codes, Vendor IDs, and supporting ty=
pes.
>  =20
>  -use crate::{bindings, error::code::EINVAL, error::Error, fmt, prelude::=
*};
>  +use crate::{
>  +    bindings,
> ++    fmt,
>  +    prelude::*, //
>  +};
> - use core::fmt;
>  =20
>   /// PCI device class codes.
>   ///

This is now a conflict between the drivers-core tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/DvlobeUib2TVbCfpzNq62Kh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyUEQACgkQAVBC80lX
0GyFNggAmuOnM6lNOwCp8J5U/ZQDKW4HM60RuLPD8KbwNDudkPI4jP7EOXNDwtbG
5JgpAnpAlRdJ0PBUUQQn8vz03jma7/CUtWhtIAFUR866rGkQ7QGW4G7wS/5WJ5yY
MUslNr/m2vtNfJcCPbudIxZCb8zCg0HTkXRyWDEWjGtVsgEwLhS+mW22VB0zkPcO
jesWpv7vcSVBVjkrlFitF35IqsCfyRrTFxa4ANmt/IGPR1coutimaAGwLmbt3fhb
PRAyc3YeSJ4acfAT4PDWTgyurSlvPas78V7ubKSoRXBDGNIFIO4y5mOqKePSlN6P
x1oyvMaNy7IYxQU7CDeSpBnrgzMz7w==
=xzs1
-----END PGP SIGNATURE-----

--Sig_/DvlobeUib2TVbCfpzNq62Kh--

