Return-Path: <linux-next+bounces-7735-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81359B145E0
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 03:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5383A7A6DBA
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 01:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE961DE3BE;
	Tue, 29 Jul 2025 01:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ABfJJEAN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C31C861F;
	Tue, 29 Jul 2025 01:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753753245; cv=none; b=Q2S3Gc4UbSzezGtI7BfFnG9nST9eNLhWqZL7REV4yFOtVqo3T/AdEF2tW6eVM9ZAD30ukc1zoZ4AX8AYt0B7/vekw1CjP/AkqsD1EcJM4Aa5++GiieH0lEMZ3g3sPeuFEBtIOH2ElE+8sTHM6PJwU7N/mREK9pz6xzi36XR4Ay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753753245; c=relaxed/simple;
	bh=3Wl2PhS4Fr3WNGWZEhDkA6x9I8ki3WYIBAPDHdzymbk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLU7RUoe83ny0yTqq5DNtCPq/sVUGWHeFPOatUOq16gKeu5EDYsawLhokzefj5rZSdVQxNRMYW/4gEZVUn2XE1o+HOV7hLCS91ZTchbHjKLRsDsQ6eDskzVBAgNDAmr2Xhm9XEQzYkYJ945raXtigyC25plSxuIZg/9OI1UiAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ABfJJEAN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753753032;
	bh=QiBQaBmju1+PmApkHRyvm08ycrRWTQUJ6Rqh1p1SCl8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ABfJJEANJMB69BaBBu1ULIOrcQU6K3nEDf33R9VLN9qAkxqOK3IiI6eoQhbvnlgt9
	 V26GctQfYXNw/nouGWFg3HLjNg9Jvmr6pIF+F9XEkiAHT7k6o6DoE16nHKwUs1Nzbz
	 H2h9jv2lXgYUX/kIj8W65K9HeqzY5Aap5fmIy8++d1XMxpPPvCh35qCdk1ecHoVJjh
	 rrQvKH83A4QqCFi0kKwyfwCI2I+tb8efKEX4eXb7f3grBfH6O/zFYb5n6Zyg2wwQ2k
	 Q+h2CT64cheDGbNd+ntJy8QIsFBKmZmYcg7QsDazbSCA3DfqOZ8U80/7qtCkt3zLjA
	 8cWUyPNEvXdTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brdHq1vT7z4w2J;
	Tue, 29 Jul 2025 11:37:11 +1000 (AEST)
Date: Tue, 29 Jul 2025 11:40:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Will McVicker
 <willmcvicker@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Subject: Re: linux-next: build warning after merge of the clockevents tree
Message-ID: <20250729114037.03a2d884@canb.auug.org.au>
In-Reply-To: <20250716160809.30045a56@canb.auug.org.au>
References: <20250716160809.30045a56@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r2lozRy2kwKK91JWJyjgwKb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r2lozRy2kwKK91JWJyjgwKb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jul 2025 16:08:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the clockevents tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x3=
24 (section: .text) -> register_current_timer_delay (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x4=
c4 (section: .text) -> register_current_timer_delay (section: .init.text)
>=20
> Introduced by commit
>=20
>   5d86e479193b ("clocksource/drivers/exynos_mct: Add module support")
>=20
> and possibly
>=20
>   7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section mismatch fro=
m the module conversion")
>=20
> For this build,
>=20
> CONFIG_CLKSRC_EXYNOS_MCT=3Dy

I am still seeing these warnings.  The above commit is now also commit

  338007c44c7f ("clocksource/drivers/exynos_mct: Add module support")

in the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/r2lozRy2kwKK91JWJyjgwKb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIJpUACgkQAVBC80lX
0Gw+5Af/d5hSgflpr/+8ForqRXliPuR5REIEBijXHIDTdq413noiSiyIkT4T28Od
0DANuOdVklULwPxBiQCooXETojuuFxPquXQnqKDpV6qFBaS1wIv3c7gttJdAlw8M
7q11lZd7Luzn0t1nLaB3/2BT4cHTu0+2Zfm5tinAano+ta0AJaC/8rU4uWBfS0LN
gwUBpGRCaTWPTWByp1CCb69ooGuNgDcVw57sl5aqvTnkegf/z6zet469ejrMwRPo
+/+osDr+OY+N1E6bEZAzzil75an9P0EDttbD/R3kgR7BcjJxduImf+C4M4sGY5Cc
bAd7El9NEQaQ3WEMxjUoAAFs4t9EyQ==
=OOtN
-----END PGP SIGNATURE-----

--Sig_/r2lozRy2kwKK91JWJyjgwKb--

