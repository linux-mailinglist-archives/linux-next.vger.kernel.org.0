Return-Path: <linux-next+bounces-9505-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFABCDC234
	for <lists+linux-next@lfdr.de>; Wed, 24 Dec 2025 12:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37EB4300DC97
	for <lists+linux-next@lfdr.de>; Wed, 24 Dec 2025 11:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7047131770E;
	Wed, 24 Dec 2025 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/RxVBRS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F933164D3;
	Wed, 24 Dec 2025 11:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576114; cv=none; b=XpN02Dbv664OdIh1p8BZDkOPLy4pWLnj8sxF1D2J4uYy+CYS/RgOz+CfX7t/dlF071utb3uAQtmGhqLgwnJTzxRC2kjrVaLQD7pYjpGy3MLw25OkQ8uWP3MWbBJsWWolThm3y700ZDRKLfeSPyIyiAJtxwADSAxuVE7HPoVnqOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576114; c=relaxed/simple;
	bh=Sx0CZNiJLuiJ3GYVMjO8d8pC2m6Ll3K0KZdivmQHsCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcYxfEgd7l0lQfGkmv8SD+anNYphYWPMLsa8uWTbFLqTV2aHWOzh5aL7oUp02MRsbEJER5ZHuuxTdn3AiifBqfX8GhYPrAW6CUkniUTh8rEb4N4Ws8hCSj5QXW2xsXKCQtgguiZVAXUO0zDPfdpmtS0SQ4xT294T5fCHPVK5618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/RxVBRS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782D5C116D0;
	Wed, 24 Dec 2025 11:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766576113;
	bh=Sx0CZNiJLuiJ3GYVMjO8d8pC2m6Ll3K0KZdivmQHsCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/RxVBRSstAano71q40300IjVMEiW8AzOAuLoDPeYIilRLUasheBmP9IwF5IYWfp/
	 y0jeqz0gbiZ6lCWjN04OV+ZSh4J8dM2gNoHUQMgBoFQqeHUgdBXIfl71lkXzz7K9hI
	 afDdOHdwZhP8gfSA+dqIof7DFaodwP+ucz/K0T8Ctk0uaQvv6rHbob3y51+whGAIYX
	 939Y3EBzBV8Y+hnvxrjKNaMOcLmUdTN1MIaXvnBcuyja0/19DbymfYYywlijQ0cRBh
	 YqjZmkmgy1Y+dxsFR6SwNA/jruS2YH1kB74rp2RhgywEaPU+fgbQmTD/21PqRhF/Y8
	 G1tKczBGaZvjQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A47BF1AC56B3; Wed, 24 Dec 2025 20:35:08 +0900 (JST)
Date: Wed, 24 Dec 2025 11:35:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Brahmajit Das <listout@listout.xyz>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amade@asmblr.net>,
	linux-sound@vger.kernel.org, linux-next@vger.kernel.org,
	cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com, tiwai@suse.com
Subject: Re: [PATCH] ASoC: Intel: avs: replace strcmp with sysfs_streq
Message-ID: <aUvP7FL6c1snBc_S@sirena.co.uk>
References: <20251221185531.6453-1-listout@listout.xyz>
 <176650962400.445350.17331328109538303145.b4-ty@kernel.org>
 <20251223192409.50a6e4ab@fedora>
 <aUsBgVbloPqBa6sZ@localhost>
 <877bucgpob.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D15Gv740fcRis8Yd"
Content-Disposition: inline
In-Reply-To: <877bucgpob.wl-tiwai@suse.de>
X-Cookie: Think big.  Pollute the Mississippi.


--D15Gv740fcRis8Yd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 24, 2025 at 11:05:56AM +0100, Takashi Iwai wrote:

> I believe it's a false positive, too.
> Or is it about potentially unterminated strings?

Regardless of the warning being spurious or not the cleanup seems like a
sensible one.

--D15Gv740fcRis8Yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlLz+sACgkQJNaLcl1U
h9DMjgf/X882mx1ReqUoyWevrkkmbrYqDryadYnmjMq0FdRjYG4kOgbNLPrQBTkj
wR5OkH3QKQ3VBO8cCfCpx7zaLj02ieePGQ1HMa5OaGgk8Zto8J+JKgBAW//etkBl
oTUO/TRi/YjWpOda0WJNPaceetQvMWM0eHcqYhCngjPCWBbl8i6i6ll+iRPsQNrX
VhUd+ip4skoh10AehiGohe2bqZSiyRSEIvaClyjJQsGCiggU7S5mTdXOo/5b0XS2
Lpn7xZXlEDunS5LDLDZCFNNZGhJgNX2D4+zCXe5M8j0EX6WuZ5m535jUHmLYes+L
CL+juZ4QuJ6lqkzqGgpYkb24WXy+UQ==
=4Hab
-----END PGP SIGNATURE-----

--D15Gv740fcRis8Yd--

