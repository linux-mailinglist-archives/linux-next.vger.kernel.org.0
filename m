Return-Path: <linux-next+bounces-7920-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0090CB23DA0
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 03:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC52D3B4428
	for <lists+linux-next@lfdr.de>; Wed, 13 Aug 2025 01:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2811778F2B;
	Wed, 13 Aug 2025 01:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lFnuuemf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92194C92;
	Wed, 13 Aug 2025 01:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755047526; cv=none; b=JkTH8AM7hZySScDjgNumU8XaCSrmxjRrLgn3pskOhy4+IE8NL5KyP1FwhLkd8vCNqYBWxCv86PPJVFV+QMi1SQCRD5jrur5qBRnUrt8QmiC34ciNVKnvd7YTWcU3/YUbrxXicIbiUONqW9NEgfnvqOuRVE6NECBudUP1XVE+Rqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755047526; c=relaxed/simple;
	bh=S0gigUqmgRJCUqMvDbhteuiG2iFm4HenjGfH8xwwguw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=shdOz+9pybVgFg2BnbQ5+k2jH9opkCvy9E9G9pSkQds00H28qlhEPupUUSV0oBdoxRef4beScG3h8wU9fW7WrIpOjVshhKltEXILHCzz+zeGBiEnLvpielJlBPmMe4hgIIrsCRCev5t659ff62HPtlAjcxmSL/maeivo0uONHm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lFnuuemf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755047514;
	bh=gAWKRyEL+/Tiia1fu4YyHdUUo9jpnANXpvBktpAOSPs=;
	h=Date:From:To:Cc:Subject:From;
	b=lFnuuemfleU9qAq1ZIo+LK9UL26SCpovfLckVgBFG6SctXdL7fQNLQn5NIztNxob5
	 5WVeBsKKd4C72PKI6oPa8D5g/KOe4jA3/vO+RFADI1Hu45N4haKGQFQmuxDoRKs5CT
	 d/EhSv73B6DQgVv482rfoxOpYzzgaSh9085oKMbe8XSAIelrIrQWWghrthkdtkk/CW
	 AVKUy47EqT8Ozjp2zruGoDfTf6gZnvXngxFZvXacmXKPHvNtwngKziryQ7SONosLKI
	 yYnQ5FGu9ziBqrVdKnSKxpexx4/u36GcQ77zMUQiVAhx/XCbffrjD6P3ToptAo8GYL
	 +ByflAu6C49sw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1r1h65Qvz4x43;
	Wed, 13 Aug 2025 11:11:52 +1000 (AEST)
Date: Wed, 13 Aug 2025 11:11:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: Danilo Krummrich <dakr@kernel.org>, Vitaly Wool
 <vitaly.wool@konsulko.se>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-unstable tree with the
 drm-misc-fixes tree
Message-ID: <20250813111151.6a261ca1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/THJw_ljfmIy6_QDMWDq2NBc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/THJw_ljfmIy6_QDMWDq2NBc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-unstable tree got a conflict in:

  rust/kernel/alloc/allocator.rs

between commit:

  fde578c86281 ("rust: alloc: replace aligned_size() with Kmalloc::aligned_=
layout()")

from the drm-misc-fixes tree and commit:

  cda097b07bce ("rust: support large alignments in allocations")

from the mm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/alloc/allocator.rs
index 2692cf90c948,63f271624428..000000000000
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@@ -43,11 -42,28 +42,17 @@@ pub struct Vmalloc
  /// For more details see [self].
  pub struct KVmalloc;
 =20
 -/// Returns a proper size to alloc a new object aligned to `new_layout`'s=
 alignment.
 -fn aligned_size(new_layout: Layout) -> usize {
 -    // Customized layouts from `Layout::from_size_align()` can have size =
< align, so pad first.
 -    let layout =3D new_layout.pad_to_align();
 -
 -    // Note that `layout.size()` (after padding) is guaranteed to be a mu=
ltiple of `layout.align()`
 -    // which together with the slab guarantees means the `krealloc` will =
return a properly aligned
 -    // object (see comments in `kmalloc()` for more information).
 -    layout.size()
 -}
 -
  /// # Invariants
  ///
- /// One of the following: `krealloc`, `vrealloc`, `kvrealloc`.
+ /// One of the following: `krealloc_node_align`, `vrealloc_node_align`, `=
kvrealloc_node_align`.
  struct ReallocFunc(
-     unsafe extern "C" fn(*const crate::ffi::c_void, usize, u32) -> *mut c=
rate::ffi::c_void,
+     unsafe extern "C" fn(
+         *const crate::ffi::c_void,
+         usize,
+         crate::ffi::c_ulong,
+         u32,
+         crate::ffi::c_int,
+     ) -> *mut crate::ffi::c_void,
  );
 =20
  impl ReallocFunc {
@@@ -76,8 -92,9 +81,9 @@@
          layout: Layout,
          old_layout: Layout,
          flags: Flags,
+         nid: NumaNode,
      ) -> Result<NonNull<[u8]>, AllocError> {
 -        let size =3D aligned_size(layout);
 +        let size =3D layout.size();
          let ptr =3D match ptr {
              Some(ptr) =3D> {
                  if old_layout.size() =3D=3D 0 {
@@@ -134,11 -140,10 +140,12 @@@ unsafe impl Allocator for Kmalloc=20
          layout: Layout,
          old_layout: Layout,
          flags: Flags,
+         nid: NumaNode,
      ) -> Result<NonNull<[u8]>, AllocError> {
 +        let layout =3D Kmalloc::aligned_layout(layout);
 +
          // SAFETY: `ReallocFunc::call` has the same safety requirements a=
s `Allocator::realloc`.
-         unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flag=
s) }
+         unsafe { ReallocFunc::KREALLOC.call(ptr, layout, old_layout, flag=
s, nid) }
      }
  }
 =20
@@@ -177,19 -177,10 +179,14 @@@ unsafe impl Allocator for KVmalloc=20
          layout: Layout,
          old_layout: Layout,
          flags: Flags,
+         nid: NumaNode,
      ) -> Result<NonNull<[u8]>, AllocError> {
 +        // `KVmalloc` may use the `Kmalloc` backend, hence we have to enf=
orce a `Kmalloc`
 +        // compatible layout.
 +        let layout =3D Kmalloc::aligned_layout(layout);
 +
-         // TODO: Support alignments larger than PAGE_SIZE.
-         if layout.align() > bindings::PAGE_SIZE {
-             pr_warn!("KVmalloc does not support alignments larger than PA=
GE_SIZE yet.\n");
-             return Err(AllocError);
-         }
-=20
          // SAFETY: If not `None`, `ptr` is guaranteed to point to valid m=
emory, which was previously
          // allocated with this `Allocator`.
-         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, fla=
gs) }
+         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, fla=
gs, nid) }
      }
  }

--Sig_/THJw_ljfmIy6_QDMWDq2NBc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmib5lcACgkQAVBC80lX
0Gx5mgf9EZwkGr0JW0BfDMvjOnKHi8qtoXToiSdr0Xlg9SePZp8c6Y7Nr62jhlVz
LCQyYVUaVNrAbnRKRe1AVwAzmsRZfebSYBjMKdRBM4X+f0F0vHaNsxa6CESieLcA
JqZDDUkmz5VNvF3t2mG8A4VojPpEhfWX9cDApxGIarnjw7BjjQv8qw7VXawnXjK4
2vRO0JiR0DujJo+UuK3RXn+S33yBFR4utsb5BdzDrBB6W/8x7xA9mJR/oCO3V+25
7ypqpfFOXRGmuP7EFn2+7KAIHX86Vpf0TXkPVgMqKhD6l6t2WPNYTj/UkPkZtL1g
nsgJ9hOa14OstNPhGygEgnchEFJj1w==
=LP5i
-----END PGP SIGNATURE-----

--Sig_/THJw_ljfmIy6_QDMWDq2NBc--

