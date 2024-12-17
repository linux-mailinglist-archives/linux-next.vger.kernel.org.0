Return-Path: <linux-next+bounces-4981-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A749F4123
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 04:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C82316CB30
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 03:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550591386DA;
	Tue, 17 Dec 2024 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CefnwPnp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1473442AAB;
	Tue, 17 Dec 2024 03:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734405014; cv=none; b=Mcxdi5ouLi8Dv+Muywr7+pGz1OAk8ZZihhoEE4S3Rt0ce/n8uXWybgc7vouEwd/xYzG0xJ5zuDnXyqPdZhEcB8suXz9MJe3db0t08nPZ2a5puWsrkpJy8yIPISzWKBxwE3W5Xv8nk549JTK2t4I/12hqUgah5yndE/76LwaQndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734405014; c=relaxed/simple;
	bh=2zUG1DfqE6nPlUUgm/FXRuVbF47vgFp97jXgl1TpdhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GTF+WW8FbfwmEdtva/NPggusIUsFEAr7Ui/VzvOPjjQ04HI64D4wUMJgbc35O0INQElL70YVZ8fVfddzqgKHhgl/3SRsssA7oKI5XK6IrkCZw23wsJWtr8umQMBqC4wIpcXUYAkyZoLKiQIyy+dxXPJw1gBv7zDgux/9DQKr5gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CefnwPnp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734405001;
	bh=FzU3LnhjL2z0sb9DhuYiio2brbPpf68Eta1kvYPM8rM=;
	h=Date:From:To:Cc:Subject:From;
	b=CefnwPnp8Vhm6+PgAH8VzDwZ+pnb5HPAbu5dp74wE+1x+YauzX4ZTym4Q+01ogV6h
	 QAxZfF07xHpMR998cIRSgZQhAwuEn9nlXRlZrFVEPHAwCwPVFs/BWLlEllzfPKCghT
	 CICT3rCbaPsCZBpLmq63XgR0DjoL/pS0Xgdd5xsuEax6yXQyHfF46cgJKKDKGruOUu
	 IlVxFytnXEQ6NJAuH4Dctvt2PYcKQnKSBmiSBwUuwWCCGwY0sJDzfGWfxU8nvW91Tv
	 KPGHA4+QkuHESfLO+VGVAsI1qBGgBtDTPO48tDHVAbhb0rz2GBjeKUyOcvYiKo5sit
	 f3tIBl3aWMPYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YC1yJ30jDz4wbx;
	Tue, 17 Dec 2024 14:10:00 +1100 (AEDT)
Date: Tue, 17 Dec 2024 14:09:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20241217140939.08167c85@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TLeoKQLetytqL.qvDZXxAZi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TLeoKQLetytqL.qvDZXxAZi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/miscdevice.rs

between commit:

  0d8a7c7bf47a ("rust: miscdevice: access file in fops")

from the driver-core tree and commit:

  27c7518e7f1c ("rust: finish using custom FFI integer types")
  1bae8729e50a ("rust: map `long` to `isize` and `char` to `u8`")

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
index ebc82e7dfc80,8f88891fb1d2..000000000000
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

--Sig_/TLeoKQLetytqL.qvDZXxAZi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdg63QACgkQAVBC80lX
0GxJ5Af/btLavkx6EvG3kqEt0IOJqSTLXDLhtM7ymbwHxSWiElfZCmfDo3Vliu1W
5hu8fA7FgNAWGpyCga/8zxUAsyj8iLuPVhlcpbOwxHLXs9jMKbYEkZsoMBf/EgmU
sadu5Yz97yzWIhN3MM3hQk2KiaAmyMREZ3CEzXGMkpJnlXjFKPjjVKYcCcyrGULv
oc/oGhCI33V8CyW8gNe1oYBGwxbDM0kVfAJpzZwQH8zYKuQXob8wIjEDmeQN0NV9
WdGeJn7kcycxaXVStY9d4YQtzVDU6XeQg6tEoRAs2P75dAYtmAyKfxoclkWCeruZ
W89AqZZBYAbRy7JtwNkC5uxNgRhGSQ==
=xZmX
-----END PGP SIGNATURE-----

--Sig_/TLeoKQLetytqL.qvDZXxAZi--

