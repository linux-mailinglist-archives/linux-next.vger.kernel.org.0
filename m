Return-Path: <linux-next+bounces-3785-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 821F79764DE
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 10:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C8A41F22297
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 08:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B1C191F6E;
	Thu, 12 Sep 2024 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="un8LgfJa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E5C1917CD;
	Thu, 12 Sep 2024 08:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726130994; cv=none; b=K9oc9MgdCysxq3j37OD8SbQE+DONS8eCVIRjj4PuIiUuOJPppbvg5HC7iD8UOO7FCWFYORmyv98Wn2Ddusfsez48M+mm1oeBuERHps7YM+pQJXEHiX2nMBQdJ1GqnkZ8Sjd2EP5IGRW2fbQ8h9HdWDcmB3Oq2XYhd+TdyoiXw4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726130994; c=relaxed/simple;
	bh=Jd9v01cP4HdcHyXeVriWTfvX5JxQB/gQYf+5wrKHZvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CG1VkPkNey8VjPcQUzW+pK2AeXT9rYMF0Nn8vlMe7rYCwFuKqoNEuZh7KtjJYverdvl9Ei/UIIIraEfC/B2Rgy73ZtYiNluk6MFspievj3HCfvLRRFfmUHFbAnGWslUGJAKD7eGZ4ZY0GLgt3GemPmoeopWpfU41PV+kAWZrPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=un8LgfJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD668C4CECC;
	Thu, 12 Sep 2024 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726130994;
	bh=Jd9v01cP4HdcHyXeVriWTfvX5JxQB/gQYf+5wrKHZvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=un8LgfJaMwc0B1O2hFKyekGcrGhOjrTXLUZ0mz5WjIQzOnecq1fVTjIapH6l3kzUl
	 wD3xsqShyM91POfJcZInF7K/Oahh7mS4zFJD9nHtP4Ecq3qD5+190JxV8KJHFRFr9Q
	 M2HHC+OF+jjYKsjNxNo4NuRYaVKUSvF/qsfocQOq6pSO77887TYid49iXso9DBD/+l
	 9XeiZYEYV3ZTI3lI5wLawQKZMPYTN6YvHP2v1H0zyYSBxTxegG4wk0/75omO7x7fhg
	 Qscv42alQRqm9djGzGxW/w+H3Ki2MmFwLU4ZLbAHp0YWVFdKcln+9dZZYmmrdYIHME
	 A93kD2miphCUw==
Date: Thu, 12 Sep 2024 10:49:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20240912-attentive-brown-crab-cefccb@houat>
References: <20240904163018.214efaa7@canb.auug.org.au>
 <20240911180741.45311006@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nok3d3zohz5eelhj"
Content-Disposition: inline
In-Reply-To: <20240911180741.45311006@canb.auug.org.au>


--nok3d3zohz5eelhj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 11, 2024 at 06:07:41PM GMT, Stephen Rothwell wrote:
> Hi all,
>=20
> On Wed, 4 Sep 2024 16:30:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the drm-misc-fixes tree, today's linux-next build (htmldo=
cs)
> > produced this warning:
> >=20
> > Error: Cannot open file drivers/gpu/drm/drm_bridge_connector.c
> >=20
> > Introduced by commit
> >=20
> >   9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER modul=
e")
>=20
> That commit is now in Linus' tree, but I am still getting the warning.

I just sent a fix for it

Maxime

--nok3d3zohz5eelhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuKrLgAKCRAnX84Zoj2+
druDAX4mW7CyP7Cq/p7kOEhweCTJHolFMFcZqkHJ31gsMZ2X6hw11IwTrq5Za58w
ANO3ZtsBewdb/gOa642wDfucqt8bKuS7BtvSoPvY7gZvT1iIWB6LUQ462j+g07/H
CoSKQerTHg==
=786n
-----END PGP SIGNATURE-----

--nok3d3zohz5eelhj--

