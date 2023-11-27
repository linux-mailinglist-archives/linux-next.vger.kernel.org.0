Return-Path: <linux-next+bounces-91-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39F7FA69D
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 17:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A0CC1C20CB9
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 16:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D85A35888;
	Mon, 27 Nov 2023 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTQIm9VH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3017531A60
	for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 16:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F78FC433C7;
	Mon, 27 Nov 2023 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701103096;
	bh=Jc3uA/l1xBlBTvWQCweF4LiIVoRMESPYgni0yWyW2Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTQIm9VH39NKodbZyyDvRXxu01IHJDuYFiSXB4jaBnPiFhXMweVgff7c7Ccb6CS/F
	 LnM3e6/tBcAaiZUxblFUn6aj9+y55YxbyqHf32ns3pwKhPRxDBOHY51UCo6QxclrTB
	 faIMrxb/8qLlPrMx7z6Pi4ppFSX5Zqo/sR0uEDxTb7xgsFOFqSUVszxMpSu8QMvFNw
	 Cph8H3g+F+BZzwmh/K0i3MIMjzxYI85fQ/0vrnLEeWtAFhcBwB6EnIgiLYbVYfKyG0
	 /N2EPflRHlJAso6QDwGSjJVgRFmyhkYoeJWlLxO/9eIZwiEBRJNsyUGE+x1qB1l0ZH
	 I27k7+m89VOGw==
Date: Mon, 27 Nov 2023 17:38:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: rafael@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-next@vger.kernel.org, sfr@canb.auug.org.au, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org, linus.walleij@linaro.org, 
	Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
Message-ID: <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qtwx6kzcm62expan"
Content-Disposition: inline
In-Reply-To: <20231127051414.3783108-2-victor.liu@nxp.com>


--qtwx6kzcm62expan
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greg, Rafael,

On Mon, Nov 27, 2023 at 01:14:13PM +0800, Liu Ying wrote:
> Export device_is_dependent() since the drm_kms_helper module is starting
> to use it.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Newly introduced as needed by patch 2.
>=20
>  drivers/base/core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 67ba592afc77..bfd2bf0364b7 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void *tar=
get)
>  	}
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(device_is_dependent);

So, a committer just applied this to drm-misc-fixes without your
approval. Could you ack it? If you don't want to, we'll fix it.

Maxime

--qtwx6kzcm62expan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWTF9QAKCRDj7w1vZxhR
xb0rAP48ijAtHc/miJhU3dvSZ7sHTokRzAIYyqw7KRtdReE2hwD/ahQdxB+702cR
W49SZmDCxK5raw/Hq4Pk4Xi/s7ICwA4=
=B8s7
-----END PGP SIGNATURE-----

--qtwx6kzcm62expan--

