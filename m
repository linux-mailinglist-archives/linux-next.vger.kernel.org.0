Return-Path: <linux-next+bounces-7288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26107AEEFFE
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 09:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 262811BC58CC
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 07:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4136624A044;
	Tue,  1 Jul 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QC+nQjak"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF6D25C6EE;
	Tue,  1 Jul 2025 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355975; cv=none; b=c3ykwfwWF+WLrW5I6gIm3wthoxsHQqF4XFEsXzx5KU3GEqupsJPpegmHkXKKuaOiqOZvJlX1NfcRft4wV2jl+UQBljZ0a2r+hZvXx2McEmZO+8glbYpFS28xQulXh+Xm2UoyGya0rLkjwHipL5Fy71ECJq76QRl6tnlkIL74m/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355975; c=relaxed/simple;
	bh=pf6wp+3/O9diS1MSitXHJ+WG7hNgrQUUrCX4FKhGP20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U2jEA4OFEHFC/Iih2KDJtX4s/bAxOA90wZ8znz5cqTPO8eQa+c0KhTTW/g34fcfTl4cW4wf+CWh+rxpPcVXYXlgR0P/eDLULyaPASXPys09bn7NPMN6AYT3ba859k1bWbU/112rkNoUlAeIbCSSh959Qf0edL9TkuF0otOY7XgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QC+nQjak; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751355960;
	bh=mSbYVdV1LyXWe8c8y9h9Kovvi9QxOa7y22v3xy0LDDQ=;
	h=Date:From:To:Cc:Subject:From;
	b=QC+nQjakQ43AoIl8Mp2kGiXLaghgb2gMfmEQUSCn0/NCpc/lsWjugf0M8qlbrjtxF
	 DJqKMMASfb/Iy8UWvhP7Uxgv7iMcrb4jyuA04Re/an5VlSyXk/t/2URbWXYB8FHCMs
	 iHPtfTxDY9gS7JU+DXIt0ql4GAy5igM2bqDvSrt6PRswlW6tcDsftlY4gk34wIddzo
	 ynX4yMiCF1thr0RqJSY8EwRVYF8+wiqW0J0bxapF9bHhJqriX6MZLPqJRyKhbzHDtq
	 3nPTYNxtiGL07ofe+44j4320y2g2qQqIV1k7yJOsLioG4CKI/hWONWp3ri9V9pGuVx
	 MSvldteJUAh4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWZpH699Nz4x0C;
	Tue,  1 Jul 2025 17:45:59 +1000 (AEST)
Date: Tue, 1 Jul 2025 17:46:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>, Viresh
 Kumar <viresh.kumar@linaro.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250701174606.7b07bbce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jfm5ubPoxdPVCYN4P6zj5am";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Jfm5ubPoxdPVCYN4P6zj5am
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/devres.rs

between commits:

  0dab138d0f4c ("rust: devres: require T: Send for Devres")
  ce7c22b2e1fb ("rust: revocable: support fallible PinInit types")
  46ae8fd7386a ("rust: devres: replace Devres::new_foreign_owned()")
  f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")

from the driver-core tree and commits:

  fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")
  23773bd8da71 ("rust: enable `clippy::as_ptr_cast_mut` lint")
  5e30550558b1 ("rust: enable `clippy::as_underscore` lint")
  b6985083be1d ("rust: Use consistent "# Examples" heading style in rustdoc=
")

from the rust tree.

Maybe not all the above commits are involved ...

I used the former version (since it changed things so much) and then
added the changes from the latter by hand where I could.  I ended up
with the below diff compared to te HEAD before the merge.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 7c5c5de8bcb6..f900433f5296 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -49,7 +49,7 @@ struct Inner<T: Send> {
 /// [`Devres`] users should make sure to simply free the corresponding bac=
king resource in `T`'s
 /// [`Drop`] implementation.
 ///
-/// # Example
+/// # Examples
 ///
 /// ```no_run
 /// # use kernel::{bindings, c_str, device::{Bound, Device}, devres::Devre=
s, io::{Io, IoRaw}};
@@ -66,19 +66,19 @@ struct Inner<T: Send> {
 ///     unsafe fn new(paddr: usize) -> Result<Self>{
 ///         // SAFETY: By the safety requirements of this function [`paddr=
`, `paddr` + `SIZE`) is
 ///         // valid for `ioremap`.
-///         let addr =3D unsafe { bindings::ioremap(paddr as _, SIZE as _)=
 };
+///         let addr =3D unsafe { bindings::ioremap(paddr as bindings::phy=
s_addr_t, SIZE) };
 ///         if addr.is_null() {
 ///             return Err(ENOMEM);
 ///         }
 ///
-///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
+///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
 ///     }
 /// }
 ///
 /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
 ///     fn drop(&mut self) {
 ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped=
 by `Self::new`.
-///         unsafe { bindings::iounmap(self.0.addr() as _); };
+///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
 ///     }
 /// }
 ///
@@ -214,7 +214,7 @@ fn remove_action(&self) -> bool {
     /// An error is returned if `dev` does not match the same [`Device`] t=
his [`Devres`] instance
     /// has been created with.
     ///
-    /// # Example
+    /// # Examples
     ///
     /// ```no_run
     /// # #![cfg(CONFIG_PCI)]

--Sig_/Jfm5ubPoxdPVCYN4P6zj5am
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjkj4ACgkQAVBC80lX
0GzBpQgAoVjAbxQOWyOBs29BnCnC1ceqeCqRrrg8evmzrqJ7/dBHb/TixyjYJNZ2
0iBLB74dm5pSSSTvNKzA4yOHDC9zYnNKyedXlB0Q60pnFP7wS9/zpGc/hkdaPxTa
zZFMmy1mnLoWwUzS8qWAecYLGQVwGnuPS8jlR89qkLw2HBpL8eX8JWPZ780t4TGo
c0zzVIamdAZCPi4a5N2uZrIIodKaH8E1Exz2+iwz/PGxYfyQ/TQBLcYYincppYbE
GFQANBrtu0Q/AlsXmklqOQiiVrZyQn/XJohLJOCgV/Mnisd5LENwjNBuiZz8Lyq3
HhIDXWi4jJb92x/8rqpgI8aY08AQPA==
=06s0
-----END PGP SIGNATURE-----

--Sig_/Jfm5ubPoxdPVCYN4P6zj5am--

