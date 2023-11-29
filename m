Return-Path: <linux-next+bounces-123-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021167FD6CB
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 13:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 904C0B21673
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 12:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4041F1DDEA;
	Wed, 29 Nov 2023 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJlY2rBo"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370E1DDDF
	for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 12:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF37C433C9;
	Wed, 29 Nov 2023 12:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701261170;
	bh=3rg6InLFJYoj0t56EbSzonGCmEtUIs3+UyoC8G9109k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJlY2rBoX/wUunC8QosbeZWCaearH7/13ya1mqQXLqYSRWaNk6vTPX37FlaTuOvQw
	 pJmuZ46UWl8lXat1EEuUg7gYCOJSdxSTEvbZyk8s/mD0FiuGmP0Bor0304jfbMox+M
	 BbU7LXd/o7peBNq++BKgkUhipr1dnlmBktw89Ba8mbX2AJqgKTh1udfDED5bjSVao4
	 /qD84HoSYXilbTniRywx3EEd2Tz21kPJqDwKgQu9pF47KtIGyGkoV4m+XL9SNfk9a5
	 RVn+4Sa+xqJM4IPKiFenquD5EbVP1r9VAMex54H7sCexwXz9sTTmGBxa5/cL1AwEPF
	 Q2tzV0QoCberA==
Date: Wed, 29 Nov 2023 13:32:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, daniel@ffwll.ch
Cc: Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, 
	gregkh@linuxfoundation.org, rafael@kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, angelogioacchino.delregno@collabora.com, 
	ulf.hansson@linaro.org
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
Message-ID: <d33ovl3ox2u74jbik2bcraeqiqplqoc57p4quapdyydqlyzrf5@vlhszortxfio>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
 <k65hxlckssjd46nsrlly6vjrr5nnkrakouzw5pmxgbf6ui3mdl@5ny7j7blkwyj>
 <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yrzhzqk3x47g4p6g"
Content-Disposition: inline
In-Reply-To: <CACRpkdbKwycpjuhMfnriqMUcbmwCTb3vJzgzCF7+ARax54q7WQ@mail.gmail.com>


--yrzhzqk3x47g4p6g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Nov 27, 2023 at 11:13:31PM +0100, Linus Walleij wrote:
> On Mon, Nov 27, 2023 at 5:29=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Mon, Nov 27, 2023 at 05:03:53PM +0100, Linus Walleij wrote:
>=20
> > > > Liu Ying (2):
> > > >   driver core: Export device_is_dependent() to modules
> > > >   drm/bridge: panel: Check device dependency before managing device=
 link
> > >
> > > I just applied patch 1 directly to the drm-misc-fixes so we don't hav=
e to
> > > revert and then re-apply patches, because that is a bigger evil. (We =
can't
> > > rebase these branches...)
> >
> > Erm, you did wait for GKH or Rafael's ACK to do that, right?
>=20
> No.
>=20
> It is a bigger evil to leave the tree broken than to enforce formal proce=
ss,
> and it is pretty self-evident. If any of them get annoyed about it we can
> revert the patch, or both.

Yeah, I definitely understand why you did it, but I don't think it's
something we would encourage in drm-misc.

We've discussed it with Sima yesterday, and I think we would even need
the extra check in dim to make sure that a committer shouldn't do that
without dim complaining.

Sima played a bit with it, and it should be doable to get something
fairly reliable if you use get_maintainers.pl to retrieve the git tree
(through scripts/get_maintainer.pl --no-email --no-l --scm) and figuring
out if only drm.git, drm-intel.git or drm-misc.git is involved.

If it isn't, then we should check that there's the ack of one of the
maintainers.

Could you write a patch to do so?

Thanks!
Maxime

--yrzhzqk3x47g4p6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWcvbwAKCRDj7w1vZxhR
xXfXAQD+NPkwoY0m8+ozRhmrZbtB+qRlugYpDd5BPUriECj8VgEAk7LOfR+2wGYS
hf8XQcHi0BQQjrr2sfXIgq5DKevijgI=
=CWHT
-----END PGP SIGNATURE-----

--yrzhzqk3x47g4p6g--

