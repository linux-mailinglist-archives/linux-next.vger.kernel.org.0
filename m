Return-Path: <linux-next+bounces-9719-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D76AFD3B655
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 836963007194
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BDA288C20;
	Mon, 19 Jan 2026 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEbGdW+Y"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB662773C6;
	Mon, 19 Jan 2026 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768848994; cv=none; b=iK+zh5W+QYpLTIAaDyDMoTsK8tHo5v86X5WmOchAQYr74HQ52T63KtA7xlSScamhDdIvd3gRAZEhvwpW5l0whmjR+asU2vu9liZFiP0pEJSk8QGTR/vQ2JTEMx5vi5p38jLWiSQ6U0CHezJvkGNgyeKyUtdFIimhWGrfzX+ffDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768848994; c=relaxed/simple;
	bh=BQAXjJOujYpYRQIi3FTmyUwlY2i0wn6b0HTy7T8Cgc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erlo3oN97r+tkTEQMtc1MjFwxxtLYOTCsNcNc402X7K2ZX6kxPot8YX/4C1MxPegICPdrnNwu8szUk0BlcLivz5JSm+r4FmbvA54dEMvO6XyNcUJaQHoqY4DHAyJJdesPMmLVTo4xRch9n4o1bVmoqcRRArZSP7GYRsz/QaxfR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEbGdW+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C278C116C6;
	Mon, 19 Jan 2026 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768848994;
	bh=BQAXjJOujYpYRQIi3FTmyUwlY2i0wn6b0HTy7T8Cgc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEbGdW+YeNmIRTWXViy/8VxGSH1gMnk8gmjGBhvfw+lQKu2lxPtM4p6KAYewb//KZ
	 oLJi+CL5cEq2rnUMhZZRVMkcEy41Q3XCI+1Yi2XjAJ30F3dZ6J3TGrOMCOsTc0IT/P
	 5TtECGdSnOEvUIRsVMiSgeq5yL2fscO97lHbfoUHuzUmHRCc9EevqShx0IcE1xLNkP
	 qUKm81pRMQnd3ezXpgYnxf5yyfBFHoIOpk7dL9+q5Fin7jQFBYioPv2jTTsGK/0xcp
	 XN++m9g0jWHQ0xJTBLjFtithSdwD9XPwB1ZAo1A6coD7GptlUoFg9vuQJGRz6gsZeN
	 /qhnehR+bGKvg==
Date: Mon, 19 Jan 2026 18:56:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <9a44bf97-4c51-49b6-bdec-2959780ff128@sirena.org.uk>
References: <20260109124558.25b0eebc@canb.auug.org.au>
 <20260109094147.GC1118061@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gopJCiM6HwCm8hAK"
Content-Disposition: inline
In-Reply-To: <20260109094147.GC1118061@google.com>
X-Cookie: I'm wearing PAMPERS!!


--gopJCiM6HwCm8hAK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2026 at 09:41:47AM +0000, Lee Jones wrote:
> On Fri, 09 Jan 2026, Stephen Rothwell wrote:

> > ERROR: modpost: missing MODULE_LICENSE() in drivers/leds/rgb/leds-lp5860-core.o
> > WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/rgb/leds-lp5860-core.o
> > ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
> > ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!

> > Caused by commit

> >   51f7560294c9 ("leds: Add support for TI LP5860 LED driver chip")

> > I have used the led-lj tree from next-20160108 for today.

> Please provide a follow-up patch post-haste.

This issue is still present in today's -next.

--gopJCiM6HwCm8hAK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlufl0ACgkQJNaLcl1U
h9Ayfwf9H8D7XAklapPiFrjrFmG555YFBZHfE7vhB2th1AuXowQgLSD8I+LoFNHT
Fqv0UfoPYY7nT2hzFlC8aqcu+m8N9qm4luDLSFZa1EDvvDjs72I7j1FU+CJIXuj5
JpFUhcEY8o1w/ZeBHfmSMQVgfNQpcnDiy21G3GY021b5omclgzIjfN1nzj/FXeYQ
izsR2xArkPIEttv5KKfkDIZh+YGInqVD0VvvQGGvFITCWUQOdYgbk1aDgA/5FUFJ
EZTA4SGpAtZoxf8V7jPIXYU70ypIbdnEBnQ3ck9XFUaTEqP9OHteibUwGGM105AT
WsCFgbrDJ73LWyHg4wP3M5UEgm20eQ==
=gbdy
-----END PGP SIGNATURE-----

--gopJCiM6HwCm8hAK--

