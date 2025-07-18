Return-Path: <linux-next+bounces-7629-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF6B0A092
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 12:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEDAC3B2296
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868602957A0;
	Fri, 18 Jul 2025 10:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fWPAvV8L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8AABA27;
	Fri, 18 Jul 2025 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752834380; cv=none; b=VQiue9vSfePy1eu9HnR2lrLdSx4UJsw8zIedQfKljXGweN+KEOKhmeLj6apWVuFFIvT26jSaM5RczBIYBa/HwfHyKjx4riz6+9VFW5EmYlvogKKXilneVAEdoVP5fjZnirKP4FSyo6WlPkNgnCETLqYWF4a9uDGhcu2mmekjiRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752834380; c=relaxed/simple;
	bh=ztu979h0svZQ93UgfU7HHWO8pk08b5eoEybQcXeUTW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M1h0ahf9CQg3gByCQxoO2ePZGjh+Ts1+Y+vPCMBlsS5ZN2D1FPt7lukJQeOtnqjsK7hpi4XsH0emxS9rI0jGmAI1gdVDWv6wYKyZXXlSIiCyF53q/KqH4bnFJfIKUj+P538bT6/eLV59Oi5CFvwYzVpr8VsajdYeXPCQCk3XFP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fWPAvV8L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752834243;
	bh=hzk/ogVlzsc/jlYK1Scv8nFmLfBUPTOSCUN8dDe3KYw=;
	h=Date:From:To:Cc:Subject:From;
	b=fWPAvV8L/XCZqvX5YfkNyLsa3cxwXQBSnpoEcLoJRroAseE10OTDqVVW4EERZkdQ8
	 5ycmtOgnMMu4RygsWV/7OIni7IUqU4Ss/q9UNpN7mXV1p9LvVMsQr8x8CkLOkqkFKH
	 bsIcFJ0N3YHtg2PEAbNH+rQmBIAa80YiKlZfwXD15ZSeJ3C6FWQKT74T08V9WLp3ns
	 69RIpQr+HZgXya2AdacIK6wMMJOG3/Yxc1xwOOd+64M/9Ugds1ktFNJ+yyQyr+sqyB
	 6dq+xNrUYTu/Uzc+Db4bSgAVubUAHR41kTFSo7+o3n3qoP+LfoM0E3OOE9YnrC+NrG
	 +90XFoVeMac4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk5Vp65SGz4wxh;
	Fri, 18 Jul 2025 20:24:02 +1000 (AEST)
Date: Fri, 18 Jul 2025 20:26:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250718202612.15567f80@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gQiIrg/zURtwYJhBSZAQI+j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gQiIrg/zURtwYJhBSZAQI+j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got conflicts in:

  rust/kernel/device_id.rs
  rust/kernel/devres.rs

between commits:

  8d84b32075fb ("rust: device_id: split out index support into a separate t=
rait")
  f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")

from the driver-core tree and various commits from the rust tree.

I fixed it up (see below - basically took the former version of
devres.rs and I suspect I have not got device_id.rs right) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/device_id.rs
index 8ed2c946144c,3dc72ca8cfc2..000000000000
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@@ -94,16 -77,14 +94,16 @@@ impl<T: RawDeviceId, U, const N: usize
              // SAFETY: by the safety requirement of `RawDeviceId`, we're =
guaranteed that `T` is
              // layout-wise compatible with `RawType`.
              raw_ids[i] =3D unsafe { core::mem::transmute_copy(&ids[i].0) =
};
 -            // SAFETY: by the safety requirement of `RawDeviceId`, this w=
ould be effectively
 -            // `raw_ids[i].driver_data =3D i;`.
 -            unsafe {
 -                raw_ids[i]
 -                    .as_mut_ptr()
 -                    .byte_add(T::DRIVER_DATA_OFFSET)
 -                    .cast::<usize>()
 -                    .write(i);
 +            if let Some(data_offset) =3D data_offset {
 +                // SAFETY: by the safety requirement of this function, th=
is would be effectively
 +                // `raw_ids[i].driver_data =3D i;`.
 +                unsafe {
 +                    raw_ids[i]
 +                        .as_mut_ptr()
-                         .byte_offset(data_offset as _)
++                        .byte_add(T::DRIVER_DATA_OFFSET)
 +                        .cast::<usize>()
 +                        .write(i);
 +                }
              }
 =20
              // SAFETY: this is effectively a move: `infos[i] =3D ids[i].1=
`. We make a copy here but
diff --cc rust/kernel/devres.rs
index 152a89b78943,d0e6c6e162c2..000000000000
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@@ -49,10 -44,10 +49,10 @@@ struct Inner<T: Send>=20
  /// [`Devres`] users should make sure to simply free the corresponding ba=
cking resource in `T`'s
  /// [`Drop`] implementation.
  ///
- /// # Example
+ /// # Examples
  ///
  /// ```no_run
 -/// # use kernel::{bindings, c_str, device::{Bound, Device}, devres::Devr=
es, io::{Io, IoRaw}};
 +/// # use kernel::{bindings, device::{Bound, Device}, devres::Devres, io:=
:{Io, IoRaw}};
  /// # use core::ops::Deref;
  ///
  /// // See also [`pci::Bar`] for a real example.

--Sig_/gQiIrg/zURtwYJhBSZAQI+j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6IUQACgkQAVBC80lX
0GzxAAgAmcixf+9YSOtIJfbUJsxCOObiXpd/QMXL2yPTn8VHLUPossjsAF3ev6rm
urV3dPUusaSiE5H//jVSnufZC7sdz5nenERzpUY8UYhiEbPTquocuYWl+FGfhry7
N4SAjkXXn7/h6EKlwtBWrJWL4Ao0ZeP4mlq98cbslAQHr3JkHMly7b1USonKUaMe
BpzvdU+lcpeyXrQ+hR3VtrmfsZ0dIw6biR+YW2HIn+emN8HzP1K+nLfeeEFRBOpS
5c/NDIFk7D3vKXL3kZOAHlqbVYngjpIJZicDsIy+htWfzvIozBIJ2m4kF6S4pNlX
pFpDKNrKQO9TEiIQRuVlJyPukzrdEA==
=UXyh
-----END PGP SIGNATURE-----

--Sig_/gQiIrg/zURtwYJhBSZAQI+j--

