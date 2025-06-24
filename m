Return-Path: <linux-next+bounces-7211-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92158AE5842
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 02:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380651896B46
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 00:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BEB136E;
	Tue, 24 Jun 2025 00:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VO8gYizV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C69366;
	Tue, 24 Jun 2025 00:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750723741; cv=none; b=MVAkvN8TI3FQ1MEIGkDim6zBuQXEoUw1KlR24DHgJ3m6vBwqyJseBfMV0TpX8zn535Cz5lxzLvFZXDyaia+be/ifXyBBul18Yi8ZEZrMNXGFv2UcN00tsNnynC9u+VJ2X/wM8mF0UTufaDRK0it1oXTFlUJ7dZBJDnbYbsRjINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750723741; c=relaxed/simple;
	bh=DTnAVL9M+3dEq83aYcEGNHIpPPI1VObniA2sW32qFUg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pFv+qul1W1W7MN/sJx5LJwAxchQH4aiUHKZOUvm8LXqVFQyrGy+RXspbYuwAiwtzNZdvK2p+iu9j/2awNtczM3btvRHHY4VMO/zXF3e2YH8p8jV6k86OeODtTx+HRh4FWB0w9MugKlU8/JMycQcfGb6udLizyE5DY1tf8wpdWQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VO8gYizV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750723733;
	bh=wo5ktJNOUfG3TSykYbWSc8PFH7/sie/YZV7UcWjBPJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VO8gYizVZDzSGm29Tc/aY1K2iAdjigj6nK4TrILm7K3r2vSDLlWIi7QNjVoXmc3s/
	 zbcoiItyH16wfPX3Fy1D5G+DMCV8rbDEByD118CQHwuiZEJ/aK7qBfGO5ooOBZGwt+
	 IpC25fTrK/0Bt+AOv3weZkUDDPKB4war6f+X326PhDAGg448FYD2apLTVmm8/K52fU
	 iqlCZuBsUKHwwP3PBql6byjjvSbnbyWmvszgZ65gt5fF3FxvBm4qqSxAy78mZEfiuu
	 p2pIKVf9kx4BH1QXuB7zvU3WqJt6ULDN3nND2E5cM/1X3g+OBW1TK0mg5s4jXqK37J
	 SFUuiqHwETR1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bR50366Flz4wxx;
	Tue, 24 Jun 2025 10:08:51 +1000 (AEST)
Date: Tue, 24 Jun 2025 10:08:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Drew Fustini <fustini@kernel.org>, Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje@dujemihanovic.xyz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 risc-v-fixes tree
Message-ID: <20250624100851.40f8b416@canb.auug.org.au>
In-Reply-To: <20250623101407.4fe17973@canb.auug.org.au>
References: <20250623101407.4fe17973@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N+iaO.pBDHQOFZd39ORK4ZY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N+iaO.pBDHQOFZd39ORK4ZY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 23 Jun 2025 10:14:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the mm-unstable tree got a conflict in:
>=20
>   .mailmap
>=20
> between commit:
>=20
>   850f0e2433cd ("MAINTAINERS: Update Drew Fustini's email address")
>=20
> from the risc-v-fixes tree and commit:
>=20
>   a5d3f8d805d2 ("mailmap: update Duje Mihanovi=C4=87's email address")
>=20
> from the mm-unstable tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc .mailmap
> index 93e94b0b9376,60165a8144bd..000000000000
> --- a/.mailmap
> +++ b/.mailmap
> @@@ -223,7 -222,7 +223,8 @@@ Dmitry Safonov <0x7f454c46@gmail.com> <
>   Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
>   Domen Puncer <domen@coderock.org>
>   Douglas Gilbert <dougg@torque.net>
>  +Drew Fustini <fustini@kernel.org> <drew@pdp7.com>
> + <duje@dujemihanovic.xyz> <duje.mihanovic@skole.hr>
>   Ed L. Cashin <ecashin@coraid.com>
>   Elliot Berman <quic_eberman@quicinc.com> <eberman@codeaurora.org>
>   Enric Balletbo i Serra <eballetbo@kernel.org> <enric.balletbo@collabora=
.com>

This is now a conflict between the mm-hotifxes tree and the
risc-v-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/N+iaO.pBDHQOFZd39ORK4ZY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhZ7JMACgkQAVBC80lX
0Gy9uAf+LVmUb9ntPpYVAOMZ6jWnjbcV40GaJS9ocNrIncbeuCxDiFsH0JfY7H1F
Z4mDvsoblqEBPMlFfyxiA/XsfcYe9mZR1vgtshilTuc6kSPr5EFYxJr2tdcQngSv
Gs9PJjr6DustzZJ2CSbogxgaIuYzTZs69Teem6kAjY7rsMTk2/r76fHLMsergMJF
Lc7jeod4wz2NU/QyoxqJcBOp/nZGUuyWhaAstrUqBXEJhehQYDgOILFJUV7UjKse
+CiWv8zSC/J2ecQgtTUMgf/TyqbCHocoOCoUPG6QNoz2Q9mpe0nqhnp7m6KuIfkn
dCsJbUYOIFYpCNiFb+pXYHG08u00yw==
=uleo
-----END PGP SIGNATURE-----

--Sig_/N+iaO.pBDHQOFZd39ORK4ZY--

