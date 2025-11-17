Return-Path: <linux-next+bounces-9036-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD6FC625CA
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 06:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 012BC35E345
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 05:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDB7158857;
	Mon, 17 Nov 2025 05:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ew6X3feV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375F926ED4A;
	Mon, 17 Nov 2025 05:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355989; cv=none; b=dj+9+Ajzk8npJZBYg4eJIROyGrKyPmZ5u31SR3cqAlaxW+NZezNYI/Z482Gh8r3RR1Cn0MzKgqZYGstC9Go+mywjb2pfD6l1NuJXOgZe4qHcJBCcQb0yDBwpxMzhbXdb1KAXDQkH60TVD07unxyTDdeOPxx7zpsLwBTvd417w8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355989; c=relaxed/simple;
	bh=6w9av6J/DepXfy3cegFN06puujQnSBaZXwd+O6xNK8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MjAbDw4btOCuug0g3SL8IQhJK7+XtkHwW7gQ9MKMswCSPeCMP8/5IKUShTyfrg6dHsPcLKTlrecAwo5gaZ1WtooMK3wp9aIwxAvBQqGcc9qtMFyqcWxlu8ltVUEKbF64qP5VMcA2dgxD9ba8VNdDOG+j55fhCtTRHN6vSN+aC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ew6X3feV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763355983;
	bh=byH9rJ2D8ricjR2zoplpdJYltTrS7AgYZLO/zgJ4OXE=;
	h=Date:From:To:Cc:Subject:From;
	b=ew6X3feVoRIfd/UE1uQTrqUarfQ59hrrjfP/8Lz87k4m7+X8CfXHcU0MPR+hUB5EQ
	 KFbVlqWXiM6h402zw8NImzspvCa3mQFVT0agk0srhYBQfzwDKwc5d/vtPG2DVBBiXu
	 h8hIAg7nQm5v8O09KN+2OxavFqFTARlmobqCCEPt0nKKMzQ4roKgBqLGr6mxuF1Dvh
	 YTrKJaiw1xdFDrio8gC2wMVZkQl4peXexcaounzfdFv70BcuexZLRuHWWYp3F5wEgn
	 KIqvGqZWS0bZ19JgU6YpHlmxbBKGly72YfSlZnSDFo+XR9EDUdsaF62cIN5JYiyf1a
	 29cnn3BsTUvVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8wgy4kzyz4wD3;
	Mon, 17 Nov 2025 16:06:22 +1100 (AEDT)
Date: Mon, 17 Nov 2025 16:06:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the drm-rust
 tree
Message-ID: <20251117160621.2043a859@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zoaz96LFcEvpzidrOwlPCus";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Zoaz96LFcEvpzidrOwlPCus
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/gpu/nova-core/driver.rs

between commit:

  1101c442410c ("gpu: nova-core: Set correct DMA mask")

from the drm-rust tree and commits:

  0242623384c7 ("rust: driver: let probe() return impl PinInit<Self, Error>=
")
  e4e679c8608e ("rust: auxiliary: unregister on parent device unbind")

from the driver-core tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/nova-core/driver.rs
index d91bbc50cde7,ca0d5f8ad54b..000000000000
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@@ -1,20 -1,14 +1,21 @@@
  // SPDX-License-Identifier: GPL-2.0
 =20
  use kernel::{
 -    auxiliary, c_str,
 +    auxiliary,
 +    c_str,
      device::Core,
+     devres::Devres,
 +    dma::Device,
 +    dma::DmaMask,
      pci,
 -    pci::{Class, ClassMask, Vendor},
 +    pci::{
 +        Class,
 +        ClassMask,
 +        Vendor, //
 +    },
      prelude::*,
      sizes::SZ_16M,
 -    sync::Arc,
 +    sync::Arc, //
  };
 =20
  use crate::gpu::Gpu;
@@@ -67,31 -53,21 +69,26 @@@ impl pci::Driver for NovaCore=20
      type IdInfo =3D ();
      const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
 =20
-     fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pi=
n<KBox<Self>>> {
-         dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
+     fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinI=
nit<Self, Error> {
+         pin_init::pin_init_scope(move || {
+             dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
 =20
-         pdev.enable_device_mem()?;
-         pdev.set_master();
+             pdev.enable_device_mem()?;
+             pdev.set_master();
 =20
-         // SAFETY: No concurrent DMA allocations or mappings can be made =
because
-         // the device is still being probed and therefore isn't being use=
d by
-         // other threads of execution.
-         unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BI=
TS>())? };
++            // SAFETY: No concurrent DMA allocations or mappings can be m=
ade because
++            // the device is still being probed and therefore isn't being=
 used by
++            // other threads of execution.
++            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DM=
A_BITS>())? };
 +
-         let devres_bar =3D Arc::pin_init(
-             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar=
0")),
-             GFP_KERNEL,
-         )?;
+             let bar =3D Arc::pin_init(
+                 pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core=
/bar0")),
+                 GFP_KERNEL,
+             )?;
 =20
-         // Used to provided a `&Bar0` to `Gpu::new` without tying it to t=
he lifetime of
-         // `devres_bar`.
-         let bar_clone =3D Arc::clone(&devres_bar);
-         let bar =3D bar_clone.access(pdev.as_ref())?;
-=20
-         let this =3D KBox::pin_init(
-             try_pin_init!(Self {
-                 gpu <- Gpu::new(pdev, devres_bar, bar),
-                 _reg: auxiliary::Registration::new(
+             Ok(try_pin_init!(Self {
+                 gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref=
())?),
+                 _reg <- auxiliary::Registration::new(
                      pdev.as_ref(),
                      c_str!("nova-drm"),
                      0, // TODO[XARR]: Once it lands, use XArray; for now =
we don't use the ID.

--Sig_/Zoaz96LFcEvpzidrOwlPCus
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkarU0ACgkQAVBC80lX
0GxhSQgAmfJwrA+UJHXEbcGZe/upE38kN4wkjJqnCvychfyJmM6XrJbnmfaTDsG4
KiNoMS40Wss9QK0RUAu1RHO3Fud1KjeOw3U7F32BBNS8O+495V1iqoDG3oyRcWtw
ZmZDs1u93icxg0uNlOuy6okIw3u0653XMc0FGpnUXuw/Krb5yslFwUT2UMM1COTq
vZCS5XLo+8qX8uEYdx0wfUF0QkPInFoh8CUzCsP3bDS46LfzI4J/N0xEC3Aw+1Xr
Z2yqfG2OLzCbBJaH0CPi/Hwg7dsFC68WzUi2RmGW/4QfsWk2wYxYQf3ox3hpmOjT
S9AYfbQzvj4TRZqv8m9CoQPdEH/h5Q==
=VGCw
-----END PGP SIGNATURE-----

--Sig_/Zoaz96LFcEvpzidrOwlPCus--

