Return-Path: <linux-next+bounces-8536-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B3ABB3D86
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 14:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB3FD7AD503
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 12:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBE33101C9;
	Thu,  2 Oct 2025 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9Y2n59o"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609053101C8;
	Thu,  2 Oct 2025 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759406751; cv=none; b=KVDWycPQ9zNMQ4yTF/W4g4KRPXN49Zerd0fRby3C5vJPavPDJz3TzNEBHMi4Kcpkn/Gr3NANJfHLMlR+VXpNZIiJq1CQlfrcTkssaxL+N8AQ2JaPG8JyhxIB3WaltGfj2U6NiUt0Enkrbtlj0sGgl9hytow+naDmk3JTlgi7eVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759406751; c=relaxed/simple;
	bh=82GXG5deRe+qBSsXfxgmCHbJTIL+lairHB0bUXENPB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGhw9QofO17Xq1TigzlXsyud8fRn3uPK6BYZex4Uf1CDL5PD44RiH+yecMoZQcN71o/HLlyf5+iz2qmOtMvEewJzdVZA71WLJPc9M/oRuz+DIpRxGvpluL4m8ZSINGyUAWkjTSUZljSAi3xxc9DMAB2jgAqp0MlkibabGAVZwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9Y2n59o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455DFC4CEF4;
	Thu,  2 Oct 2025 12:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759406751;
	bh=82GXG5deRe+qBSsXfxgmCHbJTIL+lairHB0bUXENPB4=;
	h=Date:From:To:Cc:Subject:From;
	b=V9Y2n59omsaROd4uoo1LbBkjSTMRYMlBD2PdpG74zXUyGKiXCUK3N+KLrxUo18gy7
	 gUaxII/mOuCrsCZ9haXc4WZGA7xfeseLjlQcSJuVKaXuDt8GWdXL2L3KwsCSaoE49v
	 rbKCjWC06GpE3ar06dVnD6Qt4INcs95LlPDuzGYzE8RT+LQ+OvoWSJv+1USBNU+csG
	 TDdXE8s1iyVfKt/lC/Yh/OKXXlxxjx2gue77buABuirw5+qyJMwKVzsrd5I4BcRuTN
	 eWdOSvA+eODU5fsFOZuvshXEr7sb9DLHr6MtN7rMRcULxIsyr8h6qART50m+5C/1uR
	 JiUnB+ShkcW0Q==
Date: Thu, 2 Oct 2025 13:05:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aN5qmhC9tUOCNjed@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rExuMeJDLXkDakzC"
Content-Disposition: inline


--rExuMeJDLXkDakzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  rust/kernel/alloc/allocator.rs

between commit:

  1b1a946dc2b53 ("rust: alloc: specify the minimum alignment of each alloca=
tor")

=66rom the origin tree and commits:

  1738796994a43 ("rust: support large alignments in allocations")
  8e92c9902ff11 ("rust: alloc: vmalloc: implement Vmalloc::to_page()")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/kernel/alloc/allocator.rs
index 6426ba54cf98d,84ee7e9d7b0eb..0000000000000
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@@ -13,11 -13,14 +13,15 @@@ use core::alloc::Layout
  use core::ptr;
  use core::ptr::NonNull;
 =20
 -use crate::alloc::{AllocError, Allocator};
 +use crate::alloc::{AllocError, Allocator, NumaNode};
  use crate::bindings;
+ use crate::page;
 -use crate::pr_warn;
 +
 +const ARCH_KMALLOC_MINALIGN: usize =3D bindings::ARCH_KMALLOC_MINALIGN;
 =20
+ mod iter;
+ pub use self::iter::VmallocPageIter;
+=20
  /// The contiguous kernel allocator.
  ///
  /// `Kmalloc` is typically used for physically contiguous allocations up =
to page size, but also

--rExuMeJDLXkDakzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeapkACgkQJNaLcl1U
h9DfQwgAhvJY6cUn5+Hq+wjc2X0nQf5QVqqYwPIHFaOJbAXMTGT7XVFDMLThhFVQ
0rXUfChouzlNJRpPHXDGJaMxDSMnUilWPypK58KQUTpbgLtxAWk681FjmRzb+ZIJ
PD+XgzOiZYzuJHqkunTrKt5AUdAYLJ9SVOZfm1lpBiE79BqZ077VYAeC1qZs+/yK
2F42OPvhw29Z686BQEGKE1ButjQsIqVk8rN4fyk5SfEVJQMdPZlf924+T9w40rOX
99sBYJYpPcpArrOYcoXg7McoGmm4tFmm04QBFBPDsGKTGXyFPy7mPtg2XEhfr7sx
PqgFtgbIk7oPIroo0oXWXQ1JvTvojg==
=XH26
-----END PGP SIGNATURE-----

--rExuMeJDLXkDakzC--

