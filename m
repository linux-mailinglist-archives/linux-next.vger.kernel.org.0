Return-Path: <linux-next+bounces-8531-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A1BB15A1
	for <lists+linux-next@lfdr.de>; Wed, 01 Oct 2025 19:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D6316FF88
	for <lists+linux-next@lfdr.de>; Wed,  1 Oct 2025 17:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FC62D373E;
	Wed,  1 Oct 2025 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fm1s2YkN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E0E2D372E;
	Wed,  1 Oct 2025 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759339299; cv=none; b=Ee7JDlM0nLxgORO3SOUoGYRpXAF4Bj0wkYpz5kexvRd+j5/atEUm8HVNU+grRrIEHwUEJ/O+KtmTa5qajswnz2XVkI+JaHEH5T/xoPKZFJg/SCoGvobw/NJOMfQrvfoIwzDInxzyBdy/SgtHRxfwP8FnmxjbnW9U+HKruqpdzqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759339299; c=relaxed/simple;
	bh=HyTDnAffjvigGqtHt+eqnaxvoS5wThfd8l8xoAJoL8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evovthQIjsfAKg8KxWSdEAx0odgz5VwMZ1NZCo3gR6ZQjBAeLknLcp3EhRO0hRyBeVJkA+LUUysVY2qIJHiTfCO/MxfyEwn4SsQZLYt3Tt6c7bhvnxakZvA/2TnQpZtqOxq/yMEK1+Zw/hYKkQ7odouBX0oAW0yrtzlYD4ciRQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm1s2YkN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A3DC4CEF1;
	Wed,  1 Oct 2025 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759339299;
	bh=HyTDnAffjvigGqtHt+eqnaxvoS5wThfd8l8xoAJoL8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fm1s2YkN2RXkjDOYbHCWLai2V393zjfHb3r4BOOWoeSDf6P6/DkBSjZepXLxN9qmK
	 m1lUMKQWw6voui+Knq1CYMdzTIS2dMQRJBSQQRkffVFosyZKYQ1VDf/NmLXpwE2nbG
	 S2NXzCRqFxjBx3MPrWHb6nQlWzfVJTeyge3RTFoFptdp86/W7jmrBwSQZVVUSKo8GX
	 YFX3NSxXCNT+/W2wzSur4R3SOTV2mA1kro2DW2hSoaN3fi4YnCPQy8IscyymGZ2uyq
	 sMlstsjVgpL9SMNwr6SNAM3m/IRd6OGobiJ8BHxmFvP3Paf7OvYtPpcClY7k3ijJ8V
	 leoLvs4miDf3Q==
Date: Wed, 1 Oct 2025 18:21:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <aN1jHx0sgkOFAYM4@finisterre.sirena.org.uk>
References: <aMqxWGx0asGTWZ2V@sirena.org.uk>
 <20251001095108.GO8757@google.com>
 <aN0CkwO7vxzpp30I@finisterre.sirena.org.uk>
 <20251001125028.GS8757@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZsqiOUGwz3fM7XsN"
Content-Disposition: inline
In-Reply-To: <20251001125028.GS8757@google.com>
X-Cookie: If in doubt, mumble.


--ZsqiOUGwz3fM7XsN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 01, 2025 at 01:50:28PM +0100, Lee Jones wrote:
> On Wed, 01 Oct 2025, Mark Brown wrote:

> > Your tree gets merged first so we get a build failure when your tree is
> > merged, it would get sorted out eventually when the gpio trees are added
> > but all the intermediate builds are broken.

> Interesting.

> I thought the point of -next was to test everything integrated.

It is, but part of how we do that is we add a tree at a time and see if
they break - there's byproducts of the whole process like pending-fixes
which allows fixes to be tested without all the new work in -next.

> Thanks for the heads-up though.  I'll wait until this has been merged
> before sending out my own PR to Linus.

Note that this has kept everything added after it out of -next.

--ZsqiOUGwz3fM7XsN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjdYxwACgkQJNaLcl1U
h9BrAQf9Fmztt3vsQM63QmvaHqsaKpAiiFrLUVCplP45CuzRfC4KVgb2gSBALTrW
fo83Nj0nKk5wJiugKSgS4mME65zYHg7LRAz9cJh0ZUk9mvi6Py9vydFsmFHuTI8H
sjy1iuzHw+aIVeHHPB5JBgrC7ymFFtqYCFGNfXMp0EJexsAs6HmD02Svcxg1GUrh
ZZULSZ51z8jz8Q0y2/wxfSezued1bn26SnKCCg1eMXz4z6RquD+uMqvKHyu2AxFt
FFTuOQnIEBCCMVTHvRuwpxss+RI8asWs0XmjwtgABNYNLSTFeuq7kGnFyEiS2ev7
5CNdkxHxu5oX69dRzrB6lswW9IeQEw==
=xwUQ
-----END PGP SIGNATURE-----

--ZsqiOUGwz3fM7XsN--

