Return-Path: <linux-next+bounces-8681-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2358BFA130
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 07:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6E44843EB
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 05:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E6C17A586;
	Wed, 22 Oct 2025 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FCWNRQbo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC4B2E9EAA;
	Wed, 22 Oct 2025 05:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111508; cv=none; b=UWrbtLtfJtLYfrfzyaqeaDdEC/ShOiHSQzXOQ5SiNC+NdKRw7tieY+Py+y/DJBsv/X4frdNZAzZrjKROiEIoPc3Qu8ETM0c6zX1wqTHHHmNlw1t8ytUX9mO4ogL6piSTYTqhRMZyMVUu1CEOMVbubF0glpHTHFbOEqrHOuN55Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111508; c=relaxed/simple;
	bh=Qv9E7OjNIRMdjchrba2/MnYb1mZNFR20igD+aVJBsq4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KNfnGBbK3j2JEPRPfNzhu0tuKlWDWgrjV9cJLR1l0mLXqbFDmwZbIj0U2UoeO0/fgkVcEIQPN+jkTOwB3m8pTU3b9prIMR+M7GpZvLyx7V8iBM8QcqGnN56BOCVcq8EJbNg42etfsADEzQhsk/zOCeEINUnZ9Bm3VdicajUQPAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FCWNRQbo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761111504;
	bh=gFHOlEr4tyQRFeQJJbIcrW+KmWARMU4YGEpDlGjHDPY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FCWNRQbo4nMSNoN+weSPYa9VF6PgWktjWmKxaR0IR/Qn8zpAdqf8PzBPgJewxL7Qo
	 FeOR/9ahYEN0MTtu55ZEFbF3Bp0g17Ct8e3pzDx568pScssS9dR4nEIsrE710yeaDR
	 D0I1rLsVjogZq3hrrfp3mHElvAEplqKT55JhbnOlxef1b3gtNmVSBHmHAMcAPSMh6h
	 mKs4503iK5UvTTQe0ji39EF0tRPA9gQmI3ORlut7B8gYQ5hnkQ3QzSDKNYkV7C1Oo+
	 Ux34zhGuUlWSPJQxjM6n8xuU79jyBtnkINZSX6RcaAi6rvPcCS5IWYSn5hbL3Y5Pla
	 N3m1qT41Hybvw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4crycw5v6zz4wCV;
	Wed, 22 Oct 2025 16:38:24 +1100 (AEDT)
Date: Wed, 22 Oct 2025 16:38:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add Mark Brown as a maintainer
Message-ID: <20251022163824.38b1248c@canb.auug.org.au>
In-Reply-To: <20251022163625.5df7542a@canb.auug.org.au>
References: <20251022163625.5df7542a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2ZM2ObFJP==qNqVR3HlYxgi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2ZM2ObFJP==qNqVR3HlYxgi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 22 Oct 2025 16:36:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Mark has been kindly helping fill in when I have been unavailable over
> the past several years.  Has has also put his hand up to take over
                           ^^^
Should be "He"

> linux-next maintenance when I finally decide to stop (which may be some
> time yet ;-) ).
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2bc6c6a214e..52f9d98091ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14420,6 +14420,7 @@ F:	tools/memory-model/
> =20
>  LINUX-NEXT TREE
>  M:	Stephen Rothwell <sfr@canb.auug.org.au>
> +M:	Mark Brown <broonie@kernel.org>
>  L:	linux-next@vger.kernel.org
>  S:	Supported
>  B:	mailto:linux-next@vger.kernel.org and the appropriate development tree
> --=20
> 2.51.0
>=20
> --=20
> Cheers,
> Stephen Rothwell



--=20
Cheers,
Stephen Rothwell

--Sig_/2ZM2ObFJP==qNqVR3HlYxgi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj4bdAACgkQAVBC80lX
0GwDCAf+K39TY01DE3Nh9Hk9XEHU5sCnOIqfm/QDzOOu0OjxspcAsyS8S79dPdHq
dfs6n+W8AHviO+4gkmU2naNXH1AsmV1cRE2VpS3lnAGRtuEPV9xcPSS3VwNd97v+
RFOsKVSIR2H/GDx/mxcACq+mbIlI+uBcpSJ7UajNuo2QpZ8Oqb8yjFH+KAbBMJPL
PMMkbRk3DUfGQ1Do0f5uTjj6nf+qhBlpfhkJ02deTcbrETUaQk5nMMTEYHK4qE5l
V0wzOiaKKRT49qydf6kfoDdhRyccwEan2CqYOzQ3mPYQ7m1ezvIvdirRbUP4J5R5
mdgepjbFxty5NCiEaSJyRA6KSm8WdA==
=EvuK
-----END PGP SIGNATURE-----

--Sig_/2ZM2ObFJP==qNqVR3HlYxgi--

