Return-Path: <linux-next+bounces-9152-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1DC7C51D
	for <lists+linux-next@lfdr.de>; Sat, 22 Nov 2025 04:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F4054E14E6
	for <lists+linux-next@lfdr.de>; Sat, 22 Nov 2025 03:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B78D42AA9;
	Sat, 22 Nov 2025 03:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tVoIRY2w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1DC21348;
	Sat, 22 Nov 2025 03:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763783191; cv=none; b=Rd4FspCEIYvNoXonj4/sLs+JFAzRxobV4iiZx1UQeEMz9xDT/8qDoZRUmdssUmgCkVy3IwlEMTI6FterKiHFt3mQ28NJO+l9C4kUIuI1COoOFX+iMm8jHP14Nrk1A7KorkHCGqOrMVvN8OK9E0lY5WPmrKb1MtL3W3t6xf71He4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763783191; c=relaxed/simple;
	bh=1PWlpAxv9qHCUg0Lg+xjbR8jZhun3jTGIb0Fa9LsBX8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KbPBvsxZ6ZnIRJgZege9hTP2mLOvcW45LMshEAWcASdDFNslfvXS3tT+B1l9wLHAL7iysT/2DfYGTasF/7ORSH8i9HAYnPz0Ve8somGmqVSkGNBHkQvrc9N0nLcvlqbgNrq32hcfLRe//pOTL9ZbV2OPNTVClAxEcC3iWHaLNkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tVoIRY2w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763783182;
	bh=wNOkLSzojhQ1ZFLrlyHfJzdv169QnCIrn+vZOSuHhWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tVoIRY2wNZz7o9pEZyakifAKu9S0iCA8glZJD+XtCG1YcJgLZ+/dUVCngOwWG2NBQ
	 ejFvYOdPzrARz7lmJWjp/5fDvHyjzCF/pxzCZAUg8rfoIA1tvvp+RcVH7HGHZnHfSE
	 Nj+Kbxa5lveGBZMbSs9xKbvbrCd3CnOr8ei1lg1ks58kq48poEsotzqEFJePTu9v7y
	 U6gAYsLGwzf8r1StFgt5gDrounJzwlOQu1Tw/uNCEOmQPocKxOJxDrtoOkOYxYkSIT
	 RXOTzv4AYAMda03lG/ERFyguCSUZId4GYHhnD7wibEdfdGyuASfYf1eC8WApYVnaLc
	 9ux+0KP4AqoFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCygK2RL1z4w93;
	Sat, 22 Nov 2025 14:46:21 +1100 (AEDT)
Date: Sat, 22 Nov 2025 14:46:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imagination: Document pvr_device.power member
Message-ID: <20251122144619.73fa991d@canb.auug.org.au>
In-Reply-To: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
References: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cm/GPoMjwyc8_m+4cR7fODW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Cm/GPoMjwyc8_m+4cR7fODW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, 21 Nov 2025 15:20:31 +0000 Matt Coster <matt.coster@imgtec.com> wro=
te:
>
> Based on the build target indicated in the report, I tried (and failed)
> to reproduce the reported warning using:
>=20
>    make W=3D1 htmldocs
>=20
> I was, however, able to get the reported warning (and verify that this
> patch clears it) using:
>=20
>    scripts/kernel-doc -none drivers/gpu/drm/imagination/pvr_device.h
>=20
> Does anyone have any ideas why my invocation of htmldocs didn't seem to
> have the same effect? Is it just simply that the relevant doc comment
> isn't pulled into any of the rst docs; in which case how did the
> linux-next build catch this warning?

I just do "make htmldocs" on the final linux-next tree each day, so I
have no idea what makes a difference, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/Cm/GPoMjwyc8_m+4cR7fODW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkhMgsACgkQAVBC80lX
0Gy2Vgf3et90wX9wzyf8/OHK4kFQbn0dqj9uWfZr8X7qKrJXo1N2B4RIF2izCDHo
I1W0TrbQS4BVlMggKbiYuy9cmYDUmhCPPC5KCyf0XM39+sbEjV0dzzM3OU1yifyy
kwiE7QesfVsCt4a4JIRiWLErnHjQICxcPcxMzIQirPYNHezHYC9LqA3emLBU7WCR
haLhQYNRUQJ+gZugT9xAoSiRUiRchymH4YEUvfiIrgaF1DG1pwx3SbUz135YnZIW
9UXba+CrVLwVgk5iOJUVw4ZA1v1ei26S9ysJFriJpNrSGiO+hZb0WmcSmFvwjj1u
Xzax5hXklXMAQUUws/fTZp4qHhAg
=hEPY
-----END PGP SIGNATURE-----

--Sig_/Cm/GPoMjwyc8_m+4cR7fODW--

