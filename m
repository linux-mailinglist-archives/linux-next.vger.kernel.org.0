Return-Path: <linux-next+bounces-5306-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD4A19D4D
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 04:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 885F23A56AF
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 03:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169DC3595B;
	Thu, 23 Jan 2025 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tAbCiyYW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100C1EF01;
	Thu, 23 Jan 2025 03:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603104; cv=none; b=kYnr5gJztr2mJXoA6+3kzm3a2nS3u1V28jOJn9DMNSBPcpBTmlxH1Uy9alm1PpIhDA1eB2xj1C896g29c9MPnTqC59jzf284oT0Jv5RGbkpbrzrpdKyktev+pu+zw610gyDmIghbNmpsRLVWze6rC52l+f8aHfonjmcNnxUR6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603104; c=relaxed/simple;
	bh=ROpxd7gOe57tUzokYmuwCwaH3UVB4fMy1KNIFilvM3o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ehx7mU1Xfde8aAHuRVNL1e9k+OcI+TT410lx0E7Pr+7/S1xAL5NWRvuGE6b6hpr5t7eyDNpHU5U+Icqfd+kq12bp4ZlyvzWJkqeGDcgl//m7XqUi/SY4ga3jZ5BP25K8ZeAdkQEPV/SVi3RObdfTqsBkd7nw30Fdg80dv+oD3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tAbCiyYW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737603092;
	bh=rfgTJc3YkbATTzdy7GjknrYUXfHSgDynoIYJYJTyhhc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tAbCiyYW/wIqK2kCGDrjtsyHBJGytJLpT7RyI1OscbwNeX+kCPMnAb2R5S2x7UKac
	 hH2NOY4edu8fxffdSOpUmh1Hhr1kHKXsyTVhr2/y6wzFlkx+r7bOuEHEWMyzQwA6aq
	 GyK948RXkta+rr0VY++V/Dj8MzXtpzDxljwog+yHnP8wcJ8abSf/K/Zw+bllWLiDu4
	 UAcEJKuIEJo+gavpzXp5VnGs9OyIE9aXrJobEzaVaEb7ure5bdQXhk9yKi6HVX/KDX
	 h3KHM3ImS8INjd9q8CpKDSHUc1g4kIgC+Yql5nluz9qGFJsCE39WDeSru7b2o86Da3
	 EzAIs6XixQUHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ydmh36Q17z4wbp;
	Thu, 23 Jan 2025 14:31:31 +1100 (AEDT)
Date: Thu, 23 Jan 2025 14:31:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <20250123143139.18dfe87a@canb.auug.org.au>
In-Reply-To: <20250113151236.07378dd6@canb.auug.org.au>
References: <20250113151236.07378dd6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/syUsTUT8QQnHJQOCRDpEUUW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/syUsTUT8QQnHJQOCRDpEUUW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jan 2025 15:12:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/kernel/miscdevice.rs
>=20
> between commits:
>=20
>   0d8a7c7bf47a ("rust: miscdevice: access file in fops")
>   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
>   bf2aa7df2687 ("miscdevice: rust: use build_error! macro instead of func=
tion")
>=20
> from the driver-core tree and commits:
>=20
>   27c7518e7f1c ("rust: finish using custom FFI integer types")
>   1bae8729e50a ("rust: map `long` to `isize` and `char` to `u8`")
>   15f2f9313a39 ("rust: use the `build_error!` macro, not the hidden funct=
ion")
>   4401565fe92b ("rust: add `build_error!` to the prelude")
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
> diff --cc rust/kernel/miscdevice.rs
> index dfb363630c70,9e1b9c0fae9d..000000000000
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@@ -10,11 -10,9 +10,12 @@@
>  =20
>   use crate::{
>       bindings,
>  +    device::Device,
>       error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
> +     ffi::{c_int, c_long, c_uint, c_ulong},
>  +    fs::File,
>       prelude::*,
>  +    seq_file::SeqFile,
>       str::CStr,
>       types::{ForeignOwnable, Opaque},
>   };
> @@@ -151,17 -132,8 +147,17 @@@ pub trait MiscDevice: Sized=20
>           _cmd: u32,
>           _arg: usize,
>       ) -> Result<isize> {
> -         kernel::build_error!(VTABLE_DEFAULT_ERROR)
> +         build_error!(VTABLE_DEFAULT_ERROR)
>       }
>  +
>  +    /// Show info for this fd.
>  +    fn show_fdinfo(
>  +        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
>  +        _m: &SeqFile,
>  +        _file: &File,
>  +    ) {
> -         kernel::build_error!(VTABLE_DEFAULT_ERROR)
> ++        build_error!(VTABLE_DEFAULT_ERROR)
>  +    }
>   }
>  =20
>   const fn create_vtable<T: MiscDevice>() -> &'static bindings::file_oper=
ations {
> @@@ -274,12 -225,7 +270,12 @@@ unsafe extern "C" fn fops_ioctl<T: Misc
>       // SAFETY: Ioctl calls can borrow the private data of the file.
>       let device =3D unsafe { <T::Ptr as ForeignOwnable>::borrow(private)=
 };
>  =20
>  -    match T::ioctl(device, cmd, arg) {
>  +    // SAFETY:
>  +    // * The file is valid for the duration of this call.
>  +    // * There is no active fdget_pos region on the file on this thread.
>  +    let file =3D unsafe { File::from_raw_file(file) };
>  +
> -     match T::ioctl(device, file, cmd, arg as usize) {
> ++    match T::ioctl(device, file, cmd, arg) {
>           Ok(ret) =3D> ret as c_long,
>           Err(err) =3D> err.to_errno() as c_long,
>       }
> @@@ -299,12 -245,7 +295,12 @@@ unsafe extern "C" fn fops_compat_ioctl<
>       // SAFETY: Ioctl calls can borrow the private data of the file.
>       let device =3D unsafe { <T::Ptr as ForeignOwnable>::borrow(private)=
 };
>  =20
>  -    match T::compat_ioctl(device, cmd, arg) {
>  +    // SAFETY:
>  +    // * The file is valid for the duration of this call.
>  +    // * There is no active fdget_pos region on the file on this thread.
>  +    let file =3D unsafe { File::from_raw_file(file) };
>  +
> -     match T::compat_ioctl(device, file, cmd, arg as usize) {
> ++    match T::compat_ioctl(device, file, cmd, arg) {
>           Ok(ret) =3D> ret as c_long,
>           Err(err) =3D> err.to_errno() as c_long,
>       }

This is now a conflict between the driver-core tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/syUsTUT8QQnHJQOCRDpEUUW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeRuBsACgkQAVBC80lX
0GxTDAf/RuuANWk8pI5kusAIHSLz20C8S37emsM6IgDt4QSzwtqXC/rbMG4C+yEO
TeOz/kraUmD5dy+MHENCmDzXLdXtbdxOGeCr20bLszDFv46Uq74b/E4Rg350+hjF
xDMtiAqILfgxlIlkSpogm4FUORMdvSr8E1mhuFDBOAYGdn5TnmdbLF53AQNRQQ0L
CjJLQRQ1ja3qy5C086vSTMNwamXm7fcG/Mn18qBZmV8g/ISvtSMA2cm63rFUFhJC
94ij3aab6bzfZ1V8U89WTQFF93+UqIOkAX/onNSuse8iQeVS3ihGsS5NCdc0yqhi
BLhT2+y35AIEH3sdXAFRgCPLp4XFBw==
=fSAJ
-----END PGP SIGNATURE-----

--Sig_/syUsTUT8QQnHJQOCRDpEUUW--

