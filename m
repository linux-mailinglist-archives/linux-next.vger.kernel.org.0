Return-Path: <linux-next+bounces-6446-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75186AA3CCD
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 01:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D3793A7ECB
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 23:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5662280303;
	Tue, 29 Apr 2025 23:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PjmVs5jF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176D1280300;
	Tue, 29 Apr 2025 23:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970265; cv=none; b=uFFSRyjj/PmG3YTZGrB/dg5xXVhl4R0KR35a5jWAjnkcmpmNkDB05y7XVQBrdUso8ZjraA8peRksuT63f6H7Bv/MCsW8zMa2ON3OIob+ml8tv0mFOPf3pdUMKL3BORor4eAe2u1BOPPjbqjZNSqc6NWrkxHs6/xQNbIWnGTse5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970265; c=relaxed/simple;
	bh=OhW88voj4SOyx1m/0jGkDshmJkO8fayJVeK45dr0jbc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hl93hTdqTICizG6d7G8dtOpDaHNDrCvfQ+eo2m6u0gnH/SpUfJF0GoQz0Wo53CL8hnWjiu1/1pHoTglukOvQs50+234jGjjYF6t5nu+xG4AsAU/4HwjNMWKSooydvh1rLVH/FZUPnuEol4Ka04HGxUopvvtfAgXpWZuBNsQs8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PjmVs5jF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745970260;
	bh=OhW88voj4SOyx1m/0jGkDshmJkO8fayJVeK45dr0jbc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PjmVs5jF/P0jOeTHP9FKtCYPPqwkyQN9FgeUu6yl7mUadHNngYLUZr97vHQpDy56E
	 +ZDRafJNd5NUIj5WeUJb+22h0TsthRxcza+VJyZw6XXyWa9mrq7nurB5zD174meYvK
	 URSS5M0RB5qxFf9yHVrPV31ft6NRCBMGQjQfU5Va8FtiTqX2d0BfrQmSCEtmMt2LzI
	 BffboG6BRk6dX1ppWeoVcmoIK0Bf0LPZNIv8uzpvsD8VHrFVophAeci9A2UD7lhqaI
	 bZbngLpDGFPCdglcy6giN7bsvrtBBR+55Qa2MFWxytyYQzjirlyMBem3Fwe9mqQXSB
	 w/K/P+B52UdOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnH381HM1z4wcn;
	Wed, 30 Apr 2025 09:44:20 +1000 (AEST)
Date: Wed, 30 Apr 2025 09:44:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, gldrk <me@rarity.fan>, Kees
 Cook <kees@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pm tree
Message-ID: <20250430094419.244f8176@canb.auug.org.au>
In-Reply-To: <CAJ-ks9mQfDwmz=chKjjcjv2KxPk1su4NWfZXey7nNgQWYXzaWA@mail.gmail.com>
References: <20250430085544.12800bdd@canb.auug.org.au>
	<CAJ-ks9mQfDwmz=chKjjcjv2KxPk1su4NWfZXey7nNgQWYXzaWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6fRJpP6QdMXzZCuGrl+F5xQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6fRJpP6QdMXzZCuGrl+F5xQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tamir,

On Tue, 29 Apr 2025 16:30:43 -0700 Tamir Duberstein <tamird@gmail.com> wrot=
e:
>
> Hi Stephen, how can I remedy this for 5de20bc939b0 ("ACPICA: Apply
> pack(1) to union aml_resource")?

That is up to Rafael.

--=20
Cheers,
Stephen Rothwell

--Sig_/6fRJpP6QdMXzZCuGrl+F5xQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgRZFMACgkQAVBC80lX
0Gw41gf+Of0rRo3QY8OB920LtfNl1Ve2TD7Vcg58zbIAI4JliatwYeUw4UeplnKY
eNwi1SuR67us2et4kHmxfteDTTgGw8r3w/Fhvi5KnozDKeezZfEFfsJU93hbyimD
2dYIljDQALGQCzdGjE1lulvmDWSuEa2xHJLWWIwycuYzD9HcWIKJNA4dU9j+Xt6N
Jfg0cyGLxVXgmq2fg4HgFt+lx+0FaZ5Ey8au0zSpkTTD6jXl6JHyyA7VprkIeJ4Z
yeWM53Wc6UANJJzOsWaGIqp0S5O554A3a2AtOvsenYgx17fXIVdbpeENg5MXsfEV
vk14jHp5/21NLyyfdG/cilcZ3G1kOQ==
=jz0S
-----END PGP SIGNATURE-----

--Sig_/6fRJpP6QdMXzZCuGrl+F5xQ--

