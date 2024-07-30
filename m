Return-Path: <linux-next+bounces-3161-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DED98940E95
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 12:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8672850A5
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 10:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3309D194A61;
	Tue, 30 Jul 2024 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h+0LCHvC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DE0194A48;
	Tue, 30 Jul 2024 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722333914; cv=none; b=I2RdpTUDK1Neg5Uwe3C00siT0BFrnV/zcO2iVs6g2Qwt1nYHSNv6hkHZwMrvX1L8Jx2dMvnBuwcKM0VgyOA6OMGMZLdgBnUz1+n89H0cb7eKA2iepldi3qpIFN1RVlPqi99/3DXrQKCOvuqnh+8+leTJcjoRrfbsXNAt4Ads2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722333914; c=relaxed/simple;
	bh=8bBQbz2KYIF5bgTZdXfPcPnpS0sd03+mSgoBcKAcIYo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bY4ReYnrMM+gO5rYv+LyZivGAwN39uJFAwjFts3EkBZzzhbEu6iXX0FhLzGOSOrFkKtkD8cTDJjtAIlI1SQOkpQkBF7rkAD+2w2E8iHoXX/jngvEysRV20O0p6+FrB2JLsEeqdNTkL6gG+dIgOlq5LeNd1rw+0iy0v2Bz7cbXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h+0LCHvC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722333908;
	bh=EEF2zcJRwSFOB/qu+B0W2z5uQfJQ7UhW/paudPQOaDc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h+0LCHvCfjBc6FDIzNwu47YOl9I2gfbWunLEn3Plp4uiKFPN/4UKVJuj5K2GOJdFQ
	 6fohoAUP0UJlVFT4qNVUszLJSQsQXklwDvl8ybyQcgloE3peWtlcrIW5WhCZHsr/9i
	 NmbUzHGEQBDxKHjezQ6Gbejvs/vARslY2AygQDGeGqPi7GCFD2xCKr/KnTR5v3qtEm
	 70jc/xZAJa8LRhtJb3xpM+31kGbmeY6NdRwWjPjsk8sXlTnFQp3bWbvjzXi+sH3EwE
	 spAG4n4jp99Ems+2ftImkrUVaSR0si3Pek78PzHw7TH3trNluqHAltRa0NDEkd4MP5
	 Xq9Azn7VgjHPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WY9nw0Bjmz4w2Q;
	Tue, 30 Jul 2024 20:05:08 +1000 (AEST)
Date: Tue, 30 Jul 2024 20:05:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the arm-soc tree
Message-ID: <20240730200507.1ce43e56@canb.auug.org.au>
In-Reply-To: <20240702135532.18156015@dellmb>
References: <20240702174938.04c12aab@canb.auug.org.au>
	<20240702135532.18156015@dellmb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=I5BrfSF0xStuJ2tUekStTF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=I5BrfSF0xStuJ2tUekStTF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Tue, 2 Jul 2024 13:55:32 +0200 Marek Beh=C3=BAn <kabel@kernel.org> wrote:
>
> On Tue, 2 Jul 2024 17:49:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >=20
> > After merging the arm-soc tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:26: ER=
ROR: Unexpected indentation.
> > Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:26: WA=
RNING: Block quote ends without a blank line; unexpected unindent.
> >=20
> > Introduced by commit
> >=20
> >   dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU=
 connected GPIOs")

I am still seeing these warnings.

> I don't see what can be the problem on those lines. Is it possible to
> build that specific file?

I don't know, sorry.

The warnings are probably caused by the line beginning with "   change
the LEDs panel" or the earlier line starting with '-'.

--=20
Cheers,
Stephen Rothwell

--Sig_/=I5BrfSF0xStuJ2tUekStTF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaoutMACgkQAVBC80lX
0Gxdcgf/X3ctiwc6UbGJ76/u2EADplJ7FXjROwEZE5+jhykBD3W3EjTqyJztWGdi
A+Hy4/3b49MJN0QKU0MqOKzZS7/vSvfbTfJW4D3OVA197Owg4ii3cP3hxIjYa4Ag
YdndtX7+2g3V/wEK1MlKIxvy9dAodePcoTcex4R1YBT65T/l5GtuqAozcig76fLR
1apDlbh1I3OlhmA/2OcMYjHZOY9m1ez3X7q/P7x/89JsUH4JmAp2iiOEwGCDKK6E
M2w6UQOsqmlTbmwJZmPXJLUCs/BAifEPELF8yJnCxuniB72DtWp8EuNL63L667Ri
+ZXeoq33T/PiCtw4NQ06eIQoG4nz4w==
=N5UM
-----END PGP SIGNATURE-----

--Sig_/=I5BrfSF0xStuJ2tUekStTF--

