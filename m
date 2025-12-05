Return-Path: <linux-next+bounces-9356-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD1CA6126
	for <lists+linux-next@lfdr.de>; Fri, 05 Dec 2025 05:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF55C31D61DB
	for <lists+linux-next@lfdr.de>; Fri,  5 Dec 2025 04:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2892128A1CC;
	Fri,  5 Dec 2025 04:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IW2Q4oQi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B80A23ED75;
	Fri,  5 Dec 2025 04:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907323; cv=none; b=uWhhVJ/XGiUqVVbY5rM3/kK6a9wWLSbhL3xPtugZRAJm7Q/+zUHrHxqMf3e+FCjO4kqL467xK8703c7CUQ4Rp6INxbEjbjlkTN5EA9BdlXEwFPPdWo0Id9MS8uBElcU3Wd86YvrrxXglvQa2Ndh9j2lACtTgHSioPlzhVi7rOvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907323; c=relaxed/simple;
	bh=b9sfnesYa4qZcU9qNCgSQWsPLphgZnYb79UbDrBYAxo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JD8PUgFrTbifW5/jBKlL0O6ahxWSQW6WkXnSDNEmiPaR1Pw2OA/HmYtoJNUU40+JCA6sxqEcfr/lGC9uv2tP1ehO9/Zvm1r9/AYXzLpLLUUm7zu65J1U7ZU0r0VTL8G2UD9Tn8sP9Y435JOaoLYuVP1m9Hjlu0kCjj49IXgmHS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IW2Q4oQi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764907317;
	bh=Bl1entNjKM9N+diC7FO9LEsbz3DqxL/BJ6F7iRfVEEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IW2Q4oQiGRH44voU2s2N73WLJQRpf9HZp3VQBnwfi9wPpe3W9zTEdGfPmrHQAf7YL
	 F28s6LcCrglIQfb43MSk+jl469nEwwhUw/DMF07VaKJojjEOFKPfHJ3okmuUeJQ9Ed
	 59JcCYSboZgEKRAgWCx06Ahi9m6MaepokxXyIPA0xeMhGB8IzL2p9U6vg10nmiMyQU
	 LGtbNtz4ShlJpINU/IXTAOMU2YkDiVpi+Iqh8GEcSzJip8/KhJI9nORHTa9MaVSdnD
	 pEr3qcrHeKorsoeqhKOwm0MY5bn3QZh9YBuh4Thk5NaJBxIgSh1CocB0cfvmqIH4G/
	 pW+Kq1szGv+FA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMyPK2ykZz4wGX;
	Fri, 05 Dec 2025 15:01:56 +1100 (AEDT)
Date: Fri, 5 Dec 2025 15:01:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Tamir
 Duberstein <tamird@gmail.com>
Subject: Re: linux-next: manual merge of the driver-core tree with Linus'
 tree
Message-ID: <20251205150155.59b356d7@canb.auug.org.au>
In-Reply-To: <20251205142031.7404c49d@canb.auug.org.au>
References: <20251205142031.7404c49d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DyTOfgZubiO3gv43/SJjeIq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DyTOfgZubiO3gv43/SJjeIq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 5 Dec 2025 14:20:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   rust/kernel/debugfs/traits.rs
>=20
> between commits:
>=20
>   f74cf399e02e ("rust: debugfs: Replace the usage of Rust native atomics")
>   3f0dd5fad9ac ("rust: debugfs: use `kernel::fmt`")
>=20
> from Linus' tree and commits:
>=20
>   9c804d9cf2db ("rust: debugfs: support for binary large objects")
>   a9fca8a7b2c5 ("rust: debugfs: support blobs from smart pointers")
>=20
> from the driver-core tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Forgot the diff.  See below.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/debugfs/traits.rs
index e8a8a98f18dc,82441ac8adaa..000000000000
--- a/rust/kernel/debugfs/traits.rs
+++ b/rust/kernel/debugfs/traits.rs
@@@ -3,12 -3,20 +3,17 @@@
 =20
  //! Traits for rendering or updating values exported to DebugFS.
 =20
+ use crate::alloc::Allocator;
 +use crate::fmt;
+ use crate::fs::file;
  use crate::prelude::*;
 +use crate::sync::atomic::{Atomic, AtomicBasicOps, AtomicType, Relaxed};
+ use crate::sync::Arc;
  use crate::sync::Mutex;
- use crate::uaccess::UserSliceReader;
+ use crate::transmute::{AsBytes, FromBytes};
+ use crate::uaccess::{UserSliceReader, UserSliceWriter};
 -use core::fmt::{self, Debug, Formatter};
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

--Sig_/DyTOfgZubiO3gv43/SJjeIq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkyWTMACgkQAVBC80lX
0Gy0bwgAlU0n0pkaZV14HyXoxEpxhSFJwuqAcdVgYLneC3KzvYrykh2EYDYv4ruJ
XGoD6uW9jlit+e9H7RvpfKrXAx6g+441WtsFkZctnNgyBtR5AI2Am57lxk3zBWii
CnTMAN2kwVFWwk2DwHVtsLoYi6J40o453fW/wDTaOJ8voW3RBdzFTGiTulU4BNEo
8qoyX7BRUZzstM+tMcTFz43u34BllmKYCKi0QsKWjX/oVsy88WzZVF2/IyQx/zzT
3LcOqhJNkU4Fvqw8dQNghCaQ+KdP0T6rhDnG055orHUKAWGc624bAZq23ZelJaHJ
Qy/fTbMukgN8sRkeNOWuqhlNlyyebA==
=/fnc
-----END PGP SIGNATURE-----

--Sig_/DyTOfgZubiO3gv43/SJjeIq--

