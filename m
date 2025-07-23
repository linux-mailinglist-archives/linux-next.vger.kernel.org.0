Return-Path: <linux-next+bounces-7702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC79CB0E803
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 03:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2E9C3A8B0F
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 01:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F14A37160;
	Wed, 23 Jul 2025 01:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MIUaPjGV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F2E1367;
	Wed, 23 Jul 2025 01:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753233971; cv=none; b=fF3E+XmFu2GmuwcyaNtHi0zaVR9QzDeFukpzi7dsG/3iMa3YAeOwvtwGycBu0KsORn2t6hpfBMALgkcyK52Y1u6/5qKgu0fm4zkw7IaUnACSsl717Mo+lrKyMnzp4g7f2oxdkD+tuUVSM13efRuQOheYUa2bGVmjQzKFyoa3/YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753233971; c=relaxed/simple;
	bh=6tysQMCcE3IDqsrLmjuWPMrVb3dQZiSPRY7q/+8GU/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uWGyx5vqIE22fZfBvOuGuOnf8QA0ii0fqIDHfurOEPoIFiImD4pn/JJEvzdY7FTtSYrNA3LS49ki8gGupCkk4gFFzGAEoMUYNWUQcGMQmh2Wv7aL+1z2pMMAzLV9FS79GQpx4M7vOLJBOSsNz1X9fRljGJR1UTUux5D0Fw+V4Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MIUaPjGV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753233802;
	bh=4qK4hYHtsuHi8e1mZEimbviYZ0RFFmrL2QFV3bE8k+U=;
	h=Date:From:To:Cc:Subject:From;
	b=MIUaPjGVbubPVXTGjwmjh/v4fQhCDNYbDnMtcRtUA3Nq8nnOwTNk20nkozV2FBpk9
	 eBfeXhkOC9kpHvuaFX3QogltxKJHYBYdvIS4Bd2p4DHB8ez8hSl2+IdXV9TUyRlaov
	 jJvkdc0rgMydJhBe/T0a183ZphTY9vDGgEsQbrzAsfkPwjdmX6Bhj23yZY8/+Sz/FL
	 OH9rQge+O+nssouNA75jAWwkW0hrsnTaXvL1KFxqjIdaUVJ4ncpOF2msj+3HTefBBl
	 VVgvj7aUGNsydIgDB+zxSog5lK7ssf5nrHjC6vIWq1WI9yEiyaqrqGbzGHrvrvCtAg
	 SATD7tqyAAGgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmxGd4YH2z4x21;
	Wed, 23 Jul 2025 11:23:21 +1000 (AEST)
Date: Wed, 23 Jul 2025 11:26:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Christian Schrefl
 <chrisi.schrefl@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shankari Anand <shankari.ak0208@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250723112605.74f1c077@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jTiag9qPyYcjLDEm=4Dan/+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jTiag9qPyYcjLDEm=4Dan/+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/types.rs

between commit:

  64888dfdfac7 ("rust: implement `Wrapper<T>` for `Opaque<T>`")

from the driver-core tree and commits:

  8802e1684378 ("rust: types: add Opaque::cast_from")
  07dad44aa9a9 ("rust: kernel: move ARef and AlwaysRefCounted to sync::aref=
")

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

diff --cc rust/kernel/types.rs
index 3958a5f44d56,ec82a163cb0e..000000000000
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@@ -5,12 -6,13 +6,13 @@@ use crate::ffi::c_void
  use core::{
      cell::UnsafeCell,
      marker::{PhantomData, PhantomPinned},
-     mem::{ManuallyDrop, MaybeUninit},
+     mem::MaybeUninit,
      ops::{Deref, DerefMut},
-     ptr::NonNull,
  };
 -use pin_init::{PinInit, Zeroable};
 +use pin_init::{PinInit, Wrapper, Zeroable};
 =20
+ pub use crate::sync::aref::{ARef, AlwaysRefCounted};
+=20
  /// Used to transfer ownership to and from foreign (non-Rust) languages.
  ///
  /// Ownership is transferred from Rust to a foreign language by calling [=
`Self::into_foreign`] and
@@@ -399,191 -411,16 +400,29 @@@ impl<T> Opaque<T>=20
      ///
      /// This function is useful to get access to the value without creati=
ng intermediate
      /// references.
-     pub const fn raw_get(this: *const Self) -> *mut T {
+     pub const fn cast_into(this: *const Self) -> *mut T {
          UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).ca=
st::<T>()
      }
+=20
+     /// The opposite operation of [`Opaque::cast_into`].
+     pub const fn cast_from(this: *const T) -> *const Self {
+         this.cast()
+     }
  }
 =20
 +impl<T> Wrapper<T> for Opaque<T> {
 +    /// Create an opaque pin-initializer from the given pin-initializer.
 +    fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
 +        Self::try_ffi_init(|ptr: *mut T| {
 +            // SAFETY:
 +            //   - `ptr` is a valid pointer to uninitialized memory,
 +            //   - `slot` is not accessed on error,
 +            //   - `slot` is pinned in memory.
 +            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
 +        })
 +    }
 +}
 +
- /// Types that are _always_ reference counted.
- ///
- /// It allows such types to define their own custom ref increment and dec=
rement functions.
- /// Additionally, it allows users to convert from a shared reference `&T`=
 to an owned reference
- /// [`ARef<T>`].
- ///
- /// This is usually implemented by wrappers to existing structures on the=
 C side of the code. For
- /// Rust code, the recommendation is to use [`Arc`](crate::sync::Arc) to =
create reference-counted
- /// instances of a type.
- ///
- /// # Safety
- ///
- /// Implementers must ensure that increments to the reference count keep =
the object alive in memory
- /// at least until matching decrements are performed.
- ///
- /// Implementers must also ensure that all instances are reference-counte=
d. (Otherwise they
- /// won't be able to honour the requirement that [`AlwaysRefCounted::inc_=
ref`] keep the object
- /// alive.)
- pub unsafe trait AlwaysRefCounted {
-     /// Increments the reference count on the object.
-     fn inc_ref(&self);
-=20
-     /// Decrements the reference count on the object.
-     ///
-     /// Frees the object when the count reaches zero.
-     ///
-     /// # Safety
-     ///
-     /// Callers must ensure that there was a previous matching increment =
to the reference count,
-     /// and that the object is no longer used after its reference count i=
s decremented (as it may
-     /// result in the object being freed), unless the caller owns another=
 increment on the refcount
-     /// (e.g., it calls [`AlwaysRefCounted::inc_ref`] twice, then calls
-     /// [`AlwaysRefCounted::dec_ref`] once).
-     unsafe fn dec_ref(obj: NonNull<Self>);
- }
-=20
- /// An owned reference to an always-reference-counted object.
- ///
- /// The object's reference count is automatically decremented when an ins=
tance of [`ARef`] is
- /// dropped. It is also automatically incremented when a new instance is =
created via
- /// [`ARef::clone`].
- ///
- /// # Invariants
- ///
- /// The pointer stored in `ptr` is non-null and valid for the lifetime of=
 the [`ARef`] instance. In
- /// particular, the [`ARef`] instance owns an increment on the underlying=
 object's reference count.
- pub struct ARef<T: AlwaysRefCounted> {
-     ptr: NonNull<T>,
-     _p: PhantomData<T>,
- }
-=20
- // SAFETY: It is safe to send `ARef<T>` to another thread when the underl=
ying `T` is `Sync` because
- // it effectively means sharing `&T` (which is safe because `T` is `Sync`=
); additionally, it needs
- // `T` to be `Send` because any thread that has an `ARef<T>` may ultimate=
ly access `T` using a
- // mutable reference, for example, when the reference count reaches zero =
and `T` is dropped.
- unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
-=20
- // SAFETY: It is safe to send `&ARef<T>` to another thread when the under=
lying `T` is `Sync`
- // because it effectively means sharing `&T` (which is safe because `T` i=
s `Sync`); additionally,
- // it needs `T` to be `Send` because any thread that has a `&ARef<T>` may=
 clone it and get an
- // `ARef<T>` on that thread, so the thread may ultimately access `T` usin=
g a mutable reference, for
- // example, when the reference count reaches zero and `T` is dropped.
- unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
-=20
- impl<T: AlwaysRefCounted> ARef<T> {
-     /// Creates a new instance of [`ARef`].
-     ///
-     /// It takes over an increment of the reference count on the underlyi=
ng object.
-     ///
-     /// # Safety
-     ///
-     /// Callers must ensure that the reference count was incremented at l=
east once, and that they
-     /// are properly relinquishing one increment. That is, if there is on=
ly one increment, callers
-     /// must not use the underlying object anymore -- it is only safe to =
do so via the newly
-     /// created [`ARef`].
-     pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
-         // INVARIANT: The safety requirements guarantee that the new inst=
ance now owns the
-         // increment on the refcount.
-         Self {
-             ptr,
-             _p: PhantomData,
-         }
-     }
-=20
-     /// Consumes the `ARef`, returning a raw pointer.
-     ///
-     /// This function does not change the refcount. After calling this fu=
nction, the caller is
-     /// responsible for the refcount previously managed by the `ARef`.
-     ///
-     /// # Examples
-     ///
-     /// ```
-     /// use core::ptr::NonNull;
-     /// use kernel::types::{ARef, AlwaysRefCounted};
-     ///
-     /// struct Empty {}
-     ///
-     /// # // SAFETY: TODO.
-     /// unsafe impl AlwaysRefCounted for Empty {
-     ///     fn inc_ref(&self) {}
-     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
-     /// }
-     ///
-     /// let mut data =3D Empty {};
-     /// let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
-     /// # // SAFETY: TODO.
-     /// let data_ref: ARef<Empty> =3D unsafe { ARef::from_raw(ptr) };
-     /// let raw_ptr: NonNull<Empty> =3D ARef::into_raw(data_ref);
-     ///
-     /// assert_eq!(ptr, raw_ptr);
-     /// ```
-     pub fn into_raw(me: Self) -> NonNull<T> {
-         ManuallyDrop::new(me).ptr
-     }
- }
-=20
- impl<T: AlwaysRefCounted> Clone for ARef<T> {
-     fn clone(&self) -> Self {
-         self.inc_ref();
-         // SAFETY: We just incremented the refcount above.
-         unsafe { Self::from_raw(self.ptr) }
-     }
- }
-=20
- impl<T: AlwaysRefCounted> Deref for ARef<T> {
-     type Target =3D T;
-=20
-     fn deref(&self) -> &Self::Target {
-         // SAFETY: The type invariants guarantee that the object is valid.
-         unsafe { self.ptr.as_ref() }
-     }
- }
-=20
- impl<T: AlwaysRefCounted> From<&T> for ARef<T> {
-     fn from(b: &T) -> Self {
-         b.inc_ref();
-         // SAFETY: We just incremented the refcount above.
-         unsafe { Self::from_raw(NonNull::from(b)) }
-     }
- }
-=20
- impl<T: AlwaysRefCounted> Drop for ARef<T> {
-     fn drop(&mut self) {
-         // SAFETY: The type invariants guarantee that the `ARef` owns the=
 reference we're about to
-         // decrement.
-         unsafe { T::dec_ref(self.ptr) };
-     }
- }
-=20
- /// A sum type that always holds either a value of type `L` or `R`.
- ///
- /// # Examples
- ///
- /// ```
- /// use kernel::types::Either;
- ///
- /// let left_value: Either<i32, &str> =3D Either::Left(7);
- /// let right_value: Either<i32, &str> =3D Either::Right("right value");
- /// ```
- pub enum Either<L, R> {
-     /// Constructs an instance of [`Either`] containing a value of type `=
L`.
-     Left(L),
-=20
-     /// Constructs an instance of [`Either`] containing a value of type `=
R`.
-     Right(R),
- }
-=20
  /// Zero-sized type to mark types not [`Send`].
  ///
  /// Add this type as a field to your struct if your type should not be se=
nt to a different task.

--Sig_/jTiag9qPyYcjLDEm=4Dan/+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAOi0ACgkQAVBC80lX
0GwUwgf9E8QmK155t/RK+T3HCK8F5WRMOUJfofgAbn6yCFkkDEwBDmjBrcLxCZOg
6EPl/tuQUHxbmbKAQjYjdyflVtquhguLiKdNrGT3UbuYjlpEEAWNheB3T0iz+K0P
aZkZvENpERJ28gNwYuVoyQ+0bqXpRrTWL9aKTs49LE0TLuK8C6l4LfPlAFzhrZvC
gABhfkDkqhJhbbzaVXGRz07A2fOlrbvhyUGEl4FJ7ViZJSRiRp1mwO2/bTrrcniV
RaSXHvJWeJt4lr3xtqNjljeEJk0I7jyePeBhBTAug4sdE8rA706vNOAS4XLrThnk
28YIT79NihIL5dQCScKjOag2tcKUVA==
=4DHt
-----END PGP SIGNATURE-----

--Sig_/jTiag9qPyYcjLDEm=4Dan/+--

