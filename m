Return-Path: <linux-next+bounces-4154-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE09958A2
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 22:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5AB284E40
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 20:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7984212D0B;
	Tue,  8 Oct 2024 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PSQ5xmIC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839C1D5CDB;
	Tue,  8 Oct 2024 20:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728419980; cv=none; b=u9SEdTJDa03NxZRi/SV/Cgk1gLAzJMexK7WMGHVMH93zfl6crm//4SbWTpPPQg80Q8aZBm1GDRw8mV7nmFs4J/AFAAn0l7qYOXhHMGTLvtn/Kd4ygFG0sGVtY2pT31rrBalcAvnlbyvYWe4Jy5onqmmhphm4op/Aw58Xwx6gDTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728419980; c=relaxed/simple;
	bh=HmTzMs7Tij1gzYiLaNvXsOoE3Ii0QZf6EYR2njK0OZo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tskSA5CeAqQJwF+KuorurVff2igNPp3PYR67/NDDfmCAhpeJ2SHU1Kl8c4my3C0IgTKcjWNaBgOR3cpwirBDawB34tMK6TwvfkLN6aCFm9fnohwVl9+j7krFzymsXlpFkR5rLpDJuFZmqzdc1qm8AqlPgQ1TuyfZM9JrfdZDS0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PSQ5xmIC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728419974;
	bh=PsIniBDhtYME+C47edMsgF1axG+0kADeRWJr3zTwC+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PSQ5xmIC1HU8oFvKBx+beOBWR1qWkjcKt+pxeR2tOCfQxrnmBsjqPKGm+BtDEkCfF
	 gw1w8kuJTadfIz6bf5xu1ZNh4HJlZdZXhWuv3WOBSt1dFiMQXrBM0ciLV2ZJ/hHGP/
	 SuZHoxSp/os+BOMhBEw1jPu8jOpq5lG8pOMhsbRjEqNLx/bedHz+AZFYGz0w/Y8kX8
	 YcaxcbOZ+SNOOEvJg3FQ7392t7+rvYj0tKlf8/EF88WWNNxP6NIDK9Ccwpu1W3ZuwE
	 NRyaKG7OU32BwljWTFug1TSVfT9SpGYFtzex/mkRNyUhDmc+THfvh1A+BaiUAz29ZF
	 8hSA6TL5m69Lg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNSYf2hKtz4wb0;
	Wed,  9 Oct 2024 07:39:34 +1100 (AEDT)
Date: Wed, 9 Oct 2024 07:39:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mmc tree
Message-ID: <20241009073934.65dafdc5@canb.auug.org.au>
In-Reply-To: <20241009072044.67f195b0@canb.auug.org.au>
References: <20241009072044.67f195b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OMi+v4gAnP3g=PZwNCtCnZt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OMi+v4gAnP3g=PZwNCtCnZt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

I got the wrong subject there, sorry.

On Wed, 9 Oct 2024 07:20:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Commit
>=20
>   14b473254d60 ("mmc: sh_mmcif: correctly report success when obtaining D=
MA channels")
>=20
> is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/OMi+v4gAnP3g=PZwNCtCnZt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcFmIYACgkQAVBC80lX
0Gz6DQf+Oq8BSvv6n0tMSnkb5XQl4aXV350RGxepUsIy33lpszUp6FkatbeD/tFN
ijLFtRZN4V0oC7dPvhyMgbunGA2FPaKdXQJ2dW9CfwASP//d87toAYkOtk50xG/8
buGPE3G8W+6wNY97Sgh8r7wqq8jWgccrsVjgRGjOwzBgu15mJdvTG9IugdQQvatd
bxCfPdHRbLzzOlMnTCo/l+fhaR0M1J2aLYYzKX6QOszONLTnmPoRvHc0lK2JdGJz
28vSzDvO3eLgyoV+F62W/18pNm4LsDYHjsOg8LzIAwHnckHtJ5ylzepzxM1AqyiG
6gx1Ll7bFD48GQ4mLfUXPkH6M+3ngg==
=oGHm
-----END PGP SIGNATURE-----

--Sig_/OMi+v4gAnP3g=PZwNCtCnZt--

