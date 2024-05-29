Return-Path: <linux-next+bounces-2419-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCCE8D3125
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 10:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E60BB2B1D5
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 08:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3399944C7B;
	Wed, 29 May 2024 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnUGqoJR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA3F374F6;
	Wed, 29 May 2024 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716970908; cv=none; b=EZM6SOAijFte15q5+8nGq0KN5zycxCHXrW84h32rWOt4wISeU/2vWQatMPB/B8agCNfGadYl0stzSBfYfWSp7GL5JR2SJagr35tbAMKY1QvST0Vx4qBXArYA5zs3RpDItMsp0dJrMKOw7Q5e3PFQRR2x+iTYQVzL8j++EaifBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716970908; c=relaxed/simple;
	bh=6BK6+4ZTYBHRXypx7xtkwUavViCKpZdvKxYGc7RKxGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPplvFL1B7SPCrRmdHpTt1LSc4R0ZHtVb6DmD+iqK7qq19RnMH7LSgh2Eujrcye/Qqt9Fg+ezH/GnmUWOHJ1qGXllTQ8xaVtBc1ekrxpRpm/0IT7WMCdZpWJqa5QPCab9h1JiigReqNWZBIzfK9dlWGyoYlH8f39wC0JaBUQYWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnUGqoJR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B943C2BD10;
	Wed, 29 May 2024 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716970907;
	bh=6BK6+4ZTYBHRXypx7xtkwUavViCKpZdvKxYGc7RKxGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bnUGqoJRpH4TlPUymqlOoZaD5R2mVfBwT0MDS00Xof4mLDF0y+a6wX147kY8Iw0OP
	 uH7JQZq3Yg9s2FBWS3Ug13oI94nM1LluDQbDlJxXol9chjHcoZDqY4CekxV4Ubp1+x
	 mOWpcJ2VZfVJzC4T9q5mhEpW77j5gK2N10ZffPgUXKg/21GexN2p1LepTR3ciXhZ0l
	 z2P7pRqJHAtbXRp5rCw1wC45mSUHmCwLpRiJzR6Jz4v8yR+YMCLquujeS0sxItVxWi
	 JpiiW3spmVpkzQV5wfA+/qNuVYoWrpPfR3Unm6gDFOcoWbWmYyXfqz7fFQsdGdH743
	 XLKQirTJCwCXg==
Date: Wed, 29 May 2024 10:21:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240529-holistic-careful-jackrabbit-baaf5a@houat>
References: <20240529123531.324226b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2uj3c5rwxorjlbxh"
Content-Disposition: inline
In-Reply-To: <20240529123531.324226b4@canb.auug.org.au>


--2uj3c5rwxorjlbxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 29, 2024 at 12:35:31PM GMT, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c: In function 'sun4i_hdmi_connector=
_mode_valid':
> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:17: error: implicit declaratio=
n of function 'drm_connector_hdmi_compute_mode_clock'; did you mean 'drm_hd=
mi_compute_mode_clock'? [-Werror=3Dimplicit-function-declaration]
>   213 |                 drm_connector_hdmi_compute_mode_clock(mode, 8,
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                 drm_hdmi_compute_mode_clock
> cc1: some warnings being treated as errors
>=20
> Caused by commit
>=20
>   ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
>=20
> I have used the drm-misc tree from next-20240528 for today.

Thanks for the report. A fix is now merged into drm-misc-next
https://lore.kernel.org/dri-devel/20240528151056.2104153-1-mripard@kernel.o=
rg/

Maxime

--2uj3c5rwxorjlbxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlblmAAKCRAnX84Zoj2+
ds1UAX93OosObSLimqigmxVRb3xOAr040Zmgggq97UrYsYy8/uLiW1fvXF14BJ4X
muFdptoBgOiq3eiKYRsjDSDylPraRW9mL9qdfgUhPiKax4Nqu4Q1Ex3T+DjuHTKx
pfynwvtq/w==
=VNFU
-----END PGP SIGNATURE-----

--2uj3c5rwxorjlbxh--

