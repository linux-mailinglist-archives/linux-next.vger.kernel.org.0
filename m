Return-Path: <linux-next+bounces-5922-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB505A6B594
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 08:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3265B3B5562
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 07:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F791EE02F;
	Fri, 21 Mar 2025 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e5/kLoSh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AF51DE2DF;
	Fri, 21 Mar 2025 07:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742543797; cv=none; b=HOQidzCZ02kjqQGk5fiY+pc0EOvbw3IMWqK1fdwuea2lOqwfAs+yDcQ4FBrMgnIgMTcBFjc1QZzt4ImYOcNMUtyPTq9P5J2bi0XqapqwkNXEU3VnSvm9q1xbMLVou/akhI9M8n4KuA0dmGAvGJqo8B9W/VZcilPbvSEBwMSlhHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742543797; c=relaxed/simple;
	bh=6xwiSEfjnsl9oMe9TU6BHiDj61eEv5RNCgUQucsR3dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TqMcCNp5xrX/wOIgAl7YTZQSRsgqz9EXWfncNn9LlTtlEzGW946CeqyYCs9sfUBNsvcw3Evr94vn42XN6c1+zAc556yW+JCCBPV+kUZEcRbxdE1Ldhgkw7YDumhKhqm4MMlceOcknB5NuVoJGlTOQ5lf7Lq2u+0Kk2VxUnHJKb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e5/kLoSh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742543791;
	bh=Ht5K7/zAi8n/RTu2sEicQ+bbH4WZ5Eum+1gsbP7wX4g=;
	h=Date:From:To:Cc:Subject:From;
	b=e5/kLoShqF5bp/HkpzAy4eZ+gVDIgLdb4D504/y/slHwtMsm3HMkGkXdk0QVO9oOU
	 gHsxUt2IytNE/scXsMtsFh5Lr8I52b4aHHnC1coUJ8iLLGw8Fp8jShORMvejMqJLjw
	 7Xq3fOBY/EL3QKE7uDoTyJxbSyGWKPuwZt4D784F9P2UZYpZnil7vjnK63o+1VRdsz
	 jefIwW/eYJ+Wc0fx0S3xZv48p7TxO6y1grPYcq+ztb2+e1sOtsnG+fzLkuP2YufCuG
	 XIN0cdoRwhXeo0QKQQS/667uWTY7PInVi/fy3Ptgsp2upgIoGs0jeVGpxWoxQSzI+2
	 wInKg7s5TCR4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJvsW2pyLz4xD3;
	Fri, 21 Mar 2025 18:56:31 +1100 (AEDT)
Date: Fri, 21 Mar 2025 18:56:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250321185630.566dc075@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iqxKlt56HpPDfLDApe/WxLz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iqxKlt56HpPDfLDApe/WxLz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a semantic conflict in:

  samples/rust/rust_dma.rs

between commit:

  7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")

from the driver-core tree and commit:

  9901addae63b ("samples: rust: add Rust dma test sample driver")

from the rust tree.

I fixed it up (I applied the following supplied resolution, thanks Danilo)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 21 Mar 2025 18:21:27 +1100
Subject: [PATCH] fix up for "samples: rust: add Rust dma test sample driver"

interacting with commit

  7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")

from the driver-core tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 samples/rust/rust_dma.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 908acd34b8db..874c2c964afa 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -4,10 +4,10 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
=20
-use kernel::{bindings, dma::CoherentAllocation, pci, prelude::*};
+use kernel::{bindings, device::Core, dma::CoherentAllocation, pci, prelude=
::*, types::ARef};
=20
 struct DmaSampleDriver {
-    pdev: pci::Device,
+    pdev: ARef<pci::Device>,
     ca: CoherentAllocation<MyStruct>,
 }
=20
@@ -48,7 +48,7 @@ impl pci::Driver for DmaSampleDriver {
     type IdInfo =3D ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> =3D &PCI_TABLE;
=20
-    fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<K=
Box<Self>>> {
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin=
<KBox<Self>>> {
         dev_info!(pdev.as_ref(), "Probe DMA test driver.\n");
=20
         let ca: CoherentAllocation<MyStruct> =3D
@@ -64,7 +64,7 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) ->=
 Result<Pin<KBox<Self>>
=20
         let drvdata =3D KBox::new(
             Self {
-                pdev: pdev.clone(),
+                pdev: pdev.into(),
                 ca,
             },
             GFP_KERNEL,
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/iqxKlt56HpPDfLDApe/WxLz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfdG64ACgkQAVBC80lX
0GzF4Qf9G4rdTptuKdsHkfT9ZSgqNHUnyszo/CHCx4XY9xLH1/2aJkJFkxA0fjfl
AuGOqFGkpR037w5x516iLgm+6ivojnBqLlFvZ5xI7GSE2oaL+gkagGy+qwa/3BSY
1djheHR34jlJgWI30vbFwcGYdRhj/1U1DkP5n7eB4cw1tr8RmmGq1kjU6g6hh5TD
CXXT6SKk8uG2v+nzrHvYBdeAiLRuDvB88g7uY4UW1WZJ32srWAyyt+pkGGF/o4SM
VNwHUPx/mHLkTSWB9IkW0iianBvoBuj44zK40DicwksC3YrWJYUIMsaUxSOGxXY+
ffyAE5Z9ugSM7ijsQKJD+jelvWtWZA==
=QC2D
-----END PGP SIGNATURE-----

--Sig_/iqxKlt56HpPDfLDApe/WxLz--

