Return-Path: <linux-next+bounces-3277-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491C94E34B
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 23:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A658C1C2123F
	for <lists+linux-next@lfdr.de>; Sun, 11 Aug 2024 21:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096F71537D3;
	Sun, 11 Aug 2024 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kALVTaMG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B4127447;
	Sun, 11 Aug 2024 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723411053; cv=none; b=ofMClOmRRAyzhoSISg/N+Un+QTJ1r+niBYw/Wi9bFHaQGi59AuL+ILhg2SQePNxUY8qCiSH3nTVS3XblwFZ/kF2E5GjOiX7fzdQOivGIkGJdNHqLDccFoaD3uugf9zZ0G514u8EvtNzRh7S02I5/T2rXOl560dDn4aLVqb8ip00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723411053; c=relaxed/simple;
	bh=6WnGvqMGS0HpUd0gdL63XTzvBSGOyvWS2Y5lb4XGBuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SJDK0LgsldhOhiwzP5sQO1ENwBxy0a75Sy7AnPy5FFBWycLkZb3sZxpg3Ukgnqtn9idumiMA8jfnnQXLfgjIFKxz+YFtDAohZFJLs5UMkTqaLbLCnd+OowYzdZXfp18pdVI8vNCUYXgKZGTH6pSQ/XDWXGIqN8CTMTCMkCPl7gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kALVTaMG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723410679;
	bh=cwBBtE5XGAA6pLs+gJHVPxhOr8WGHk41NhHCPjOQxf8=;
	h=Date:From:To:Cc:Subject:From;
	b=kALVTaMGcueri5WQDdsZ8LTo0dovFUc6p/RUNMQDdkmnCk+VtuN+7ljAh+j47eg+I
	 EvNhtqAQu7xQVhH+GpAIWLf5hU4jsqm1EXQc1FTh1CNdSSSAx05lAcesNPyXn+ydJI
	 roOhkSlV4v4nBLHngLDKl3Fl0o98FwFYitQTR73XczkZef1Xa1nmJdWnxrO1B3RKPM
	 wSjITDH4YngvV++H4UmvLlp6pLEa3ivk1LrsDPN8HEL6rHY5OcBlxxeyrvqiDpvHeN
	 10HLq/ClZbDlN7dRZ8wiHDap4ZLswMhSRLlovIzumLlDknBYDw/0ki4syDCrjQjKXJ
	 1u/9i/OqBjBWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Whr133FmSz4x3J;
	Mon, 12 Aug 2024 07:11:19 +1000 (AEST)
Date: Mon, 12 Aug 2024 07:11:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Asmaa Mnebhi <asmaa@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the gpio-brgl-fixes tree
Message-ID: <20240812071116.401fd3b2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3tMfih=nAYUmwrk=5yiTI5R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3tMfih=nAYUmwrk=5yiTI5R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  aad418323267 ("gpio: mlxbf3: Support shutdown() function")

Fixes tag

  Fixes: 38a700efc510 ("gpio: mlxbf3: Add gpio driver support")

has these problem(s):

  - Subject does not match target commit subject

Maybe you meant

Fixes: 38a700efc510 ("gpio: mlxbf3: Support add_pin_ranges()")
or
Fixes: cd33f216d241 ("gpio: mlxbf3: Add gpio driver support")

--=20
Cheers,
Stephen Rothwell

--Sig_/3tMfih=nAYUmwrk=5yiTI5R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma5KPQACgkQAVBC80lX
0GwiFQf+PWB/CP18XBj0nXGjkBcZ/nrFG7BD3vcMKIQfRxaqDjkdw5AlcfJjvuPz
4gHW1czY67z6tTrbj+FYjzMpskaQfIT04z9LdSYATHOZb4+Qa4ujbHAiC0n5WCKl
DYIRmEy2YrkcB2KKlz5IaBiawI3lqu7Xdnfavi5OSKDEKxCezb0IS7AFnhGitzoW
zED8/b+Dl7AeVZE0cVQyXpAUyR3fLjkaCALOucIzaBdorfCCaiaDO62MDfI8nX99
hGKfVSDHul3XiOLmO11TxMVy/47fBK7j7wYN7Ush4ATaGXhIcUzoITx+qier0vXL
SenlJ67g5JIJM3C7nHkmJG/F4MO8/g==
=d19w
-----END PGP SIGNATURE-----

--Sig_/3tMfih=nAYUmwrk=5yiTI5R--

