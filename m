Return-Path: <linux-next+bounces-7045-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D94BACD014
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 00:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69C161893E07
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 22:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554E322688C;
	Tue,  3 Jun 2025 22:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kR9UTzT3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C15C1A2643;
	Tue,  3 Jun 2025 22:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991476; cv=none; b=GDF1BiVcTVERagPsXqa8E8zfwbWZUuZ6mXRVFrPNcgJ8fc5wXvzxrXHk7qiHEILIwHot8gLBbAyKQfMXGNs6BF7mc8fNb2nRDhX+yZhXgCpuJYKpULKxFbRaKh6ED7J3KjmCgzLfWZFU0Hpk0SSfpwA9Kn48I+5BuQM1fl+pop0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991476; c=relaxed/simple;
	bh=mfHYMr+11h25XsQDyANpiLb2jQGWQgM6lpmUpf4GY2A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WLAM2sNLMT3czARjUUsoHNnSwSY5d8z7k8ef46WQeIDfkrfOveCVmvED7/izpFlT3JfYOUtZ4LYb30QG2a1at+GISiochQfj1FSIt/UD0lxtfrSoM/YzNPQm2PAE1Fm969jDspIUlAe3+XL/Dfn2cc7IIujIonFJkjUEDpN4rRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kR9UTzT3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748991466;
	bh=4IRj4XnLCWXGXfbFdoH9RyIeDX5InpmpdZH6opIp2pM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kR9UTzT3QdFhz+aRkXi9PtVQpQ2vR4X2xspD2SG0VtNwsZWwE+yYogcDgEfPinchn
	 n+9pJGeQ6+GZgX7pb923MtLVZt4ImlSKaT8YnKdVJkAMW0ezqqcvODIGBP8UlZQo6r
	 Pb2X0OSOBd/e0OcFu6+2O190vjx78qLTiaCOJv8+N6p6KIwIVmW7kFC3snMf/UTp3d
	 8zyxH2pFGDLLtoOXrL9ZvVsNSEfkuPO9/X7a8Lgu8v6IF3HtqFDGCdRmCsV71O59qe
	 L9oZ1+p+qA/27BK9JHfOoB36V39hfqZKZDGa2KUyu5clfxp1sIy4ehC+FFTsOVbf+K
	 3v09ngtOHr67A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBmMG1lX0z4x6p;
	Wed,  4 Jun 2025 08:57:46 +1000 (AEST)
Date: Wed, 4 Jun 2025 08:57:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Yihan Zhu <Yihan.Zhu@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250604085744.3584e17d@canb.auug.org.au>
In-Reply-To: <20250422203338.3ff1ce14@canb.auug.org.au>
References: <20250422203338.3ff1ce14@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dnyC3i4/CtbNtkDh2u5unN5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dnyC3i4/CtbNtkDh2u5unN5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 22 Apr 2025 20:33:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> WARNING: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068 struct member '=
mcm' not described in 'mpc_funcs'
> WARNING: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068 struct member '=
rmcm' not described in 'mpc_funcs'
>=20
> Introduced by commit
>=20
>   652968d996d7 ("drm/amd/display: DCN42 RMCM and MCM 3DLUT support")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/dnyC3i4/CtbNtkDh2u5unN5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg/fekACgkQAVBC80lX
0GzkuQgAja3ZeLrkuJBzY/upPHetUNnnLu4LGnwK+OOjK0sP52HwZyGjk8FZve0r
6vLqt1kLmx9PAsA3BzPB4kG6DPmS5HhGRzOniev0kzOm+6MHytH1xpLwkGp3Mftt
upBIydH1eZokUs0uqbTjyb+UQFUHL6svBoDL2gjNiD9sgZqn6h6FlzSvVWx5OE8F
47WCIq2kt8b0tBHg78hAaKhKATmC1miEGVwGPjtmNn33Fv+Jj3iq2j+sSURuWZfY
ZuBNukop5GMZegPcJhpOQGF+x1kJfqkgBJYnPRSxVg2rAEZ0u3nHFQ5KRH7inz7G
MPGXDgvrGg3UFTlRgr0cJox7EY0KOw==
=eSFu
-----END PGP SIGNATURE-----

--Sig_/dnyC3i4/CtbNtkDh2u5unN5--

