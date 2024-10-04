Return-Path: <linux-next+bounces-4099-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5F298FCC0
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 06:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B16CD1F22842
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 04:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E573D55D;
	Fri,  4 Oct 2024 04:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nMv0YZwp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9164E33FD;
	Fri,  4 Oct 2024 04:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728016929; cv=none; b=tXCyia0WjO9wvmIXCt1yAAqqxK/bbyVLb5r0F/vEEsWAHdP400mlsfLVhND3/HD/Rz0EbUjthMR82Ga/vb4rmjGxv9diK0HhWTSMhU7jRaRzuotxX7KJMSdxK4CBIUaC+c8yJJWC/mPFM060Ut51XsNNYdTn02fUE7lkFFCqbzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728016929; c=relaxed/simple;
	bh=ZCU4rzWW8nYo6znPQJ3a5zENZq5BAyna+xiVRTgloC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WpTeD+oUMSz4qjtzgHIMmqJO6D3LUDn2YlpCjTPbNCWpk4wCgyvye9rTfMgl9KT8Xx/Wx5yh1IxgFqa69rf2l2b6+8bka5MGPBVrZ9DqtRPYmefcec1Rn8evhKM2UunwEKL0z2D6hQb6Jch0RE9H6JWHESn8XaQQG4bwt+NmU94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nMv0YZwp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728016923;
	bh=WP3QY5cWHPQzIelK2LCRXAQqVf2dA1gMNgETdawsXBc=;
	h=Date:From:To:Cc:Subject:From;
	b=nMv0YZwpzkPFGGxFeO43i61+5Nv32xNs19cK/h4eWHyVnczlOaCQyZ5qvObPSD4Qz
	 qQP6dm8j2ovqK923KSHPO6ZTifRxVQo+AvuY9GL2NaNVDwO6J4vcN/4McvAaDivuMf
	 +SpjM/Y+6k2GUBsADbQSaNvfXnb6IuNmjYsugiS5S2Kp5vKyhHxWMtMHntT6cPlBs+
	 V3WQMHtigVY+EADvsUAuAZGARhJbXSY3ae6u+Cnjg2FlN5Vyl+YxhBoijX7/oIlRHp
	 4suzN89k9ibn7kkJrcm8ujXkNzi2ZGr7klSUA+q6jCPWO12bR+yxBoJAIkb59y9A+y
	 dd2DZSAq1p9Og==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKbVg05jrz4x8h;
	Fri,  4 Oct 2024 14:42:02 +1000 (AEST)
Date: Fri, 4 Oct 2024 14:42:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the vfs-brauner tree
Message-ID: <20241004144202.24a9f0ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EeTqXcoSBaggvR0ct99RPBD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EeTqXcoSBaggvR0ct99RPBD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/types.rs

between commit:

  e7572e5deaf3 ("rust: types: add `NotThreadSafe`")

from the vfs-brauner tree and commits:

  c4277ae2a630 ("rust: types: avoid repetition in `{As,From}Bytes` impls")
  432526d4ff32 ("rust: enable `clippy::undocumented_unsafe_blocks` lint")

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
index 3238ffaab031,28d9e5ea3df4..000000000000
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@@ -514,42 -527,23 +527,44 @@@ impl_frombytes!=20
  /// mutability.
  pub unsafe trait AsBytes {}
 =20
- // SAFETY: Instances of the following types have no uninitialized portion=
s.
- unsafe impl AsBytes for u8 {}
- unsafe impl AsBytes for u16 {}
- unsafe impl AsBytes for u32 {}
- unsafe impl AsBytes for u64 {}
- unsafe impl AsBytes for usize {}
- unsafe impl AsBytes for i8 {}
- unsafe impl AsBytes for i16 {}
- unsafe impl AsBytes for i32 {}
- unsafe impl AsBytes for i64 {}
- unsafe impl AsBytes for isize {}
- unsafe impl AsBytes for bool {}
- unsafe impl AsBytes for char {}
- unsafe impl AsBytes for str {}
- // SAFETY: If individual values in an array have no uninitialized portion=
s, then the array itself
- // does not have any uninitialized portions either.
- unsafe impl<T: AsBytes> AsBytes for [T] {}
- unsafe impl<T: AsBytes, const N: usize> AsBytes for [T; N] {}
+ macro_rules! impl_asbytes {
+     ($($({$($generics:tt)*})? $t:ty, )*) =3D> {
+         // SAFETY: Safety comments written in the macro invocation.
+         $(unsafe impl$($($generics)*)? AsBytes for $t {})*
+     };
+ }
+=20
+ impl_asbytes! {
+     // SAFETY: Instances of the following types have no uninitialized por=
tions.
+     u8, u16, u32, u64, usize,
+     i8, i16, i32, i64, isize,
+     bool,
+     char,
+     str,
+=20
+     // SAFETY: If individual values in an array have no uninitialized por=
tions, then the array
+     // itself does not have any uninitialized portions either.
+     {<T: AsBytes>} [T],
+     {<T: AsBytes, const N: usize>} [T; N],
+ }
 +
 +/// Zero-sized type to mark types not [`Send`].
 +///
 +/// Add this type as a field to your struct if your type should not be se=
nt to a different task.
 +/// Since [`Send`] is an auto trait, adding a single field that is `!Send=
` will ensure that the
 +/// whole type is `!Send`.
 +///
 +/// If a type is `!Send` it is impossible to give control over an instanc=
e of the type to another
 +/// task. This is useful to include in types that store or reference task=
-local information. A file
 +/// descriptor is an example of such task-local information.
 +///
 +/// This type also makes the type `!Sync`, which prevents immutable acces=
s to the value from
 +/// several threads in parallel.
 +pub type NotThreadSafe =3D PhantomData<*mut ()>;
 +
 +/// Used to construct instances of type [`NotThreadSafe`] similar to how =
`PhantomData` is
 +/// constructed.
 +///
 +/// [`NotThreadSafe`]: type@NotThreadSafe
 +#[allow(non_upper_case_globals)]
 +pub const NotThreadSafe: NotThreadSafe =3D PhantomData;

--Sig_/EeTqXcoSBaggvR0ct99RPBD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb/choACgkQAVBC80lX
0GzctAf/Q/buPiqF7EVmv4bl8M23zY46ShWKq5fQGxN+10682npm4R544RAuFc2N
4w3nBjWh7h9gb0E5X2n/SDQZuyP3TM/QdYAPBbUv78X5Hr0dU6tdXjvj5Lm0+9uW
yPB2kLfkzPOyJAXcGgpgMP6P1pqFwxtKLshNkDQpYgOwH/1XVaHRobvP8qPnBpXA
JGMR0EAG0kYh4UOd2OOUI+zjHvtFPCKfayrVaugRirIo328xMQdUaOFKRD73Gofk
QyzIyYdldd9GloRSb4UocPmBJUXUtmWh3wVkPKtlPea4ISys6RPyX308GBS7MlOa
tMMeC6KdYNM87ThBGig7Om+qUyRGUg==
=Smv2
-----END PGP SIGNATURE-----

--Sig_/EeTqXcoSBaggvR0ct99RPBD--

