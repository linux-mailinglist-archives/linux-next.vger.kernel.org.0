Return-Path: <linux-next+bounces-9350-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C6CA5E94
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 03:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2E4B3140287
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 02:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6E01DE894;
	Fri,  5 Dec 2025 02:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fLWztmxD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984F4414;
	Fri,  5 Dec 2025 02:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901912; cv=none; b=fF0vORBfHvgNh6l/+0hHvFPT4j3T8bAytOH6qIty+x+U/arDCM9ZjuyX5M8L2hXctiLDlGDC6OksFtpVJOfDkDe6Xi9jx5nwQzjiBASApq5t+3KVAciB6qu4LkozInCRWQlPssihVurYafRAjdiTHhpl24NpZ029ay+zgL+rQq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901912; c=relaxed/simple;
	bh=Kd4YMGS2rseGm/BeG0SuvW8uJe7osjoN7m/ZLclmzM0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bbbsdu/5aveRvy75dyLBCoZLDcECrKMlPudOlwKovaazKbZi7q7sw1bDEIuVGXDDF6KeDJS2j8KNyVn03Mko3RkhG3d8yJiAKMuu3WLwtQaBFNXqsemNQ/QYPoU6ZToQCVFerOnn0MTA2Blyd4pXHZbseg7WQRGUSP6bV5wlLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fLWztmxD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764901901;
	bh=e801wkXlyjOoe34VaU7piNoht28rJs84eyrOaPU4Lzg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fLWztmxDWtrGVlfHeHu9+UI63UJCBm4/Gg4Vhqo2j8ZVRMPHzsnhUqRL26P55kCjL
	 J3lIdas2iZ+1F7GturYdc+UHzu87DR8e+2Ee18F2UAWf1NihjwhJOFQYOcdHBdopl+
	 96V3d4Z7/1p8H2jMYb74UVJixEhAS2+g36w61mIFCQbebAgJd1x13U08FUsAoGkwVn
	 xmO83HlFvaKbIdYqi9WPIMqrXugQKTX2gjAVlbizWYr4OEaNpfTI3vnav9jkkFC4Rr
	 y5YOgx+c3WcQQvZbdy2qUvNbADLTfLeGeufEHqHZzCaEN1WcRxWh9g8KioTR4vBVG6
	 xE+kM/hYb+R8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMwP85CZhz4wGv;
	Fri, 05 Dec 2025 13:31:40 +1100 (AEDT)
Date: Fri, 5 Dec 2025 13:31:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andreas Hindborg
 <a.hindborg@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the modules tree
Message-ID: <20251205133140.6e28f633@canb.auug.org.au>
In-Reply-To: <20251104105516.40fea116@canb.auug.org.au>
References: <20251104105516.40fea116@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BLl/F4z5yRusMwYBov3FcXN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BLl/F4z5yRusMwYBov3FcXN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 4 Nov 2025 10:55:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/kernel/str.rs
>=20
> between commit:
>=20
>   51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions")
>=20
> from the modules tree and commit:
>=20
>   3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")
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
> diff --cc rust/kernel/str.rs
> index a1a3581eb546,7593d758fbb7..000000000000
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@@ -10,11 -10,11 +10,13 @@@ use crate::
>   };
>   use core::{
>       marker::PhantomData,
> -     ops::{self, Deref, DerefMut, Index},
> +     ops::{Deref, DerefMut, Index},
>   };
>  =20
> + pub use crate::prelude::CStr;
> +=20
>  +pub mod parse_int;
>  +
>   /// Byte string without UTF-8 validity guarantee.
>   #[repr(transparent)]
>   pub struct BStr([u8]);

This is now a conflict between the modules tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BLl/F4z5yRusMwYBov3FcXN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyRAwACgkQAVBC80lX
0GxG+Qf/SHgzEScmlKYihoGPyFXPxSKF64u1XcjAbfrMMFquc1BRjzQfxNj1GPnN
GNX40bcnlzmvU64e+wLy1qB4UMjHQ+noVTYVCmpyUIzA5cKq3IcUV/PYRG2vc6p8
ZNBZGv0OQOSQbEP7MfkafJVgaHBeWu3e8UXs1ZDBYaJhRSg7KVPu48wqAHhHE45b
K+6u9CQhKOBi7Z3SXpR7gnsbjTJ3EFofgvB53WRMXzn8wYweXgKotsfS6tm/p/t5
9ZuDEBGa983TT7nrS1vj7zJeMEkwtrgtI8HbLWQoEsBafM4A+XKr+lONC64Ez/xO
BZnyawoGwZy03LBmUXJ7BY80xJxCYw==
=dsMn
-----END PGP SIGNATURE-----

--Sig_/BLl/F4z5yRusMwYBov3FcXN--

