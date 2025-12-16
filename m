Return-Path: <linux-next+bounces-9415-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D58CC06A9
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B61773018EF1
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822CB158538;
	Tue, 16 Dec 2025 01:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OIX00R91"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1892E413;
	Tue, 16 Dec 2025 01:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847257; cv=none; b=VeAuE20kLCa1WGUVlzCG3zA1jSuY/nUIxhNU6tprqQf8XufILRGanQIKr6eRmkNbLATI4y4HHnOOuV+rZy0Sw1HuFSAbSJb45UEcebKIsARoGmfl/qW/xMpFh09dKSJN3Sk3FXTBGkej9LK0onbUNBrqwLfuGMGJhDdZ3ZO0fbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847257; c=relaxed/simple;
	bh=eB6dnpqHNFLhXoeh88O9ft2sUbS8PlS5aip9CnBsUUY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FnlO/E71iHRWdQKVHIb5HZihQSo+Nwk3tHpRcPF5giH68YJ7TTZFRx+XW2YCNxYgSXuFoJkTDIp2FQvqhEv8pFVxRcopmorAuAdl9vbkW8LreAHxRM7f3x/SVQmN32L835mhIANmAORFpHl9/2Xo7cHUDAymIFA/p41g02BAh1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OIX00R91; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765847253;
	bh=Aquz4bP0gxJpuT2sRbvZciaOBDnTuQ3hDcueavYRZeA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OIX00R91m+S3pKPIiw0eHuu98PVjGuksh6bSBfiuivWsFZX9hm5uO8UBWfOIQ1NdE
	 g95iZjm+m6KTEhTzE8148WAdd70K+MQ/hVFvIN3BWV41+BbfWeyPnbCI2xjk42s4Ga
	 Pd1eGwPEZsFMZRfdsk2YyhV3SUjcYg/Zj5S2kZS3qEwJcyeS+b/ywuJtmIzR8w6bO/
	 UAk5uMBa1NKI8Kz+zMA1CgbxHPixQpruvXo5FdPHOhWjQxkpLg0A5+cPbVMBB4Iijb
	 jaIy37VHRVIpZAypuGc9Wh9SaZCtFY+W/e7JM1DVaSQjewsF3OFBv6MuyT2b+bEtFt
	 qweMTUKUWGH5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVf113BqMz4wBD;
	Tue, 16 Dec 2025 12:07:33 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:07:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, George Shen
 <george.shen@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20251216120732.6248043d@canb.auug.org.au>
In-Reply-To: <20251119132235.5db86bee@canb.auug.org.au>
References: <20251119132235.5db86bee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qrDlmokiszZ=DUI/uqZouhX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qrDlmokiszZ=DUI/uqZouhX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Nov 2025 13:22:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> WARNING: drivers/gpu/drm/amd/display/dc/dc.h:2796 This comment starts wit=
h '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kern=
el-doc.rst
>  * Software state variables used to program register fields across the di=
splay pipeline
>=20
> Introduced by commit
>=20
>   b0ff344fe70c ("drm/amd/display: Add interface to capture expected HW st=
ate from SW state")

I am still seeing this warning (but the line number is now 2857).
--=20
Cheers,
Stephen Rothwell

--Sig_/qrDlmokiszZ=DUI/uqZouhX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAsNQACgkQAVBC80lX
0Gzo3Af/f4p07SHQDrzmbvYKglIeoLCJvgisvalVjvwti7l2ryzHMqj0I/c9oRsM
Z/Y7pfEsCMG03Gdrmwtnsyoq0aYyInXK7FChryPejvo2qo+KFtatTJnYH0qDNNnj
F4lB9umdQdW4QG5dbCsOcdUaEzg34cyOJ2EMwYnZ9Jpk9cY9Siv7NzAy9zo/i492
3s2I62mxgReL6D5JTpH7qTibiHjpjMwdtxjilmzzHt1aqw1okf99DWlu8f7G2ld4
FLwObA9M30fp5T1rzrgtsrZnv2L3T2mbQIREAVm9buJuMtt85Uu8cQ+VlDPipGp+
4uzc5PblZcmECjG4cvv0lws9QUMhwg==
=NxWI
-----END PGP SIGNATURE-----

--Sig_/qrDlmokiszZ=DUI/uqZouhX--

