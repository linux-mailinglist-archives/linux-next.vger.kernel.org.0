Return-Path: <linux-next+bounces-2557-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB6908BF4
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 14:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 515FC1F278B6
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 12:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F34198A27;
	Fri, 14 Jun 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9wPwX4+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110B3196C8B;
	Fri, 14 Jun 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718369051; cv=none; b=Vzh5FPl/04cYQ4/dfVeBV7T81pfPhqNT58F6U2/b49KkvWwjESCdjTZZkIZvGXG9TQWcguyMj1KAO8lfcXK5mww3wSyBWvOEKPahwFigpJQli/XwuU8ClxAhkTd34G9gIvB2KnV+p5WgY0wbyLDQLBC+OaF8acn6HjQUX7+YEKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718369051; c=relaxed/simple;
	bh=F+70HqNrOnJHgZzQfxEBwkmuRJxP5ktUon7gNFn2wG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swd2AfniSzy2NFBgVTjKMKK6de3+UNLF639tC9uttB+zi840HriXcTPCeQA+/uKxwBVwD1ppC+RLBa1q/p6irw8xqpmMDZLty5Qg8GQ58Hq9Hkd7zykztwdvL1BBAZsOmRdDgNDxG0gpFOulsnM3Duck67Kjos+UYkd602Juw3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9wPwX4+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3688DC2BD10;
	Fri, 14 Jun 2024 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718369050;
	bh=F+70HqNrOnJHgZzQfxEBwkmuRJxP5ktUon7gNFn2wG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L9wPwX4+r1YyCuPIjj477dWuiQ0Lmls44LIj9WIUrWLdELe4mxlRyyFR1hTHlfrQ6
	 0LqnVT3PB3AuPsVN6h9P5EVspu08Rl0OZTUQajQNpr4czNk8xHBN3eGWRMJptpxYnT
	 OAtE9XVcsiLGmmrZUaYTwNqa6ScpGze0aP9jk/BOLu8UJ3hQNAwgUvOni/xarPJhxL
	 forHTiqs5HKEfqf2wM2JuzxHF3HC+HXOd2F5+ErX52Rw3qnz9+uMv29LNapw+MOsHg
	 1zhSj0qDOe3xw8gDtdrIsNnUWN9Wt8l7rzBpJheNDxdJ/ypdQkU4akebUOVDejodlj
	 rrAEY37/NX/Pw==
Date: Fri, 14 Jun 2024 13:44:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 13
Message-ID: <Zmw7EQnVEEVCRmGN@finisterre.sirena.org.uk>
References: <20240613144524.22abd1a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+jRttAIso1e5rO9V"
Content-Disposition: inline
In-Reply-To: <20240613144524.22abd1a0@canb.auug.org.au>
X-Cookie: Your love life will be... interesting.


--+jRttAIso1e5rO9V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2024 at 02:45:24PM +1000, Stephen Rothwell wrote:

> News: I will not be doing any linnux-next releases between June 14 and
> June 30, inclusive.

I'm on a train most of today so nothing from me today but I will try to
provide coverage for the rest of Stephen's (well earned!) vacation -
hopefully there should be something on Monday, though sometimes there's
bootstrapping issues which cause me to run out of time on the first day.

--+jRttAIso1e5rO9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZsOwcACgkQJNaLcl1U
h9CIEgf+PtSM2OvSiiZmuyXEV6MqNaV9VMWgRJkR2rfV/1zkXLut3yzUcygYu2RI
iYSFSWPzR2SYikuBlegmYdcPNH/84FXJOU9WQs/xCegfAFcV9jVv0gFKsrREig0+
kyrzvhRMzyXVLC8xQfShEI0FjOrnGjX8ClCqtjO7944o+yuDEaZM9dXK1NGnyGSj
BFK1hMVxzKWShu3ccGOwd9LCzmGTzbNFxiokeRisxbnVokLw9a6/WvQPYThM73ht
5po9puOM2Qi3nyrFyrIUxdYfvZw4KV0avynwa2KUaTOvUXP6+CLdsHkd9RYY9mJv
1FIm7kn6c2vczmb40IMMzUoMXa5Eiw==
=U/12
-----END PGP SIGNATURE-----

--+jRttAIso1e5rO9V--

