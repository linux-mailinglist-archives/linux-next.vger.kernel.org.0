Return-Path: <linux-next+bounces-7393-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 500AEAFC1D4
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 06:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25AFC7B1CC3
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 04:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75194218821;
	Tue,  8 Jul 2025 04:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Bm/FtHsO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC361F4C85;
	Tue,  8 Jul 2025 04:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751950399; cv=none; b=e7iec5S4gTxj2hGHOuO+xWYzyTrhbFipPbyX7vTzpbJ2UvfJvpSaRtnXnyrtLpPJG3/K2YxSrEJ7DoTPSXjFUsI779Dhuj21WYJ27huT97zidXTdBywOR7AY+r97ESQLsTBUbtx1GIQ4HL6fpxOizoAIfkg6e6yn1C3eEZH52hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751950399; c=relaxed/simple;
	bh=fniMWbf0qaFoz0eZk+Yk5fA7gGLw16gqH3dsZmSkppc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p85h5nz/i8sVbTimfcAR8cyU8EMeWzBYnGQRGbQB58TDxfFj0Bygf4SSxdhxZLP5fruxN2TSQgTC2np3XD39PQG1m1QeyXgCbAnMZEHq4baeRWfyQ10zWn+dc3gdIegs1JUNcGP4RPSmXWZ7qmBfCCIa4RKXaMNJC0JWPdwW4hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Bm/FtHsO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751950336;
	bh=7pw5+O6mjAMwf4cs6nEfnvw9RhDSfJtGBTteaXRfWao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bm/FtHsOzj1sWrplQQMOz6U8Xy5IolsG8HP8kTkZNsZZaMKt8TJrB2DOb3+D9XVNw
	 0NHSTVqgztiNAPgHNBA0dmqoA+63I3NVFDAdiNjF8oesd/SvS0lJPaLdUah2BrQU2i
	 II6VzpEud+nmwJYA5ApEOyVnqK7Eo0bn7prC53YSmhTkePlJDVZaVVyhyl1dCsXsNR
	 otjjP8JoLxYDZ2R5OjEnEa1COkEvuVrcqlOEh8yVAxFES4K2INq5UVjp9dX6ouEiVZ
	 DTwWfiuZizUmxz5DAlL+qtRx+ikZmJS4FE8Qwv4ZFWGayKRD20e9s1zZ+KtqkZdX+d
	 HdpLzzz/aeFiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bbpcb3jmrz4w2Q;
	Tue,  8 Jul 2025 14:52:15 +1000 (AEST)
Date: Tue, 8 Jul 2025 14:53:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20250708145312.56f44a23@canb.auug.org.au>
In-Reply-To: <20250703142348.45bb8d28@canb.auug.org.au>
References: <20250703142348.45bb8d28@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mJPyZs8wOg2hOWN+DD3yFlZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mJPyZs8wOg2hOWN+DD3yFlZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Jul 2025 14:23:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> drivers/media/radio/radio-wl1273.c:12:10: fatal error: linux/mfd/wl1273-c=
ore.h: No such file or directory
>    12 | #include <linux/mfd/wl1273-core.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/codecs/wl1273.c:10:10: fatal error: linux/mfd/wl1273-core.h: No=
 such file or directory
>    10 | #include <linux/mfd/wl1273-core.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   17f5c6fa85e5 ("mfd: wl1273-core: Remove the header")
>=20
> I have used the mfd tree from next-20250702 for today.

I am still seeing this build failure.
--=20
Cheers,
Stephen Rothwell

--Sig_/mJPyZs8wOg2hOWN+DD3yFlZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhspDgACgkQAVBC80lX
0Gz3zQgAhphaEi2EtMzkDHZOVGmmFBRmhVk1l/wPWYFKVv5QFZk2duWl/DbwYwC+
p9Gwbeup4/6o/TVLjxS/lyLA7ftmuacvF3987BWs4ZZrF84qlPH0rxFHAJmPim0s
OP37bDCYhKrLV/xsbBKmwbX69PMHTKiX7WXkwQW7LqjYPApXJiuQndWyjtGVuknJ
shr/akr05Din0vHoieD+XXr0A0XcXRlb/UG4lgg4gvaNc0byvIkHikMfsmhc20aj
Aerjt8VgFKX9MicWH+Kk8dlc49Tkqq8/YveNz5NMYi2nIXfN0RIDKJAfugXxz3aV
b4qGf8jT2kXWR9v845svRUnnGRG0Bw==
=zfP+
-----END PGP SIGNATURE-----

--Sig_/mJPyZs8wOg2hOWN+DD3yFlZ--

