Return-Path: <linux-next+bounces-8200-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47978B44BB8
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 04:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0955D585192
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 02:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BCE1A254E;
	Fri,  5 Sep 2025 02:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SUJnLkyD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AF3DF71;
	Fri,  5 Sep 2025 02:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040406; cv=none; b=WVH7nmkSVwpH3m3Kiyqd67G9q4rZK+UZta3xIVSLBED/sgXMF6pQXFD4adHkW1siZgYH5ORML64NTL8o6Hj+rVmF07o8v81dDbFYn6sweXdnyoAtT7e7CgDMEfDx4FtSNjAHWf7oe+b9nHVbsdhp9ov/xN6vUEyZw4H1eNz0eaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040406; c=relaxed/simple;
	bh=2XLHxKiuXhW1CpOB+irALYx4Wbur16P08WjRQOWDls0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nmBNOkXxtcUdfYOvkRbvWwtu/Ksbre9OC6iytlwnL7Lwiq3wpHD+YbdgRFFB2VZuIiI3KklTZOl2cW/byLoUBj9l2HqN2Eyt+cH5eeREf2RdXWYDJV1zIsLO2U62dYyhLJHqpAADgVYilq4/2YGW+qG7iT4GhPaZWidCWtGW85Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SUJnLkyD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757040396;
	bh=0OwQBUle5snYIWACyVhsW42bYN6nLUiN5PF0KXaOC1M=;
	h=Date:From:To:Cc:Subject:From;
	b=SUJnLkyDGAlgmYe7Qz1EDxiHbdXIMyiOQ34rAYeHbpcrPeDzxtVq277RM3v0YaQXV
	 m17uyD52cfI3wnZxKbkD435inxs6PH7NnsiZvM7H+cJU31R5njX5uix5cRu3tWyAPc
	 pfjhNpWug0nOalf/TwKQJMXCslABUBsvItV9VgIbBJbXrAHvWxiqj/Jyf9vdreKkqF
	 L+ljiTMP7FDYb6gLcG4ym9kOrVjbHcAN42uSFmI9slvgaAY/BefSKzpZ86U+WhMvWt
	 2ZI3ZMnpM1nRDGP9DWyHhNV6Gtk2c8AQXE4s24F/lt06IvoJE1d0TuCV/12V7j3Ckh
	 +SgCIkUWS0HDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cJ12M3FFPz4w2J;
	Fri,  5 Sep 2025 12:46:35 +1000 (AEST)
Date: Fri, 5 Sep 2025 12:46:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Vitaly Wool
 <vitaly.wool@konsulko.se>
Subject: linux-next: manual merge of the drm-rust tree with the mm-unstable
 tree
Message-ID: <20250905124634.68da9a1e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eymLTy3fiZy=ugK9BFtdPy/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eymLTy3fiZy=ugK9BFtdPy/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got a conflict in:

  rust/kernel/alloc/kbox.rs

between commit:

  5efe8a1dcf3b ("rust: add support for NUMA ids in allocations")

from the mm-unstable tree and commit:

  671618432f46 ("rust: alloc: kbox: implement AsPageIter for VBox")

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

diff --cc rust/kernel/alloc/kbox.rs
index 1fef9beb57c8,b69ff4a1d748..000000000000
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@@ -3,8 -3,8 +3,8 @@@
  //! Implementation of [`Box`].
 =20
  #[allow(unused_imports)] // Used in doc comments.
- use super::allocator::{KVmalloc, Kmalloc, Vmalloc};
+ use super::allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter};
 -use super::{AllocError, Allocator, Flags};
 +use super::{AllocError, Allocator, Flags, NumaNode};
  use core::alloc::Layout;
  use core::borrow::{Borrow, BorrowMut};
  use core::fmt;

--Sig_/eymLTy3fiZy=ugK9BFtdPy/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi6TwoACgkQAVBC80lX
0Gy2EQf/co7q9O7IGGGQ1KQdDK+A366VEobzeL94dACQ1DWhbjsBJ+QWxRsH4B08
Lkh4+3SgioQ7AcMV9iCroLVSnub/LEaHBzRzbdDLUsNy1WRodDwsrGFCNT3IVZGc
eFI9pTB5JLW4ebx3FIEC4VpraqDdcTx+MDIs/EXq6eIRw1EftkCrC6nVX4Rzmvba
elmiwXywRuppbHtllA51z0GVhJFE2e0MGGUXkn8YVkFXNb0eEtUoh4wWjjL2eLV1
xNkxnw6EXxQlV8ymJM3fIa+LsQG+ZiHeIt2yQO6Xi/PEr6uWkiJuaOaRLSwwGziK
hPLCNE0XdZQPD4aZy/8ePKR//ogr7Q==
=UGea
-----END PGP SIGNATURE-----

--Sig_/eymLTy3fiZy=ugK9BFtdPy/--

