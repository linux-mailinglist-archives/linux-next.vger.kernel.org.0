Return-Path: <linux-next+bounces-5859-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34693A672D6
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 12:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6038417E958
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 11:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D92520A5C6;
	Tue, 18 Mar 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qOcx5lh2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D32066C4;
	Tue, 18 Mar 2025 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742297840; cv=none; b=Mwici/Nwt9U22G7DwRePYU07N5aBPAcYNbBOVWaQ/Fm8EMaiNCBxVEYBjsPVoOKu1Hz/JMNYPJhl1zlc6aR+SVCmPikoOo6Wz8WQTaOBdss+xJR8ADZOaCSY8hnZ2RhP4QDOjR0NrfQQ5AiL0qYBCF+jfqUNjsvhXr/1FbH1Byo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742297840; c=relaxed/simple;
	bh=2HF38Pn5h2IKIx7Zs82Y/cT8s7GNAsuq2KJ8O3ac9gI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=My/zNvc+NCJMDD9nT87mzDS71uWDLOXtUuxGdnVg4fLnOL/Y7e5/WRQESKYTSFSzBMEr3IJnqbzL8ECbMCjdYREtVS9qEjWN7XmCUU0YeAFoQMIKzn5sVydUqP2TUQrbq2MoMpotU425/pYbzqHq+v/4+ikxMJs/br93HqlwKZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qOcx5lh2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742297827;
	bh=p6r75jZcEb2uSYmc4x9MU+soIPqQEGiCtkjlY0hYvBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qOcx5lh2E6g3hm17Odfv7l6JP+CWTkpJny+ecqHUw8taU9rO34ipbGhHOYPt/oHkW
	 6Qqhpj/SP7W3/8szcK9PhX2JqmVZevJqJjA24SZcMJECnJiWn0zDuiaXXx199zt5zQ
	 Gjebi2UGY1fZJpp5Wk9KXl4YUhUrXDXtEr5mzB0Cbdu5+RsmH3cS4redRJg9Sbz010
	 n7kE2poGTnnr4Djf7RwJqwy2MUtbpkTsBBK01Qliq2X51zknsje4LGvIXMsGqj39T6
	 KSF11EviutNqciqg5l+YAVzAaulV4nBWVzgkzyv9hZc0vd8kxFnWT+QWA5huR0VArZ
	 Fq5YiRL/po/YQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZH8vQ694Hz4xM1;
	Tue, 18 Mar 2025 22:37:06 +1100 (AEDT)
Date: Tue, 18 Mar 2025 22:37:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20250318223706.604bc4c5@canb.auug.org.au>
In-Reply-To: <20250318103504.4cbfe7e1@canb.auug.org.au>
References: <20250317215757.2412aef1@canb.auug.org.au>
	<CANiq72n05i322FfpSjFX=Wz3-9AgVRKLkKs1CHa-LxzWQ7-pew@mail.gmail.com>
	<20250318103504.4cbfe7e1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X9k2JsrApTtNVhiYXtW7+Vu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X9k2JsrApTtNVhiYXtW7+Vu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 18 Mar 2025 10:35:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Thanks, I will see what I can come up with.

(there are 2 resolutions below)

When I merge the rust tree into linux-next, the complete resolution now
looks like this:
(the hunk in rust/kernel/sync.rs is needed due to a commit in the tip
tree)

892715be4379deb333376e573113fd75672eca6c
diff --cc drivers/gpu/drm/drm_panic_qr.rs
index 5d21f6d10bcb,ecd87e8ffe05..f2a99681b998
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@@ -27,7 -26,8 +27,7 @@@
  //! * <https://github.com/erwanvivien/fast_qr>
  //! * <https://github.com/bjguillot/qr>
 =20
- use kernel::str::CStr;
 -use core::cmp;
+ use kernel::{prelude::*, str::CStr};
 =20
  #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
  struct Version(usize);
diff --cc rust/Makefile
index 089473a89d46,e761a8cc3bd5..3474f0b2b24c
--- a/rust/Makefile
+++ b/rust/Makefile
@@@ -175,9 -199,9 +203,9 @@@ quiet_cmd_rustdoc_test_kernel =3D RUSTDO
  	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
  	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
  	OBJTREE=3D$(abspath $(objtree)) \
 -	$(RUSTDOC) --test $(rust_flags) \
 +	$(RUSTDOC) --test $(filter-out --remap-path-prefix=3D%,$(rust_flags)) \
- 		-L$(objtree)/$(obj) --extern ffi --extern kernel \
- 		--extern build_error --extern macros \
+ 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
+ 		--extern kernel --extern build_error --extern macros \
  		--extern bindings --extern uapi \
  		--no-run --crate-name kernel -Zunstable-options \
  		--sysroot=3D/dev/null \
diff --cc rust/kernel/alloc/kbox.rs
index cb4ebea3b074,e6200cd1d06d..a4bde2616c4e
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@@ -99,6 -100,12 +100,10 @@@ pub type VBox<T> =3D Box<T, super::alloca
  /// ```
  pub type KVBox<T> =3D Box<T, super::allocator::KVmalloc>;
 =20
 -// SAFETY: All zeros is equivalent to `None` (option layout optimization =
guarantee).
 -//
 -// In this case we are allowed to use `T: ?Sized`, since all zeros is the=
 `None` variant and there
 -// is no problem with a VTABLE pointer being null.
 -unsafe impl<T: ?Sized, A: Allocator> ZeroableOption for Box<T, A> {}
++// SAFETY: All zeros is equivalent to `None` (option layout optimization =
guarantee:
++// https://doc.rust-lang.org/stable/std/option/index.html#representation).
++unsafe impl<T, A: Allocator> ZeroableOption for Box<T, A> {}
+=20
  // SAFETY: `Box` is `Send` if `T` is `Send` because the `Box` owns a `T`.
  unsafe impl<T, A> Send for Box<T, A>
  where
diff --cc rust/kernel/sync.rs
index 4104bc26471a,3498fb344dc9..ee8ffd2955b8
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@@ -5,8 -5,6 +5,8 @@@
  //! This module contains the kernel APIs related to synchronisation that =
have been ported or
  //! wrapped for usage by Rust code in the kernel.
 =20
- use crate::pin_init;
++use pin_init;
 +use crate::prelude::*;
  use crate::types::Opaque;
 =20
  mod arc;
diff --cc rust/kernel/sync/condvar.rs
index fbf68ada582f,c2535db9e0f8..caebf03f553b
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@@ -8,17 -8,14 +8,15 @@@
  use super::{lock::Backend, lock::Guard, LockClassKey};
  use crate::{
      ffi::{c_int, c_long},
-     init::PinInit,
-     pin_init,
      str::CStr,
 -    task::{MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UN=
INTERRUPTIBLE},
 +    task::{
 +        MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NO=
RMAL, TASK_UNINTERRUPTIBLE,
 +    },
      time::Jiffies,
      types::Opaque,
  };
 -use core::marker::PhantomPinned;
 -use core::ptr;
 +use core::{marker::PhantomPinned, pin::Pin, ptr};
- use macros::pin_data;
+ use pin_init::{pin_data, pin_init, PinInit};
 =20
  /// Creates a [`CondVar`] initialiser with the given name and a newly-cre=
ated lock class.
  #[macro_export]
diff --cc rust/kernel/sync/lock.rs
index 360a10a9216d,7f611b59ac57..b69ed684df14
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@@ -10,10 -10,8 +10,8 @@@ use crate::
      str::CStr,
      types::{NotThreadSafe, Opaque, ScopeGuard},
  };
 -use core::{cell::UnsafeCell, marker::PhantomPinned};
 +use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
- use macros::pin_data;
+ use pin_init::{pin_data, pin_init, PinInit};
 =20
  pub mod mutex;
  pub mod spinlock;
diff --cc rust/pin-init/src/lib.rs
index 000000000000,f36b8f8e8730..9cd822388ba2
mode 000000,100644..100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@@ -1,0 -1,1486 +1,1484 @@@
+ // SPDX-License-Identifier: Apache-2.0 OR MIT
+=20
+ //! Library to safely and fallibly initialize pinned `struct`s using in-p=
lace constructors.
+ //!
+ //! [Pinning][pinning] is Rust's way of ensuring data does not move.
+ //!
+ //! It also allows in-place initialization of big `struct`s that would ot=
herwise produce a stack
+ //! overflow.
+ //!
+ //! This library's main use-case is in [Rust-for-Linux]. Although this ve=
rsion can be used
+ //! standalone.
+ //!
+ //! There are cases when you want to in-place initialize a struct. For ex=
ample when it is very big
+ //! and moving it from the stack is not an option, because it is bigger t=
han the stack itself.
+ //! Another reason would be that you need the address of the object to in=
itialize it. This stands
+ //! in direct conflict with Rust's normal process of first initializing a=
n object and then moving
+ //! it into it's final memory location. For more information, see
+ //! <https://rust-for-linux.com/the-safe-pinned-initialization-problem>.
+ //!
+ //! This library allows you to do in-place initialization safely.
+ //!
+ //! ## Nightly Needed for `alloc` feature
+ //!
+ //! This library requires the [`allocator_api` unstable feature] when the=
 `alloc` feature is
+ //! enabled and thus this feature can only be used with a nightly compile=
r. When enabling the
+ //! `alloc` feature, the user will be required to activate `allocator_api=
` as well.
+ //!
+ //! [`allocator_api` unstable feature]: https://doc.rust-lang.org/nightly=
/unstable-book/library-features/allocator-api.html
+ //!
+ //! The feature is enabled by default, thus by default `pin-init` will re=
quire a nightly compiler.
+ //! However, using the crate on stable compilers is possible by disabling=
 `alloc`. In practice this
+ //! will require the `std` feature, because stable compilers have neither=
 `Box` nor `Arc` in no-std
+ //! mode.
+ //!
+ //! # Overview
+ //!
+ //! To initialize a `struct` with an in-place constructor you will need t=
wo things:
+ //! - an in-place constructor,
+ //! - a memory location that can hold your `struct` (this can be the [sta=
ck], an [`Arc<T>`],
+ //!   [`Box<T>`] or any other smart pointer that supports this library).
+ //!
+ //! To get an in-place constructor there are generally three options:
+ //! - directly creating an in-place constructor using the [`pin_init!`] m=
acro,
+ //! - a custom function/macro returning an in-place constructor provided =
by someone else,
+ //! - using the unsafe function [`pin_init_from_closure()`] to manually c=
reate an initializer.
+ //!
+ //! Aside from pinned initialization, this library also supports in-place=
 construction without
+ //! pinning, the macros/types/functions are generally named like the pinn=
ed variants without the
+ //! `pin_` prefix.
+ //!
+ //! # Examples
+ //!
+ //! Throughout the examples we will often make use of the `CMutex` type w=
hich can be found in
+ //! `../examples/mutex.rs`. It is essentially a userland rebuild of the `=
struct mutex` type from
+ //! the Linux kernel. It also uses a wait list and a basic spinlock. Impo=
rtantly the wait list
+ //! requires it to be pinned to be locked and thus is a prime candidate f=
or using this library.
+ //!
+ //! ## Using the [`pin_init!`] macro
+ //!
+ //! If you want to use [`PinInit`], then you will have to annotate your `=
struct` with
+ //! `#[`[`pin_data`]`]`. It is a macro that uses `#[pin]` as a marker for
+ //! [structurally pinned fields]. After doing this, you can then create a=
n in-place constructor via
+ //! [`pin_init!`]. The syntax is almost the same as normal `struct` initi=
alizers. The difference is
+ //! that you need to write `<-` instead of `:` for fields that you want t=
o initialize in-place.
+ //!
+ //! ```rust
+ //! # #![expect(clippy::disallowed_names)]
+ //! # #![feature(allocator_api)]
+ //! # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ //! # use core::pin::Pin;
+ //! use pin_init::{pin_data, pin_init, InPlaceInit};
+ //!
+ //! #[pin_data]
+ //! struct Foo {
+ //!     #[pin]
+ //!     a: CMutex<usize>,
+ //!     b: u32,
+ //! }
+ //!
+ //! let foo =3D pin_init!(Foo {
+ //!     a <- CMutex::new(42),
+ //!     b: 24,
+ //! });
+ //! # let _ =3D Box::pin_init(foo);
+ //! ```
+ //!
+ //! `foo` now is of the type [`impl PinInit<Foo>`]. We can now use any sm=
art pointer that we like
+ //! (or just the stack) to actually initialize a `Foo`:
+ //!
+ //! ```rust
+ //! # #![expect(clippy::disallowed_names)]
+ //! # #![feature(allocator_api)]
+ //! # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ //! # use core::{alloc::AllocError, pin::Pin};
+ //! # use pin_init::*;
+ //! #
+ //! # #[pin_data]
+ //! # struct Foo {
+ //! #     #[pin]
+ //! #     a: CMutex<usize>,
+ //! #     b: u32,
+ //! # }
+ //! #
+ //! # let foo =3D pin_init!(Foo {
+ //! #     a <- CMutex::new(42),
+ //! #     b: 24,
+ //! # });
+ //! let foo: Result<Pin<Box<Foo>>, AllocError> =3D Box::pin_init(foo);
+ //! ```
+ //!
+ //! For more information see the [`pin_init!`] macro.
+ //!
+ //! ## Using a custom function/macro that returns an initializer
+ //!
+ //! Many types that use this library supply a function/macro that returns=
 an initializer, because
+ //! the above method only works for types where you can access the fields.
+ //!
+ //! ```rust
+ //! # #![feature(allocator_api)]
+ //! # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ //! # use pin_init::*;
+ //! # use std::sync::Arc;
+ //! # use core::pin::Pin;
+ //! let mtx: Result<Pin<Arc<CMutex<usize>>>, _> =3D Arc::pin_init(CMutex:=
:new(42));
+ //! ```
+ //!
+ //! To declare an init macro/function you just return an [`impl PinInit<T=
, E>`]:
+ //!
+ //! ```rust
+ //! # #![feature(allocator_api)]
+ //! # use pin_init::*;
+ //! # #[path =3D "../examples/error.rs"] mod error; use error::Error;
+ //! # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ //! #[pin_data]
+ //! struct DriverData {
+ //!     #[pin]
+ //!     status: CMutex<i32>,
+ //!     buffer: Box<[u8; 1_000_000]>,
+ //! }
+ //!
+ //! impl DriverData {
+ //!     fn new() -> impl PinInit<Self, Error> {
+ //!         try_pin_init!(Self {
+ //!             status <- CMutex::new(0),
+ //!             buffer: Box::init(pin_init::zeroed())?,
+ //!         }? Error)
+ //!     }
+ //! }
+ //! ```
+ //!
+ //! ## Manual creation of an initializer
+ //!
+ //! Often when working with primitives the previous approaches are not su=
fficient. That is where
+ //! [`pin_init_from_closure()`] comes in. This `unsafe` function allows y=
ou to create a
+ //! [`impl PinInit<T, E>`] directly from a closure. Of course you have to=
 ensure that the closure
+ //! actually does the initialization in the correct way. Here are the thi=
ngs to look out for
+ //! (we are calling the parameter to the closure `slot`):
+ //! - when the closure returns `Ok(())`, then it has completed the initia=
lization successfully, so
+ //!   `slot` now contains a valid bit pattern for the type `T`,
+ //! - when the closure returns `Err(e)`, then the caller may deallocate t=
he memory at `slot`, so
+ //!   you need to take care to clean up anything if your initialization f=
ails mid-way,
+ //! - you may assume that `slot` will stay pinned even after the closure =
returns until `drop` of
+ //!   `slot` gets called.
+ //!
+ //! ```rust
+ //! # #![feature(extern_types)]
+ //! use pin_init::{pin_data, pinned_drop, PinInit, PinnedDrop, pin_init_f=
rom_closure};
+ //! use core::{
+ //!     ptr::addr_of_mut,
+ //!     marker::PhantomPinned,
+ //!     cell::UnsafeCell,
+ //!     pin::Pin,
+ //!     mem::MaybeUninit,
+ //! };
+ //! mod bindings {
+ //!     #[repr(C)]
+ //!     pub struct foo {
+ //!         /* fields from C ... */
+ //!     }
+ //!     extern "C" {
+ //!         pub fn init_foo(ptr: *mut foo);
+ //!         pub fn destroy_foo(ptr: *mut foo);
+ //!         #[must_use =3D "you must check the error return code"]
+ //!         pub fn enable_foo(ptr: *mut foo, flags: u32) -> i32;
+ //!     }
+ //! }
+ //!
+ //! /// # Invariants
+ //! ///
+ //! /// `foo` is always initialized
+ //! #[pin_data(PinnedDrop)]
+ //! pub struct RawFoo {
+ //!     #[pin]
+ //!     _p: PhantomPinned,
+ //!     #[pin]
+ //!     foo: UnsafeCell<MaybeUninit<bindings::foo>>,
+ //! }
+ //!
+ //! impl RawFoo {
+ //!     pub fn new(flags: u32) -> impl PinInit<Self, i32> {
+ //!         // SAFETY:
+ //!         // - when the closure returns `Ok(())`, then it has successfu=
lly initialized and
+ //!         //   enabled `foo`,
+ //!         // - when it returns `Err(e)`, then it has cleaned up before
+ //!         unsafe {
+ //!             pin_init_from_closure(move |slot: *mut Self| {
+ //!                 // `slot` contains uninit memory, avoid creating a re=
ference.
+ //!                 let foo =3D addr_of_mut!((*slot).foo);
+ //!                 let foo =3D UnsafeCell::raw_get(foo).cast::<bindings:=
:foo>();
+ //!
+ //!                 // Initialize the `foo`
+ //!                 bindings::init_foo(foo);
+ //!
+ //!                 // Try to enable it.
+ //!                 let err =3D bindings::enable_foo(foo, flags);
+ //!                 if err !=3D 0 {
+ //!                     // Enabling has failed, first clean up the foo an=
d then return the error.
+ //!                     bindings::destroy_foo(foo);
+ //!                     Err(err)
+ //!                 } else {
+ //!                     // All fields of `RawFoo` have been initialized, =
since `_p` is a ZST.
+ //!                     Ok(())
+ //!                 }
+ //!             })
+ //!         }
+ //!     }
+ //! }
+ //!
+ //! #[pinned_drop]
+ //! impl PinnedDrop for RawFoo {
+ //!     fn drop(self: Pin<&mut Self>) {
+ //!         // SAFETY: Since `foo` is initialized, destroying is safe.
+ //!         unsafe { bindings::destroy_foo(self.foo.get().cast::<bindings=
::foo>()) };
+ //!     }
+ //! }
+ //! ```
+ //!
+ //! For more information on how to use [`pin_init_from_closure()`], take =
a look at the uses inside
+ //! the `kernel` crate. The [`sync`] module is a good starting point.
+ //!
+ //! [`sync`]: https://rust.docs.kernel.org/kernel/sync/index.html
+ //! [pinning]: https://doc.rust-lang.org/std/pin/index.html
+ //! [structurally pinned fields]:
+ //!     https://doc.rust-lang.org/std/pin/index.html#pinning-is-structura=
l-for-field
+ //! [stack]: crate::stack_pin_init
+ #![cfg_attr(
+     kernel,
+     doc =3D "[`Arc<T>`]: https://rust.docs.kernel.org/kernel/sync/struct.=
Arc.html"
+ )]
+ #![cfg_attr(
+     kernel,
+     doc =3D "[`Box<T>`]: https://rust.docs.kernel.org/kernel/alloc/kbox/s=
truct.Box.html"
+ )]
+ #![cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync::Arc")]
+ #![cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed::Box")]
+ //! [`impl PinInit<Foo>`]: crate::PinInit
+ //! [`impl PinInit<T, E>`]: crate::PinInit
+ //! [`impl Init<T, E>`]: crate::Init
+ //! [Rust-for-Linux]: https://rust-for-linux.com/
+=20
+ #![cfg_attr(not(RUSTC_LINT_REASONS_IS_STABLE), feature(lint_reasons))]
+ #![cfg_attr(
+     all(
+         any(feature =3D "alloc", feature =3D "std"),
+         not(RUSTC_NEW_UNINIT_IS_STABLE)
+     ),
+     feature(new_uninit)
+ )]
+ #![forbid(missing_docs, unsafe_op_in_unsafe_fn)]
+ #![cfg_attr(not(feature =3D "std"), no_std)]
+ #![cfg_attr(feature =3D "alloc", feature(allocator_api))]
+=20
+ use core::{
+     cell::UnsafeCell,
+     convert::Infallible,
+     marker::PhantomData,
+     mem::MaybeUninit,
+     num::*,
+     pin::Pin,
+     ptr::{self, NonNull},
+ };
+=20
+ #[doc(hidden)]
+ pub mod __internal;
+ #[doc(hidden)]
+ pub mod macros;
+=20
+ #[cfg(any(feature =3D "std", feature =3D "alloc"))]
+ mod alloc;
+ #[cfg(any(feature =3D "std", feature =3D "alloc"))]
+ pub use alloc::InPlaceInit;
+=20
+ /// Used to specify the pinning information of the fields of a struct.
+ ///
+ /// This is somewhat similar in purpose as
+ /// [pin-project-lite](https://crates.io/crates/pin-project-lite).
+ /// Place this macro on a struct definition and then `#[pin]` in front of=
 the attributes of each
+ /// field you want to structurally pin.
+ ///
+ /// This macro enables the use of the [`pin_init!`] macro. When pin-initi=
alizing a `struct`,
+ /// then `#[pin]` directs the type of initializer that is required.
+ ///
+ /// If your `struct` implements `Drop`, then you need to add `PinnedDrop`=
 as arguments to this
+ /// macro, and change your `Drop` implementation to `PinnedDrop` annotate=
d with
+ /// `#[`[`macro@pinned_drop`]`]`, since dropping pinned values requires e=
xtra care.
+ ///
+ /// # Examples
+ ///
+ /// ```
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// use pin_init::pin_data;
+ ///
+ /// enum Command {
+ ///     /* ... */
+ /// }
+ ///
+ /// #[pin_data]
+ /// struct DriverData {
+ ///     #[pin]
+ ///     queue: CMutex<Vec<Command>>,
+ ///     buf: Box<[u8; 1024 * 1024]>,
+ /// }
+ /// ```
+ ///
+ /// ```
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// # mod bindings { pub struct info; pub unsafe fn destroy_info(_: *mut =
info) {} }
+ /// use core::pin::Pin;
+ /// use pin_init::{pin_data, pinned_drop, PinnedDrop};
+ ///
+ /// enum Command {
+ ///     /* ... */
+ /// }
+ ///
+ /// #[pin_data(PinnedDrop)]
+ /// struct DriverData {
+ ///     #[pin]
+ ///     queue: CMutex<Vec<Command>>,
+ ///     buf: Box<[u8; 1024 * 1024]>,
+ ///     raw_info: *mut bindings::info,
+ /// }
+ ///
+ /// #[pinned_drop]
+ /// impl PinnedDrop for DriverData {
+ ///     fn drop(self: Pin<&mut Self>) {
+ ///         unsafe { bindings::destroy_info(self.raw_info) };
+ ///     }
+ /// }
+ /// ```
+ pub use ::pin_init_internal::pin_data;
+=20
+ /// Used to implement `PinnedDrop` safely.
+ ///
+ /// Only works on structs that are annotated via `#[`[`macro@pin_data`]`]=
`.
+ ///
+ /// # Examples
+ ///
+ /// ```
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// # mod bindings { pub struct info; pub unsafe fn destroy_info(_: *mut =
info) {} }
+ /// use core::pin::Pin;
+ /// use pin_init::{pin_data, pinned_drop, PinnedDrop};
+ ///
+ /// enum Command {
+ ///     /* ... */
+ /// }
+ ///
+ /// #[pin_data(PinnedDrop)]
+ /// struct DriverData {
+ ///     #[pin]
+ ///     queue: CMutex<Vec<Command>>,
+ ///     buf: Box<[u8; 1024 * 1024]>,
+ ///     raw_info: *mut bindings::info,
+ /// }
+ ///
+ /// #[pinned_drop]
+ /// impl PinnedDrop for DriverData {
+ ///     fn drop(self: Pin<&mut Self>) {
+ ///         unsafe { bindings::destroy_info(self.raw_info) };
+ ///     }
+ /// }
+ /// ```
+ pub use ::pin_init_internal::pinned_drop;
+=20
+ /// Derives the [`Zeroable`] trait for the given struct.
+ ///
+ /// This can only be used for structs where every field implements the [`=
Zeroable`] trait.
+ ///
+ /// # Examples
+ ///
+ /// ```
+ /// use pin_init::Zeroable;
+ ///
+ /// #[derive(Zeroable)]
+ /// pub struct DriverData {
+ ///     id: i64,
+ ///     buf_ptr: *mut u8,
+ ///     len: usize,
+ /// }
+ /// ```
+ pub use ::pin_init_internal::Zeroable;
+=20
+ /// Initialize and pin a type directly on the stack.
+ ///
+ /// # Examples
+ ///
+ /// ```rust
+ /// # #![expect(clippy::disallowed_names)]
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// # use pin_init::*;
+ /// # use core::pin::Pin;
+ /// #[pin_data]
+ /// struct Foo {
+ ///     #[pin]
+ ///     a: CMutex<usize>,
+ ///     b: Bar,
+ /// }
+ ///
+ /// #[pin_data]
+ /// struct Bar {
+ ///     x: u32,
+ /// }
+ ///
+ /// stack_pin_init!(let foo =3D pin_init!(Foo {
+ ///     a <- CMutex::new(42),
+ ///     b: Bar {
+ ///         x: 64,
+ ///     },
+ /// }));
+ /// let foo: Pin<&mut Foo> =3D foo;
+ /// println!("a: {}", &*foo.a.lock());
+ /// ```
+ ///
+ /// # Syntax
+ ///
+ /// A normal `let` binding with optional type annotation. The expression =
is expected to implement
+ /// [`PinInit`]/[`Init`] with the error type [`Infallible`]. If you want =
to use a different error
+ /// type, then use [`stack_try_pin_init!`].
+ #[macro_export]
+ macro_rules! stack_pin_init {
+     (let $var:ident $(: $t:ty)? =3D $val:expr) =3D> {
+         let val =3D $val;
+         let mut $var =3D ::core::pin::pin!($crate::__internal::StackInit$=
(::<$t>)?::uninit());
+         let mut $var =3D match $crate::__internal::StackInit::init($var, =
val) {
+             Ok(res) =3D> res,
+             Err(x) =3D> {
+                 let x: ::core::convert::Infallible =3D x;
+                 match x {}
+             }
+         };
+     };
+ }
+=20
+ /// Initialize and pin a type directly on the stack.
+ ///
+ /// # Examples
+ ///
+ /// ```rust
+ /// # #![expect(clippy::disallowed_names)]
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/error.rs"] mod error; use error::Error;
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// # use pin_init::*;
+ /// #[pin_data]
+ /// struct Foo {
+ ///     #[pin]
+ ///     a: CMutex<usize>,
+ ///     b: Box<Bar>,
+ /// }
+ ///
+ /// struct Bar {
+ ///     x: u32,
+ /// }
+ ///
+ /// stack_try_pin_init!(let foo: Foo =3D try_pin_init!(Foo {
+ ///     a <- CMutex::new(42),
+ ///     b: Box::try_new(Bar {
+ ///         x: 64,
+ ///     })?,
+ /// }? Error));
+ /// let foo =3D foo.unwrap();
+ /// println!("a: {}", &*foo.a.lock());
+ /// ```
+ ///
+ /// ```rust
+ /// # #![expect(clippy::disallowed_names)]
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/error.rs"] mod error; use error::Error;
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// # use pin_init::*;
+ /// #[pin_data]
+ /// struct Foo {
+ ///     #[pin]
+ ///     a: CMutex<usize>,
+ ///     b: Box<Bar>,
+ /// }
+ ///
+ /// struct Bar {
+ ///     x: u32,
+ /// }
+ ///
+ /// stack_try_pin_init!(let foo: Foo =3D? try_pin_init!(Foo {
+ ///     a <- CMutex::new(42),
+ ///     b: Box::try_new(Bar {
+ ///         x: 64,
+ ///     })?,
+ /// }? Error));
+ /// println!("a: {}", &*foo.a.lock());
+ /// # Ok::<_, Error>(())
+ /// ```
+ ///
+ /// # Syntax
+ ///
+ /// A normal `let` binding with optional type annotation. The expression =
is expected to implement
+ /// [`PinInit`]/[`Init`]. This macro assigns a result to the given variab=
le, adding a `?` after the
+ /// `=3D` will propagate this error.
+ #[macro_export]
+ macro_rules! stack_try_pin_init {
+     (let $var:ident $(: $t:ty)? =3D $val:expr) =3D> {
+         let val =3D $val;
+         let mut $var =3D ::core::pin::pin!($crate::__internal::StackInit$=
(::<$t>)?::uninit());
+         let mut $var =3D $crate::__internal::StackInit::init($var, val);
+     };
+     (let $var:ident $(: $t:ty)? =3D? $val:expr) =3D> {
+         let val =3D $val;
+         let mut $var =3D ::core::pin::pin!($crate::__internal::StackInit$=
(::<$t>)?::uninit());
+         let mut $var =3D $crate::__internal::StackInit::init($var, val)?;
+     };
+ }
+=20
+ /// Construct an in-place, pinned initializer for `struct`s.
+ ///
+ /// This macro defaults the error to [`Infallible`]. If you need a differ=
ent error, then use
+ /// [`try_pin_init!`].
+ ///
+ /// The syntax is almost identical to that of a normal `struct` initializ=
er:
+ ///
+ /// ```rust
+ /// # use pin_init::*;
+ /// # use core::pin::Pin;
+ /// #[pin_data]
+ /// struct Foo {
+ ///     a: usize,
+ ///     b: Bar,
+ /// }
+ ///
+ /// #[pin_data]
+ /// struct Bar {
+ ///     x: u32,
+ /// }
+ ///
+ /// # fn demo() -> impl PinInit<Foo> {
+ /// let a =3D 42;
+ ///
+ /// let initializer =3D pin_init!(Foo {
+ ///     a,
+ ///     b: Bar {
+ ///         x: 64,
+ ///     },
+ /// });
+ /// # initializer }
+ /// # Box::pin_init(demo()).unwrap();
+ /// ```
+ ///
+ /// Arbitrary Rust expressions can be used to set the value of a variable.
+ ///
+ /// The fields are initialized in the order that they appear in the initi=
alizer. So it is possible
+ /// to read already initialized fields using raw pointers.
+ ///
+ /// IMPORTANT: You are not allowed to create references to fields of the =
struct inside of the
+ /// initializer.
+ ///
+ /// # Init-functions
+ ///
+ /// When working with this library it is often desired to let others cons=
truct your types without
+ /// giving access to all fields. This is where you would normally write a=
 plain function `new` that
+ /// would return a new instance of your type. With this library that is a=
lso possible. However,
+ /// there are a few extra things to keep in mind.
+ ///
+ /// To create an initializer function, simply declare it like this:
+ ///
+ /// ```rust
+ /// # use pin_init::*;
+ /// # use core::pin::Pin;
+ /// # #[pin_data]
+ /// # struct Foo {
+ /// #     a: usize,
+ /// #     b: Bar,
+ /// # }
+ /// # #[pin_data]
+ /// # struct Bar {
+ /// #     x: u32,
+ /// # }
+ /// impl Foo {
+ ///     fn new() -> impl PinInit<Self> {
+ ///         pin_init!(Self {
+ ///             a: 42,
+ ///             b: Bar {
+ ///                 x: 64,
+ ///             },
+ ///         })
+ ///     }
+ /// }
+ /// ```
+ ///
+ /// Users of `Foo` can now create it like this:
+ ///
+ /// ```rust
+ /// # #![expect(clippy::disallowed_names)]
+ /// # use pin_init::*;
+ /// # use core::pin::Pin;
+ /// # #[pin_data]
+ /// # struct Foo {
+ /// #     a: usize,
+ /// #     b: Bar,
+ /// # }
+ /// # #[pin_data]
+ /// # struct Bar {
+ /// #     x: u32,
+ /// # }
+ /// # impl Foo {
+ /// #     fn new() -> impl PinInit<Self> {
+ /// #         pin_init!(Self {
+ /// #             a: 42,
+ /// #             b: Bar {
+ /// #                 x: 64,
+ /// #             },
+ /// #         })
+ /// #     }
+ /// # }
+ /// let foo =3D Box::pin_init(Foo::new());
+ /// ```
+ ///
+ /// They can also easily embed it into their own `struct`s:
+ ///
+ /// ```rust
+ /// # use pin_init::*;
+ /// # use core::pin::Pin;
+ /// # #[pin_data]
+ /// # struct Foo {
+ /// #     a: usize,
+ /// #     b: Bar,
+ /// # }
+ /// # #[pin_data]
+ /// # struct Bar {
+ /// #     x: u32,
+ /// # }
+ /// # impl Foo {
+ /// #     fn new() -> impl PinInit<Self> {
+ /// #         pin_init!(Self {
+ /// #             a: 42,
+ /// #             b: Bar {
+ /// #                 x: 64,
+ /// #             },
+ /// #         })
+ /// #     }
+ /// # }
+ /// #[pin_data]
+ /// struct FooContainer {
+ ///     #[pin]
+ ///     foo1: Foo,
+ ///     #[pin]
+ ///     foo2: Foo,
+ ///     other: u32,
+ /// }
+ ///
+ /// impl FooContainer {
+ ///     fn new(other: u32) -> impl PinInit<Self> {
+ ///         pin_init!(Self {
+ ///             foo1 <- Foo::new(),
+ ///             foo2 <- Foo::new(),
+ ///             other,
+ ///         })
+ ///     }
+ /// }
+ /// ```
+ ///
+ /// Here we see that when using `pin_init!` with `PinInit`, one needs to =
write `<-` instead of `:`.
+ /// This signifies that the given field is initialized in-place. As with =
`struct` initializers, just
+ /// writing the field (in this case `other`) without `:` or `<-` means `o=
ther: other,`.
+ ///
+ /// # Syntax
+ ///
+ /// As already mentioned in the examples above, inside of `pin_init!` a `=
struct` initializer with
+ /// the following modifications is expected:
+ /// - Fields that you want to initialize in-place have to use `<-` instea=
d of `:`.
+ /// - In front of the initializer you can write `&this in` to have access=
 to a [`NonNull<Self>`]
+ ///   pointer named `this` inside of the initializer.
+ /// - Using struct update syntax one can place `..Zeroable::zeroed()` at =
the very end of the
+ ///   struct, this initializes every field with 0 and then runs all initi=
alizers specified in the
+ ///   body. This can only be done if [`Zeroable`] is implemented for the =
struct.
+ ///
+ /// For instance:
+ ///
+ /// ```rust
+ /// # use pin_init::*;
+ /// # use core::{ptr::addr_of_mut, marker::PhantomPinned};
+ /// #[pin_data]
+ /// #[derive(Zeroable)]
+ /// struct Buf {
+ ///     // `ptr` points into `buf`.
+ ///     ptr: *mut u8,
+ ///     buf: [u8; 64],
+ ///     #[pin]
+ ///     pin: PhantomPinned,
+ /// }
+ ///
+ /// let init =3D pin_init!(&this in Buf {
+ ///     buf: [0; 64],
+ ///     // SAFETY: TODO.
+ ///     ptr: unsafe { addr_of_mut!((*this.as_ptr()).buf).cast() },
+ ///     pin: PhantomPinned,
+ /// });
+ /// let init =3D pin_init!(Buf {
+ ///     buf: [1; 64],
+ ///     ..Zeroable::zeroed()
+ /// });
+ /// ```
+ ///
+ /// [`NonNull<Self>`]: core::ptr::NonNull
+ // For a detailed example of how this macro works, see the module documen=
tation of the hidden
+ // module `macros` inside of `macros.rs`.
+ #[macro_export]
+ macro_rules! pin_init {
+     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
+         $($fields:tt)*
+     }) =3D> {
+         $crate::try_pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
+             $($fields)*
+         }? ::core::convert::Infallible)
+     };
+ }
+=20
+ /// Construct an in-place, fallible pinned initializer for `struct`s.
+ ///
+ /// If the initialization can complete without error (or [`Infallible`]),=
 then use [`pin_init!`].
+ ///
+ /// You can use the `?` operator or use `return Err(err)` inside the init=
ializer to stop
+ /// initialization and return the error.
+ ///
+ /// IMPORTANT: if you have `unsafe` code inside of the initializer you ha=
ve to ensure that when
+ /// initialization fails, the memory can be safely deallocated without an=
y further modifications.
+ ///
+ /// The syntax is identical to [`pin_init!`] with the following exception=
: you must append `? $type`
+ /// after the `struct` initializer to specify the error type you want to =
use.
+ ///
+ /// # Examples
+ ///
+ /// ```rust
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/error.rs"] mod error; use error::Error;
+ /// use pin_init::{pin_data, try_pin_init, PinInit, InPlaceInit, zeroed};
+ ///
+ /// #[pin_data]
+ /// struct BigBuf {
+ ///     big: Box<[u8; 1024 * 1024 * 1024]>,
+ ///     small: [u8; 1024 * 1024],
+ ///     ptr: *mut u8,
+ /// }
+ ///
+ /// impl BigBuf {
+ ///     fn new() -> impl PinInit<Self, Error> {
+ ///         try_pin_init!(Self {
+ ///             big: Box::init(zeroed())?,
+ ///             small: [0; 1024 * 1024],
+ ///             ptr: core::ptr::null_mut(),
+ ///         }? Error)
+ ///     }
+ /// }
+ /// # let _ =3D Box::pin_init(BigBuf::new());
+ /// ```
+ // For a detailed example of how this macro works, see the module documen=
tation of the hidden
+ // module `macros` inside of `macros.rs`.
+ #[macro_export]
+ macro_rules! try_pin_init {
+     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
+         $($fields:tt)*
+     }? $err:ty) =3D> {
+         $crate::__init_internal!(
+             @this($($this)?),
+             @typ($t $(::<$($generics),*>)? ),
+             @fields($($fields)*),
+             @error($err),
+             @data(PinData, use_data),
+             @has_data(HasPinData, __pin_data),
+             @construct_closure(pin_init_from_closure),
+             @munch_fields($($fields)*),
+         )
+     }
+ }
+=20
+ /// Construct an in-place initializer for `struct`s.
+ ///
+ /// This macro defaults the error to [`Infallible`]. If you need a differ=
ent error, then use
+ /// [`try_init!`].
+ ///
+ /// The syntax is identical to [`pin_init!`] and its safety caveats also =
apply:
+ /// - `unsafe` code must guarantee either full initialization or return a=
n error and allow
+ ///   deallocation of the memory.
+ /// - the fields are initialized in the order given in the initializer.
+ /// - no references to fields are allowed to be created inside of the ini=
tializer.
+ ///
+ /// This initializer is for initializing data in-place that might later b=
e moved. If you want to
+ /// pin-initialize, use [`pin_init!`].
+ ///
+ /// # Examples
+ ///
+ /// ```rust
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/error.rs"] mod error; use error::Error;
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// # use pin_init::InPlaceInit;
+ /// use pin_init::{init, Init, zeroed};
+ ///
+ /// struct BigBuf {
+ ///     small: [u8; 1024 * 1024],
+ /// }
+ ///
+ /// impl BigBuf {
+ ///     fn new() -> impl Init<Self> {
+ ///         init!(Self {
+ ///             small <- zeroed(),
+ ///         })
+ ///     }
+ /// }
+ /// # let _ =3D Box::init(BigBuf::new());
+ /// ```
+ // For a detailed example of how this macro works, see the module documen=
tation of the hidden
+ // module `macros` inside of `macros.rs`.
+ #[macro_export]
+ macro_rules! init {
+     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
+         $($fields:tt)*
+     }) =3D> {
+         $crate::try_init!($(&$this in)? $t $(::<$($generics),*>)? {
+             $($fields)*
+         }? ::core::convert::Infallible)
+     }
+ }
+=20
+ /// Construct an in-place fallible initializer for `struct`s.
+ ///
+ /// If the initialization can complete without error (or [`Infallible`]),=
 then use
+ /// [`init!`].
+ ///
+ /// The syntax is identical to [`try_pin_init!`]. You need to specify a c=
ustom error
+ /// via `? $type` after the `struct` initializer.
+ /// The safety caveats from [`try_pin_init!`] also apply:
+ /// - `unsafe` code must guarantee either full initialization or return a=
n error and allow
+ ///   deallocation of the memory.
+ /// - the fields are initialized in the order given in the initializer.
+ /// - no references to fields are allowed to be created inside of the ini=
tializer.
+ ///
+ /// # Examples
+ ///
+ /// ```rust
+ /// # #![feature(allocator_api)]
+ /// # use core::alloc::AllocError;
+ /// # use pin_init::InPlaceInit;
+ /// use pin_init::{try_init, Init, zeroed};
+ ///
+ /// struct BigBuf {
+ ///     big: Box<[u8; 1024 * 1024 * 1024]>,
+ ///     small: [u8; 1024 * 1024],
+ /// }
+ ///
+ /// impl BigBuf {
+ ///     fn new() -> impl Init<Self, AllocError> {
+ ///         try_init!(Self {
+ ///             big: Box::init(zeroed())?,
+ ///             small: [0; 1024 * 1024],
+ ///         }? AllocError)
+ ///     }
+ /// }
+ /// # let _ =3D Box::init(BigBuf::new());
+ /// ```
+ // For a detailed example of how this macro works, see the module documen=
tation of the hidden
+ // module `macros` inside of `macros.rs`.
+ #[macro_export]
+ macro_rules! try_init {
+     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
+         $($fields:tt)*
+     }? $err:ty) =3D> {
+         $crate::__init_internal!(
+             @this($($this)?),
+             @typ($t $(::<$($generics),*>)?),
+             @fields($($fields)*),
+             @error($err),
+             @data(InitData, /*no use_data*/),
+             @has_data(HasInitData, __init_data),
+             @construct_closure(init_from_closure),
+             @munch_fields($($fields)*),
+         )
+     }
+ }
+=20
+ /// Asserts that a field on a struct using `#[pin_data]` is marked with `=
#[pin]` ie. that it is
+ /// structurally pinned.
+ ///
+ /// # Example
+ ///
+ /// This will succeed:
+ /// ```
+ /// use pin_init::{pin_data, assert_pinned};
+ ///
+ /// #[pin_data]
+ /// struct MyStruct {
+ ///     #[pin]
+ ///     some_field: u64,
+ /// }
+ ///
+ /// assert_pinned!(MyStruct, some_field, u64);
+ /// ```
+ ///
+ /// This will fail:
+ /// ```compile_fail
+ /// use pin_init::{pin_data, assert_pinned};
+ ///
+ /// #[pin_data]
+ /// struct MyStruct {
+ ///     some_field: u64,
+ /// }
+ ///
+ /// assert_pinned!(MyStruct, some_field, u64);
+ /// ```
+ ///
+ /// Some uses of the macro may trigger the `can't use generic parameters =
from outer item` error. To
+ /// work around this, you may pass the `inline` parameter to the macro. T=
he `inline` parameter can
+ /// only be used when the macro is invoked from a function body.
+ /// ```
+ /// # use core::pin::Pin;
+ /// use pin_init::{pin_data, assert_pinned};
+ ///
+ /// #[pin_data]
+ /// struct Foo<T> {
+ ///     #[pin]
+ ///     elem: T,
+ /// }
+ ///
+ /// impl<T> Foo<T> {
+ ///     fn project(self: Pin<&mut Self>) -> Pin<&mut T> {
+ ///         assert_pinned!(Foo<T>, elem, T, inline);
+ ///
+ ///         // SAFETY: The field is structurally pinned.
+ ///         unsafe { self.map_unchecked_mut(|me| &mut me.elem) }
+ ///     }
+ /// }
+ /// ```
+ #[macro_export]
+ macro_rules! assert_pinned {
+     ($ty:ty, $field:ident, $field_ty:ty, inline) =3D> {
+         let _ =3D move |ptr: *mut $field_ty| {
+             // SAFETY: This code is unreachable.
+             let data =3D unsafe { <$ty as $crate::__internal::HasPinData>=
::__pin_data() };
+             let init =3D $crate::__internal::AlwaysFail::<$field_ty>::new=
();
+             // SAFETY: This code is unreachable.
+             unsafe { data.$field(ptr, init) }.ok();
+         };
+     };
+=20
+     ($ty:ty, $field:ident, $field_ty:ty) =3D> {
+         const _: () =3D {
+             $crate::assert_pinned!($ty, $field, $field_ty, inline);
+         };
+     };
+ }
+=20
+ /// A pin-initializer for the type `T`.
+ ///
+ /// To use this initializer, you will need a suitable memory location tha=
t can hold a `T`. This can
+ /// be [`Box<T>`], [`Arc<T>`] or even the stack (see [`stack_pin_init!`]).
+ ///
+ /// Also see the [module description](self).
+ ///
+ /// # Safety
+ ///
+ /// When implementing this trait you will need to take great care. Also t=
here are probably very few
+ /// cases where a manual implementation is necessary. Use [`pin_init_from=
_closure`] where possible.
+ ///
+ /// The [`PinInit::__pinned_init`] function:
+ /// - returns `Ok(())` if it initialized every field of `slot`,
+ /// - returns `Err(err)` if it encountered an error and then cleaned `slo=
t`, this means:
+ ///     - `slot` can be deallocated without UB occurring,
+ ///     - `slot` does not need to be dropped,
+ ///     - `slot` is not partially initialized.
+ /// - while constructing the `T` at `slot` it upholds the pinning invaria=
nts of `T`.
+ ///
+ #[cfg_attr(
+     kernel,
+     doc =3D "[`Arc<T>`]: https://rust.docs.kernel.org/kernel/sync/struct.=
Arc.html"
+ )]
+ #[cfg_attr(
+     kernel,
+     doc =3D "[`Box<T>`]: https://rust.docs.kernel.org/kernel/alloc/kbox/s=
truct.Box.html"
+ )]
+ #[cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync::Arc")]
+ #[cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed::Box")]
+ #[must_use =3D "An initializer must be used in order to create its value.=
"]
+ pub unsafe trait PinInit<T: ?Sized, E =3D Infallible>: Sized {
+     /// Initializes `slot`.
+     ///
+     /// # Safety
+     ///
+     /// - `slot` is a valid pointer to uninitialized memory.
+     /// - the caller does not touch `slot` when `Err` is returned, they a=
re only permitted to
+     ///   deallocate.
+     /// - `slot` will not move until it is dropped, i.e. it will be pinne=
d.
+     unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E>;
+=20
+     /// First initializes the value using `self` then calls the function =
`f` with the initialized
+     /// value.
+     ///
+     /// If `f` returns an error the value is dropped and the initializer =
will forward the error.
+     ///
+     /// # Examples
+     ///
+     /// ```rust
+     /// # #![feature(allocator_api)]
+     /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+     /// # use pin_init::*;
+     /// let mtx_init =3D CMutex::new(42);
+     /// // Make the initializer print the value.
+     /// let mtx_init =3D mtx_init.pin_chain(|mtx| {
+     ///     println!("{:?}", mtx.get_data_mut());
+     ///     Ok(())
+     /// });
+     /// ```
+     fn pin_chain<F>(self, f: F) -> ChainPinInit<Self, F, T, E>
+     where
+         F: FnOnce(Pin<&mut T>) -> Result<(), E>,
+     {
+         ChainPinInit(self, f, PhantomData)
+     }
+ }
+=20
+ /// An initializer returned by [`PinInit::pin_chain`].
+ pub struct ChainPinInit<I, F, T: ?Sized, E>(I, F, __internal::Invariant<(=
E, T)>);
+=20
+ // SAFETY: The `__pinned_init` function is implemented such that it
+ // - returns `Ok(())` on successful initialization,
+ // - returns `Err(err)` on error and in this case `slot` will be dropped.
+ // - considers `slot` pinned.
+ unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainPinInit<I, F, T, E>
+ where
+     I: PinInit<T, E>,
+     F: FnOnce(Pin<&mut T>) -> Result<(), E>,
+ {
+     unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
+         // SAFETY: All requirements fulfilled since this function is `__p=
inned_init`.
+         unsafe { self.0.__pinned_init(slot)? };
+         // SAFETY: The above call initialized `slot` and we still have un=
ique access.
+         let val =3D unsafe { &mut *slot };
+         // SAFETY: `slot` is considered pinned.
+         let val =3D unsafe { Pin::new_unchecked(val) };
+         // SAFETY: `slot` was initialized above.
+         (self.1)(val).inspect_err(|_| unsafe { core::ptr::drop_in_place(s=
lot) })
+     }
+ }
+=20
+ /// An initializer for `T`.
+ ///
+ /// To use this initializer, you will need a suitable memory location tha=
t can hold a `T`. This can
+ /// be [`Box<T>`], [`Arc<T>`] or even the stack (see [`stack_pin_init!`])=
. Because
+ /// [`PinInit<T, E>`] is a super trait, you can use every function that t=
akes it as well.
+ ///
+ /// Also see the [module description](self).
+ ///
+ /// # Safety
+ ///
+ /// When implementing this trait you will need to take great care. Also t=
here are probably very few
+ /// cases where a manual implementation is necessary. Use [`init_from_clo=
sure`] where possible.
+ ///
+ /// The [`Init::__init`] function:
+ /// - returns `Ok(())` if it initialized every field of `slot`,
+ /// - returns `Err(err)` if it encountered an error and then cleaned `slo=
t`, this means:
+ ///     - `slot` can be deallocated without UB occurring,
+ ///     - `slot` does not need to be dropped,
+ ///     - `slot` is not partially initialized.
+ /// - while constructing the `T` at `slot` it upholds the pinning invaria=
nts of `T`.
+ ///
+ /// The `__pinned_init` function from the supertrait [`PinInit`] needs to=
 execute the exact same
+ /// code as `__init`.
+ ///
+ /// Contrary to its supertype [`PinInit<T, E>`] the caller is allowed to
+ /// move the pointee after initialization.
+ ///
+ #[cfg_attr(
+     kernel,
+     doc =3D "[`Arc<T>`]: https://rust.docs.kernel.org/kernel/sync/struct.=
Arc.html"
+ )]
+ #[cfg_attr(
+     kernel,
+     doc =3D "[`Box<T>`]: https://rust.docs.kernel.org/kernel/alloc/kbox/s=
truct.Box.html"
+ )]
+ #[cfg_attr(not(kernel), doc =3D "[`Arc<T>`]: alloc::alloc::sync::Arc")]
+ #[cfg_attr(not(kernel), doc =3D "[`Box<T>`]: alloc::alloc::boxed::Box")]
+ #[must_use =3D "An initializer must be used in order to create its value.=
"]
+ pub unsafe trait Init<T: ?Sized, E =3D Infallible>: PinInit<T, E> {
+     /// Initializes `slot`.
+     ///
+     /// # Safety
+     ///
+     /// - `slot` is a valid pointer to uninitialized memory.
+     /// - the caller does not touch `slot` when `Err` is returned, they a=
re only permitted to
+     ///   deallocate.
+     unsafe fn __init(self, slot: *mut T) -> Result<(), E>;
+=20
+     /// First initializes the value using `self` then calls the function =
`f` with the initialized
+     /// value.
+     ///
+     /// If `f` returns an error the value is dropped and the initializer =
will forward the error.
+     ///
+     /// # Examples
+     ///
+     /// ```rust
+     /// # #![expect(clippy::disallowed_names)]
+     /// use pin_init::{init, zeroed, Init};
+     ///
+     /// struct Foo {
+     ///     buf: [u8; 1_000_000],
+     /// }
+     ///
+     /// impl Foo {
+     ///     fn setup(&mut self) {
+     ///         println!("Setting up foo");
+     ///     }
+     /// }
+     ///
+     /// let foo =3D init!(Foo {
+     ///     buf <- zeroed()
+     /// }).chain(|foo| {
+     ///     foo.setup();
+     ///     Ok(())
+     /// });
+     /// ```
+     fn chain<F>(self, f: F) -> ChainInit<Self, F, T, E>
+     where
+         F: FnOnce(&mut T) -> Result<(), E>,
+     {
+         ChainInit(self, f, PhantomData)
+     }
+ }
+=20
+ /// An initializer returned by [`Init::chain`].
+ pub struct ChainInit<I, F, T: ?Sized, E>(I, F, __internal::Invariant<(E, =
T)>);
+=20
+ // SAFETY: The `__init` function is implemented such that it
+ // - returns `Ok(())` on successful initialization,
+ // - returns `Err(err)` on error and in this case `slot` will be dropped.
+ unsafe impl<T: ?Sized, E, I, F> Init<T, E> for ChainInit<I, F, T, E>
+ where
+     I: Init<T, E>,
+     F: FnOnce(&mut T) -> Result<(), E>,
+ {
+     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
+         // SAFETY: All requirements fulfilled since this function is `__i=
nit`.
+         unsafe { self.0.__pinned_init(slot)? };
+         // SAFETY: The above call initialized `slot` and we still have un=
ique access.
+         (self.1)(unsafe { &mut *slot }).inspect_err(|_|
+             // SAFETY: `slot` was initialized above.
+             unsafe { core::ptr::drop_in_place(slot) })
+     }
+ }
+=20
+ // SAFETY: `__pinned_init` behaves exactly the same as `__init`.
+ unsafe impl<T: ?Sized, E, I, F> PinInit<T, E> for ChainInit<I, F, T, E>
+ where
+     I: Init<T, E>,
+     F: FnOnce(&mut T) -> Result<(), E>,
+ {
+     unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
+         // SAFETY: `__init` has less strict requirements compared to `__p=
inned_init`.
+         unsafe { self.__init(slot) }
+     }
+ }
+=20
+ /// Creates a new [`PinInit<T, E>`] from the given closure.
+ ///
+ /// # Safety
+ ///
+ /// The closure:
+ /// - returns `Ok(())` if it initialized every field of `slot`,
+ /// - returns `Err(err)` if it encountered an error and then cleaned `slo=
t`, this means:
+ ///     - `slot` can be deallocated without UB occurring,
+ ///     - `slot` does not need to be dropped,
+ ///     - `slot` is not partially initialized.
+ /// - may assume that the `slot` does not move if `T: !Unpin`,
+ /// - while constructing the `T` at `slot` it upholds the pinning invaria=
nts of `T`.
+ #[inline]
+ pub const unsafe fn pin_init_from_closure<T: ?Sized, E>(
+     f: impl FnOnce(*mut T) -> Result<(), E>,
+ ) -> impl PinInit<T, E> {
+     __internal::InitClosure(f, PhantomData)
+ }
+=20
+ /// Creates a new [`Init<T, E>`] from the given closure.
+ ///
+ /// # Safety
+ ///
+ /// The closure:
+ /// - returns `Ok(())` if it initialized every field of `slot`,
+ /// - returns `Err(err)` if it encountered an error and then cleaned `slo=
t`, this means:
+ ///     - `slot` can be deallocated without UB occurring,
+ ///     - `slot` does not need to be dropped,
+ ///     - `slot` is not partially initialized.
+ /// - the `slot` may move after initialization.
+ /// - while constructing the `T` at `slot` it upholds the pinning invaria=
nts of `T`.
+ #[inline]
+ pub const unsafe fn init_from_closure<T: ?Sized, E>(
+     f: impl FnOnce(*mut T) -> Result<(), E>,
+ ) -> impl Init<T, E> {
+     __internal::InitClosure(f, PhantomData)
+ }
+=20
+ /// An initializer that leaves the memory uninitialized.
+ ///
+ /// The initializer is a no-op. The `slot` memory is not changed.
+ #[inline]
+ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
+     // SAFETY: The memory is allowed to be uninitialized.
+     unsafe { init_from_closure(|_| Ok(())) }
+ }
+=20
+ /// Initializes an array by initializing each element via the provided in=
itializer.
+ ///
+ /// # Examples
+ ///
+ /// ```rust
+ /// # use pin_init::*;
+ /// use pin_init::init_array_from_fn;
+ /// let array: Box<[usize; 1_000]> =3D Box::init(init_array_from_fn(|i| i=
)).unwrap();
+ /// assert_eq!(array.len(), 1_000);
+ /// ```
+ pub fn init_array_from_fn<I, const N: usize, T, E>(
+     mut make_init: impl FnMut(usize) -> I,
+ ) -> impl Init<[T; N], E>
+ where
+     I: Init<T, E>,
+ {
+     let init =3D move |slot: *mut [T; N]| {
+         let slot =3D slot.cast::<T>();
+         for i in 0..N {
+             let init =3D make_init(i);
+             // SAFETY: Since 0 <=3D `i` < N, it is still in bounds of `[T=
; N]`.
+             let ptr =3D unsafe { slot.add(i) };
+             // SAFETY: The pointer is derived from `slot` and thus satisf=
ies the `__init`
+             // requirements.
+             if let Err(e) =3D unsafe { init.__init(ptr) } {
+                 // SAFETY: The loop has initialized the elements `slot[0.=
.i]` and since we return
+                 // `Err` below, `slot` will be considered uninitialized m=
emory.
+                 unsafe { ptr::drop_in_place(ptr::slice_from_raw_parts_mut=
(slot, i)) };
+                 return Err(e);
+             }
+         }
+         Ok(())
+     };
+     // SAFETY: The initializer above initializes every element of the arr=
ay. On failure it drops
+     // any initialized elements and returns `Err`.
+     unsafe { init_from_closure(init) }
+ }
+=20
+ /// Initializes an array by initializing each element via the provided in=
itializer.
+ ///
+ /// # Examples
+ ///
+ /// ```rust
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// # use pin_init::*;
+ /// # use core::pin::Pin;
+ /// use pin_init::pin_init_array_from_fn;
+ /// use std::sync::Arc;
+ /// let array: Pin<Arc<[CMutex<usize>; 1_000]>> =3D
+ ///     Arc::pin_init(pin_init_array_from_fn(|i| CMutex::new(i))).unwrap(=
);
+ /// assert_eq!(array.len(), 1_000);
+ /// ```
+ pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
+     mut make_init: impl FnMut(usize) -> I,
+ ) -> impl PinInit<[T; N], E>
+ where
+     I: PinInit<T, E>,
+ {
+     let init =3D move |slot: *mut [T; N]| {
+         let slot =3D slot.cast::<T>();
+         for i in 0..N {
+             let init =3D make_init(i);
+             // SAFETY: Since 0 <=3D `i` < N, it is still in bounds of `[T=
; N]`.
+             let ptr =3D unsafe { slot.add(i) };
+             // SAFETY: The pointer is derived from `slot` and thus satisf=
ies the `__init`
+             // requirements.
+             if let Err(e) =3D unsafe { init.__pinned_init(ptr) } {
+                 // SAFETY: The loop has initialized the elements `slot[0.=
.i]` and since we return
+                 // `Err` below, `slot` will be considered uninitialized m=
emory.
+                 unsafe { ptr::drop_in_place(ptr::slice_from_raw_parts_mut=
(slot, i)) };
+                 return Err(e);
+             }
+         }
+         Ok(())
+     };
+     // SAFETY: The initializer above initializes every element of the arr=
ay. On failure it drops
+     // any initialized elements and returns `Err`.
+     unsafe { pin_init_from_closure(init) }
+ }
+=20
+ // SAFETY: Every type can be initialized by-value.
+ unsafe impl<T, E> Init<T, E> for T {
+     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
+         // SAFETY: TODO.
+         unsafe { slot.write(self) };
+         Ok(())
+     }
+ }
+=20
+ // SAFETY: Every type can be initialized by-value. `__pinned_init` calls =
`__init`.
+ unsafe impl<T, E> PinInit<T, E> for T {
+     unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
+         // SAFETY: TODO.
+         unsafe { self.__init(slot) }
+     }
+ }
+=20
+ /// Smart pointer containing uninitialized memory and that can write a va=
lue.
+ pub trait InPlaceWrite<T> {
+     /// The type `Self` turns into when the contents are initialized.
+     type Initialized;
+=20
+     /// Use the given initializer to write a value into `self`.
+     ///
+     /// Does not drop the current value and considers it as uninitialized=
 memory.
+     fn write_init<E>(self, init: impl Init<T, E>) -> Result<Self::Initial=
ized, E>;
+=20
+     /// Use the given pin-initializer to write a value into `self`.
+     ///
+     /// Does not drop the current value and considers it as uninitialized=
 memory.
+     fn write_pin_init<E>(self, init: impl PinInit<T, E>) -> Result<Pin<Se=
lf::Initialized>, E>;
+ }
+=20
+ /// Trait facilitating pinned destruction.
+ ///
+ /// Use [`pinned_drop`] to implement this trait safely:
+ ///
+ /// ```rust
+ /// # #![feature(allocator_api)]
+ /// # #[path =3D "../examples/mutex.rs"] mod mutex; use mutex::*;
+ /// # use pin_init::*;
+ /// use core::pin::Pin;
+ /// #[pin_data(PinnedDrop)]
+ /// struct Foo {
+ ///     #[pin]
+ ///     mtx: CMutex<usize>,
+ /// }
+ ///
+ /// #[pinned_drop]
+ /// impl PinnedDrop for Foo {
+ ///     fn drop(self: Pin<&mut Self>) {
+ ///         println!("Foo is being dropped!");
+ ///     }
+ /// }
+ /// ```
+ ///
+ /// # Safety
+ ///
+ /// This trait must be implemented via the [`pinned_drop`] proc-macro att=
ribute on the impl.
+ pub unsafe trait PinnedDrop: __internal::HasPinData {
+     /// Executes the pinned destructor of this type.
+     ///
+     /// While this function is marked safe, it is actually unsafe to call=
 it manually. For this
+     /// reason it takes an additional parameter. This type can only be co=
nstructed by `unsafe` code
+     /// and thus prevents this function from being called where it should=
 not.
+     ///
+     /// This extra parameter will be generated by the `#[pinned_drop]` pr=
oc-macro attribute
+     /// automatically.
+     fn drop(self: Pin<&mut Self>, only_call_from_drop: __internal::OnlyCa=
llFromDrop);
+ }
+=20
+ /// Marker trait for types that can be initialized by writing just zeroes.
+ ///
+ /// # Safety
+ ///
+ /// The bit pattern consisting of only zeroes is a valid bit pattern for =
this type. In other words,
+ /// this is not UB:
+ ///
+ /// ```rust,ignore
+ /// let val: Self =3D unsafe { core::mem::zeroed() };
+ /// ```
+ pub unsafe trait Zeroable {}
+=20
+ /// Marker trait for types that allow `Option<Self>` to be set to all zer=
oes in order to write
+ /// `None` to that location.
+ ///
+ /// # Safety
+ ///
+ /// The implementer needs to ensure that `unsafe impl Zeroable for Option=
<Self> {}` is sound.
+ pub unsafe trait ZeroableOption {}
+=20
+ // SAFETY: by the safety requirement of `ZeroableOption`, this is valid.
+ unsafe impl<T: ZeroableOption> Zeroable for Option<T> {}
+=20
+ /// Create a new zeroed T.
+ ///
+ /// The returned initializer will write `0x00` to every byte of the given=
 `slot`.
+ #[inline]
+ pub fn zeroed<T: Zeroable>() -> impl Init<T> {
+     // SAFETY: Because `T: Zeroable`, all bytes zero is a valid bit patte=
rn for `T`
+     // and because we write all zeroes, the memory is initialized.
+     unsafe {
+         init_from_closure(|slot: *mut T| {
+             slot.write_bytes(0, 1);
+             Ok(())
+         })
+     }
+ }
+=20
+ macro_rules! impl_zeroable {
+     ($($({$($generics:tt)*})? $t:ty, )*) =3D> {
+         // SAFETY: Safety comments written in the macro invocation.
+         $(unsafe impl$($($generics)*)? Zeroable for $t {})*
+     };
+ }
+=20
+ impl_zeroable! {
+     // SAFETY: All primitives that are allowed to be zero.
+     bool,
+     char,
+     u8, u16, u32, u64, u128, usize,
+     i8, i16, i32, i64, i128, isize,
+     f32, f64,
+=20
+     // Note: do not add uninhabited types (such as `!` or `core::convert:=
:Infallible`) to this list;
+     // creating an instance of an uninhabited type is immediate undefined=
 behavior. For more on
+     // uninhabited/empty types, consult The Rustonomicon:
+     // <https://doc.rust-lang.org/stable/nomicon/exotic-sizes.html#empty-=
types>. The Rust Reference
+     // also has information on undefined behavior:
+     // <https://doc.rust-lang.org/stable/reference/behavior-considered-un=
defined.html>.
+     //
+     // SAFETY: These are inhabited ZSTs; there is nothing to zero and a v=
alid value exists.
+     {<T: ?Sized>} PhantomData<T>, core::marker::PhantomPinned, (),
+=20
+     // SAFETY: Type is allowed to take any value, including all zeros.
+     {<T>} MaybeUninit<T>,
+=20
+     // SAFETY: `T: Zeroable` and `UnsafeCell` is `repr(transparent)`.
+     {<T: ?Sized + Zeroable>} UnsafeCell<T>,
+=20
 -    // SAFETY: All zeros is equivalent to `None` (option layout optimizat=
ion guarantee).
++    // SAFETY: All zeros is equivalent to `None` (option layout optimizat=
ion guarantee:
++    // https://doc.rust-lang.org/stable/std/option/index.html#representat=
ion).
+     Option<NonZeroU8>, Option<NonZeroU16>, Option<NonZeroU32>, Option<Non=
ZeroU64>,
+     Option<NonZeroU128>, Option<NonZeroUsize>,
+     Option<NonZeroI8>, Option<NonZeroI16>, Option<NonZeroI32>, Option<Non=
ZeroI64>,
+     Option<NonZeroI128>, Option<NonZeroIsize>,
+=20
 -    // SAFETY: All zeros is equivalent to `None` (option layout optimizat=
ion guarantee).
 -    //
 -    // In this case we are allowed to use `T: ?Sized`, since all zeros is=
 the `None` variant.
 -    {<T: ?Sized>} Option<NonNull<T>>,
++    {<T>} Option<NonNull<T>>,
+=20
+     // SAFETY: `null` pointer is valid.
+     //
+     // We cannot use `T: ?Sized`, since the VTABLE pointer part of fat po=
inters is not allowed to be
+     // null.
+     //
+     // When `Pointee` gets stabilized, we could use
+     // `T: ?Sized where <T as Pointee>::Metadata: Zeroable`
+     {<T>} *mut T, {<T>} *const T,
+=20
+     // SAFETY: `null` pointer is valid and the metadata part of these fat=
 pointers is allowed to be
+     // zero.
+     {<T>} *mut [T], {<T>} *const [T], *mut str, *const str,
+=20
+     // SAFETY: `T` is `Zeroable`.
+     {<const N: usize, T: Zeroable>} [T; N], {<T: Zeroable>} Wrapping<T>,
+ }
+=20
+ macro_rules! impl_tuple_zeroable {
+     ($(,)?) =3D> {};
+     ($first:ident, $($t:ident),* $(,)?) =3D> {
+         // SAFETY: All elements are zeroable and padding can be zero.
+         unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($f=
irst, $($t),*) {}
+         impl_tuple_zeroable!($($t),* ,);
+     }
+ }
+=20
+ impl_tuple_zeroable!(A, B, C, D, E, F, G, H, I, J);
diff --cc scripts/generate_rust_analyzer.py
index adae71544cbd,54228e87e577..a0e5a0aef444
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@@ -97,28 -85,42 +97,43 @@@ def generate_crates(srctree, objtree, s
          ["core", "compiler_builtins"],
      )
 =20
 -    append_crate(
 -        "bindings",
 -        srctree / "rust"/ "bindings" / "lib.rs",
 -        ["core"],
 -        cfg=3Dcfg,
 -    )
 -    crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
 -
+     append_crate(
+         "pin_init_internal",
+         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
+         [],
+         cfg=3D["kernel"],
+         is_proc_macro=3DTrue,
+     )
+=20
+     append_crate(
+         "pin_init",
+         srctree / "rust" / "pin-init" / "src" / "lib.rs",
+         ["core", "pin_init_internal", "macros"],
+         cfg=3D["kernel"],
+     )
+=20
 -    append_crate(
 -        "kernel",
 -        srctree / "rust" / "kernel" / "lib.rs",
 -        ["core", "macros", "build_error", "bindings", "pin_init"],
 -        cfg=3Dcfg,
 -    )
 -    crates[-1]["source"] =3D {
 -        "include_dirs": [
 -            str(srctree / "rust" / "kernel"),
 -            str(objtree / "rust")
 -        ],
 -        "exclude_dirs": [],
 -    }
 +    def append_crate_with_generated(
 +        display_name,
 +        deps,
 +    ):
 +        append_crate(
 +            display_name,
 +            srctree / "rust"/ display_name / "lib.rs",
 +            deps,
 +            cfg=3Dcfg,
 +        )
 +        crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
 +        crates[-1]["source"] =3D {
 +            "include_dirs": [
 +                str(srctree / "rust" / display_name),
 +                str(objtree / "rust")
 +            ],
 +            "exclude_dirs": [],
 +        }
 +
 +    append_crate_with_generated("bindings", ["core"])
 +    append_crate_with_generated("uapi", ["core"])
-     append_crate_with_generated("kernel", ["core", "macros", "build_error=
", "bindings", "uapi"])
++    append_crate_with_generated("kernel", ["core", "macros", "build_error=
", "bindings", "pin_init", "uapi"])
 =20
      def is_root_crate(build_file, target):
          try:


Then when I merge the rust-hrtimer tree in top of that, the resolution
looks like this:

6270ed5f46761dad1d29b06ccb73d86d5c019f3a
diff --cc rust/kernel/time/hrtimer.rs
index 000000000000,2746e69016aa..d52ce884303d
mode 000000,100644..100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@@ -1,0 -1,517 +1,518 @@@
+ // SPDX-License-Identifier: GPL-2.0
+=20
+ //! Intrusive high resolution timers.
+ //!
+ //! Allows running timer callbacks without doing allocations at the time =
of
+ //! starting the timer. For now, only one timer per type is allowed.
+ //!
+ //! # Vocabulary
+ //!
+ //! States:
+ //!
+ //! - Stopped: initialized but not started, or cancelled, or not restarte=
d.
+ //! - Started: initialized and started or restarted.
+ //! - Running: executing the callback.
+ //!
+ //! Operations:
+ //!
+ //! * Start
+ //! * Cancel
+ //! * Restart
+ //!
+ //! Events:
+ //!
+ //! * Expire
+ //!
+ //! ## State Diagram
+ //!
+ //! ```text
+ //!                                                   Return NoRestart
+ //!                       +----------------------------------------------=
-----------------------+
+ //!                       |                                              =
                       |
+ //!                       |                                              =
                       |
+ //!                       |                                              =
                       |
+ //!                       |                                         Retur=
n Restart              |
+ //!                       |                                      +-------=
-----------------+     |
+ //!                       |                                      |       =
                 |     |
+ //!                       |                                      |       =
                 |     |
+ //!                       v                                      v       =
                 |     |
+ //!           +-----------------+      Start      +------------------+   =
        +--------+-----+--+
+ //!           |                 +---------------->|                  |   =
        |                 |
+ //! Init      |                 |                 |                  |  E=
xpire   |                 |
+ //! --------->|    Stopped      |                 |      Started     +---=
------->|     Running     |
+ //!           |                 |     Cancel      |                  |   =
        |                 |
+ //!           |                 |<----------------+                  |   =
        |                 |
+ //!           +-----------------+                 +---------------+--+   =
        +-----------------+
+ //!                                                     ^         |
+ //!                                                     |         |
+ //!                                                     +---------+
+ //!                                                      Restart
+ //! ```
+ //!
+ //!
+ //! A timer is initialized in the **stopped** state. A stopped timer can =
be
+ //! **started** by the `start` operation, with an **expiry** time. After =
the
+ //! `start` operation, the timer is in the **started** state. When the ti=
mer
+ //! **expires**, the timer enters the **running** state and the handler is
+ //! executed. After the handler has returned, the timer may enter the
+ //! **started* or **stopped** state, depending on the return value of the
+ //! handler. A timer in the **started** or **running** state may be **can=
celed**
+ //! by the `cancel` operation. A timer that is cancelled enters the **sto=
pped**
+ //! state.
+ //!
+ //! A `cancel` or `restart` operation on a timer in the **running** state=
 takes
+ //! effect after the handler has returned and the timer has transitioned
+ //! out of the **running** state.
+ //!
+ //! A `restart` operation on a timer in the **stopped** state is equivale=
nt to a
+ //! `start` operation.
+=20
+ use super::ClockId;
 -use crate::{init::PinInit, prelude::*, time::Ktime, types::Opaque};
++use crate::{prelude::*, time::Ktime, types::Opaque};
+ use core::marker::PhantomData;
++use pin_init::PinInit;
+=20
+ /// A timer backed by a C `struct hrtimer`.
+ ///
+ /// # Invariants
+ ///
+ /// * `self.timer` is initialized by `bindings::hrtimer_setup`.
+ #[pin_data]
+ #[repr(C)]
+ pub struct HrTimer<T> {
+     #[pin]
+     timer: Opaque<bindings::hrtimer>,
+     mode: HrTimerMode,
+     _t: PhantomData<T>,
+ }
+=20
+ // SAFETY: Ownership of an `HrTimer` can be moved to other threads and
+ // used/dropped from there.
+ unsafe impl<T> Send for HrTimer<T> {}
+=20
+ // SAFETY: Timer operations are locked on the C side, so it is safe to op=
erate
+ // on a timer from multiple threads.
+ unsafe impl<T> Sync for HrTimer<T> {}
+=20
+ impl<T> HrTimer<T> {
+     /// Return an initializer for a new timer instance.
+     pub fn new(mode: HrTimerMode, clock: ClockId) -> impl PinInit<Self>
+     where
+         T: HrTimerCallback,
+     {
+         pin_init!(Self {
+             // INVARIANT: We initialize `timer` with `hrtimer_setup` belo=
w.
+             timer <- Opaque::ffi_init(move |place: *mut bindings::hrtimer=
| {
+                 // SAFETY: By design of `pin_init!`, `place` is a pointer=
 to a
+                 // live allocation. hrtimer_setup will initialize `place`=
 and
+                 // does not require `place` to be initialized prior to th=
e call.
+                 unsafe {
+                     bindings::hrtimer_setup(
+                         place,
+                         Some(T::Pointer::run),
+                         clock.into_c(),
+                         mode.into_c(),
+                     );
+                 }
+             }),
+             mode: mode,
+             _t: PhantomData,
+         })
+     }
+=20
+     /// Get a pointer to the contained `bindings::hrtimer`.
+     ///
+     /// This function is useful to get access to the value without creati=
ng
+     /// intermediate references.
+     ///
+     /// # Safety
+     ///
+     /// `this` must point to a live allocation of at least the size of `S=
elf`.
+     unsafe fn raw_get(this: *const Self) -> *mut bindings::hrtimer {
+         // SAFETY: The field projection to `timer` does not go out of bou=
nds,
+         // because the caller of this function promises that `this` point=
s to an
+         // allocation of at least the size of `Self`.
+         unsafe { Opaque::raw_get(core::ptr::addr_of!((*this).timer)) }
+     }
+=20
+     /// Cancel an initialized and potentially running timer.
+     ///
+     /// If the timer handler is running, this function will block until t=
he
+     /// handler returns.
+     ///
+     /// Note that the timer might be started by a concurrent start operat=
ion. If
+     /// so, the timer might not be in the **stopped** state when this fun=
ction
+     /// returns.
+     ///
+     /// Users of the `HrTimer` API would not usually call this method dir=
ectly.
+     /// Instead they would use the safe [`HrTimerHandle::cancel`] on the =
handle
+     /// returned when the timer was started.
+     ///
+     /// This function is useful to get access to the value without creati=
ng
+     /// intermediate references.
+     ///
+     /// # Safety
+     ///
+     /// `this` must point to a valid `Self`.
+     pub(crate) unsafe fn raw_cancel(this: *const Self) -> bool {
+         // SAFETY: `this` points to an allocation of at least `HrTimer` s=
ize.
+         let c_timer_ptr =3D unsafe { HrTimer::raw_get(this) };
+=20
+         // If the handler is running, this will wait for the handler to r=
eturn
+         // before returning.
+         // SAFETY: `c_timer_ptr` is initialized and valid. Synchronizatio=
n is
+         // handled on the C side.
+         unsafe { bindings::hrtimer_cancel(c_timer_ptr) !=3D 0 }
+     }
+ }
+=20
+ /// Implemented by pointer types that point to structs that contain a [`H=
rTimer`].
+ ///
+ /// `Self` must be [`Sync`] because it is passed to timer callbacks in an=
other
+ /// thread of execution (hard or soft interrupt context).
+ ///
+ /// Starting a timer returns a [`HrTimerHandle`] that can be used to mani=
pulate
+ /// the timer. Note that it is OK to call the start function repeatedly, =
and
+ /// that more than one [`HrTimerHandle`] associated with a [`HrTimerPoint=
er`] may
+ /// exist. A timer can be manipulated through any of the handles, and a h=
andle
+ /// may represent a cancelled timer.
+ pub trait HrTimerPointer: Sync + Sized {
+     /// A handle representing a started or restarted timer.
+     ///
+     /// If the timer is running or if the timer callback is executing whe=
n the
+     /// handle is dropped, the drop method of [`HrTimerHandle`] should no=
t return
+     /// until the timer is stopped and the callback has completed.
+     ///
+     /// Note: When implementing this trait, consider that it is not unsaf=
e to
+     /// leak the handle.
+     type TimerHandle: HrTimerHandle;
+=20
+     /// Start the timer with expiry after `expires` time units. If the ti=
mer was
+     /// already running, it is restarted with the new expiry time.
+     fn start(self, expires: Ktime) -> Self::TimerHandle;
+ }
+=20
+ /// Unsafe version of [`HrTimerPointer`] for situations where leaking the
+ /// [`HrTimerHandle`] returned by `start` would be unsound. This is the c=
ase for
+ /// stack allocated timers.
+ ///
+ /// Typical implementers are pinned references such as [`Pin<&T>`].
+ ///
+ /// # Safety
+ ///
+ /// Implementers of this trait must ensure that instances of types implem=
enting
+ /// [`UnsafeHrTimerPointer`] outlives any associated [`HrTimerPointer::Ti=
merHandle`]
+ /// instances.
+ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
+     /// A handle representing a running timer.
+     ///
+     /// # Safety
+     ///
+     /// If the timer is running, or if the timer callback is executing wh=
en the
+     /// handle is dropped, the drop method of [`Self::TimerHandle`] must =
not return
+     /// until the timer is stopped and the callback has completed.
+     type TimerHandle: HrTimerHandle;
+=20
+     /// Start the timer after `expires` time units. If the timer was alre=
ady
+     /// running, it is restarted at the new expiry time.
+     ///
+     /// # Safety
+     ///
+     /// Caller promises keep the timer structure alive until the timer is=
 dead.
+     /// Caller can ensure this by not leaking the returned [`Self::TimerH=
andle`].
+     unsafe fn start(self, expires: Ktime) -> Self::TimerHandle;
+ }
+=20
+ /// A trait for stack allocated timers.
+ ///
+ /// # Safety
+ ///
+ /// Implementers must ensure that `start_scoped` does not return until the
+ /// timer is dead and the timer handler is not running.
+ pub unsafe trait ScopedHrTimerPointer {
+     /// Start the timer to run after `expires` time units and immediately
+     /// after call `f`. When `f` returns, the timer is cancelled.
+     fn start_scoped<T, F>(self, expires: Ktime, f: F) -> T
+     where
+         F: FnOnce() -> T;
+ }
+=20
+ // SAFETY: By the safety requirement of [`UnsafeHrTimerPointer`], droppin=
g the
+ // handle returned by [`UnsafeHrTimerPointer::start`] ensures that the ti=
mer is
+ // killed.
+ unsafe impl<T> ScopedHrTimerPointer for T
+ where
+     T: UnsafeHrTimerPointer,
+ {
+     fn start_scoped<U, F>(self, expires: Ktime, f: F) -> U
+     where
+         F: FnOnce() -> U,
+     {
+         // SAFETY: We drop the timer handle below before returning.
+         let handle =3D unsafe { UnsafeHrTimerPointer::start(self, expires=
) };
+         let t =3D f();
+         drop(handle);
+         t
+     }
+ }
+=20
+ /// Implemented by [`HrTimerPointer`] implementers to give the C timer ca=
llback a
+ /// function to call.
+ // This is split from `HrTimerPointer` to make it easier to specify trait=
 bounds.
+ pub trait RawHrTimerCallback {
+     /// Type of the parameter passed to [`HrTimerCallback::run`]. It may =
be
+     /// [`Self`], or a pointer type derived from [`Self`].
+     type CallbackTarget<'a>;
+=20
+     /// Callback to be called from C when timer fires.
+     ///
+     /// # Safety
+     ///
+     /// Only to be called by C code in the `hrtimer` subsystem. `this` mu=
st point
+     /// to the `bindings::hrtimer` structure that was used to start the t=
imer.
+     unsafe extern "C" fn run(this: *mut bindings::hrtimer) -> bindings::h=
rtimer_restart;
+ }
+=20
+ /// Implemented by structs that can be the target of a timer callback.
+ pub trait HrTimerCallback {
+     /// The type whose [`RawHrTimerCallback::run`] method will be invoked=
 when
+     /// the timer expires.
+     type Pointer<'a>: RawHrTimerCallback;
+=20
+     /// Called by the timer logic when the timer fires.
+     fn run(this: <Self::Pointer<'_> as RawHrTimerCallback>::CallbackTarge=
t<'_>) -> HrTimerRestart
+     where
+         Self: Sized;
+ }
+=20
+ /// A handle representing a potentially running timer.
+ ///
+ /// More than one handle representing the same timer might exist.
+ ///
+ /// # Safety
+ ///
+ /// When dropped, the timer represented by this handle must be cancelled,=
 if it
+ /// is running. If the timer handler is running when the handle is droppe=
d, the
+ /// drop method must wait for the handler to return before returning.
+ ///
+ /// Note: One way to satisfy the safety requirement is to call `Self::can=
cel` in
+ /// the drop implementation for `Self.`
+ pub unsafe trait HrTimerHandle {
+     /// Cancel the timer. If the timer is in the running state, block til=
l the
+     /// handler has returned.
+     ///
+     /// Note that the timer might be started by a concurrent start operat=
ion. If
+     /// so, the timer might not be in the **stopped** state when this fun=
ction
+     /// returns.
+     fn cancel(&mut self) -> bool;
+ }
+=20
+ /// Implemented by structs that contain timer nodes.
+ ///
+ /// Clients of the timer API would usually safely implement this trait by=
 using
+ /// the [`crate::impl_has_hr_timer`] macro.
+ ///
+ /// # Safety
+ ///
+ /// Implementers of this trait must ensure that the implementer has a
+ /// [`HrTimer`] field and that all trait methods are implemented accordin=
g to
+ /// their documentation. All the methods of this trait must operate on th=
e same
+ /// field.
+ pub unsafe trait HasHrTimer<T> {
+     /// Return a pointer to the [`HrTimer`] within `Self`.
+     ///
+     /// This function is useful to get access to the value without creati=
ng
+     /// intermediate references.
+     ///
+     /// # Safety
+     ///
+     /// `this` must be a valid pointer.
+     unsafe fn raw_get_timer(this: *const Self) -> *const HrTimer<T>;
+=20
+     /// Return a pointer to the struct that is containing the [`HrTimer`]=
 pointed
+     /// to by `ptr`.
+     ///
+     /// This function is useful to get access to the value without creati=
ng
+     /// intermediate references.
+     ///
+     /// # Safety
+     ///
+     /// `ptr` must point to a [`HrTimer<T>`] field in a struct of type `S=
elf`.
+     unsafe fn timer_container_of(ptr: *mut HrTimer<T>) -> *mut Self
+     where
+         Self: Sized;
+=20
+     /// Get pointer to the contained `bindings::hrtimer` struct.
+     ///
+     /// This function is useful to get access to the value without creati=
ng
+     /// intermediate references.
+     ///
+     /// # Safety
+     ///
+     /// `this` must be a valid pointer.
+     unsafe fn c_timer_ptr(this: *const Self) -> *const bindings::hrtimer {
+         // SAFETY: `this` is a valid pointer to a `Self`.
+         let timer_ptr =3D unsafe { Self::raw_get_timer(this) };
+=20
+         // SAFETY: timer_ptr points to an allocation of at least `HrTimer=
` size.
+         unsafe { HrTimer::raw_get(timer_ptr) }
+     }
+=20
+     /// Start the timer contained in the `Self` pointed to by `self_ptr`.=
 If
+     /// it is already running it is removed and inserted.
+     ///
+     /// # Safety
+     ///
+     /// - `this` must point to a valid `Self`.
+     /// - Caller must ensure that the pointee of `this` lives until the t=
imer
+     ///   fires or is canceled.
+     unsafe fn start(this: *const Self, expires: Ktime) {
+         // SAFETY: By function safety requirement, `this` is a valid `Sel=
f`.
+         unsafe {
+             bindings::hrtimer_start_range_ns(
+                 Self::c_timer_ptr(this).cast_mut(),
+                 expires.to_ns(),
+                 0,
+                 (*Self::raw_get_timer(this)).mode.into_c(),
+             );
+         }
+     }
+ }
+=20
+ /// Restart policy for timers.
+ #[derive(Copy, Clone, PartialEq, Eq, Debug)]
+ #[repr(u32)]
+ pub enum HrTimerRestart {
+     /// Timer should not be restarted.
+     NoRestart =3D bindings::hrtimer_restart_HRTIMER_NORESTART,
+     /// Timer should be restarted.
+     Restart =3D bindings::hrtimer_restart_HRTIMER_RESTART,
+ }
+=20
+ impl HrTimerRestart {
+     fn into_c(self) -> bindings::hrtimer_restart {
+         self as bindings::hrtimer_restart
+     }
+ }
+=20
+ /// Operational mode of [`HrTimer`].
+ // NOTE: Some of these have the same encoding on the C side, so we keep
+ // `repr(Rust)` and convert elsewhere.
+ #[derive(Clone, Copy, PartialEq, Eq, Debug)]
+ pub enum HrTimerMode {
+     /// Timer expires at the given expiration time.
+     Absolute,
+     /// Timer expires after the given expiration time interpreted as a du=
ration from now.
+     Relative,
+     /// Timer does not move between CPU cores.
+     Pinned,
+     /// Timer handler is executed in soft irq context.
+     Soft,
+     /// Timer handler is executed in hard irq context.
+     Hard,
+     /// Timer expires at the given expiration time.
+     /// Timer does not move between CPU cores.
+     AbsolutePinned,
+     /// Timer expires after the given expiration time interpreted as a du=
ration from now.
+     /// Timer does not move between CPU cores.
+     RelativePinned,
+     /// Timer expires at the given expiration time.
+     /// Timer handler is executed in soft irq context.
+     AbsoluteSoft,
+     /// Timer expires after the given expiration time interpreted as a du=
ration from now.
+     /// Timer handler is executed in soft irq context.
+     RelativeSoft,
+     /// Timer expires at the given expiration time.
+     /// Timer does not move between CPU cores.
+     /// Timer handler is executed in soft irq context.
+     AbsolutePinnedSoft,
+     /// Timer expires after the given expiration time interpreted as a du=
ration from now.
+     /// Timer does not move between CPU cores.
+     /// Timer handler is executed in soft irq context.
+     RelativePinnedSoft,
+     /// Timer expires at the given expiration time.
+     /// Timer handler is executed in hard irq context.
+     AbsoluteHard,
+     /// Timer expires after the given expiration time interpreted as a du=
ration from now.
+     /// Timer handler is executed in hard irq context.
+     RelativeHard,
+     /// Timer expires at the given expiration time.
+     /// Timer does not move between CPU cores.
+     /// Timer handler is executed in hard irq context.
+     AbsolutePinnedHard,
+     /// Timer expires after the given expiration time interpreted as a du=
ration from now.
+     /// Timer does not move between CPU cores.
+     /// Timer handler is executed in hard irq context.
+     RelativePinnedHard,
+ }
+=20
+ impl HrTimerMode {
+     fn into_c(self) -> bindings::hrtimer_mode {
+         use bindings::*;
+         match self {
+             HrTimerMode::Absolute =3D> hrtimer_mode_HRTIMER_MODE_ABS,
+             HrTimerMode::Relative =3D> hrtimer_mode_HRTIMER_MODE_REL,
+             HrTimerMode::Pinned =3D> hrtimer_mode_HRTIMER_MODE_PINNED,
+             HrTimerMode::Soft =3D> hrtimer_mode_HRTIMER_MODE_SOFT,
+             HrTimerMode::Hard =3D> hrtimer_mode_HRTIMER_MODE_HARD,
+             HrTimerMode::AbsolutePinned =3D> hrtimer_mode_HRTIMER_MODE_AB=
S_PINNED,
+             HrTimerMode::RelativePinned =3D> hrtimer_mode_HRTIMER_MODE_RE=
L_PINNED,
+             HrTimerMode::AbsoluteSoft =3D> hrtimer_mode_HRTIMER_MODE_ABS_=
SOFT,
+             HrTimerMode::RelativeSoft =3D> hrtimer_mode_HRTIMER_MODE_REL_=
SOFT,
+             HrTimerMode::AbsolutePinnedSoft =3D> hrtimer_mode_HRTIMER_MOD=
E_ABS_PINNED_SOFT,
+             HrTimerMode::RelativePinnedSoft =3D> hrtimer_mode_HRTIMER_MOD=
E_REL_PINNED_SOFT,
+             HrTimerMode::AbsoluteHard =3D> hrtimer_mode_HRTIMER_MODE_ABS_=
HARD,
+             HrTimerMode::RelativeHard =3D> hrtimer_mode_HRTIMER_MODE_REL_=
HARD,
+             HrTimerMode::AbsolutePinnedHard =3D> hrtimer_mode_HRTIMER_MOD=
E_ABS_PINNED_HARD,
+             HrTimerMode::RelativePinnedHard =3D> hrtimer_mode_HRTIMER_MOD=
E_REL_PINNED_HARD,
+         }
+     }
+ }
+=20
+ /// Use to implement the [`HasHrTimer<T>`] trait.
+ ///
+ /// See [`module`] documentation for an example.
+ ///
+ /// [`module`]: crate::time::hrtimer
+ #[macro_export]
+ macro_rules! impl_has_hr_timer {
+     (
+         impl$({$($generics:tt)*})?
+             HasHrTimer<$timer_type:ty>
+             for $self:ty
+         { self.$field:ident }
+         $($rest:tt)*
+     ) =3D> {
+         // SAFETY: This implementation of `raw_get_timer` only compiles i=
f the
+         // field has the right type.
+         unsafe impl$(<$($generics)*>)? $crate::time::hrtimer::HasHrTimer<=
$timer_type> for $self {
+=20
+             #[inline]
+             unsafe fn raw_get_timer(
+                 this: *const Self,
+             ) -> *const $crate::time::hrtimer::HrTimer<$timer_type> {
+                 // SAFETY: The caller promises that the pointer is not da=
ngling.
+                 unsafe { ::core::ptr::addr_of!((*this).$field) }
+             }
+=20
+             #[inline]
+             unsafe fn timer_container_of(
+                 ptr: *mut $crate::time::hrtimer::HrTimer<$timer_type>,
+             ) -> *mut Self {
+                 // SAFETY: As per the safety requirement of this function=
, `ptr`
+                 // is pointing inside a `$timer_type`.
+                 unsafe { ::kernel::container_of!(ptr, $timer_type, $field=
).cast_mut() }
+             }
+         }
+     }
+ }
+=20
+ mod arc;
+ pub use arc::ArcHrTimerHandle;
+ mod pin;
+ pub use pin::PinHrTimerHandle;
+ mod pin_mut;
+ pub use pin_mut::PinMutHrTimerHandle;
+ // `box` is a reserved keyword, so prefix with `t` for timer
+ mod tbox;
+ pub use tbox::BoxHrTimerHandle;

--=20
Cheers,
Stephen Rothwell

--Sig_/X9k2JsrApTtNVhiYXtW7+Vu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZWuIACgkQAVBC80lX
0GxYoQf/dGQxOV6lS74nUstqoDG+FahoHHuUqXEZq1PmG8DEnfcSGnla4ERxWENT
KHAFoRGOJlIZQYXgVWhGwcfcRa+6SYtx8KS6p7ktQNv44ueK8R4zcW6Lyu6Bu3in
CMU8IivvOsmV3f9PipP+jEHBD1vx8RLjYrZ8tBcSagRarQyBy4SiNKDM1W7Iier3
sBsmBEzkAWzSnORzJ1FSMOLrWpW5fCRW9lLenQWQYMJ8006TTZKKpN07Svk0mETt
PD9BosfKi95wmlHaKkYkafmjYymjAFTaHQLc2LOqSAFby17WTBwvWYp+g4beexY3
umOqlGr/E0dasTPbQbnCM1yuW60nbA==
=TJkE
-----END PGP SIGNATURE-----

--Sig_/X9k2JsrApTtNVhiYXtW7+Vu--

