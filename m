Return-Path: <linux-next+bounces-2689-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB791AA13
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 17:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21730286415
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 15:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124E615ECD1;
	Thu, 27 Jun 2024 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuTRXVnx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE1F13A245;
	Thu, 27 Jun 2024 15:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500449; cv=none; b=RhgXFHYRcLKiNiqTGZlEsrXezINElwsqFYPON/ikhTGz6bEKnI/uLAUCOAVE775PPz8BP52rz+Sihc/6BeWlOOAIWeXr1wXt6A1lmSB17rkTmkHkYtdA7IIm0IZZx7JHAQilpzOfMmTyF0nem6crJq7hCw+HfgcgFg4phdaNw5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500449; c=relaxed/simple;
	bh=tRy9SRr/CPS5is3VqgbmrQWOvnGMxmc+yYVzPk/KzTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUOM5luUp3huizuUdnzw6omV8UMbm+IRhYdQ4tJpwhL+8wP/qmiakXBzaJsLX8mDRySv6Bj6TTN/uZd0Rlay0lCu+0n6pHkDgY4iTeQGtEtLT/Ia8+88BlVNOldResRcF+CB9H8OfND4rIzj8MkZSWTQtsRD/KzyMQ2PT5Ishfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuTRXVnx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E79CC2BBFC;
	Thu, 27 Jun 2024 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500448;
	bh=tRy9SRr/CPS5is3VqgbmrQWOvnGMxmc+yYVzPk/KzTA=;
	h=Date:From:To:Cc:Subject:From;
	b=QuTRXVnx6PQBh3Ifc3bXcfIpsmGSUWK7UmFsmOtWiClWmmiX1jZ7d9kZJJyoJVDf1
	 KrxjtYz3bOxoHEuohXern8M3GICcIMBn42oioz2FlVKAkA/b6uIRoRnbdgDsCD9781
	 AzgDDSt3oQzO6+B6P2WXTlomfFvWZVIQRVfmo3MLUJUByOXt78cl5e2XreZ+kCqr5I
	 6CIoBryX3TjHSM5FiurxGeaudMw8gBB5qTAsfsPhNGYoxt7D/WA3tEJDLPde7s9SXe
	 dxCq10u0biT1f8z05cIX2gnoWy2Xx8wSGM5PuB6Ti8yRXmhEM/EQZDwDfp1o0ljKtq
	 eOiq6lLGp5vng==
Date: Thu, 27 Jun 2024 16:00:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Frank Min <Frank.Min@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <Zn1-m_-MGxsjV9Se@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ue3LuKhK8SGwUSeP"
Content-Disposition: inline


--ue3LuKhK8SGwUSeP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c

between commit:

  f6f49dda49db7 ("drm/amdgpu/atomfirmware: fix parsing of vram_info")

=66rom the drm-fixes tree and commit:

  9a55c77978308 ("drm/amdgpu: fix getting vram info for gfx12")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index 2e13c7c4b2b41,f932bec6e5345..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c

--ue3LuKhK8SGwUSeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9fpsACgkQJNaLcl1U
h9CRsAf+LW2q7qC2ENz5xQFPQCynOBKV+Y8tZnTt/hPYgOCAVPjdfE9Xf9jOheq1
8TsaTh6EnBEQgfvjE2wa4x5Jb4oEzmhq97vbvE9QGsvS6g6SgJqgZf3ErW52jklc
06jh3/iZFbrLV/mRIXfw92Mk45gNc4B5/wsEP+5b3oij3Rp29bkyp4CpiSQTKmWG
S3nj601uy2iGqmhscshng6neVOFAc+rqhnWsWKhE/lbOO17hJCul7GWsjrYXwZFy
wDeNTwjbuJpqsiqmjOCtJHJwftxmLY1nT3xzGX5lcZK6Hll+VA3KoBLCjvW9GZoC
TpSv+z6ZW8hTd+xl3rS+WoWkqK8txw==
=16uz
-----END PGP SIGNATURE-----

--ue3LuKhK8SGwUSeP--

