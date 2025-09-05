Return-Path: <linux-next+bounces-8202-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB2B44BF6
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 04:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDBB4A038F9
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 02:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F3623BF96;
	Fri,  5 Sep 2025 02:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ak3s5Rv0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE303230BEC;
	Fri,  5 Sep 2025 02:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757041018; cv=none; b=nDbnwuVPtnMSTclOx4ZoYDOWnEamg5hJEUKnE6JV28ZZqTTaSa06AfS6OA6x4Fa1SvlTcuK9ne7CHSAZ9iOe1BjwGqpVUY3ueH089gdEWrDU8+KNQGOkmIyCmO3bytgXlCy6L1CryWQ9pwBf97n0DqynUD1yZnF89eLIydDGBPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757041018; c=relaxed/simple;
	bh=59C8ioKoXyvkYBltlVln0DQNNJB6Qs+nvuvLu6vvarg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oP0N5OxgxB3i5NB6RLlTRp9k+Kh2qQ7ei6llrod5FCNSMcVV78Dh59MzzUiSjKCmdMq9oEpbniP6rtKrWtl/faFVV8sZ04PkpenFhYFsYnt4a4ZkQSOXpOUUjD2YlB5aujTGivMA+zBqXdpYqxITXjffAdgQ3SG/IXbKMbC0FZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ak3s5Rv0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757041014;
	bh=ZG3QBvYIhuWmp00+bEl/UPV09HMJA2/iWeCyXeNUCOo=;
	h=Date:From:To:Cc:Subject:From;
	b=ak3s5Rv0C7bvZbolyazP6T1tVeZ8MN6iihQdYtcOjZixTmd7JPKCpWtkGUSGrZfsM
	 Gp1TJnKTWvTZChwxGDmPhPRZG3OIybHC/XOAgqyG71MelNFpkugyNVpZMKbHna2zt1
	 3f0gl8zxzH/RSIPTj6PDhrenERBSWo7OuR+bXokn7JRgAGZbKY72vUdPt6bsceM4Ap
	 nCZrjt5aLBaWvrfgVZ0N7vQ2eCIPCH/Z5+cgc6A02YXAoyKpvOR/PZgdL9pXlwRF6n
	 dDM8djZwAat/lFoFUFXhWCkTi5VvE0gszvsGMNxZ5QBI5s+SPSnw0Gn34MWYD3FpEo
	 A5YbEHqAsIlPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cJ1GG400zz4w91;
	Fri,  5 Sep 2025 12:56:54 +1000 (AEST)
Date: Fri, 5 Sep 2025 12:56:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Subject: linux-next: manual merge of the drm-rust tree with Linus' tree
Message-ID: <20250905125653.0ebc7580@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HlC4+STjxV7X2vUs9gGm79I";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HlC4+STjxV7X2vUs9gGm79I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got a conflict in:

  rust/kernel/alloc/allocator_test.rs

between commit:

  0f580d5d3d9d ("rust: alloc: fix `rusttest` by providing `Cmalloc::aligned=
_layout` too")

from Linus' tree and commit:

  7937dca77039 ("rust: alloc: implement VmallocPageIter")

from the drm-rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/alloc/allocator_test.rs
index 2e61cdbd2303,f46b4b671389..000000000000
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@@ -9,11 -9,13 +9,13 @@@
 =20
  #![allow(missing_docs)]
 =20
 -use super::{flags::*, AllocError, Allocator, Flags};
 +use super::{flags::*, AllocError, Allocator, Flags, NumaNode};
  use core::alloc::Layout;
  use core::cmp;
+ use core::marker::PhantomData;
  use core::ptr;
  use core::ptr::NonNull;
+ use kernel::page;
 =20
  /// The userspace allocator based on libc.
  pub struct Cmalloc;
@@@ -22,17 -24,33 +24,44 @@@ pub type Kmalloc =3D Cmalloc
  pub type Vmalloc =3D Kmalloc;
  pub type KVmalloc =3D Kmalloc;
 =20
 +impl Cmalloc {
 +    /// Returns a [`Layout`] that makes [`Kmalloc`] fulfill the requested=
 size and alignment of
 +    /// `layout`.
 +    pub fn aligned_layout(layout: Layout) -> Layout {
 +        // Note that `layout.size()` (after padding) is guaranteed to be =
a multiple of
 +        // `layout.align()` which together with the slab guarantees means=
 that `Kmalloc` will return
 +        // a properly aligned object (see comments in `kmalloc()` for mor=
e information).
 +        layout.pad_to_align()
 +    }
 +}
 +
+ pub struct VmallocPageIter<'a> {
+     _p: PhantomData<page::BorrowedPage<'a>>,
+ }
+=20
+ impl<'a> Iterator for VmallocPageIter<'a> {
+     type Item =3D page::BorrowedPage<'a>;
+=20
+     fn next(&mut self) -> Option<Self::Item> {
+         None
+     }
+ }
+=20
+ impl<'a> VmallocPageIter<'a> {
+     #[allow(clippy::missing_safety_doc)]
+     pub unsafe fn new(_buf: NonNull<u8>, _size: usize) -> Self {
+         Self { _p: PhantomData }
+     }
+=20
+     pub fn size(&self) -> usize {
+         0
+     }
+=20
+     pub fn page_count(&self) -> usize {
+         0
+     }
+ }
+=20
  extern "C" {
      #[link_name =3D "aligned_alloc"]
      fn libc_aligned_alloc(align: usize, size: usize) -> *mut crate::ffi::=
c_void;

--Sig_/HlC4+STjxV7X2vUs9gGm79I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi6UXUACgkQAVBC80lX
0GykEwf+LFKaX5vo4hXFPM52RBInS8EpFtXvJwnyBg0yQij7bHtvOxGu3fSype2D
J/itzTEa6kbGo9obbLhq6WYZGrDVeowajmx2Cyp+CaSD6WvQH3QEcEjYp6BKbiZQ
EWc0Mz3D9H3+9AALX33/bJb0PqapHI1V/a4mNiF8LLxE3azRc//nOjdT/WRfDBk9
QC6668n8do9tzR5odygA19IpNzVf20rZgOoXKFmfKlnBvXRT7GPMDPUe74xad9Wt
ptfEZMD+g9Q5WwkNY/NwbYf+8UWS1c3WdodvQyq0AgZro7pUFwsBMGE+4oFMR2gG
ISuvwfmCpQsO/o5YWQ1N/E9rfRw9bg==
=CKQJ
-----END PGP SIGNATURE-----

--Sig_/HlC4+STjxV7X2vUs9gGm79I--

