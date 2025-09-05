Return-Path: <linux-next+bounces-8201-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C47CB44BE4
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 04:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E65B9189E99D
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 02:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301831F5842;
	Fri,  5 Sep 2025 02:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PV0NUH/a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076E220696;
	Fri,  5 Sep 2025 02:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040705; cv=none; b=Eefi6UjY/9LglDYI3O+9JU/mU2gpi7BJiBYkVMSP6peJUOCWDxoARYn2DAzeorqoWHev2aCtTXYaNk0Y/vwZ6/CxFwBEzEb7vUUvgKgPjodgnrbqBggbCKUEdxQ9u4bQjC4zLGegipKlQt5QnqExAN+3njBvav7eqny2rWCVBhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040705; c=relaxed/simple;
	bh=uJ/gNDtdokUhqcSjyck5MOmZYPs4s93S3ATJMdJVdFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GP6N8VgKAeSNViQ1N2BpODFp1Z62IWiPlZAGFDfh65Dt/WaDmRjxf0/GHhoqYFxP9VjdT7G4qMcQNUkz3qqi6ExnLJzqvg65rIqs9dqgOf8ksTrvFnavKTOngHgTLUGPkNkt+YWKiWXN9/Ukw1tpnAooerDlW3RyWCeC/VzVV0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PV0NUH/a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757040700;
	bh=UaJbBaFYr9catSTHL4/bjmDz3L8Li0BSlapt8CFV/uo=;
	h=Date:From:To:Cc:Subject:From;
	b=PV0NUH/azH1s9hvMSq0v6UdtP39L+SChNsnVdf2H5vCcPNP4tgBty+DsLkISE01uf
	 Ti6B+pubS/dyQGqjSEtDBa45d0rOi2BbYmQ/VWPiYf6lKYy9j/mURn5TEGDwSCqVTc
	 0SlYcJ8UPqLNr44+4OWpO7CIf0I6b0TVYIhphOkUGgo07axodYpE00z7ADFICReKkl
	 KLadaeJ77GAHRxeWY4Z+qEydC+vsCFCzZJGEAvNyyqkxZOg8dBUNa6J2WPANXwhEHE
	 DDr+0qdU6fyMlPuQSni14opFo53i0dKqfSP3FXY+dTjO0lsdNRyHfiRh37QfJ5ekyC
	 UtXdzEDlVKOpA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cJ18C75Czz4w1m;
	Fri,  5 Sep 2025 12:51:39 +1000 (AEST)
Date: Fri, 5 Sep 2025 12:51:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Vitaly Wool
 <vitaly.wool@konsulko.se>
Subject: linux-next: manual merge of the drm-rust tree with the mm-unstable
 tree
Message-ID: <20250905125139.109081b2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YZl6_t0Nj4oXpvJlkKHhSD4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YZl6_t0Nj4oXpvJlkKHhSD4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got a conflict in:

  rust/kernel/alloc/allocator.rs

between commit:

  eeefae80e404 ("rust: support large alignments in allocations")

from the mm-unstable tree and commit:

  8e92c9902ff1 ("rust: alloc: vmalloc: implement Vmalloc::to_page()")

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

diff --cc rust/kernel/alloc/allocator.rs
index b561e7a57bb8,90e03ad15760..000000000000
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@@ -13,8 -13,13 +13,12 @@@ use core::alloc::Layout
  use core::ptr;
  use core::ptr::NonNull;
 =20
 -use crate::alloc::{AllocError, Allocator};
 +use crate::alloc::{AllocError, Allocator, NumaNode};
  use crate::bindings;
+ use crate::page;
 -use crate::pr_warn;
+=20
+ mod iter;
+ pub use self::iter::VmallocPageIter;
 =20
  /// The contiguous kernel allocator.
  ///

--Sig_/YZl6_t0Nj4oXpvJlkKHhSD4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi6UDsACgkQAVBC80lX
0GyDZAgAoNzuWVSAN3BlUDPj8A6f3mA1ZbHIn4BXdBQMnDf/ozHclDg+Xt5Dp5Km
9WSicms0kpIrSiXAXI+G6fbWOU9BKAOsigUbNtkXxjN2L20lmeUVwC1k5qwABQ/4
TXtlcJUiK4gz5Pc18eDKSTzoPDLS8Htrv75PtDf7Rc9ympV07hMK1Vy3Dtg1KEr+
tPQYrHCy3iImASe+Ulp88biUju0pwZcp0seFxNofZqxj4DD3M99fB/GdBwL+O5ns
nLueL2UugAXaZAa2RzUiLHlV4SDwiQFJ710cc3qCM1QM1XitNvAEEPNNREGXB73I
oYppLYoozq+q+dSJ3nhO86Pa5O1W0Q==
=yzXe
-----END PGP SIGNATURE-----

--Sig_/YZl6_t0Nj4oXpvJlkKHhSD4--

