Return-Path: <linux-next+bounces-7284-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB772AEECF7
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 05:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 401731BC3835
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 03:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0290213D539;
	Tue,  1 Jul 2025 03:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HcLoTEkB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAB11E515;
	Tue,  1 Jul 2025 03:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340046; cv=none; b=sB8RJbHnBkygv94v7FQp4kjXCXcI28zvrl7+lm6Z8RRgPEq42X6YNceoMyK2kRdm51/y4ByMYdYNgrI04Adi5D8XaXjFQkStfXg2braUeidcIm/EpVW8Y3RIyzHm+5e9BEwulHANjzczhGp+ZwgvGaq5b5zmxJnOpI6zy0pQiPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340046; c=relaxed/simple;
	bh=BUvwnnly6LzN8bSSm62Cs8c2W12GgBE4UjnowN3varA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBq4+rIa+xuTNpwtEByo9hPQTzUiBOJleAaN7hMacnFeYIDO3khF36+/f0S4LtOj5VTOdSyqtdlYWumNiEeRQdMrAzZVrmW9W0AbJFcAPEWJC/s8xFZE0T7feCZumJWdCbdO1uEZj+/DTHw4mQWY4FEAN9rivfm+Cgx5BIOGkts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HcLoTEkB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751340041;
	bh=TiZJd6TOIYdOJwulFiMyObzmR6cbm1TJXONiRpeKk1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HcLoTEkBk5rGuHPuh4sFO/cXkZvp9p7hUcmHXzHHogHA8kp/CT6vzY2dODxjFTHxo
	 C8GmnmrHf0ecfvzEv4tRK6pRjg8agaKp7ZKFBuIacLmr4xYtFugcM04PJGNdmPCzZJ
	 sPbHUi8TIoJF0AWvqkrcEM/MB5wg9NHUxl9yihm3rjIlblC5YpH76WrW+ObVftG2Jr
	 SwdQhlM8Ug5BanfTdN6Mub+fCT6466fj4gzdShAhhvsigNyCDDEz4+7BfKGp4yCSdK
	 Iwcc9q7zyrN+A0p0LLgG1kTWNbdTEsiHOHUzovoBDr9ZYj7+mkhYY7LYcgA6XiC1OB
	 63H9G/m9oAC3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWSw86ryxz4x0C;
	Tue,  1 Jul 2025 13:20:40 +1000 (AEST)
Date: Tue, 1 Jul 2025 13:20:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20250701132040.4f6c04a8@canb.auug.org.au>
In-Reply-To: <20250701125705.5d5fb3f0@canb.auug.org.au>
References: <20250701125443.5ba945e2@canb.auug.org.au>
	<20250701125705.5d5fb3f0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0wzreYd+=u672Vxs2YKsrcp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0wzreYd+=u672Vxs2YKsrcp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry, this was actually a conflict between the amdgpu tree and Linus'
tree.

On Tue, 1 Jul 2025 12:57:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 1 Jul 2025 12:54:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the drm-misc tree got a conflict in:
> >=20
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >=20
> > between commit:
> >=20
> >   ebe43542702c ("drm/amdgpu: switch job hw_fence to amdgpu_fence")
> >=20
> > from Linus' tree and commit:
> >=20
> >   d0c35c84dcfa ("drm/amdgpu: remove job parameter from amdgpu_fence_emi=
t()")
> >=20
> > from the drm-misc tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts. =20
>=20
> I used the latter version of the conflicting section.

--=20
Cheers,
Stephen Rothwell

--Sig_/0wzreYd+=u672Vxs2YKsrcp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjVAgACgkQAVBC80lX
0GyUAwf+OvOFAIk64b7IWoGJEiBeZQ9N0+rzoXWAKDdU0T0NXGm47bHq5hPWnkYj
wWWnjN9DXXFJ6sjRlJy5HhkV9/5w+NJ5vFLJUlC2je4APweNKYi8xF1NoxyQDv2K
LXzSFT/SKcFBIvhE1b1VXKlOOnfMI05JgGQ8NommwNpU5Rn96z4PyDtPGLfn4yCk
DB/c9ackt7wQ5xCm7S2lLTfVfk+saMREBgIL2fR0V6tLDnq2ybfomHz8+030cAZt
CftyPfS3gSrvTy3JW43yOJNROzsNwsnBvIIR3sn2YYrZ1Sk74H3Jd91Z39MQaA8M
TGZM9L96yt9vrBTn0TsVM90ciWY8cA==
=+Jtk
-----END PGP SIGNATURE-----

--Sig_/0wzreYd+=u672Vxs2YKsrcp--

