Return-Path: <linux-next+bounces-5305-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EBCA19D45
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 04:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 386BF16AAE5
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 03:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9AA1EF01;
	Thu, 23 Jan 2025 03:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sEvH92uF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243412C9A;
	Thu, 23 Jan 2025 03:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737603030; cv=none; b=ICCQZ9f9e/lmYDSeUGTnNRcCLGt7xsBo6bo0nCW5DI8Dmbtaa1N0iD5w1wYGaBl8V5GAgrnUwiX38dZbTGkvIkJ5j8RuDlvsNNL3tqc2rscXcc8KqjLGANMZ4NpBzn4u2ojjwssqQDvbtoK96QuKS5olMRpvON/oWkMdXQhgHDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737603030; c=relaxed/simple;
	bh=9FSOh93HzFYEpQCIAbMRkDEQc1onGmIu1l4MmUG2y0A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jxo4ziP5dkE+4xCdGdThuRMZmo/KxZYqd9vyBkI4q6BP+dZfR3IgQcAeMscXgjDfA28zJSp7tIdSzXfyPIhLdkrcvxWqM+S/loKy6MbL5hXnfosJW9g/XXFxUAARhcLq+Ku4RaxugMI9nlBBs+b438jVN9AjA7mnbukY7rzQEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sEvH92uF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737603018;
	bh=T/ntsnJWB7VOztgwMrw+R6wEYpLquIjl/h8pec+1BGM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sEvH92uFi7s0anZZSKzi+Sowu95MdechbhG1BLY5JVwj5uX3mHRJkqWJaIkO2ou2r
	 SCb6BtrtopSkBzZDJe8wmmZE86b+5xUtl5isDCA6PoQacq/t+Sa0zdBjIAx0c2WJ+U
	 sQMsQr1b8mboXEBhXYy6BaNYBf0vE+KCUYf5268uC1dvMlrQJpyUzFSadjJhsIFzk9
	 NrRi12hJeyKiKDk5WJcw4ltBp/bCfaYnz328XeyZChIU//eTjkxOu45jgzL0uhRz7l
	 SSRESYG/G5wZ3yZuA2LvMb/naa2mz/WnOxdYBdKUC6vq+2fejjqi7bC8WzsR54P6nc
	 SI1+t2eOBWkhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ydmff1F6gz4x5r;
	Thu, 23 Jan 2025 14:30:18 +1100 (AEDT)
Date: Thu, 23 Jan 2025 14:30:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <20250123143025.66cde6bc@canb.auug.org.au>
In-Reply-To: <20250114154623.080e160f@canb.auug.org.au>
References: <20250114154623.080e160f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vEIsNUs1y/enq.WemI2zumZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vEIsNUs1y/enq.WemI2zumZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Jan 2025 15:46:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the rust tree got a conflict in:
>=20
>   rust/kernel/miscdevice.rs
>=20
> between commit:
>=20
>   88441d5c6d17 ("rust: miscdevice: access the `struct miscdevice` from fo=
ps->open()")
>=20
> from the driver-core tree and commit:
>=20
>   14686571a914 ("rust: kernel: change `ForeignOwnable` pointer to mut")
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
> diff --cc rust/kernel/miscdevice.rs
> index dfb363630c70,b3a6cc50b240..000000000000
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
> @@@ -230,12 -188,8 +226,12 @@@ unsafe extern "C" fn fops_open<T: MiscD
>           Err(err) =3D> return err.to_errno(),
>       };
>  =20
>  -    // SAFETY: The open call of a file owns the private data.
>  -    unsafe { (*file).private_data =3D ptr.into_foreign() };
>  +    // This overwrites the private data with the value specified by the=
 user, changing the type of
>  +    // this file's private data. All future accesses to the private dat=
a is performed by other
>  +    // fops_* methods in this file, which all correctly cast the privat=
e data to the new type.
>  +    //
>  +    // SAFETY: The open call of a file can access the private data.
> -     unsafe { (*raw_file).private_data =3D ptr.into_foreign().cast_mut()=
 };
> ++    unsafe { (*raw_file).private_data =3D ptr.into_foreign() };
>  =20
>       0
>   }
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

--Sig_/vEIsNUs1y/enq.WemI2zumZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeRt9EACgkQAVBC80lX
0GwQbAf7BR8uusL6plo8/74zlv7/S20ZxZTCEf8+6hjvq47psdWyd+OTfHcX9gNv
lbcEEfTpyXH7K4Faedk56B9JSy6Kj1nk3QZLh0T3uvRk8IrVHtWd0OIpv57ntBkC
h5oZEPSlE/vYjLYyiIrT2JBMHaO3uLZa0mLBJnR4e/0lURiHj0qhmhRBVFVf5ddC
+c5ZJmQkgWepZE8RwaTcwyGGRDxf3tJP/cvHFCW/b99kH+fDQCPgqtpVlwNsWc4W
gGZLRsPB1tPtG+ut5JwGyQru94rPSCaa434Ijbb2j0dAMwAD85zj2fTDVrk680Is
aswDXrDJWrVXGq56C4lwIg3Yn74aZA==
=Poyw
-----END PGP SIGNATURE-----

--Sig_/vEIsNUs1y/enq.WemI2zumZ--

