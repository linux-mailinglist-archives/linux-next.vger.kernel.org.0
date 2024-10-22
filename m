Return-Path: <linux-next+bounces-4374-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151469AB760
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 22:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 726B2B21AA6
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 20:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60C61A08CC;
	Tue, 22 Oct 2024 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7NtSWQt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AAF13AA2B;
	Tue, 22 Oct 2024 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729627441; cv=none; b=L9U91ZhmNwgRMs2W4d6UjWcr1zP+IIjWM2W5r3J+O6rPpIYl5aM4PuPxOtXGKL3e6BmjJOdJ/LVWeRyrqvrCvlFy8eoBZ4Dpdv4k45CTo2ksFcDywhGrFsDlXBkn1brUQFJ4BKSnszjOmDZj2/XrAnfOTk4TYboVVgyfQpeO7Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729627441; c=relaxed/simple;
	bh=Ce5m+lHEQ05NQAw6ueU3PLDjcUkOGXd5F2FK8qdhzLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjFRrJQoo5BhzyAiuQGFm3vH5mwc8FuFF1kJAbG+l6zWxlRoSTsv7vYD7BwwgxdAAJwqcroCy2I2KJEFqanSZ9k3w4WRlPj+K9pcQohOxqWov9HbMDF8Eejilx+4ISu2L/n58r4pLO0lX5OSdqoIPG1E4Lg0wFgR8c9sH3ZHYx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7NtSWQt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA7EC4CEC3;
	Tue, 22 Oct 2024 20:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729627441;
	bh=Ce5m+lHEQ05NQAw6ueU3PLDjcUkOGXd5F2FK8qdhzLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7NtSWQtC5AAicjrj25oqyA77ASOc8UEMmwL8+IDf1SRHdvKZ+ocH5wTp6Fush2XC
	 x5BxOuzPRa6NZwkFf2DYKb7xiEPqflQBUJOd+5Xgru9xiZUK4pXa0xHRxrbfoMPOm9
	 o9xXZTZw2CkvlNFB3+WCSga1nzJtWJf7rYuf2OcyENijW7uQegxCQm2vn6D+9/SWsf
	 YUJ7JbMqRZlVk0h827Dy9nfhgaQVBpsgEbytEK481SE2LOL/DAIbmV5GlfB5DCJvpy
	 +MEZNcwk3zRsdobGP6CJzbYVPnkJEu+7uSoSrwxOvhnlwaUJzEHSyjEW3pFoZkwLDH
	 q2wgYL0eOhemA==
Date: Tue, 22 Oct 2024 21:03:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the regulator tree
Message-ID: <ef8697e9-9eb1-459f-8c5d-197019029fbc@sirena.org.uk>
References: <20241016135943.24e1fab0@canb.auug.org.au>
 <20241016075510.GL8348@google.com>
 <4bb56093-5358-4d3b-aba8-f8815d2347a6@sirena.org.uk>
 <20241016130924.GB1152434@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hn4ANHQBzStGPp4r"
Content-Disposition: inline
In-Reply-To: <20241016130924.GB1152434@google.com>
X-Cookie: Surprise due today.  Also the rent.


--Hn4ANHQBzStGPp4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2024 at 02:09:24PM +0100, Lee Jones wrote:

> I said to apply the regulator patch because it looked like it didn't
> have any dependencies.  The latter part was my mistake as now I see that
> it did have deps.

I've now dropped those patches.

--Hn4ANHQBzStGPp4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcYBSwACgkQJNaLcl1U
h9CUxQgAhKGABRXzCLqCKiV/fHS9LrYJCoNC6G+9REH4TD5+7h4EOHczC8YDdoyL
2dAGK1uf514s0cdkn7+t8fdF1eMO1yG2Xyq+taUXUw+VpFd9n29HImdX9cBgGHSR
cPouq3j4GDZESWH9KczeZax/Y+u5fifCgX5uBiDM9BeWmy9gvMkOI5MZZBtTJ4ND
jVeKZ42n8Ndz+V0oPqB7/xnYciUauqB45fHiDOTB+wgKgaxwwbcxy0qZ/XsqHN9t
8GGR6qXGCb9UjnCzWi5mdoy/T5rZi3irUk1N74PgaNOkiglqIYcRjgtUdnA3R55j
BgpdPIrbtRh4L8e4J2vRbSv9pYzdrw==
=qftm
-----END PGP SIGNATURE-----

--Hn4ANHQBzStGPp4r--

