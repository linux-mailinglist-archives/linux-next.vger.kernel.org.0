Return-Path: <linux-next+bounces-8095-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47463B35173
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 04:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60C5B1B2835F
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 02:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DACF1F75A6;
	Tue, 26 Aug 2025 02:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="L5WSt5LD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E692C9D;
	Tue, 26 Aug 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756174409; cv=none; b=eO6+g8Y7XwxOGoROt0RRemfBu6J+mzMsWXHXGq0RpBla2GP169xioD81+/bP7IohMYvYCS7trTH9yK55vbSb/CsDvEB8ScNlLqP2htGYhM5H7ibkfcDUWh31v58PSHH1KRVl8QJqu4vTHBfj98vJUhNv1UA6R9jJdzHKtefGdu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756174409; c=relaxed/simple;
	bh=egCMPQ+qHJ5nut2FDsKpa+WMH0WNi3aLL+6AAZy4+JM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vq8v08PObdXQCoDsZaU5cGq2dujpK9B9Q1pNngQa0PBcYwiWVlUp5zhcLpV/p/scKa6QFPYVef2qhv6c3A8tSo+/Lfk6qPJdzXTZyFGmEwCHmH+x3IdYpp8aPh1yTa5bYjw6Dbf3l7QJJqvRoKbcs0QG9iwwK64sNCMccDJ6cqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=L5WSt5LD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756174401;
	bh=6xVpkuMJ+D24KXzN4/hikh/iXPb4SPvcqA7zNwqGG4s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L5WSt5LDmhFBFNOMid9a5+lLayu/YUlxYBzyIT+RBPbwnwy6o+ONKFhtNCgORPnOT
	 bqRHQPbR6yNpGlBzfzpJMYR61/krRMcPLDXn7z+6fVWo4S3FOATwLilZtkBtsFYsSD
	 RKr0ThMrcK7y9m9LVcDu70Pllv1utrru9AtnXrKpuEzePIQwMyYfZQd69Tr3fx2iYM
	 KAUWB1ZtlaVkzrRT0jzjRyfUKucLEUtaGPNGH3iZdmATBscNowo629AzaWlo4J6eXm
	 glJ6DziLnyhmwsl7o84WcbzBRLcceS9JrmpUSpwluMBq0zsd8SHP+cz+AOV9jwlvoJ
	 WDRrxwESv2uJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c9rmc6Wxdz4x3N;
	Tue, 26 Aug 2025 12:13:20 +1000 (AEST)
Date: Tue, 26 Aug 2025 12:13:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Inki Dae <daeinki@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>, Kaustabh Chakraborty
 <kauschluss@disroot.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Message-ID: <20250826121320.4931c6eb@canb.auug.org.au>
In-Reply-To: <20250821112740.75a41814@canb.auug.org.au>
References: <20250821112740.75a41814@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/82HYJ/7/QUOw_drQmrEUpQk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/82HYJ/7/QUOw_drQmrEUpQk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 21 Aug 2025 11:27:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-exynos tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/exynos/exynos_drm_dsi.c:158:20: error: 'DSIM_TYPE_EXYNOS7=
870' undeclared here (not in a function); did you mean 'DSIM_TYPE_EXYNOS541=
0'?
>   158 |         .hw_type =3D DSIM_TYPE_EXYNOS7870,
>       |                    ^~~~~~~~~~~~~~~~~~~~
>       |                    DSIM_TYPE_EXYNOS5410
>=20
> Caused by commit
>=20
>   d07e4c00696f ("drm/exynos: dsi: add support for exynos7870")
>=20
> I have used the drm-exynos tree from next-20250820 for today.

I am still seeing this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/82HYJ/7/QUOw_drQmrEUpQk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmitGEAACgkQAVBC80lX
0Gzj6Af/UzgSr3h9un6rGLlhj07ajABW24qv8shfD1H+3TTpzA8qbWhqfEa/Czke
DzksZ3u0xopZK9I2bKXGRwUHnvPeaAak8gk/hYoK6IKhjGsIMJZ/ohzWaKrR2ubE
CZEFtUxNJMixWFrGVEHxpvq/nbEEt6hTuXjhtFt3pzH/OpnRffOEh5Bhi4DsvQD3
1xGIl5qIhKdX7f8G0HE71HmEQ38ulJMcozFqeNfs6VXtNJ4P6Ismg+GCmOxIWh/l
CWAVoGvP2By0VHQnwiiE0fyBeu1SP7tVUVqsRcZN3Q6tHAA6APBKGUvNuW5IyWzt
M4qhdGWYwCVc4rEZlJ3T2ebJwVy2fQ==
=Yt29
-----END PGP SIGNATURE-----

--Sig_/82HYJ/7/QUOw_drQmrEUpQk--

