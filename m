Return-Path: <linux-next+bounces-4135-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB13993E80
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 07:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7951C1F237C7
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 05:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C7613B2B8;
	Tue,  8 Oct 2024 05:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rQVX3tlh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0F42905;
	Tue,  8 Oct 2024 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728367003; cv=none; b=IkO9glxVG+Y7NCKHEWA/2Ty1r2K6dlVPwFIDhly2a+EkdrB8pHnMfzG2L7Fj+7Bz1AwD6aQWbyHB+95+pQRW4bmcsjSOq6JsGVcbyTlLXSt4DVq7AxDfrYkLKf/sHP/BbbVdA+F3z7X6pb7+VjHgFO1F3xAyRn3kpvFSjC8Zjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728367003; c=relaxed/simple;
	bh=UmHzq8+lelGAlPH9pd82mtqLGKgeP7kR6xHYM/WlLYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I6cP450NI/VObwCn7Ba4WWZKcBN93d5MqpSN9p+efc6uxGAWsnh1z9fBHG7SakDBrVhCI8723U6v1og+DLkrwpPlaTNGcrc1/CJWc8Sd/qqdklT0lhXwavkLM1rU0bduNnii6XFBxxntjw/DXw7HRpLhgXCym/6jWRBrEGrx0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rQVX3tlh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728366996;
	bh=FEgyFMxR6IYvbg3waLB423wN8QvwNFIdtHgZJ8dpKNU=;
	h=Date:From:To:Cc:Subject:From;
	b=rQVX3tlhEX+xZahQcq8BpkFYT0pOtO4O7I0A0qidQn6WMDiwoQlN7LHkofMqICUSH
	 KGDRgAh6Olahfp042SHCI7EFKHUvVnRiV/fsOOgiiVpsEw6Sl6RYy5358eWprAnYHl
	 8QG9zsojeooPsw6+os+F+1pm9ye9tGy0G8krRsOxpcSps3cn7Ie5KILNWpvNEagV55
	 69Q7/bHJaP8LITAJthjy8mXJTt+aFUWstys17/7F5wgAt7k67f51zH8wL+lghvZU4s
	 fkIDIv31urGRDldUFkzHJj0lU83MIeZlavmwbw/mKDPjFpDQZMv7qNrLkQOMfevei7
	 gaOFPPa9FWD7g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XN4yr4Mz0z4wcr;
	Tue,  8 Oct 2024 16:56:36 +1100 (AEDT)
Date: Tue, 8 Oct 2024 16:56:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Aliet Exposito Garcia
 <aliet.exposito@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the vfs-brauner tree
Message-ID: <20241008165636.0e8d0d4e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=TaquIC/0_.amr5+WKZXvow";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=TaquIC/0_.amr5+WKZXvow
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/types.rs

between commit:

  e7572e5deaf3 ("rust: types: add `NotThreadSafe`")

from the vfs-brauner tree and commits:

  567cdff53e71 ("rust: types: avoid repetition in `{As,From}Bytes` impls")
  67b3fa4288fa ("rust: kernel: move `FromBytes` and `AsBytes` traits to a n=
ew `transmute` module")

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
index 3238ffaab031,5ea9126c8c93..000000000000
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@@ -468,88 -329,3 +329,24 @@@ pub enum Either<L, R>=20
      /// Constructs an instance of [`Either`] containing a value of type `=
R`.
      Right(R),
  }
 +
- /// Types for which any bit pattern is valid.
- ///
- /// Not all types are valid for all values. For example, a `bool` must be=
 either zero or one, so
- /// reading arbitrary bytes into something that contains a `bool` is not =
okay.
- ///
- /// It's okay for the type to have padding, as initializing those bytes h=
as no effect.
- ///
- /// # Safety
- ///
- /// All bit-patterns must be valid for this type. This type must not have=
 interior mutability.
- pub unsafe trait FromBytes {}
-=20
- // SAFETY: All bit patterns are acceptable values of the types below.
- unsafe impl FromBytes for u8 {}
- unsafe impl FromBytes for u16 {}
- unsafe impl FromBytes for u32 {}
- unsafe impl FromBytes for u64 {}
- unsafe impl FromBytes for usize {}
- unsafe impl FromBytes for i8 {}
- unsafe impl FromBytes for i16 {}
- unsafe impl FromBytes for i32 {}
- unsafe impl FromBytes for i64 {}
- unsafe impl FromBytes for isize {}
- // SAFETY: If all bit patterns are acceptable for individual values in an=
 array, then all bit
- // patterns are also acceptable for arrays of that type.
- unsafe impl<T: FromBytes> FromBytes for [T] {}
- unsafe impl<T: FromBytes, const N: usize> FromBytes for [T; N] {}
-=20
- /// Types that can be viewed as an immutable slice of initialized bytes.
- ///
- /// If a struct implements this trait, then it is okay to copy it byte-fo=
r-byte to userspace. This
- /// means that it should not have any padding, as padding bytes are unini=
tialized. Reading
- /// uninitialized memory is not just undefined behavior, it may even lead=
 to leaking sensitive
- /// information on the stack to userspace.
- ///
- /// The struct should also not hold kernel pointers, as kernel pointer ad=
dresses are also considered
- /// sensitive. However, leaking kernel pointers is not considered undefin=
ed behavior by Rust, so
- /// this is a correctness requirement, but not a safety requirement.
- ///
- /// # Safety
- ///
- /// Values of this type may not contain any uninitialized bytes. This typ=
e must not have interior
- /// mutability.
- pub unsafe trait AsBytes {}
-=20
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
-=20
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

--Sig_/=TaquIC/0_.amr5+WKZXvow
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcEyZQACgkQAVBC80lX
0GxL5Af+L6xVjhjy8fHB7yMsg0Uuow+y3RkTVImzHZmGCBuxtsE3IKDf5u6JrNnv
Ob6+v7ujU+N0wmvQHT3DfLwf0Btdj1YuHLMaLSV7GQOCyXR+DifJr/yvxCJQq44b
pghjHui6JwpDsOlsrmuAmCYCceBKLu0c9zWteEkb8YM5KKYwi03Rkqcwhw93hs6Q
hpvTUbmxMGO23ASVnnr9HkiLGbNCmNGTYU8FUuuWMEy9CcBvDOlNoUDj/0Uv0uiE
jZnYqIlS/wABgUQx1JFpbkN+FJJu3wZ54HKVfohfUYWo8+yFku6+Z70nr2Roy4J5
EwtxAtXNX+Eik+vjJABojYOn8i22+A==
=jVHr
-----END PGP SIGNATURE-----

--Sig_/=TaquIC/0_.amr5+WKZXvow--

