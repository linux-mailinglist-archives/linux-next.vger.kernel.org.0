Return-Path: <linux-next+bounces-9104-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8FC7288D
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 08:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8D94E347434
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 07:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEA23002CA;
	Thu, 20 Nov 2025 07:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c92yDA8b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA852FF660;
	Thu, 20 Nov 2025 07:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622680; cv=none; b=cpBrHTIlJA31NfJKcATi1DVkd0qEW1R8zYenJEk4VcIqihZYHVFvsB2mZ1sL6uNZSQJiaHR1qhWrDtS5HEuQnu9fk8N5pRmEBtXZx88CKtEUty4h1dhuriMG35jZmCVvNrsv5nnUVIn2tlOxknntMFHUPiC2rwZw11ae34BCtps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622680; c=relaxed/simple;
	bh=H8fmKLT1OdCreucj8V8zd2rgywAW7QFLt+CIAReubx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FQmSqxtM81pBVIcpsGzD9ktlM8RpQt3zXdyoftdPRocXW7VIGElR0v4U+fnT5Hbl7Sb6mDENdTsjkWXQfw0UbNowqrCbpctCKLdjJFCox/PjRlfhH/tbZJBeRrGPDT/1TLZ8hVfUdFcPVI+BVFLBT+JNM42D9y3ei+ZYiPO84GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c92yDA8b; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763622673;
	bh=U7KAH9uJjxbfx5x0ZHVC7SqFyohJfSqpADDqhoK8ySQ=;
	h=Date:From:To:Cc:Subject:From;
	b=c92yDA8bVtxrnNM7OF29bADycK3i24y9k+qvXTQ7aW8iJ6oJDRi5T1LRh+JesaJoL
	 NXDnCBNBv4zDY1mRDd10cKVXOz2XjhOyn+xyQVO7KSrGP4nA/yf9eBSffYOuBO0d3S
	 EhIOvj6gnCP1aope8CqP++oSR2cXyFxAXffDRRvPQIu9TyxWCS76BLWqqIua3o/AgN
	 k1ZuFQSWr06xVSAs5pATHDS3xh68Otn6AIaBSZWkBDXdrwR8rVSJF6cJkT3dyLNCq1
	 Otsa6lZ8SWGxPTCB+w1A/8P6o5NfNG+RWvKc/6N8fateNaW1JaXtvLXjxtRhx4YN0Q
	 sDQ20RxVej+cQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBqJc6n5Fz4wC8;
	Thu, 20 Nov 2025 18:11:12 +1100 (AEDT)
Date: Thu, 20 Nov 2025 18:11:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>, Tamir Duberstein
 <tamird@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20251120181111.65ce75a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vZbA+FwNd79pbeX2Mz1UPBo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vZbA+FwNd79pbeX2Mz1UPBo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0599]: no method named `len_with_nul` found for reference `&'static =
ffi::CStr` in the current scope
  --> rust/kernel/i2c.rs:48:16
   |
48 |             id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
   |                ^^^^^^^^^^^^ method not found in `&CStr`

error[E0599]: no method named `as_bytes_with_nul` found for reference `&'st=
atic ffi::CStr` in the current scope
  --> rust/kernel/i2c.rs:51:22
   |
51 |         let src =3D id.as_bytes_with_nul();
   |                      ^^^^^^^^^^^^^^^^^
   |
help: there is a method `to_bytes_with_nul` with a similar name
   |
51 |         let src =3D id.to_bytes_with_nul();
   |                      ~~~~~~~~~~~~~~~~~

error[E0599]: no method named `len_with_nul` found for reference `&'static =
ffi::CStr` in the current scope
   --> rust/kernel/i2c.rs:438:19
    |
438 |             type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
    |                   ^^^^^^^^^^^^ method not found in `&CStr`

error[E0599]: no method named `as_bytes_with_nul` found for reference `&'st=
atic ffi::CStr` in the current scope
   --> rust/kernel/i2c.rs:441:25
    |
441 |         let src =3D type_.as_bytes_with_nul();
    |                         ^^^^^^^^^^^^^^^^^
    |
help: there is a method `to_bytes_with_nul` with a similar name
    |
441 |         let src =3D type_.to_bytes_with_nul();
    |                         ~~~~~~~~~~~~~~~~~

error: aborting due to 4 previous errors

For more information about this error, try `rustc --explain E0599`.

Caused by commit

  3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")

interacting with commits

  f3cc26a417b7 ("rust: i2c: add manual I2C device creation abstractions")
  57c5bd9aee94 ("rust: i2c: add basic I2C device and driver abstractions")

from the driver-core tree.

I have applied the following (hack) merge resolution for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 20 Nov 2025 17:01:06 +1100
Subject: [PATCH] fix up 2 for "rust: replace `CStr` with `core::ffi::CStr`"

interacting with commits

  f3cc26a417b7 ("rust: i2c: add manual I2C device creation abstractions")
  57c5bd9aee94 ("rust: i2c: add basic I2C device and driver abstractions")

from the driver-core tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 rust/kernel/i2c.rs | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 95b056cc1a71..e5e057312858 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -39,16 +39,16 @@
 pub struct DeviceId(bindings::i2c_device_id);
=20
 impl DeviceId {
-    const I2C_NAME_SIZE: usize =3D 20;
+    // const I2C_NAME_SIZE: usize =3D 20;
=20
     /// Create a new device id from an I2C 'id' string.
     #[inline(always)]
     pub const fn new(id: &'static CStr) -> Self {
-        build_assert!(
-            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
-            "ID exceeds 20 bytes"
-        );
-        let src =3D id.as_bytes_with_nul();
+        // build_assert!(
+        //     id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
+        //     "ID exceeds 20 bytes"
+        // );
+        let src =3D id.to_bytes_with_nul();
         let mut i2c: bindings::i2c_device_id =3D pin_init::zeroed();
         let mut i =3D 0;
         while i < src.len() {
@@ -430,15 +430,15 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
 pub struct I2cBoardInfo(bindings::i2c_board_info);
=20
 impl I2cBoardInfo {
-    const I2C_TYPE_SIZE: usize =3D 20;
+    // const I2C_TYPE_SIZE: usize =3D 20;
     /// Create a new [`I2cBoardInfo`] for a kernel driver.
     #[inline(always)]
     pub const fn new(type_: &'static CStr, addr: u16) -> Self {
-        build_assert!(
-            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
-            "Type exceeds 20 bytes"
-        );
-        let src =3D type_.as_bytes_with_nul();
+        // build_assert!(
+        //     type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
+        //     "Type exceeds 20 bytes"
+        // );
+        let src =3D type_.to_bytes_with_nul();
         let mut i2c_board_info: bindings::i2c_board_info =3D pin_init::zer=
oed();
         let mut i: usize =3D 0;
         while i < src.len() {
--=20
2.51.1

--=20
Cheers,
Stephen Rothwell

--Sig_/vZbA+FwNd79pbeX2Mz1UPBo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkevw8ACgkQAVBC80lX
0Gz9wgf/REJCQv1wiyFKZfsz3Df8vARavYzK5Bs8rq+eheGLITxrKoPYYGvtl24T
0zpBIGUUmZz3FN9odfHkHUnpQHSwlak2wGuIptcFBD9fOzBx99JBwHM2gipFi2ZY
HW98p/BfpPmR8q138LfVYjLwJ03CTF/BTNZFJX4hkuK99r65j6qzJJvlQhjlinUG
KdyFsVG05pmDlyImbdfsCCS9WsMnoz+rtvrBZ8HhV0XHvvI0FrNjJZVkz1jdr1ib
4Ma0wbZ1gSP8NGrt/YQwI8MN8mrAay8LUFylUGGWPYF26xJyhBHWORt0kW5j4Dxz
nkEDi04EzL+pTr7hLsngwTcr1VZ0ww==
=c53d
-----END PGP SIGNATURE-----

--Sig_/vZbA+FwNd79pbeX2Mz1UPBo--

