Return-Path: <linux-next+bounces-5191-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0662A0FFF9
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 05:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4775168D4E
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 04:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1CE26AC3;
	Tue, 14 Jan 2025 04:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sNOcwmor"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E27E1E49B;
	Tue, 14 Jan 2025 04:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736829990; cv=none; b=f7wit0DjVf5uLxI/97Apcdf9aqvW82kIGeXeGGStiYeeIpWk6Vkg1lkPEgv+qskyexXpSqn0Qo1h2P+CcisyHYIxlvcGnXotFJWUnt3ma/dqQTXOafDzXdsq7sHFSUyikxqt/9FRLaLB59HxqxDJmH8GIR2O6WIOs/qH5IQu9WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736829990; c=relaxed/simple;
	bh=4O0G4I02ukUmKDq76i1TAGEitvRCe8IXG3cgqPPQy0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DRviEKESVWdwe10cF4o/btdNsAZ24QZ7m4O9Bia2LXdd8baaWWjsi6R3O8yPbv1SE90vzAFZZTBgInaP8GzY+P/KljVHV3m2TRsQjUVRSXl21qzRywYn5dm4d1nyJ1uZChxu5e7JriUFIm/tXVfMI+Msp+eg9pjClp5G7b1mhC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sNOcwmor; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736829977;
	bh=889z8enteqbNdIcqIOkESiOB/cMSYNy5G3grMYG4fZo=;
	h=Date:From:To:Cc:Subject:From;
	b=sNOcwmorJqoyZmeAVBWXp3KQLi9W0mgT0zSKxr3ml28t185kCR7Re0s69t1U90ddn
	 IH1RINiYe54LTWfN6qIo8NQaueuHCo6vMsfW7XeI1pPOSApSteCwMaZ/L/J7DlTeWr
	 vriPIlm+yxcoQlnzLi6u5v7+awZVGiTHOhQsBLFDAqGq0o1HTG4qwLzVWMDcwtJlQe
	 j6FOGo8uEtHWQHVVz1RaLsopKT+/Q2bm2AC+Crod6bG++LAkC6dd0lK6FoAGqhkBFW
	 +YbNs6pquhUkjuE6OKkIVWpQCWIMbRDL0H0FFsxqayQa4LEAzVjgrLTaTd7BtH3DK4
	 zCr+g3/WJ9J5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXGmS6phQz4x2g;
	Tue, 14 Jan 2025 15:46:16 +1100 (AEDT)
Date: Tue, 14 Jan 2025 15:46:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250114154623.080e160f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KOrcP2bN_Z0J6l=Vk/BQbqp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KOrcP2bN_Z0J6l=Vk/BQbqp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/miscdevice.rs

between commit:

  88441d5c6d17 ("rust: miscdevice: access the `struct miscdevice` from fops=
->open()")

from the driver-core tree and commit:

  14686571a914 ("rust: kernel: change `ForeignOwnable` pointer to mut")

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
index dfb363630c70,b3a6cc50b240..000000000000
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
@@@ -230,12 -188,8 +226,12 @@@ unsafe extern "C" fn fops_open<T: MiscD
          Err(err) =3D> return err.to_errno(),
      };
 =20
 -    // SAFETY: The open call of a file owns the private data.
 -    unsafe { (*file).private_data =3D ptr.into_foreign() };
 +    // This overwrites the private data with the value specified by the u=
ser, changing the type of
 +    // this file's private data. All future accesses to the private data =
is performed by other
 +    // fops_* methods in this file, which all correctly cast the private =
data to the new type.
 +    //
 +    // SAFETY: The open call of a file can access the private data.
-     unsafe { (*raw_file).private_data =3D ptr.into_foreign().cast_mut() };
++    unsafe { (*raw_file).private_data =3D ptr.into_foreign() };
 =20
      0
  }
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

--Sig_/KOrcP2bN_Z0J6l=Vk/BQbqp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeF7B8ACgkQAVBC80lX
0GwRHwgAjijvq8E6I4be8qzYYixi7apbO92VUNis6mLpre18wbMsYTUGUEWTmShj
c752GKE/OgJp3k36vJLu+FvZucruMcVk2UtaNKZGlLog+mKgNF9ZFmw7UMMWAFqj
fAvyvgQa3Za7fzghzgcifB0KGFKKsofE2c7b4Bnjut4E7ta6ahJcgVRMV8d2WlOz
75ScbVmpT9klKc55rIdlpx6CPMi3en6FIFHuU/q7JEA+op1IFBVVb0pgfj2aOI0Z
N5jan1hI/b43XZOEV3FRqQBslRF7WOf6XPFZqvy3xKZ/J0UKnftNi7+QsGLzeDLT
Msf9LGKcHA4wS2bOrLJMcJE2R6Wwaw==
=7u0+
-----END PGP SIGNATURE-----

--Sig_/KOrcP2bN_Z0J6l=Vk/BQbqp--

