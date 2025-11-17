Return-Path: <linux-next+bounces-9037-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F03C6264F
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 06:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B65C23A8D73
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 05:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826F030E82C;
	Mon, 17 Nov 2025 05:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X3dte1BC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36930EF89;
	Mon, 17 Nov 2025 05:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356923; cv=none; b=uL3Li7z36F7qHxsT/RU9EA8zVgz88/kpT5HbO/X7ntcKfzVcbolX6jgJBHDsMmYUEwgPnXMyoyXklhpMbtpI/y4d+1Q6TtC3Aaf5XdHjXuLd5z1scjxQqPzzFPwgCSQn0eFGWglM7/qOoN/AXHU0OqdT212z+5bdyVG/VsAhAgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356923; c=relaxed/simple;
	bh=sb5TB6y7h2kEX96dGytlOczo27q+C8cvh8kZ1co49fs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GUTfqh/GRAzpo8w2nQJjynXMw9RgfeRepOi3t3CXI9DbRZiVIyNWfSbmV7FM1pIko/rGEEDOCCkRad5N+7L8Stg96uL0akZQSQ/Tml2FEdumI/i5HsXteUH1N1FfDwzTEKPvXPDocs8VTKJzXq18scRs18fgWKBfjGhRbGhF6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X3dte1BC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763356916;
	bh=3oO9JU99vN2leQ86IHT5PyIqmSGV55nYYgsantuUb1c=;
	h=Date:From:To:Cc:Subject:From;
	b=X3dte1BCtwSAsmgC0QaEkRvUQ/SWfDs9Xc8zfd+AikRDOeStvxOjRuk5A4IZJKMIN
	 vL9RwCZJrgcNFEkYgCsrNYVJdb32kEJhMCSMwdCQINlOcHsav5W/STiHyt2Ohkzk+E
	 ACMbpM8VuHdpCvTnKb5Nuzjio1437DeJvulTKCtP+Ti3vGVlo7h4M4+dL5ltRUFjwr
	 VH52MCMx3DjshMeOov/G/u7MmShohHMxopKFRc7PLsd2ks3vFMW/5LvwJGSMtMgKhD
	 3Gs04Q1RXo5uNOTe3sBgqy7tqcFmEZHMrlxtzl8dt1ea1//7PbfILMpf9P3JZzlZY9
	 C+2txG0zINtuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8x1t6kqzz4w21;
	Mon, 17 Nov 2025 16:21:54 +1100 (AEDT)
Date: Mon, 17 Nov 2025 16:21:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the tip tree
Message-ID: <20251117162154.193e1e9e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cSo9zkUzt7i5hiN=.h7+sGm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cSo9zkUzt7i5hiN=.h7+sGm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  rust/kernel/debugfs/traits.rs

between commit:

  f74cf399e02e ("rust: debugfs: Replace the usage of Rust native atomics")

from the tip tree and commits:

  9c804d9cf2db ("rust: debugfs: support for binary large objects")
  a9fca8a7b2c5 ("rust: debugfs: support blobs from smart pointers")

from the driver-core tree.

I fixed it up (I think - see below) and can carry the fix as necessary. This
complex conflicts.
conflicts should be mentioned to your upstream maintainer when your tree
is now fixed as far as linux-next is concerned, but any non trivial
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/debugfs/traits.rs
index 92054fed2136,82441ac8adaa..000000000000
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@@ -3,12 -3,20 +3,17 @@@
 =20
  //! Traits for rendering or updating values exported to DebugFS.
 =20
+ use crate::alloc::Allocator;
+ use crate::fs::file;
  use crate::prelude::*;
+ use crate::sync::Arc;
 +use crate::sync::atomic::{Atomic, AtomicBasicOps, AtomicType, Relaxed};
  use crate::sync::Mutex;
- use crate::uaccess::UserSliceReader;
+ use crate::transmute::{AsBytes, FromBytes};
+ use crate::uaccess::{UserSliceReader, UserSliceWriter};
  use core::fmt::{self, Debug, Formatter};
+ use core::ops::{Deref, DerefMut};
  use core::str::FromStr;
 -use core::sync::atomic::{
 -    AtomicI16, AtomicI32, AtomicI64, AtomicI8, AtomicIsize, AtomicU16, At=
omicU32, AtomicU64,
 -    AtomicU8, AtomicUsize, Ordering,
 -};
 =20
  /// A trait for types that can be written into a string.
  ///
@@@ -63,21 -175,164 +172,148 @@@ impl<T: FromStr + Unpin> Reader for Mut
      }
  }
 =20
 +impl<T: AtomicType + FromStr> Reader for Atomic<T>
 +where
 +    T::Repr: AtomicBasicOps,
 +{
 +    fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
 +        let mut buf =3D [0u8; 21]; // Enough for a 64-bit number.
 +        if reader.len() > buf.len() {
 +            return Err(EINVAL);
 +        }
 +        let n =3D reader.len();
 +        reader.read_slice(&mut buf[..n])?;
 +
 +        let s =3D core::str::from_utf8(&buf[..n]).map_err(|_| EINVAL)?;
 +        let val =3D s.trim().parse::<T>().map_err(|_| EINVAL)?;
 +        self.store(val, Relaxed);
 +        Ok(())
 +    }
 +}
++
+ /// Trait for types that can be constructed from a binary representation.
+ ///
+ /// See also [`BinaryReader`] for interior mutability.
+ pub trait BinaryReaderMut {
+     /// Reads the binary form of `self` from `reader`.
+     ///
+     /// Same as [`BinaryReader::read_from_slice`], but takes a mutable re=
ference.
+     ///
+     /// `offset` is the requested offset into the binary representation o=
f `self`.
+     ///
+     /// On success, returns the number of bytes read from `reader`.
+     fn read_from_slice_mut(
+         &mut self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize>;
+ }
+=20
+ // Base implementation for any `T: AsBytes + FromBytes`.
+ impl<T: AsBytes + FromBytes> BinaryReaderMut for T {
+     fn read_from_slice_mut(
+         &mut self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize> {
+         reader.read_slice_file(self.as_bytes_mut(), offset)
+     }
+ }
+=20
+ // Delegate for `Box<T, A>`: Support a `Box<T, A>` with an outer lock.
+ impl<T: ?Sized + BinaryReaderMut, A: Allocator> BinaryReaderMut for Box<T=
, A> {
+     fn read_from_slice_mut(
+         &mut self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize> {
+         self.deref_mut().read_from_slice_mut(reader, offset)
+     }
+ }
+=20
+ // Delegate for `Vec<T, A>`: Support a `Vec<T, A>` with an outer lock.
+ impl<T, A> BinaryReaderMut for Vec<T, A>
+ where
+     T: AsBytes + FromBytes,
+     A: Allocator,
+ {
+     fn read_from_slice_mut(
+         &mut self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize> {
+         let slice =3D self.as_mut_slice();
+=20
+         // SAFETY: `T: AsBytes + FromBytes` allows us to treat `&mut [T]`=
 as `&mut [u8]`.
+         let buffer =3D unsafe {
+             core::slice::from_raw_parts_mut(
+                 slice.as_mut_ptr().cast(),
+                 core::mem::size_of_val(slice),
+             )
+         };
+=20
+         reader.read_slice_file(buffer, offset)
+     }
+ }
+=20
+ /// Trait for types that can be constructed from a binary representation.
+ ///
+ /// See also [`BinaryReaderMut`] for the mutable version.
+ pub trait BinaryReader {
+     /// Reads the binary form of `self` from `reader`.
+     ///
+     /// `offset` is the requested offset into the binary representation o=
f `self`.
+     ///
+     /// On success, returns the number of bytes read from `reader`.
+     fn read_from_slice(
+         &self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize>;
+ }
+=20
+ // Delegate for `Mutex<T>`: Support a `T` with an outer `Mutex`.
+ impl<T: BinaryReaderMut + Unpin> BinaryReader for Mutex<T> {
+     fn read_from_slice(
+         &self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize> {
+         let mut this =3D self.lock();
+=20
+         this.read_from_slice_mut(reader, offset)
+     }
+ }
+=20
+ // Delegate for `Box<T, A>`: Support a `Box<T, A>` with an inner lock.
+ impl<T: ?Sized + BinaryReader, A: Allocator> BinaryReader for Box<T, A> {
+     fn read_from_slice(
+         &self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize> {
+         self.deref().read_from_slice(reader, offset)
+     }
+ }
+=20
+ // Delegate for `Pin<Box<T, A>>`: Support a `Pin<Box<T, A>>` with an inne=
r lock.
+ impl<T: ?Sized + BinaryReader, A: Allocator> BinaryReader for Pin<Box<T, =
A>> {
+     fn read_from_slice(
+         &self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize> {
+         self.deref().read_from_slice(reader, offset)
+     }
+ }
+=20
+ // Delegate for `Arc<T>`: Support an `Arc<T>` with an inner lock.
+ impl<T: ?Sized + BinaryReader> BinaryReader for Arc<T> {
+     fn read_from_slice(
+         &self,
+         reader: &mut UserSliceReader,
+         offset: &mut file::Offset,
+     ) -> Result<usize> {
+         self.deref().read_from_slice(reader, offset)
+     }
+ }
 -
 -macro_rules! impl_reader_for_atomic {
 -    ($(($atomic_type:ty, $int_type:ty)),*) =3D> {
 -        $(
 -            impl Reader for $atomic_type {
 -                fn read_from_slice(&self, reader: &mut UserSliceReader) -=
> Result {
 -                    let mut buf =3D [0u8; 21]; // Enough for a 64-bit num=
ber.
 -                    if reader.len() > buf.len() {
 -                        return Err(EINVAL);
 -                    }
 -                    let n =3D reader.len();
 -                    reader.read_slice(&mut buf[..n])?;
 -
 -                    let s =3D core::str::from_utf8(&buf[..n]).map_err(|_|=
 EINVAL)?;
 -                    let val =3D s.trim().parse::<$int_type>().map_err(|_|=
 EINVAL)?;
 -                    self.store(val, Ordering::Relaxed);
 -                    Ok(())
 -                }
 -            }
 -        )*
 -    };
 -}
 -
 -impl_reader_for_atomic!(
 -    (AtomicI16, i16),
 -    (AtomicI32, i32),
 -    (AtomicI64, i64),
 -    (AtomicI8, i8),
 -    (AtomicIsize, isize),
 -    (AtomicU16, u16),
 -    (AtomicU32, u32),
 -    (AtomicU64, u64),
 -    (AtomicU8, u8),
 -    (AtomicUsize, usize)
 -);

--Sig_/cSo9zkUzt7i5hiN=.h7+sGm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkasPIACgkQAVBC80lX
0GykHAf/QeKI6KxRKtJPv3nMlhcqF6wda4GAL5tJG/vi6C9En8idkiEZuycK1zza
yVDr8s8tgBUW6ZWASt2l0yRXNJYBwHAt3bDzkmri2Nu4T5TD8K1DJ63H4AF9GttM
7X+6Hej9Rg3V/XtcQi+f2ic8NyE3q50u0moP0jAZre+xhEyn9UAVY7Mse5m/q/do
MNt4SGoI3oXOtSrp5fvyU0VzAn2CjR5dxuj6T+tNsC6PkyC0ULQNjrGaVsn+PYLh
0aeH5PQ4dFnJA0Vpp9FFDio11nyX4UpPwo+QKqL9N4XRfmw1NDrHeKiNr1o4+8ho
4Cj1sunNEX7o06ticKwH/m1QeIAsDA==
=GHNo
-----END PGP SIGNATURE-----

--Sig_/cSo9zkUzt7i5hiN=.h7+sGm--

