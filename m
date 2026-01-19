Return-Path: <linux-next+bounces-9716-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 713EFD3B573
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D53DA3009D66
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265E62ECEA3;
	Mon, 19 Jan 2026 18:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOQlRh2A"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E7D318142;
	Mon, 19 Jan 2026 18:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846839; cv=none; b=W83XZHVCMFv8IKywK/xZvhTwPrjjj/EM+oHkVR+4O/79H7pdUFarqHeyS+gmV+vC3NozkFkUFymgU2n7+WHm+Rg85UoeUeNz4fJP2meHIq+LM7k6izaKC5fjw6BhD3zf4iJeh7Fl2FWq7xTAkiXHvYbDvlOyKRgO1MMCQIGXN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846839; c=relaxed/simple;
	bh=LdRY6iucm53TfUNQVTI238DCic1LdNWFeofO49kLJHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X11rmDmAv+Ehi69NdXxiRw1MSTOHcUmRzBCg6tfADbh3302YM2yyianqrjvAbjOviTfm1yLe3rIylq+X2824hG+imaIvmVNHtRH3lZh7KLp4PNmmrqNSwUR6mhkKmXosR6nuyucFB4MzXyDIDU0WlFXrQkDHNoc0hagU4DcJM9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOQlRh2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37366C19422;
	Mon, 19 Jan 2026 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768846838;
	bh=LdRY6iucm53TfUNQVTI238DCic1LdNWFeofO49kLJHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOQlRh2ALchoe/iYkO/HT5Ps6J9EE1CI4EVKmmaQlD/qDwAKJ1WDdkAFXL0r22mk+
	 lITulSIslefprPs9dnYGOjdYT49f+5KGQUj1Uy3HpHoe4UT1PKyGyWTYrH90xMhCef
	 D6e/DetQE0DfVAZo42in/P9GUbG+HBu9T0yzcrCXmc4THwJ/9QkLOYYfDAL4f/uFqh
	 gDp9zTKTocBK832RMFzU6EHkxE66LgTZJkBpZYTZUD5UBwFq2P/tWGqnVGS0vYMOWz
	 g3fpGvY3Id+Fk/41dDK/kR/1oIA9ZKP2X4Oi8HcEw+iZ0PEminu0qljuREfEX2zVzA
	 V+IBjARP3SVlA==
Date: Mon, 19 Jan 2026 18:20:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <b5e4e92c-91bf-457e-8cd8-5bbb926ab6b9@sirena.org.uk>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
 <7481981a-1441-40cf-9924-de1466a9f33b@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+PE2sBpg9sNeU+gn"
Content-Disposition: inline
In-Reply-To: <7481981a-1441-40cf-9924-de1466a9f33b@kernel.dk>
X-Cookie: Does not include installation.


--+PE2sBpg9sNeU+gn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 11:05:17AM -0700, Jens Axboe wrote:
> On 1/19/26 11:02 AM, Mark Brown wrote:

> > Caused by commit

> >   4cef2fcda3ada (rnull: replace `kernel::c_str!` with C-Strings)

> > I have used the version from 20260116 instead.

> Adding Andreas too. This is a bit annoying as other stuff in the
> block/io_uring tree would be nice to get exposed...

Like I said in the other mail it turns out this has been there for a
while (something has triggered the rust build I think, I *thought* I'd
had the toolchain on the build machine already but ICBW and might've put
it on after the release on Friday) so I'm going to do a revert instead
and everything else will get picked up.

--+PE2sBpg9sNeU+gn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmludfEACgkQJNaLcl1U
h9DvaAf/eIMQpprjJ+Xiv17o0qCdJJxCDRD15CJv4ded3urgmsZIVm4OyLMt7woV
OH0k3XibZ1okBwSbUREwgjCkjpiJGy68x2EsrHWbRD0e1NGfKd1dkeh+fYEyunip
oQOn+rz8Iexp1/2gbX+LNDkBUo5T3u+4Ut0iUflfsxLEGbezzoDKBwCtsBZlCQHO
HF2bXUjwjnjJsPeBhebOA2YwQ3eTcssMlr3IR2keKewmWk/Myy2X5X+hBPIMAJq0
jkxuMYM5fyOCBq9p995PxAVA6lSd+ZSowiS6WmU/lAPxzYsBNSST5KnCYzkdt6jS
Eb1REHLL4vOX1w4o9h3JWR1porYtWQ==
=tF6O
-----END PGP SIGNATURE-----

--+PE2sBpg9sNeU+gn--

