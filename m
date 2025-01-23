Return-Path: <linux-next+bounces-5304-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16451A19D43
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 04:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0A3A3A699F
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 03:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005A643151;
	Thu, 23 Jan 2025 03:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ilJN//tJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B31BC3F;
	Thu, 23 Jan 2025 03:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737602921; cv=none; b=lqU9RXKhZiivO/8tHtUQ+oZe/VAaTJpLAUNVznHjCGPMX0CRbH5aAbFNvPse5tGdvTLyqPS0qC+2Dk5DY29MGZIqFUm8Zhs8+6+oHq1N1UYd5lnifK9fCjHF3m0U3M04Z7OHuoPQxanQSq9gFLP9s4z8ua6GnEiZNoK/fO74t3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737602921; c=relaxed/simple;
	bh=gmbZpLMVKbfVuee7TqQytPcfBrVeYfwEudxnEm90bKg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L8+bpqaYDwwlR/SMTjFOGXDv5fxqbfEdtH74C5QCHJbRGhXOZ+QvyhJ6TnPnA5wQLwc9ID+T5HoddzK/fqJFuEr0tZrjaBH0eymZUq33pDBCf4hv6nQWKDUNE2wzOzmmKTxwi1oAMHBsfRWA/GCyr38Qe0EWC5E9maa93cmgVGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ilJN//tJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737602909;
	bh=CrLA+AwX6W91CKXm9EPDRHaOc3CGXSAkqvaWjv/BP7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ilJN//tJF40FhOIXhErXMy6PIpGisaoD7bV2KsVrrXlV07B7/KN3rTiHh2q+kDATM
	 hKcN0HO0WnBpkI19CSDsV9BtoLEoxC7ZjgXRTLtUQCYcYV18A8LaQe7pS+ujm4+eod
	 WjC/d4lvyDyfWnddHzV1FN4VYm1XvYBKz4MvYusiB6Y/2MSIuuCUQW7pdb8j8g3ScA
	 6DhuRojdjxTNZgewAqrxQFIPDhRunQpVAXC1JfKY7ZdyxFfIYfazyWt6b609wBvRXq
	 r5/ib5gX5M6ichvZFIGq248VjOgfza+bzgkYlfjrVe5CZEFCKxItNrIJzQv0KgICyC
	 CjWkB/gVXyfLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YdmcX2Zh5z4wc3;
	Thu, 23 Jan 2025 14:28:28 +1100 (AEDT)
Date: Thu, 23 Jan 2025 14:28:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Fabien Parent <fabien.parent@linaro.org>, Gary Guo <gary@garyguo.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <20250123142835.1ae298f5@canb.auug.org.au>
In-Reply-To: <20250114153733.1b73c3df@canb.auug.org.au>
References: <20250114153733.1b73c3df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yKSEmls.zdjl7.FKm=iR+pY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yKSEmls.zdjl7.FKm=iR+pY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Jan 2025 15:37:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/kernel/lib.rs
>=20
> between commit:
>=20
>   9b90864bb42b ("rust: implement `IdArray`, `IdTable` and `RawDeviceId`")
>=20
> from the driver-core tree and commit:
>=20
>   47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.0")
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
>=20
> diff --cc rust/kernel/lib.rs
> index b11fa08de3c0,545d1170ee63..000000000000
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@@ -13,16 -13,12 +13,17 @@@
>  =20
>   #![no_std]
>   #![feature(arbitrary_self_types)]
> - #![feature(coerce_unsized)]
> - #![feature(dispatch_from_dyn)]
> + #![cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, feature(derive_coerce_poin=
tee))]
> + #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(coerce_unsize=
d))]
> + #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(dispatch_from=
_dyn))]
> + #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
>   #![feature(inline_const)]
>   #![feature(lint_reasons)]
> - #![feature(unsize)]
>  +// Stable in Rust 1.83
>  +#![feature(const_maybe_uninit_as_mut_ptr)]
>  +#![feature(const_mut_refs)]
>  +#![feature(const_ptr_write)]
>  +#![feature(const_refs_to_cell)]
>  =20
>   // Ensure conditional compilation based on the kernel configuration wor=
ks;
>   // otherwise we may silently break things like initcall handling.
> @@@ -37,12 -33,10 +38,13 @@@ pub use ffi
>   pub mod alloc;
>   #[cfg(CONFIG_BLOCK)]
>   pub mod block;
> - mod build_assert;
> + #[doc(hidden)]
> + pub mod build_assert;
>   pub mod cred;
>   pub mod device;
>  +pub mod device_id;
>  +pub mod devres;
>  +pub mod driver;
>   pub mod error;
>   #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
>   pub mod firmware;

This is now a conflict bewteen the driver-core tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/yKSEmls.zdjl7.FKm=iR+pY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeRt2MACgkQAVBC80lX
0GwoAQgAo78i1Caow5KFheiTHrPoM0HsFHsqWrt+I60RJzszE/pzJ3+vHdNTmZoE
Pxey81xuRb/uak7RMT3G94kLmMgYoyvckXTaSRI20qoagpUd/pCs1HWHsJ20NHnn
tjjdLsgTKXrwkSRbFWC5ZfgW3fOEUIJwu1MgXIEhHAm9H5ATNXOxdeXlqY8XtBkE
lM30PfuwCIiSFIgkOjX4IeUb6AXRv1RCVrRR66P8rootCknH8OKBlkRPMcCb/ze2
79pPzIcN/lJwVzFimzBbEj4mKZOaUtOm1S6JYdVZBi7pj5uUlMk933IEoXxrG+P1
Fn5bFbYq2RmPM07BBd0hf4M4a9OdCA==
=8l7d
-----END PGP SIGNATURE-----

--Sig_/yKSEmls.zdjl7.FKm=iR+pY--

