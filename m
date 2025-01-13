Return-Path: <linux-next+bounces-5168-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A8CA0AE20
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C6D3A370C
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 04:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC11814B965;
	Mon, 13 Jan 2025 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gPBhbHbl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384D02AF09;
	Mon, 13 Jan 2025 04:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736741562; cv=none; b=Ahkf0sjCwAfd1RzokS3ldtyJC4lqCSyw+ODyoT3huSDLwl+j48d7e8WgBuO51iGYrol2elw2pgcueda/Ev0uhLogCapciLelSjnGFWxs5qrXuoZDUk80CTKLC3kt5bjlHdtbBc/pxj6Iw0urK53Ty3gkGX36s+WuNNYMv+Ov6wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736741562; c=relaxed/simple;
	bh=cSNT7mMC2Nr2En15QzByVkhJeCK6x9VLPx+0nwmWdZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DhSeiVlVz/6TUzBJWqz7/WO9kOJoIjEuU4GJx5D+UzMwQt3NtJaelx+o/Trr2rF0+dU3Ov/dzg6p27BEVk9kaLRJl+6S8OL+xJf3g4URkWUT+I6IUMFMxvwGn1P4U5STrPu/zwMXwgw+ue/t/cZ3jCIcPnSMgfuOa25Chr7S9fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gPBhbHbl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736741550;
	bh=gQbaS1m5FcApuEg7eh89L+Ebeem1knWIgTjqLhZ3cwY=;
	h=Date:From:To:Cc:Subject:From;
	b=gPBhbHblE9q7Hoctc0oQLKZQKOM9n5h5TnzQyBMpyWwu3NM9RQVsJJU4Ox40T8vIi
	 Gv24ZtW3DBykA0JNXl9vYpSH64CnfJD5IOZg58fTqB1ANIi26CzMnEdYUpOCKaUnQ1
	 RV7QczdkgNUv37AiEAnt0UsMq7Z2G9mlB9KapDtnCUabS0CsMHCknCGD7L/9Gq6t3f
	 zf1AIdX/ZRsgnPMTP5JSmcORgOhOO2BFx2t+XHF295yxVoBvZrCe0HKZrTYb1JUQpN
	 jj32XJwp+Oapme044gxdf0PyPXC36C1tNNC8b2biXnqojKHHz4plJUqfwKSdInQXQj
	 PAvOX1f7LqWNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWf3x3lYJz4wvb;
	Mon, 13 Jan 2025 15:12:29 +1100 (AEDT)
Date: Mon, 13 Jan 2025 15:12:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250113151236.07378dd6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SlFZY+CHRFUEYpNahNNthQT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SlFZY+CHRFUEYpNahNNthQT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/miscdevice.rs

between commits:

  0d8a7c7bf47a ("rust: miscdevice: access file in fops")
  5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
  bf2aa7df2687 ("miscdevice: rust: use build_error! macro instead of functi=
on")

from the driver-core tree and commits:

  27c7518e7f1c ("rust: finish using custom FFI integer types")
  1bae8729e50a ("rust: map `long` to `isize` and `char` to `u8`")
  15f2f9313a39 ("rust: use the `build_error!` macro, not the hidden functio=
n")
  4401565fe92b ("rust: add `build_error!` to the prelude")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/miscdevice.rs
index dfb363630c70,9e1b9c0fae9d..000000000000
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@@ -10,11 -10,9 +10,12 @@@
 =20
  use crate::{
      bindings,
 +    device::Device,
      error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
+     ffi::{c_int, c_long, c_uint, c_ulong},
 +    fs::File,
      prelude::*,
 +    seq_file::SeqFile,
      str::CStr,
      types::{ForeignOwnable, Opaque},
  };
@@@ -151,17 -132,8 +147,17 @@@ pub trait MiscDevice: Sized=20
          _cmd: u32,
          _arg: usize,
      ) -> Result<isize> {
-         kernel::build_error!(VTABLE_DEFAULT_ERROR)
+         build_error!(VTABLE_DEFAULT_ERROR)
      }
 +
 +    /// Show info for this fd.
 +    fn show_fdinfo(
 +        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
 +        _m: &SeqFile,
 +        _file: &File,
 +    ) {
-         kernel::build_error!(VTABLE_DEFAULT_ERROR)
++        build_error!(VTABLE_DEFAULT_ERROR)
 +    }
  }
 =20
  const fn create_vtable<T: MiscDevice>() -> &'static bindings::file_operat=
ions {
@@@ -274,12 -225,7 +270,12 @@@ unsafe extern "C" fn fops_ioctl<T: Misc
      // SAFETY: Ioctl calls can borrow the private data of the file.
      let device =3D unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
 =20
 -    match T::ioctl(device, cmd, arg) {
 +    // SAFETY:
 +    // * The file is valid for the duration of this call.
 +    // * There is no active fdget_pos region on the file on this thread.
 +    let file =3D unsafe { File::from_raw_file(file) };
 +
-     match T::ioctl(device, file, cmd, arg as usize) {
++    match T::ioctl(device, file, cmd, arg) {
          Ok(ret) =3D> ret as c_long,
          Err(err) =3D> err.to_errno() as c_long,
      }
@@@ -299,12 -245,7 +295,12 @@@ unsafe extern "C" fn fops_compat_ioctl<
      // SAFETY: Ioctl calls can borrow the private data of the file.
      let device =3D unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
 =20
 -    match T::compat_ioctl(device, cmd, arg) {
 +    // SAFETY:
 +    // * The file is valid for the duration of this call.
 +    // * There is no active fdget_pos region on the file on this thread.
 +    let file =3D unsafe { File::from_raw_file(file) };
 +
-     match T::compat_ioctl(device, file, cmd, arg as usize) {
++    match T::compat_ioctl(device, file, cmd, arg) {
          Ok(ret) =3D> ret as c_long,
          Err(err) =3D> err.to_errno() as c_long,
      }

--Sig_/SlFZY+CHRFUEYpNahNNthQT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEkrQACgkQAVBC80lX
0GyhkAf/fY2yIJV4RlyIya0sebhBJ37dkttj0QQpLvH9f6uaqsEuiH7TuBvbko67
2KMhbiPoRHWqXByEEiR+/zbwTWYkUMSlsIr1VDs3cGR2koICIB3XbNIJjDfLB2cT
2v70FhicsnSmicq6qdY8evL0CKHbNP4HnIoltcCaut+vTI3YJS2sR3bgbExul/uv
UkgVgd1O+nXk4jGALvkDvKRb1Rfx5GvrN5J/5jNwbbAXcVff2dKf4YCuNstm3ArD
tvdMRg3sDN0XbFYrQz08E1vn+MXCP7HPbnKcamd7Fg1qY2ro7EfTC2iqFp+js9yj
Uq2sFKhlQdNFyNMQ1AuMHKzlkEJm3g==
=Ke/M
-----END PGP SIGNATURE-----

--Sig_/SlFZY+CHRFUEYpNahNNthQT--

