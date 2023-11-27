Return-Path: <linux-next+bounces-90-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B17FA663
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 17:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EE2EB20BE1
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 16:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CED5364A4;
	Mon, 27 Nov 2023 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXdwtQOF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E6358BA
	for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 16:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD38BC433C8;
	Mon, 27 Nov 2023 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701102562;
	bh=P7uKPy4Si6jMYdiV0VL4sw0N58VgoAw1ff3tv2+3244=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXdwtQOF7BnXpOlbUFB89Bi1/Kb2wgfZDgIP/NF5Niu9ydpnkXFWQWKDxIYNc5nz3
	 GU8X1Uy03kciMgch481+XBWKf67cuWngkaLOseWgtMlwOCphm68okTEpom47c7n5N4
	 8w1JYt2EURLmxXAW35oQiFWqb1SP39fErzz2PbLXJyq9q1sGaIpCIF9+wdNCR0/MVt
	 q04N1k+tCXrR6whXPcf4100JBh1nWr7FA0EMBvKW8j286EBDhfOdGVsUJjvfeBR2YY
	 B8aD9GJqYiOd+r+ctcB+YTLkqdiO9In5fl38oezRAYxdj7AERlMS4ZuB0ifX3kAgOj
	 GPbONkeWZU/bQ==
Date: Mon, 27 Nov 2023 17:29:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, 
	gregkh@linuxfoundation.org, rafael@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
Message-ID: <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ww6pvplr3hkztgem"
Content-Disposition: inline
In-Reply-To: <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>


--ww6pvplr3hkztgem
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 05:03:53PM +0100, Linus Walleij wrote:
> On Mon, Nov 27, 2023 at 6:10=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wro=
te:
>=20
> > This series aims to check panel device dependency upon DRM device before
> > managing device link between them.  It fixes eariler patches in v6.7-rc1
> > which tried to manage the link.  Without this series, the link fails to
> > be added for dependent panel devices and hence relevant panel bridges
> > fail to be attached.  A real broken panel is "novatek,nt35510" defined
> > in arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts as reported by
> > Linus Walleij.
> >
> > Patch 1 exports device_is_dependent() to modules as needed by patch 2.
> > Patch 2 checks device dependency before managing the device link.
> >
> > Note that patch 2 is already in drm-misc/drm-misc-fixes and
> > drm-misc/for-linux-next-fixes.  Patch 1 needs to be reviewed and picked=
 up.
> >
> > v2:
> > * Introduce patch 1 to export device_is_dependent() to modules as neede=
d by
> >   patch 2.
> >
> > Liu Ying (2):
> >   driver core: Export device_is_dependent() to modules
> >   drm/bridge: panel: Check device dependency before managing device link
>=20
> I just applied patch 1 directly to the drm-misc-fixes so we don't have to
> revert and then re-apply patches, because that is a bigger evil. (We can't
> rebase these branches...)

Erm, you did wait for GKH or Rafael's ACK to do that, right?

Maxime

--ww6pvplr3hkztgem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWTD3wAKCRDj7w1vZxhR
xevGAP4/iVJ2RG/YQlUAysxXeBnGz+ZVYH2/pWpD304wlxPcAQEA5qk/iH4bHDC5
ZVb/u/aTM589OM9H4d1Kr0Tv3Ib7TAM=
=pSsr
-----END PGP SIGNATURE-----

--ww6pvplr3hkztgem--

