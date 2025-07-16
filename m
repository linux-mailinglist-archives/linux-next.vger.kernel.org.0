Return-Path: <linux-next+bounces-7567-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC80B06DA3
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 08:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 754F4179F4F
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 06:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1A727281D;
	Wed, 16 Jul 2025 06:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jurnm2l/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469D417A2EB;
	Wed, 16 Jul 2025 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752646101; cv=none; b=in7uvZs2oa+xOSAyeRD+RhKJ64VacqDMpbdURj2v/pId2kS2hPvZoHelu2EXBPiyF44k16ZxbRu37Tih3uvxoNIzCjKGhVqc0Cve+VpxMiG7zkygHQ7Awurg0E4489ZIIVtGrhrD2RFKAVwk7Ku0PUNHaClEiRtm8GQBCfMHTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752646101; c=relaxed/simple;
	bh=6gEcNwbS3mzksw1oitjVOTzbSOe+6e3BXsTfDswZZ0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BVwmXf4DqyDxP1ZSO2MshamNA0kLHoLh++dOjHbpQUxfFKwPeMhm6wciJUGgreidSXjPqUK+5gdlUX6K7DVDRfN/nDQ2mBoQpXdEVAfWs+U0omwWFqYhRxeHwFuex7OCUgr56kPO8NjPjBKb94j4JGMAyDfpiq2gn/+Di9WLKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jurnm2l/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752645976;
	bh=xiuNGglcJ4zOe68lTes452XoRe2vjs4glbIiDIGxVjo=;
	h=Date:From:To:Cc:Subject:From;
	b=jurnm2l/4BcQCsVaa6l0yMBMku4ttsZoBHCfIkODDxf6FUxsUNYQmv7ncR8ediCY1
	 EklFo/elxcWXeHm2QVCMMxN2TcrMq2ei2BcSIbR1TQNtsFiJ0rGI1H5t1MFGImAXmi
	 U/yvPu73qU39u6+9VbVTPNl3c07HR/obaPgh36ygQkd3CU4W1CAJcFI5Nsqk/UEHAd
	 OV/TjVe1gGEKlB3Iug+zLX/FgH19B4bAxGr5HXfVoR5XsWKVMmV0bOedwR4Ql8ldTx
	 PraFy45Yd8pU4MRQ0WrApvfszg8Yn1XkVFt45QrzutafGbw6Io+883iWZxt/nsFCNS
	 2jej6hlqX0OWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhltJ0VTTz4wbn;
	Wed, 16 Jul 2025 16:06:16 +1000 (AEST)
Date: Wed, 16 Jul 2025 16:08:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Will McVicker
 <willmcvicker@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the clockevents tree
Message-ID: <20250716160809.30045a56@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7at+00tyozLYnLo/9qW1Kv4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7at+00tyozLYnLo/9qW1Kv4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clockevents tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x324=
 (section: .text) -> register_current_timer_delay (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x4c4=
 (section: .text) -> register_current_timer_delay (section: .init.text)

Introduced by commit

  5d86e479193b ("clocksource/drivers/exynos_mct: Add module support")

and possibly

  7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section mismatch from =
the module conversion")

For this build,

CONFIG_CLKSRC_EXYNOS_MCT=3Dy

--=20
Cheers,
Stephen Rothwell

--Sig_/7at+00tyozLYnLo/9qW1Kv4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3QckACgkQAVBC80lX
0GxyfQf+Iu6FK+4PJc6WdJmGVZZHfqycFyQVyWiF2AgQUItCiUjequl+N+Rz8Ewj
8vTRgoSX7kYHaFRTyWyfjU12AkqvSUqlV8x9NHi6pb+yHygWfa86+yF+K/01RF45
Fnqz6MP+TXxLeEeJyU2O1el6lmUK7Hcz7BH0SWWf8E2Gu861iKwFkF4cfp1Tn4vG
ERdMoyfGs2Dr/ywN++FJ7IUz3hUeQji3U1H8b6qePnBqJNqSW7IMTySQK1uwlV4w
UKxLWd41manuKdJ/3qm3rwuPo7dtfgf0AQlbLQwYXUy4BR281WjswfDsTzaLr/oi
6BXUZbvkmRpTYTB6toakIeaF0R+VGA==
=/iO9
-----END PGP SIGNATURE-----

--Sig_/7at+00tyozLYnLo/9qW1Kv4--

