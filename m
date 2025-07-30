Return-Path: <linux-next+bounces-7776-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08018B162B9
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 16:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D9D3A90A0
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 14:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC43E2D7801;
	Wed, 30 Jul 2025 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YnmuGi1u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09D2BD582;
	Wed, 30 Jul 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885624; cv=none; b=AtcvERuVmCTjmvcFaXF2t/9QCAHRPJinlXyNsGTBf5ObeQg7LMnrfDPFQYoL1XrhW7NP1nt8H6LouOax+6n8IniX+mrH0D3A60bGYsMwVlCn/zzzvs1MxsPDZt3XznP/JOtHy19WRSFEFdCH3Oro0uW/ddUnYwgwMZA9Lz165ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885624; c=relaxed/simple;
	bh=bE094o3im5w7P13S0HeOXZd789744GBC6W3B0HmnpDw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QSM8q0iwmcWy69qhcauhnlOymtvOZOZwNVLPQ5XJ0pK/t9F9WqCR9AInon3dRRki6/+Z4a36GbnglMUAGB5QTaTWBaCSPHRZjDvIUDgd0AnrEo+dDnIhSeULFgeV+XBJH8FF29zUbcSLruH0wxVFpJFp1gDO/+DVBiFoWBEJ6iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YnmuGi1u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753885399;
	bh=bE094o3im5w7P13S0HeOXZd789744GBC6W3B0HmnpDw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YnmuGi1uL2tpQPebcZywcWIzIUbAoCP1dsUkIAf4ATK0M1OmpDc5oUJ585zvr+i8O
	 mKjrT7Pti8Vc3Xl/LmddWdx05MR4kiN4RsAQFPPOFLFBBVEUGZ40cVMtpB4m0cG1JC
	 Z9SN2czc67l+jAkj/zNyLWI9unfoDNbVYDK/WB7t6rEO+GNr1K6l79/+frcB3lDlOz
	 e6UFuox5qoEgVaZol8u9YDLziKBNwoQEaEhJjMa5Pz9cFmLGn2JAE+0LxISZWTlsoI
	 d4FwFuHfNMkvJI/nk4qU4362g+/aJZIVAmbUdC0PJ9FHkqlx6rpgpulYP2GYkz/I3v
	 uoepnAuPdvmOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsZFL1wlSz4x6p;
	Thu, 31 Jul 2025 00:23:18 +1000 (AEST)
Date: Thu, 31 Jul 2025 00:26:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Will McVicker
 <willmcvicker@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Subject: Re: linux-next: build warning after merge of the clockevents tree
Message-ID: <20250731002654.19af9458@canb.auug.org.au>
In-Reply-To: <e8e2bc93-1639-433d-9689-d1ce9f28b877@linaro.org>
References: <20250716160809.30045a56@canb.auug.org.au>
	<20250729114037.03a2d884@canb.auug.org.au>
	<e8e2bc93-1639-433d-9689-d1ce9f28b877@linaro.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HdvHeNX1UtLYp6D3caRo_AJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HdvHeNX1UtLYp6D3caRo_AJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, 30 Jul 2025 14:22:27 +0200 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>
> This should be fixed now.
>=20
> Also the clockevent branch has been reset.

Thanks for both.

--=20
Cheers,
Stephen Rothwell

--Sig_/HdvHeNX1UtLYp6D3caRo_AJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiKK64ACgkQAVBC80lX
0Gy4WwgAn3CVtaKNDvo3qQ7LdaCbOY96ppun5gQoA5T54f3G9Rhvn/VgdWdgajS2
i7X4oQVHc9PDvoThreMDQp1PVL4Ey5WL2qBbqdCzxWgdd0CBHqHr1iWTWTVMPM5d
R929REoNxQBWnhKG0wJRV4EiMIJFtPr87OuYUOIy82o7KozrYzIfIn5JWPj6RCAC
gejC5SZE95bIQR6nLykWRlSSnHh95YOjgR1xr0psJwEbyQepw0SCV4nQuUI/T+hA
MkSciRdsUawlGmTVoOQvAl6xGC8vnzSgCKKiiTxB+KLnEt3YjfMGJVbiCTJz2/zA
lSPm57Qx4eKIdDfcZX6MY86LTO/Cjw==
=vW6g
-----END PGP SIGNATURE-----

--Sig_/HdvHeNX1UtLYp6D3caRo_AJ--

