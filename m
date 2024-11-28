Return-Path: <linux-next+bounces-4851-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 333609DB144
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2024 02:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 528D0B23519
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2024 01:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA65126F0A;
	Thu, 28 Nov 2024 01:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O23o4aTn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC34433B1;
	Thu, 28 Nov 2024 01:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732758540; cv=none; b=L1bOSlUp8qP7q9gVAS8vvEDDTNx8y/D0XMo9aEfx9CSI+Gc1DJOn1ETRCvyjAJNWLoB/UIpV6lTeY94P6dN304aA5M8vMAydClaJcPJWwhQ1USHyrq8tb818bqrlwRQiGl1w6jEVhDQFFbMTtPWra/HkGLS5NECpkUap2KVca6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732758540; c=relaxed/simple;
	bh=qFZqa2g3rtD1S5hvQK/QPN+lCmyx0GI7AyQs6+yhmXg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jcZlHzgbBqcYvTB7+Yypj4fL31oG/VmkBq4y649yx1yria0kf2/nk75wjaSweVT0TWhr/RiNITsJxu45GVvyhhh8Kiz4zwi9uzHVYeK0atPLC0w3q6Iqri8xzs4/OjMBd4IsHU/Z6NfBD819VrGxqXKcwHORkOQSItN/2lp/ZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O23o4aTn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732758529;
	bh=9/+4+DKi9l1YlnxE9Qi3fYjYigMG3SgGnOgTbOV9pcg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O23o4aTn6PHIINpU2F2bUasp5DeFudIEd0F9HKfQm1nNTLvW/RdLVc7OYdeZB6khr
	 NLxi8c4zCBWwOF0swA8bjFhn3Qgk8zkHU8sfU9VoXs2comZRaq/vy1Exct02cLtOO2
	 URGo6KRRU+775FsQf9u8Cm0gs4Sde4+UAZgQ1b9bXKDCgZ+DQsYXCm/4MJpsTZ5/ZY
	 zjBjOMSR7SKos8XtOOR5aWCV8bk/81DdL7smwF2jZrfJg5kDh5Za8cGppG4UcWZBCm
	 6SitKaJgm9qG+CYX3j2ne6UhYPoQ93LJZ3u+ePGnOtoyblRmJ6FSTBhQFf+BSHrCD1
	 C/TKZRRVAlpyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XzK3N2mj4z4wvd;
	Thu, 28 Nov 2024 12:48:48 +1100 (AEDT)
Date: Thu, 28 Nov 2024 12:48:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wedson Almeida Filho <walmeida@microsoft.com>
Subject: Re: linux-next: manual merge of the rust tree with the char-misc
 tree
Message-ID: <20241128124804.36680f92@canb.auug.org.au>
In-Reply-To: <20241111173459.2646d4af@canb.auug.org.au>
References: <20241111173459.2646d4af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RIPwlR01mbRmU=Lxh0=rOjg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RIPwlR01mbRmU=Lxh0=rOjg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 11 Nov 2024 17:34:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/macros/module.rs
>=20
> between commit:
>=20
>   7f15c46a57c3 ("rust: introduce `InPlaceModule`")
>=20
> from the char-misc tree and commit:
>=20
>   d072acda4862 ("rust: use custom FFI integer types")
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
> diff --cc rust/macros/module.rs
> index a03266a78cfb,e7a087b7e884..000000000000
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@@ -332,15 -330,21 +332,15 @@@ pub(crate) fn module(ts: TokenStream) -
>                       /// # Safety
>                       ///
>                       /// This function must only be called once.
> -                     unsafe fn __init() -> core::ffi::c_int {{
> +                     unsafe fn __init() -> kernel::ffi::c_int {{
>  -                        match <{type_} as kernel::Module>::init(&super:=
:super::THIS_MODULE) {{
>  -                            Ok(m) =3D> {{
>  -                                // SAFETY: No data race, since `__MOD` =
can only be accessed by this
>  -                                // module and there only `__init` and `=
__exit` access it. These
>  -                                // functions are only called once and `=
__exit` cannot be called
>  -                                // before or during `__init`.
>  -                                unsafe {{
>  -                                    __MOD =3D Some(m);
>  -                                }}
>  -                                return 0;
>  -                            }}
>  -                            Err(e) =3D> {{
>  -                                return e.to_errno();
>  -                            }}
>  +                        let initer =3D
>  +                            <{type_} as kernel::InPlaceModule>::init(&s=
uper::super::THIS_MODULE);
>  +                        // SAFETY: No data race, since `__MOD` can only=
 be accessed by this module
>  +                        // and there only `__init` and `__exit` access =
it. These functions are only
>  +                        // called once and `__exit` cannot be called be=
fore or during `__init`.
>  +                        match unsafe {{ initer.__pinned_init(__MOD.as_m=
ut_ptr()) }} {{
>  +                            Ok(m) =3D> 0,
>  +                            Err(e) =3D> e.to_errno(),
>                           }}
>                       }}
>  =20

This is now  conflict between the char-misc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/RIPwlR01mbRmU=Lxh0=rOjg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdHy9QACgkQAVBC80lX
0GybnAgApSnxXZldWbPUVGDC6qWi6KWdatnuJigGEkpJKhxSR+hDuCxeUgSozXMW
2D3KxDnaRQc8A3LizVhEjCVv1Zrg+Kcn3JmSmqv67/qh7RGcwkpTQQh5MrpO1Sl9
lp4zw1SHpOiQN6R8I/gNo8hhUVvE7vd/EScfnBr+Mp8Nbm4xkPcsUOgMhekNXuGd
EwXMhZK6Rrb0lEnUE9W1Lkcr7y/h2lzpZoITpaopzJxYtezHFbTZh9IhbH/N0Qxx
borXcl6/0POTQRbzM5EV1JyawRjSxTQ9a+NVXCVlSRKzyOsEoKKQ6sdB/ScvuvnZ
QRYgvA9rvShsKWO/aP7BTRFCJTe2Tg==
=nDF3
-----END PGP SIGNATURE-----

--Sig_/RIPwlR01mbRmU=Lxh0=rOjg--

