Return-Path: <linux-next+bounces-8159-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C8B3F28F
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 05:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C314A1A849D8
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 03:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA3421770C;
	Tue,  2 Sep 2025 03:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KatPvi7g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961DE19047F;
	Tue,  2 Sep 2025 03:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756782194; cv=none; b=A8iH5Lv1DgGFaIafGmPHNJiNe2SbLLu7zb6wOAjDUq2VR/HwOBhB0wtregsYg4mjGGzgCHRTc9hks9JJqSJJ2rugdr+JWmjm+rx5e6I7IODAXsQKYckc/vPpVlPB+ZZYAEaxxbKWiKqdysg8lMvuC7ekTUPaTzR5IRZxK69BEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756782194; c=relaxed/simple;
	bh=HF8hvu7/eTPhrpjGuV4Rdrgg9P/kYFx9A8SmQQTF7U8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Exfm6vavL8qjAIEzbRblQCg4fWP6kWQhvYRz7126ab3RjkyvFj4uYcB3XtYkx+7dvBm2isW0vZP4E3aeMcNJ5Hj5s1NG3VKP9U+2nxETGPxhpPcJnPn/hyBNrh4MDidvij5Z6zRWt4EaWodP+4N7pdNXH0MOVT46UG+ndAN9Axk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KatPvi7g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756782186;
	bh=DC+oKZZYxqWcrJpyWP/DWxEAJRgFryniOiFt72m9hk4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KatPvi7g1Nw65lso4s10kJSihpm4gZXr/NsjhquAU2bDC/9x1dZ9mng7zM602oBb4
	 2o1bbgA5+C/PHqUuPuZAp+tccWaQxWmHQOse65y4+pzjhYnzUQCWzRLzoX3V+MFyZW
	 kZJzF569bj5GNoaWjw5iVSPOrNYGI9VFtOUnGZBePOU+ea06G/51A/XAbJGclF8uuS
	 I6twKv1dwt7DNkOSLO6XRprCw6PNUPmcJYjx40QPCCEL/KvpggBlFSODEK2WT7NEDe
	 L3uwjLYr83KzoyVdJGnMAvKbM5sdmTTBimeXBSwBuR2KMYblJWphCznhUircmiRxT0
	 iaP6XCN7FGSWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cG9Xn15lbz4w9V;
	Tue,  2 Sep 2025 13:03:05 +1000 (AEST)
Date: Tue, 2 Sep 2025 13:03:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Inki Dae <daeinki@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Kaustabh Chakraborty
 <kauschluss@disroot.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Message-ID: <20250902130304.1f80f4c6@canb.auug.org.au>
In-Reply-To: <20250901122226.20a39858@canb.auug.org.au>
References: <20250821112740.75a41814@canb.auug.org.au>
	<20250826121320.4931c6eb@canb.auug.org.au>
	<20250901122226.20a39858@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+b2F+nsi+ou0j8IYjHeDy/x";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+b2F+nsi+ou0j8IYjHeDy/x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Sep 2025 12:22:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 26 Aug 2025 12:13:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Thu, 21 Aug 2025 11:27:40 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > After merging the drm-exynos tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >=20
> > > drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:20: error: 'DSIM_TYPE_EXY=
NOS7870' undeclared here (not in a function); did you mean 'DSIM_TYPE_EXYNO=
S5410'?
> > >   158 |         .hw_type =3D DSIM_TYPE_EXYNOS7870,
> > >       |                    ^~~~~~~~~~~~~~~~~~~~
> > >       |                    DSIM_TYPE_EXYNOS5410
> > >=20
> > > Caused by commit
> > >=20
> > >   d07e4c00696f ("drm/exynos: dsi: add support for exynos7870")
> > >=20
> > > I have used the drm-exynos tree from next-20250820 for today.   =20
> >=20
> > I am still seeing this failure. =20
>=20
> I am still seeing this failure.

Today, I have just reverted that commit instead of the whole branch,

--=20
Cheers,
Stephen Rothwell

--Sig_/+b2F+nsi+ou0j8IYjHeDy/x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi2XmgACgkQAVBC80lX
0GxL0QgAi41jeaE5Qn2T1A78VvF7HiCC39PD+ifyWxGBOfP/fNjSCwS2+1SKx7+i
ZaaNXjzt7TVDaP5SntF6X1oa3qqU1RXgpVupusH0M1E6URngmXkrc3QxxJyz+/Pb
MxiKeYoGaiyW/OdzWBpxCZ1WempBamr0mpO2K4EScDuGugxx4QcJ4E6x0R/o8PjV
frpR8XcdkErmd8eq14m2Y6fbO9DaZ+jI6I/8Hok2cfU9ARduyNt5RMF0uNq1rOuG
ozGO4VQ463Yu+hlysos6wZD1QCRxIedUbqK4PT9HKG7siFFjyWoLdqG4IG+pbqnT
v729GqxxHkbdCidKyFMKb+WnNyN7Mg==
=hZOr
-----END PGP SIGNATURE-----

--Sig_/+b2F+nsi+ou0j8IYjHeDy/x--

