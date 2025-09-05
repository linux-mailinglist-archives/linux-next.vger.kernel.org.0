Return-Path: <linux-next+bounces-8203-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28607B44CDE
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 06:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F578A00068
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 04:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E0527054C;
	Fri,  5 Sep 2025 04:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kUtoOk8k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D9261B91;
	Fri,  5 Sep 2025 04:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757047499; cv=none; b=CzAkM9EvK04D0iALwyr/yvRMFO06K2BliyuD6eQAJ4Q0io28AX/gvxD3w3Qro20g0V4o1FByZ3Og1NhzNAWngr7JuMantvkBIbh0X0twEMcQqZYUCz/oLluAAy67bcSUbzy/tED74AHNiy3pPwN3XrETfaoc6vcHvSdPafSK0vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757047499; c=relaxed/simple;
	bh=TEUvt1N8kdMtlYp9fz5VZJ6SjoRpeW1M9D6zK3ueHho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yu5/bUmWUKUu3c0+2rGvzBhIN0GxF0QrH9FNZE5SxQYfod2S01rzvkfr+qjc0v73T+9Obh23QGBS9BknVfAvUcRjpIiLn6h5GIBiTUZAiv9a/UsCf8vHw38e+7ujAel4jGsiwf6duRQUamIi87UtAhwE89wYzDiPap1pU789rHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kUtoOk8k; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757047490;
	bh=sK9rWy1870udB58vmw/UtxTecbXxMop4pLdYnxaT9Kc=;
	h=Date:From:To:Cc:Subject:From;
	b=kUtoOk8koodLcl2hiX2ISPgQ52jwB/PtYu3UzA3X3bW0RK3pkI2ue5hd4Ro3129q0
	 E1yHT0uUhUexoyV8Sg3PzuOvHSN7TpB1ZFvOUHjvC2mftVb97xOU92Hho85EGCM4L+
	 UveXBipnC2juiW3nYeZggSLKQqd8XFgEbVC59mtephPwUADslJWjVhvXf7sW3+hROR
	 oZsYD5mNJ5XKYdTTu120/Du3grGdw4z9rnj4ZZQ43Lf+ljePEq9hf6eOpHGRagFgGN
	 KqyuPDZ5PM8aYDCVNmckYG+G1/dyz1YWnK0rIi/ox5nxzYJZNlZSHEI9QHxLYiXUWY
	 K6vMGYWRIwcGQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cJ3fp5drCz4w91;
	Fri,  5 Sep 2025 14:44:50 +1000 (AEST)
Date: Fri, 5 Sep 2025 14:44:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shankari Anand <shankari.ak0208@gmail.com>
Subject: linux-next: manual merge of the rust-alloc tree with the drm-rust
 tree
Message-ID: <20250905144449.437ef3cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LkIasNxuFqykYJj/u0uoBRM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LkIasNxuFqykYJj/u0uoBRM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust-alloc tree got a conflict in:

  samples/rust/rust_dma.rs

between commit:

  5444799d701c ("samples: rust: dma: add sample code for SGTable")

from the drm-rust tree and commit:

  7e25d84f460c ("rust: dma: Update ARef and AlwaysRefCounted imports from s=
ync::aref")

from the rust-alloc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc samples/rust/rust_dma.rs
index f55c6a37ccd9,997a9c4cf2b3..000000000000
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@@ -5,15 -5,14 +5,15 @@@
  //! To make this driver probe, QEMU must be run with `-device pci-testdev=
`.
 =20
  use kernel::{
 -    bindings,
      device::Core,
 -    dma::{CoherentAllocation, Device, DmaMask},
 -    pci,
 +    dma::{CoherentAllocation, DataDirection, Device, DmaMask},
 +    page, pci,
      prelude::*,
 +    scatterlist::{Owned, SGTable},
-     types::ARef,
+     sync::aref::ARef,
  };
 =20
 +#[pin_data(PinnedDrop)]
  struct DmaSampleDriver {
      pdev: ARef<pci::Device>,
      ca: CoherentAllocation<MyStruct>,

--Sig_/LkIasNxuFqykYJj/u0uoBRM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi6asEACgkQAVBC80lX
0GwdyAf+L8yIssAO1IOtWP5DoBmm/+oIcUIKeQkdWll/4z/rGdNYYNSfINH7VWcr
FWGaFOyekkktCPP2sZpajgcRjrQ/I1ryWQ3tM0WbsfS1XOU0tzJJShfKicCvCn8a
iah3t62dZB7XqZGV1i1iYyDjBh/59VTTCV+VjkugXX5dyqMos6yRWPKzZycdM3L4
XwPIZBab8WbWOIrYPw4F3l7QQYUQpKwt0ikyfOgy4xuG3uyFPYaVG5FjR0YdTKJc
IwNPVIwx0yPa/RlH9MM2ftOGqpdrt0Sdyxf5IpUwBsgWxhfZA9fhxI04CQSEcOGi
8RcPokyGbEc8l3DtPPxYbzPjm/E5VQ==
=A11J
-----END PGP SIGNATURE-----

--Sig_/LkIasNxuFqykYJj/u0uoBRM--

