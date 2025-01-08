Return-Path: <linux-next+bounces-5097-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4DA06773
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 22:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782FD18899A8
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 21:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8A31F4E50;
	Wed,  8 Jan 2025 21:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h4SnuKVt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850FD1F3D3A;
	Wed,  8 Jan 2025 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736372862; cv=none; b=UtXuPiJ14VzRfmyEnJ3t0dGCqddFW5cE0p0h8IkBoJfd3EvmBnCnWQ4EAP/cJbVVhNLrC1qcRTYoCeR05ZaECjTGZYeVYuh35un4hwnSKX0YSHP4U5W8wtn/3xTmiaoAsUfVpoekKvZVpAt+EKIDGSySlADjBLqf5NokAi0k0o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736372862; c=relaxed/simple;
	bh=SLU9ufOcysmvRVOdMjyUbwG00vJlLTuWjTebZw2GUdo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vml0AI0tXMPd/z95mJJWqNpxfMhWvYdOsxGJjtSXIiIUVivT14v/IOec7MwO91QFi9GbWKhdm39JhxkihNcTxubat1QdlJ0+nTBCMWmTIvW0F9LDAzyg1BCrhheqeDTpZ2PqYYtOJzJT9hxp9m7tezodoGThv6qjmERsQRluzSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h4SnuKVt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736372851;
	bh=cN9Bnnh2Xdd8PAZnw6ESIP15PeyN1tqx9SRAkJj5Fnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h4SnuKVt8xOL7Gf6shSlGK3mjWFYU/cC/retM5P7ad6cXxsF/4ECrSORIsDHFq5dP
	 wP/9dBBC9DJUBuqbEh1x8xJXyZ2NdjNKg5wWzYTZxvNIiuheG6bDQGYvxFrjtNjQVD
	 SfXz+6I2UyYagcUd+wF3aofvqrvZqyLAJvsGvZegyw+wVMFq/KC9OY23+v5YnH08JH
	 OyT70KJ7sYrKrC4+4GEYiXwB+L9tU1upTVrPxcaKTRT56TaOSlhlMoxF7zh/hp1HEO
	 11ZtQ5Z0qdlEzJz/vU4iI3+C/mVGF1INt/+ATR+7AH7TOrTfhnc/9eHG/OlO2nv+Ds
	 SJVqpqgeUt8Xw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YT1jb1NKBz4wc4;
	Thu,  9 Jan 2025 08:47:31 +1100 (AEDT)
Date: Thu, 9 Jan 2025 08:47:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich
 <frank-w@public-files.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20250109084737.574cfb99@canb.auug.org.au>
In-Reply-To: <20250106164630.4447cd0d@canb.auug.org.au>
References: <20250106164630.4447cd0d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bljhQ_KxN6fWAoJLMIec1nQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bljhQ_KxN6fWAoJLMIec1nQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 16:46:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: In function 'mtk_pincon=
f_bias_set_pd':
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:606:13: error: unused va=
riable 'err' [-Werror=3Dunused-variable]
>   606 |         int err, pd;
>       |             ^~~
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: At top level:
> drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:602:12: error: 'mtk_pinc=
onf_bias_set_pd' defined but not used [-Werror=3Dunused-function]
>   602 | static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   1673d720b7e2 ("pinctrl: mediatek: add support for MTK_PULL_PD_TYPE")
>=20
> I have used the pinctrl tree from next-20241220 for today.

I am still seeing these errors.
--=20
Cheers,
Stephen Rothwell

--Sig_/bljhQ_KxN6fWAoJLMIec1nQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd+8nkACgkQAVBC80lX
0Gyn8Af/bvlIxGbYsXnO1TdCqWFDIIic58fPzgVtd+Uwxh2Z/Hs5TW5H0uddXSvT
5x6nhC/CSK56LHYTJeFpjAhJjHvKPHHV8a2HsjO+7pUGoR24uuCmpbSQV6hV/L6X
EyIf4ZOucqRzpdsEuyAD3gg6NAz499ZwJ469KLBQJF8Ae38tWq7thV4PdU1okGse
RBCvxjXeVDtB4FI+slyrBB6Z8B9/HUxM3hJ29iOIEL+C0F4cquHAuUNaANpTqmL8
iYd1quJ9BnalYpGD0Ldlo0tTh9F/gtIbmrvSx8YjW3PpIv5UnhUhk/z5k1phwop2
EUHSh95Z1R4kEtv+fZIWVdrTMpB+kg==
=+LQf
-----END PGP SIGNATURE-----

--Sig_/bljhQ_KxN6fWAoJLMIec1nQ--

