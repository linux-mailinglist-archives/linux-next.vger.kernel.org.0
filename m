Return-Path: <linux-next+bounces-2875-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B592B283
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 10:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7649D1F2275A
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7089154C15;
	Tue,  9 Jul 2024 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Cr2rJv7O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC67149E13;
	Tue,  9 Jul 2024 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514766; cv=none; b=HOeZfsBj2+Vuga7lesgEbn7Wn7OyjoTJ3WuSuOesya87owssvNetm01mGtunStbJdzZeVgkEh4Y71JpparkGnAaS2NwQdzOkIjd33xR2pm3vwHDIbuXSs09qE2OCdD8/ZQh6aSs0ArDF9UjJDd7pq5USgmX0OJXxwlcjKUzolQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514766; c=relaxed/simple;
	bh=BbPJ2Oh11tQ8R7WVf487c9dpDGz3HqjqdVRQkky4hyU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivuwB/nKY7IpM+s2vcU3sYdKOIQVjm6Gf9X+rbYa6n/lyq8NjlhGDxqqfBvo426Gah7YpRlF3FJNkMtoyUV+74gUsTsHQN5Y780n7vumzXPeyL5WwzZoMLuPRGZJEKx9vnMB8L7+wVlbLH0IQkvGd9KlaG69OAoxAOq8Ti4DaZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Cr2rJv7O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720514761;
	bh=m5As5ibD0IsWbHKVWPgbOjU9rstZ/h/jYvVPgQR28uc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Cr2rJv7O2WIhrY69e++LJuHjpUdbVIq5QuojWfxzakCpdEk421FYyPDKvzJRZltgI
	 UYUWaipSNhNMELJRdXvdIMpJbwZqnbYIDiMKj3WEkU2u69Y9EdKmmQrXw+dAC+gblz
	 ISIPn39Lh5U06YS2eiK7XiFk2hYNz3DBj0W9qYYYsFf9YYVD2EcROreUvTFyPCyRqE
	 rcqEERwhTRH7e+2HHbBMMk4A/gjKz2oT3RByX996xzRGo5r9i+3QWb+sFXPsRLDT/A
	 fpeiS1RtPiQG+oXKrNuMtPevB+13d5I99J1EzaXe2j3EimuTNL8nXS0+E1/4t99gSF
	 BHZ6901dObhmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJF2K069Sz4w2M;
	Tue,  9 Jul 2024 18:46:00 +1000 (AEST)
Date: Tue, 9 Jul 2024 18:45:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicolas Pitre <npitre@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20240709184559.676c476c@canb.auug.org.au>
In-Reply-To: <20240709184004.60f94726@canb.auug.org.au>
References: <20240709184004.60f94726@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ez3TZETVsX7yJS9lVCymq3j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ez3TZETVsX7yJS9lVCymq3j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 18:40:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Caused by commit
>=20
>   7a3c42cc4fc3 ("mul_u64_u64_div_u64: make it precise always")
>=20
> from the mm-nonmm-unstable branch of the mm tree.
>=20
> I have reverted that commit for today.

I reverted the following commit as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/ez3TZETVsX7yJS9lVCymq3j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM+MgACgkQAVBC80lX
0GwsZwf/UwlzuGwZNOMHlqxzu3UTbAXwBaRY5af9GGBeb2I78RAswjnt67uPPY4L
oj0QUjNuD/DO18eiPNnG3JThTu8nGjk2wriqjNGwfX0JKYfhNbQa3jQSTP/g/8NU
4bqwCR9JctTa8OXDRycE4dNI7Y2rhtu9yKj2JanUZ6Pe2KlFNRg8QxQniCVWRp+j
tYF19WWxP7w+sgFfD79AdpXL/hcCBbu88x2qlo6vm/Ne7FRHL27+V+ruH0EseAbY
ebm0aA5RmiANsffMa0kiepHVmZwLrMoQGXMGv82AoCiM2q2B50G3pCyso20Cnbcw
jmT69fdA3DrTNiDPueN6YuUdHwoTyQ==
=kQ42
-----END PGP SIGNATURE-----

--Sig_/ez3TZETVsX7yJS9lVCymq3j--

