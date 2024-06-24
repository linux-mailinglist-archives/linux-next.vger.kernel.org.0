Return-Path: <linux-next+bounces-2652-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D3915631
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 20:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 440A71F215CB
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 18:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F93313BC1E;
	Mon, 24 Jun 2024 18:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4Alrhjj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744D718039;
	Mon, 24 Jun 2024 18:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719252335; cv=none; b=k8Q2vTEHVXkvfLhLI12pW1OH0kXhqQiM7TOdob2l5CApnPNme//e2UbeK2Ig1Ru+DglKyp7hxrxevDmQODPiWUMU3GOqc7U6ktyoEYfii2YacOnLrz86feTUUJb+qfRP3NODj41gkLLDnSZdudEadEXfM0KkSsB6gHE7o+DORbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719252335; c=relaxed/simple;
	bh=dEStDFuSTYU8n7jrSHnMseqew7Yr9W9Y/sesTQnL1x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFn9YKJStajfko6A3/HsixgyrjcSBjqQYapwMEwzYs/gl30OlStUFUQ7x9cZbyfnKlHxmdnyG9Shi1RPlaJsLzsRvHhnDp/GNp+ZbHRCkLiXl5/nUtVeDI0Qks22n9hoKoxuumWLyb+Y9G8wNrVZc1bYaCypmyzxzv7eaVUVkPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4Alrhjj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A011CC32789;
	Mon, 24 Jun 2024 18:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719252334;
	bh=dEStDFuSTYU8n7jrSHnMseqew7Yr9W9Y/sesTQnL1x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4AlrhjjM53NXC0HwSKg+XN15w1WObxHQcIoKn8b8ezy4hGWuKhpQy5Jnhg5sJHqO
	 NGPqle/peJMmON3qZObhYfPWxsLvm/vBAcA53IfL1tahCBLsDZpzR/nTV3SJfQpiTi
	 T5NL1yw33mpHLYT+29hXEVTGICp2Bvd/x4sUHar9yhSmJ6YfVtxPRtH/RVL7ZJN2ng
	 vlO8LU8mRe9eitNjYVBK1MkYG2Umbbcvwsn33k8xrjH/6EN2z5kXEQtIw+u3wF2hwj
	 VKdXKqXFjTP0B1li9GrmidpeAZz8tqnQBtgAda7Foc3ghb3XUjTZAP94m2euwxlPgI
	 rq9vPWdsjb3iQ==
Date: Mon, 24 Jun 2024 19:05:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the driver-core tree with the reset
 tree
Message-ID: <cc2eeff6-d7d9-45a9-a681-793053f0f26c@sirena.org.uk>
References: <Znmufb9L78FCoSSS@sirena.org.uk>
 <2024062443-runt-lard-fd07@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mXlM7WGKGIZH7Y6z"
Content-Disposition: inline
In-Reply-To: <2024062443-runt-lard-fd07@gregkh>
X-Cookie: Allow 6 to 8 weeks for delivery.


--mXlM7WGKGIZH7Y6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 24, 2024 at 07:47:56PM +0200, Greg KH wrote:
> On Mon, Jun 24, 2024 at 06:35:57PM +0100, Mark Brown wrote:

> > diff --cc drivers/reset/reset-meson-audio-arb.c
> > index 894ad9d37a665,8740f5f6abf80..0000000000000
> > --- a/drivers/reset/reset-meson-audio-arb.c
> > +++ b/drivers/reset/reset-meson-audio-arb.c

> No diff for the conflict?

That's what happens when the merge winds up bringing in no changes.

--mXlM7WGKGIZH7Y6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5tWkACgkQJNaLcl1U
h9Ca0wf/VadP31FBBMBtCQWcIenUZoMjYJodgWLkBDRdpVj9/jy2e94HRyb3Guw/
9kiZBmsRSaKuCJsHgRuam9Z1D5t+yCHCy545CL7WPdtfyZU1+xlqaUETgClTg4dM
SqNjqu3Sq2KY3UhEtVs5mdc2bJKxLCVKQYxBNCzpStvXMeqlqMG4BNyy1dkL1D1O
dR/PidTPBi+2IrcDL6EbP6dhqHOp02GhHTs7wE5Y27CMJErMLS745sPpz5mpi7+U
wS7i+0CsSCBJIgMBbU/+SXM8Ugd1MhtoiBNRXw5IWcSojuYRd1RGZr4CHMMppnZI
2i0moT1mgoNpmG7eqzfw2UVRxUDZUg==
=4okn
-----END PGP SIGNATURE-----

--mXlM7WGKGIZH7Y6z--

