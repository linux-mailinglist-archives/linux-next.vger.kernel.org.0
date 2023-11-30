Return-Path: <linux-next+bounces-142-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4B7FEC7A
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 11:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3370FB20D0B
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 10:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009133B1BA;
	Thu, 30 Nov 2023 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GO3DnmRX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82E1C8E2
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 10:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EEAC433C9;
	Thu, 30 Nov 2023 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701338746;
	bh=O2WWoxTEi44H1URmj3ZurepyAkSwNGHn9e5XUr9Kk2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GO3DnmRXyD+X+wrA5UhtLCTd4I2x6wWVpYZg1JWHbxw4m7OYujjvNEjQhxBod6gZi
	 zJ34SdZ91eQCPpsfA3A/Ds/pniN7YuNOQo6pEpAOlXUbHykcIllhtvzZvdqJHsJ6wH
	 noSmUGDd1719TwiSX5gzGMyzj6QcaZ0RK8wxtZ4yIFO+ELn8Z5ncS5k0Az5qsd7G6o
	 3cap8LKytjF9hFciuap2Uk22V17c0kxgbZaboKDCJWDGNxqxsMva+T+m1sVdiBoQ7Q
	 SV+1iLCPzyzRXGH9mHU46EzgnTs4fP+/ujcAa+C+KxUViqEz1mywLi/om/KBTRYdIK
	 cgwCE1C5wanww==
Date: Thu, 30 Nov 2023 11:05:43 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: daniel@ffwll.ch, Liu Ying <victor.liu@nxp.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, gregkh@linuxfoundation.org, rafael@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
Message-ID: <cmebtbqvckxlscimbtwgkyf4bkqqmr6uprqaadakz2kcvwxx4t@kj3gvgopezyy>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
 <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
 <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com>
 <d33ovl3ox2u74jbik2bcraeqiqplqoc57p4quapdyydqlyzrf5@vlhszortxfio>
 <CACRpkdb1DmH2NJ2nBRtGaB+9Tmbn1tzXafDSpZVxjCFnexz=3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5ujbigdloignsuu"
Content-Disposition: inline
In-Reply-To: <CACRpkdb1DmH2NJ2nBRtGaB+9Tmbn1tzXafDSpZVxjCFnexz=3g@mail.gmail.com>


--b5ujbigdloignsuu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, Nov 29, 2023 at 03:38:35PM +0100, Linus Walleij wrote:
> On Wed, Nov 29, 2023 at 1:32=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> [Me]
> > > It is a bigger evil to leave the tree broken than to enforce formal p=
rocess,
> > > and it is pretty self-evident. If any of them get annoyed about it we=
 can
> > > revert the patch, or both.
> >
> > Yeah, I definitely understand why you did it, but I don't think it's
> > something we would encourage in drm-misc.
>=20
> Hm OK I guess, it can be debated but no point in debating it either.
>=20
> > We've discussed it with Sima yesterday, and I think we would even need
> > the extra check in dim to make sure that a committer shouldn't do that
> > without dim complaining.
> (...)
> > Sima played a bit with it, and it should be doable to get something
> > fairly reliable if you use get_maintainers.pl to retrieve the git tree
> > (through scripts/get_maintainer.pl --no-email --no-l --scm) and figuring
> > out if only drm.git, drm-intel.git or drm-misc.git is involved.
> >
> > If it isn't, then we should check that there's the ack of one of the
> > maintainers.
>=20
> So check for any code that is hitting namespaces outside drivers/gpu/*
> Documentation/gpu/* or include/[uapi/]drm/* that it is ACKed by the respe=
ctive
> maintainer for that area of the kernel?

We can have something more reliable if we just check the git tree listed
in MAINTAINERS (and returned by get_maintainers --scm). That way we
don't have to whitelist anything, and it will always by in sync with
MAINTAINERS.

And if it's not one of drm trees, then it requires an ack from someone
else get_maintainers will also tell you about.

> > Could you write a patch to do so?
>=20
> Patch dim? Well my bash skills are a bit so-so. But I guess I could
> learn it. But did you say there is already a prototype?

My shell skills are also fairly limited, so we just discussed the
solution but didn't do a prototype yet :)

Maxime

--b5ujbigdloignsuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWhedwAKCRDj7w1vZxhR
xVJyAQC/BB7GistGp1TFQsAJh1CdMKlI3ncYUBM1Gp2WoVScbQEAjJ9ZU7eizhiQ
9g0i2RZGyKnuCldJMbMjRSH6RTnYcAM=
=WW3o
-----END PGP SIGNATURE-----

--b5ujbigdloignsuu--

