Return-Path: <linux-next+bounces-9038-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 97044C6267B
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 06:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B9B535B26B
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 05:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757111E9B1A;
	Mon, 17 Nov 2025 05:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qoVsTc7e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62681799F;
	Mon, 17 Nov 2025 05:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763357440; cv=none; b=hE/O+kozCdKJ+oMnotG1maxdHOhWhMGUE4FLKp9Ig0/vfU3xr4tH2SnsX/A1r6VcOO+zSyfN4x43kp1WjHdXf7ZNPLeAKcEW9DRQzEZtiyp8tJe9aLPkThXD4qGC26GBgiqOjHAS7eDDH4CQctY7tKUscdQoDd1usj6W09YBI3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763357440; c=relaxed/simple;
	bh=DgnO1qcOgC9oLOhYElgAqWvXCNTQjsCnlUmwt534A/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X+RUd3CEsacOXeucmB9f+S2u9yDBkVX6MPfjk+LvRVEWoRJ3gfgoRqH9PwdOoyUBRSawdpJObdTnC0qnasMnTNLv4KNCatdX+LYxsdwl9qRySWyfrLngnLKQ2dRfg5q+V9s1gEhEjfeAugjboJMJCmEOT0XcOf2XjcpRcRRKErc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qoVsTc7e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763357434;
	bh=EvsLvjtG/IH84KnYf75V8jmkdZzhUgVCEZW8hXkkYw8=;
	h=Date:From:To:Cc:Subject:From;
	b=qoVsTc7eQjkCZ3O4wV78dY3jqvz7PaJSvEc3rGi4EFo+QpHOawbWakDvCSyXvn2Bj
	 rf2dreFxTjZ34D++zEG8xfxA+mv5fZyHzLqLmRopYwRA7ozixzQoWiYdxP6evJktkz
	 IcbDPopcKDZQEMvOaP1Pp6mMwzS+RwvzSnNyQFWeHkAM1WojOUHSQQ0PPuTAS5Y91+
	 2yZEFG+lY/GDYgnuvL3mX/KXzmcak6xJcu3NKYfA44qjgOsXR4rbtTfHHEpORa7mqT
	 HoCnJj/N0E+0McIUrJ2Qe9QAE7P0+J/Zwa8SgIiUrALc7OcXKQFTC+umGi2u+CfM8L
	 aeboi3wt1ia4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8xCt3Swhz4wD3;
	Mon, 17 Nov 2025 16:30:34 +1100 (AEDT)
Date: Mon, 17 Nov 2025 16:30:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the tip tree
Message-ID: <20251117163033.5fe01a29@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5Luq6gVC3RD1Zfj7w308r4j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5Luq6gVC3RD1Zfj7w308r4j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got conflicts in:

  samples/rust/rust_debugfs.rs
  samples/rust/rust_debugfs_scoped.rs

between commit:

  f74cf399e02e ("rust: debugfs: Replace the usage of Rust native atomics")

from the tip tree and commits:

  0242623384c7 ("rust: driver: let probe() return impl PinInit<Self, Error>=
")
  52af0c37964b ("samples: rust: debugfs: add example for blobs")
  f656279afde1 ("samples: rust: debugfs_scoped: add example for blobs")

from the driver-core tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/rust/rust_debugfs.rs
index 711faa07bece,c45b568d951b..000000000000
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@@ -36,8 -38,9 +36,9 @@@ use kernel::c_str
  use kernel::debugfs::{Dir, File};
  use kernel::new_mutex;
  use kernel::prelude::*;
+ use kernel::sizes::*;
 +use kernel::sync::atomic::{Atomic, Relaxed};
  use kernel::sync::Mutex;
 -
  use kernel::{acpi, device::Core, of, platform, str::CString, types::ARef};
 =20
  kernel::module_platform_driver! {
@@@ -57,9 -60,13 +58,13 @@@ struct RustDebugFs=20
      #[pin]
      _compatible: File<CString>,
      #[pin]
 -    counter: File<AtomicUsize>,
 +    counter: File<Atomic<usize>>,
      #[pin]
      inner: File<Mutex<Inner>>,
+     #[pin]
+     array_blob: File<Mutex<[u8; 4]>>,
+     #[pin]
+     vector_blob: File<Mutex<KVec<u8>>>,
  }
 =20
  #[derive(Debug)]
@@@ -104,16 -111,17 +109,17 @@@ impl platform::Driver for RustDebugFs=20
      fn probe(
          pdev: &platform::Device<Core>,
          _info: Option<&Self::IdInfo>,
-     ) -> Result<Pin<KBox<Self>>> {
-         let result =3D KBox::try_pin_init(RustDebugFs::new(pdev), GFP_KER=
NEL)?;
-         // We can still mutate fields through the files which are atomic =
or mutexed:
-         result.counter.store(91, Relaxed);
-         {
-             let mut guard =3D result.inner.lock();
-             guard.x =3D guard.y;
-             guard.y =3D 42;
-         }
-         Ok(result)
+     ) -> impl PinInit<Self, Error> {
+         RustDebugFs::new(pdev).pin_chain(|this| {
 -            this.counter.store(91, Ordering::Relaxed);
++            this.counter.store(91, Relaxed);
+             {
+                 let mut guard =3D this.inner.lock();
+                 guard.x =3D guard.y;
+                 guard.y =3D 42;
+             }
+=20
+             Ok(())
+         })
      }
  }
 =20
diff --cc samples/rust/rust_debugfs_scoped.rs
index 9f0ec5f24cda,c80312cf168d..000000000000
--- a/samples/rust/rust_debugfs_scoped.rs
+++ b/samples/rust/rust_debugfs_scoped.rs
@@@ -6,9 -6,10 +6,10 @@@
  //! `Scope::dir` to create a variety of files without the need to separat=
ely
  //! track them all.
 =20
 -use core::sync::atomic::AtomicUsize;
  use kernel::debugfs::{Dir, Scope};
  use kernel::prelude::*;
+ use kernel::sizes::*;
 +use kernel::sync::atomic::Atomic;
  use kernel::sync::Mutex;
  use kernel::{c_str, new_mutex, str::CString};
 =20
@@@ -109,7 -114,8 +114,8 @@@ impl ModuleData=20
 =20
  struct DeviceData {
      name: CString,
 -    nums: KVec<AtomicUsize>,
 +    nums: KVec<Atomic<usize>>,
+     blob: Pin<KBox<Mutex<[u8; SZ_4K]>>>,
  }
 =20
  fn init_control(base_dir: &Dir, dyn_dirs: Dir) -> impl PinInit<Scope<Modu=
leData>> + '_ {

--Sig_/5Luq6gVC3RD1Zfj7w308r4j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkasvkACgkQAVBC80lX
0GyamQf/TpDEftAxapg5YgB0z39fJPI+Ad2NR5VP61LQ9linOMHomNBXMr5Y7WJN
5BueShgyoxVymOrdMLfW8njUOvJwvdqQWonwSiqNP2hdJ81KM7jp9jHfPEw3Wmiy
EG6A8yaMk5FVIixfkgfwpTbOaSqw6l455qWG2fRMxyYa2hLCiR2hhbMUd4PHPpgz
REeAr3zzpBkuKNHai1QMgpuznF8xXnoEH0mWRPFO2UU9GFHHP4XgXOmmpqNr2275
OCcMh04SBchl8/A+6+q0oy6nPS52LoNHN7vhJN+O16rxIpULF9Elzarv1YkFnR+U
8eL0j3/0ce32bMw4wghUoBqJjaLTCw==
=k8Ev
-----END PGP SIGNATURE-----

--Sig_/5Luq6gVC3RD1Zfj7w308r4j--

