Return-Path: <linux-next+bounces-9571-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB7CFBF3A
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 05:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C49430024CA
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 04:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56773242D67;
	Wed,  7 Jan 2026 04:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ij0oS9Px"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9260922A4EE;
	Wed,  7 Jan 2026 04:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760166; cv=none; b=jIbci9IO5StLIqfBiatwsUKkkEBrl41DVWPmJYs5NEB4C6SMVtViQY+VwQupYSwgaWw1dtNRTSXTejrrj2hFUqkuFnkB7gbeJXOHVfEmOHWwqwlFbr9SfkynooRi4942IHn1wd39eY78pUM2XGE6oo1mOnorTJUmH8zUhNTji6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760166; c=relaxed/simple;
	bh=dKegN+vBXc7E87tEWT7TGIGvvPytBqORxCs/ezna88E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Re3WJ+BSscSGKZpXOemlRMfWTAlMQyJu1m8fwTH1kehpr2gQgw9MjSNjRJH4HLoLy2BJ5h+NKOFa8FhmwBopF3Dur9xYf7iyXTddPpQbuQHxUHWUYk5wxxe+hMtUsvyrwr499SqmfVObQlOLucPJTJlUpzGbexPuegUgKCGxnYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ij0oS9Px; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767760160;
	bh=GrrWSBNUjbvs/WVrPxFZ/PfwnCnLjvtEr257GgWt9Yw=;
	h=Date:From:To:Cc:Subject:From;
	b=Ij0oS9Px8Q2qpHU4PKnorHxaPGgbx++ecmQ72OQ8tkaihcmqhBkDrgg/F3mxrniEV
	 fz0OGayOO2cqUexMR0R1Gt5B2DVzO7qdG7YUm6sKC+7j2IyGioLv+rVTfDBLM2BdWS
	 323PJiiKaFmh5eLUAVhYRBAJuL7RD4Q7j+bVg4BTkjiyhqm/5fRHT7UmJgqZBxDf+b
	 DKn24fnOBpsWv0LjtKxu6jRnmzCS29P+amn2NeTgjj5LGyavJUJNDGC0y9207Lckbn
	 e+OjjZ8gzuxlZChS+BTAlwtSCNzEQ5hlmQjEAWfbKhYnGlglZJfNNSpY1HgpJXroIx
	 rvjbWh0Dsjanw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmFRg749sz4wC1;
	Wed, 07 Jan 2026 15:29:19 +1100 (AEDT)
Date: Wed, 7 Jan 2026 15:29:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the driver-core tree with the
 driver-core.current tree
Message-ID: <20260107152919.19977947@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K4AERT7VeKLPG1MRTZjWhzo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K4AERT7VeKLPG1MRTZjWhzo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  rust/kernel/device.rs

between commit:

  8510ef5e3cfb ("rust: device: Remove explicit import of CStrExt")

from the driver-core.current tree and commit:

  f0c6ea853bd7 ("rust: device: replace `kernel::c_str!` with C-Strings")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/device.rs
index 71b200df0f40,a13f6ee24b09..000000000000
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@@ -12,9 -12,8 +12,6 @@@ use crate::
  };
  use core::{any::TypeId, marker::PhantomData, ptr};
 =20
- #[cfg(CONFIG_PRINTK)]
- use crate::c_str;
 -use crate::str::CStrExt as _;
--
  pub mod property;
 =20
  // Assert that we can `read()` / `write()` a `TypeId` instance from / int=
o `struct driver_type`.
@@@ -158,8 -156,9 +155,8 @@@ static_assert!(core::mem::size_of::<bin
  /// `bindings::device::release` is valid to be called from any thread, he=
nce `ARef<Device>` can be
  /// dropped from any thread.
  ///
- /// [`AlwaysRefCounted`]: kernel::types::AlwaysRefCounted
+ /// [`AlwaysRefCounted`]: kernel::sync::aref::AlwaysRefCounted
  /// [`impl_device_context_deref`]: kernel::impl_device_context_deref
 -/// [`pci::Device`]: kernel::pci::Device
  /// [`platform::Device`]: kernel::platform::Device
  #[repr(transparent)]
  pub struct Device<Ctx: DeviceContext =3D Normal>(Opaque<bindings::device>=
, PhantomData<Ctx>);

--Sig_/K4AERT7VeKLPG1MRTZjWhzo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmld4R8ACgkQAVBC80lX
0Gy1Uwf/VEQOwpZRS23wY8CRSopdxVyxmeFOBbWNERaiS01EnbvBm6BFtoJUYfSp
QeBBtsCGlT09ZPskWwH8TpW0U2g0smIKhnS2/ZAXaKhVypDeX1cv4B34QBkbMpPE
ss8ehZtHxS5oW5PHli5o3zFx3sLYcGdXT6GRkvfLIrorXvMkeyyQ3R7HiJ66ptof
SFmYuBTsIyO513lV9idB++S+vRSpTwTZq4/+fwHpesIpzRGdy9KYHoqiKN5kPp3Z
Ljso8RxnAnhO5HvkvlVoe8BT1Rz6jxvrYhLqCtJfUH/xaHTQbLnlE1B+h7TVmOua
R1g0YnE3Ybmn7+ErITLsjPoKKyl/yQ==
=WfTy
-----END PGP SIGNATURE-----

--Sig_/K4AERT7VeKLPG1MRTZjWhzo--

