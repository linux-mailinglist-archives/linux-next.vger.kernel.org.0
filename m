Return-Path: <linux-next+bounces-7631-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7EEB0A0F8
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 12:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC1C5A75BB
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CB32BDC32;
	Fri, 18 Jul 2025 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qf9H5lhK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335D2BDC20;
	Fri, 18 Jul 2025 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835619; cv=none; b=kgpim+J/LkxvXfrImC+vyy+FknfZ2bifw9jALSQBm38EIAt/HBAcTK8cgmSdK9VC/Toz/pYATIhvm2RptRW96+6Fut3uwXXoF2FIXEr8xJzK6luV4/4fW2lH//oXTywQE+zc5Sv8KBACOSWUhbnpma2yuTCbM9dFFmmNMZbZgGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835619; c=relaxed/simple;
	bh=IhyFDAPlIxtcyAvmSz29FX3FiMhWPJyGdZPko3TxCfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fTSWwC7RLImoVodl1PRGz1db/4UOUTS2PAbufm50rfwh/9kPO92IYyu6YT3MwCErIyXJdYhwOp9QF6RTT3cXYAdfpsttWcTClOucHFCKxZJhntQjrT67RhBEsKCEzI2CN3uXTJBz+P0ZRU9JUKiFRX/3rFTzdm9ALvXL7ABcZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qf9H5lhK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752835483;
	bh=pqXCxpfk8RHZAm591B7yRvrjDZVGuw75WnTPlk3aX3A=;
	h=Date:From:To:Cc:Subject:From;
	b=qf9H5lhKCNCDoJABLeMeDGWLIBud3hthgUsb78nVTCSJ7Qj+ZFsFXqaBU5ikZeHEQ
	 EIYnyLFNoaCoWyV6Mww2PDkbPASJiX6t32Yj95t7LntiqzUpdnmbcQAcp/Cg5VATxN
	 Vxxlmr/zEeUfwVaFqJ+pPp4ngqUIkv9ybY2w72hRbRqGFe+0qwNmxZPwPKs932d4lK
	 eoNJbXFNe5W0p2qFyTIGpn9eS+Og8/ovdrFEg0tuPa0fqhweAnL1sYxPaps9P5Mxsy
	 Hh4OXdmpvffn/oYwhfoAm4wqShbzSDQhiaDO3wC+1RlsZcDBggKUYCamCf0BBMnfvG
	 Zd+g4iOGu9oxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk5yg1kJ9z4wxh;
	Fri, 18 Jul 2025 20:44:43 +1000 (AEST)
Date: Fri, 18 Jul 2025 20:46:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo
 Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the driver-core tree
Message-ID: <20250718204653.1289b26f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ki4UrVQd2d+yVeT6eLwLTEe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ki4UrVQd2d+yVeT6eLwLTEe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/device_id.rs

between commit:

  8d84b32075fb ("rust: device_id: split out index support into a separate t=
rait")

from the driver-core tree and commit:

  5e30550558b1 ("rust: enable `clippy::as_underscore` lint")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

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
++                        .byte_add(data_offset)
 +                        .cast::<usize>()
 +                        .write(i);
 +                }
              }
 =20
              // SAFETY: this is effectively a move: `infos[i] =3D ids[i].1=
`. We make a copy here but

--Sig_/ki4UrVQd2d+yVeT6eLwLTEe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6Jh0ACgkQAVBC80lX
0Gz5lAf/XDOW6+D7Ogk7bUxrUbrYDlA1K7CAegju2sCErZkpzGK72737c3p/81D5
yf1O/vADYKWxks/zVzfAqX/yrGH+p+LjxcmmMhleOhHceAwAZY05hoTncS/4RZKg
wDnH2cuk4haZ5AoPekqp54L00Ca1J3V7/RoZv/wXifAU0W+4zATJjo6bcP+TiJl9
ivl6iPyH7YC+tCqo6dt/3PL4IvQ4gB5TX1p2NC0PoS2Xa1CMGNNynmongc2g5Lb2
wk/MzjjYPbvvoC68sH5kMbXVmkqP9CEW9AjH2nTYSwJAJCE19uZD2oRC4LXGZeOz
04TSdNNsWSjHLenosHaWEVAXOj69XQ==
=AIG/
-----END PGP SIGNATURE-----

--Sig_/ki4UrVQd2d+yVeT6eLwLTEe--

