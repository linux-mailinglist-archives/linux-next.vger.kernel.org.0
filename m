Return-Path: <linux-next+bounces-8519-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0447FBA9866
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 16:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B116217517F
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 14:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1309304BAF;
	Mon, 29 Sep 2025 14:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1qkXMdo"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A151E8329;
	Mon, 29 Sep 2025 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155692; cv=none; b=XtnkH3uenpaOdKTD7dhY2UMOF1v5fZJRuNu4zcdzLG1V9KWkyN5trC8knEXcYW0oe8JVFXP1Lka9Zk4B15cFLgE7QFSFqoxwgvifGN1oFGndAfehDKsrMPGk3ATjQbxQCXI8PjoPZxtZ9c2bhZquKv28+WrFzxnfxp2NYb2p4es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155692; c=relaxed/simple;
	bh=3aO0cBpEFzXk1SeJPxb6+4X0Wk9Gl1GvwnfdA0K/k88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RD2XPQ0GZ5zh+GPHzX6biDSUDuykBz8+I6zoTJPDwYn5x77XbToqtSAKLo6UvixN5dfZkvhHO17ST+VST7E5RPZvodUj5zX3mwgsmN/dlj0cczYPJFKaBgrhb+hU/y0KJbaj7HA8kVbHqNYJsUJFdKBPPsXqMq0qz3nHMZ8thcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1qkXMdo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90E4C4CEF4;
	Mon, 29 Sep 2025 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759155691;
	bh=3aO0cBpEFzXk1SeJPxb6+4X0Wk9Gl1GvwnfdA0K/k88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1qkXMdocqCQKbY+xKxRjCu1tCTKH8ijDqtiW6KyL/nUYn9dKif7mcGhZ9mXonlEo
	 1VjIlj21khc3gGOc+0HYex7zUVdTk7TBdHuQZTLAgp7h9zc4L+isFW2aoTwAZFE8LV
	 O6w0i3oJhBM/9Jbp0bYXYuKdtpzmYqbAWWQBrrKgD128bsiQ5rqT6HFSqEp5R0d+3g
	 REuM1nhnTfmTYjhP/g+r+JwqTYuH6Aoekjz9Mh1enFLQHBBx2hCGockmZZ44Vhme89
	 6W28pcHLEEhSIAcwjM/xHnHR9ci4xhy1Gvch6zaFYo4BG0LDdaRiwXr3hwxTwlPmfk
	 50Yc3W1ifsotg==
Date: Mon, 29 Sep 2025 15:21:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <daeff453-2653-4138-af40-df7cdbc2dde3@sirena.org.uk>
References: <aMqxWGx0asGTWZ2V@sirena.org.uk>
 <8c54836a-5cda-4734-b933-31c8b16f3fff@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WgkRKmG5rxm4aASK"
Content-Disposition: inline
In-Reply-To: <8c54836a-5cda-4734-b933-31c8b16f3fff@sirena.org.uk>
X-Cookie: Stay away from hurricanes for a while.


--WgkRKmG5rxm4aASK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 02:03:24PM +0100, Mark Brown wrote:
> On Wed, Sep 17, 2025 at 02:02:16PM +0100, Mark Brown wrote:
> > Hi all,
> >=20
> > After merging the mfd tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
> > gpio-stmpe.c:(.text+0x213ed29): undefined reference to `stmpe_reg_read'
>=20
> This is still present in today's -next.

And today's.

--WgkRKmG5rxm4aASK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjaleUACgkQJNaLcl1U
h9BQnAf8C3la3PV29lvGjrXwZy3E9oPIMSkhoCHd2Gb2SUYKUMJ3Lxfbyzknj1hj
bW27H0vbuCgqlj2/y040wYnNq41rjYYvSadLs7Y/V/YqvMJkqK/0WlcU1zu5tGCE
YTqnNXDvX97qyXmeHama/tIVZ9FuyMyCwwAE42edLYmVRgo0H10xnHu6z1Yhikrz
jHGkHhRmFYXG9MHqzEAAYlSebYfJY0Y3xES4GAnVSrQLhxC6gzt4Tw+Hg6UWFpYM
1qWPlxWzjyEhcGkSJ8kGLOlTKxO891wiRuAm2dv6SWC6NsQax4rdW2H1QJ94QylE
Azo/GfW6ecex2iCrwPNmzG/MDw9m7g==
=MTPc
-----END PGP SIGNATURE-----

--WgkRKmG5rxm4aASK--

