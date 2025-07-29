Return-Path: <linux-next+bounces-7761-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2DB155F4
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 01:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0597716680B
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 23:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0814C285042;
	Tue, 29 Jul 2025 23:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tU7aTxra"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B62319D8BC;
	Tue, 29 Jul 2025 23:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831672; cv=none; b=NY2v/2Oj1Pke/YjdK+6iFwt1CMKta4mmX67LWaeg5Pcss4/yzbtJYteS4edUls9otQ51OXP4lrRhnI/4qCnUZAeSkukexwBL7s7pZMcUSd7XnpRgiYDqT6zMiQDkxlwxIzRyK4zbYzEQbO9ZJG/Ts3jS20sAse3UDp3NBUa4EVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831672; c=relaxed/simple;
	bh=uwSpHf7Svq/Z+HcDlHfqihJ9wMTLx3vVkNJZ8UnB8Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKrR/7hlflnO5V1zOkUPsBYXiCbChthj9KHPuO2taafOfbr+vZ4y2FEaflNELkjjcxfTRCxDeRtJyiap4e6o00N4sHR3Um4GTZFJXhuLnrkrdNOeW3oi0HevFEuAbhDcxOPoR6ivJ/O/O/d4HZvg7RBEkOwYu00yyTxerObuxAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tU7aTxra; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753831455;
	bh=6mTBlnRa8PfraSaaxyB4E03DncCpm/bdVtGK3eHDw28=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tU7aTxranuaaz+DwfXamuiJ/PpaLzLGSReMsdUZgXmLOHRlhUihAJRQ7xeG8ET8N6
	 BSjXVXF/DsVBMbT4Xtr+uziHC7jNV1ezuY9hTGjoyk23SgzBNLVuHIisuslBFUW+qo
	 HNaVzs5PQzB9eAJQu6ZPsHzyz+b0E1FAEv4PW557NRP3JGnAbOVh8IS7PdqEPbLHWn
	 fu6Y0VaZOvSKML3e2A0XLJPg1TlpFYzdTmV0bnCK6dJOG3pQwBh5jySLSr34HeveKh
	 mjcX6P11IzxTM6EhbGULbzRkJYZrQ1J4JEFBCv2oTgXrlmC2ZopXyVx/MSP102qDi6
	 P12CytnqSM31Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsBHy73Dcz4w2R;
	Wed, 30 Jul 2025 09:24:14 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:27:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drm-nova tree
Message-ID: <20250730092746.1576eaa3@canb.auug.org.au>
In-Reply-To: <20250701155159.47b914a3@canb.auug.org.au>
References: <20250701155159.47b914a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AMgr8NzSUK_p=U_yMkTt9h=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AMgr8NzSUK_p=U_yMkTt9h=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Jul 2025 15:51:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/gpu/nova-core/driver.rs
>=20
> between commit:
>=20
>   94a08721435c ("gpu: nova-core: increase BAR0 size to 16MB")
>=20
> from the drm-nova tree and commit:
>=20
>   f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")
>=20
> from the driver-core tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/gpu/nova-core/driver.rs
> index 518ef8739550,110f2b355db4..000000000000
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@@ -1,6 -1,6 +1,6 @@@
>   // SPDX-License-Identifier: GPL-2.0
>  =20
> - use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*,=
 sizes::SZ_16M};
>  -use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*,=
 sync::Arc};
> ++use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*,=
 sizes::SZ_16M, sync::Arc};
>  =20
>   use crate::gpu::Gpu;
>  =20

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AMgr8NzSUK_p=U_yMkTt9h=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJWPIACgkQAVBC80lX
0Gwbcgf/RCYzMVrfgLKrYwOzn0BcMoNWMGL7Z5Ew3wMyRelaWSOrkIvFHSL6m290
luqRdmfLxE1SPmZfD1mfW7f4sxEbzixFa0n8LCkGr+1NtfgMryLYrLAje9o1Tz5w
QvlFxuBSifzmMV4EKTSoKW6PLc1Ay9rQgk0ACcKkZ/QGBhVwqotFzLZElwTR5y5m
wjF0s0b8wTwqEl76qhkHRDS9ILaaA8XLQwWL3Hxy8IILm9siVQlngRsa+au1HqHf
HazP4ciXAWVkm4kxxLPg+z/mXlln7uGozB5m7Jn137tEjtAhhjQipKqiCQsx23pj
8wT6Jvwv/t/4+CVZJZ3GnL2nDEmiag==
=xobR
-----END PGP SIGNATURE-----

--Sig_/AMgr8NzSUK_p=U_yMkTt9h=--

