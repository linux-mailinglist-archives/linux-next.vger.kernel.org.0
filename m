Return-Path: <linux-next+bounces-3869-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FA979B65
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 08:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C521C20AD1
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 06:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EAA81AD2;
	Mon, 16 Sep 2024 06:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZornDbVh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968388289A;
	Mon, 16 Sep 2024 06:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469272; cv=none; b=Yq823v47yqkxj4Gy4ZrrUoEa1ulAEXu9EiBKmAOMmnit0/o3Fg3yqoOLcCA+Ta7Nr0fIE8KVMhABl/Ka9y9ss2+xhORof99drmrhoEDwluGHez8l+UkvwibIuJKGTn9zxZECmK3xZmSh8pzl4tdea8v7CjYx+gzfKZfap8ZiCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469272; c=relaxed/simple;
	bh=S4jMHUX9poTfb9e19DedP3LkgtIDcRFffjCHS3w0WtM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQgDz/xrkK46CjvJ7l5m33VeH7FPAJHtIzvabrYLAUxqCmnzP8KLOpNd8Ap+WxWujGCySIqD2tJUkBBIevZecatrA22RcbXhnGf86w/bwogtP8pO1RH/tZxJtEUCsOlpu4Optw/qmwhsW5PVZUlDMj+0HsaDR7pHuL3gaPYJWdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZornDbVh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726469267;
	bh=KL6isrVmkMEDbrBMR12kIHoCDfymdOx4DGl2Qk5z6O0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZornDbVhUA0GBvna7IjKIgdFowRTLi6P2rLUCgWE+TNai5Eg+QVTzRvZKfAhnc2jC
	 4nn13K7lQpT3YmvEdoSm/wg1wlxPaprbmF+thOwjbKAYGO8PEcFzMOGN8MA351x0pb
	 Hh2+BDcgH3HGYpREIfBfXjDz0fXIK5isMUQW5cUMKOXWzGMKPDlpg4iAmoiMgPQyAI
	 1B/W6ZdnPPyFhGji8uXdM1q6FjjnK0SWqwwQGZ7agjrHsW/G4CQoIWCgZbZcxBUttM
	 +Uj3NxV15gE7cf02y1il2Jz0pSxy9Na0rgUJz+kli6Z6fBsX8yEd3rQrc6j18vuoRP
	 vvy7gMgv9xR+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6b821l3pz4x8C;
	Mon, 16 Sep 2024 16:47:45 +1000 (AEST)
Date: Mon, 16 Sep 2024 16:47:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64
 tree
Message-ID: <20240916164744.3ecf283d@canb.auug.org.au>
In-Reply-To: <20240905160856.14e95d14@canb.auug.org.au>
References: <20240905160856.14e95d14@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ta6sSh.Z0zISF5r92HD6ugV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ta6sSh.Z0zISF5r92HD6ugV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 5 Sep 2024 16:08:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the kvm-arm tree got a conflict in:
>=20
>   arch/arm64/include/asm/kvm_host.h
>=20
> between commit:
>=20
>   b86c9bea6349 ("KVM: arm64: Save/restore POE registers")
>=20
> from the arm64 tree and commits:
>=20
>   b55688943597 ("KVM: arm64: Move SVCR into the sysreg array")
>   7d9c1ed6f4bf ("KVM: arm64: Move FPMR into the sysreg array")
>=20
> from the kvm-arm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/arm64/include/asm/kvm_host.h
> index d5857452a1ec,b9ca899041db..000000000000
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@@ -446,8 -446,10 +446,12 @@@ enum vcpu_sysreg=20
>   	GCR_EL1,	/* Tag Control Register */
>   	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
>  =20
>  +	POR_EL0,	/* Permission Overlay Register 0 (EL0) */
>  +
> + 	/* FP/SIMD/SVE */
> + 	SVCR,
> + 	FPMR,
> +=20
>   	/* 32bit specific registers. */
>   	DACR32_EL2,	/* Domain Access Control Register */
>   	IFSR32_EL2,	/* Instruction Fault Status Register */

This is now a conflict between the kvm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ta6sSh.Z0zISF5r92HD6ugV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbn1JAACgkQAVBC80lX
0GzdYwf/REGn+MeTjYFX1zvkPcJjXSOkiT3MmIPxjimEjI1IWMbxhmyVYFNEtv61
5go/hXS4Iyp97ZeGqxYOL3iey5YfVjlAvW1Qwf5BrI4tjy0qvyVZaZAKPQnjP7tP
quJSyPk0iE/EdlwZ13Z2ccLirZMimqTVB9DdQ6cVMs0DevQrIwl6ZhXaITVG75hr
2pFVbZsL5HVDtNOXmuTNB+pbCAa558AyGUtYhFTxR27ctoLHSAqV1UZm4xDQZebf
x62JNlDyJA7YgqlNIkVOD7m+SzVQRu+wwS6QKcLooWLwKFpEfBzi7TgCM/Pk4pWQ
Xy/layxDlVdUPDSeFN4ymjJ3HN1Vog==
=8hLL
-----END PGP SIGNATURE-----

--Sig_/ta6sSh.Z0zISF5r92HD6ugV--

