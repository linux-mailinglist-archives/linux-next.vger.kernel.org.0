Return-Path: <linux-next+bounces-5554-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3431A42738
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 17:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0D5D165D1C
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 16:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1FB25B66A;
	Mon, 24 Feb 2025 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q+uvAVqa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE663DBB6;
	Mon, 24 Feb 2025 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740412911; cv=none; b=jTzLxCNK/+TxOgi1pxt/NEkg54//Ww50SQw5Ac8Ur1/H7AiVSeJ30Nx/68JJAU2RWb0eUx+lxjr82QpJhBY5ORVoyGvrYHLR+x8N5ED92BxNaXCCn/zQOBSEBxIfAk894KqjSvufrcHWjlywIJzMu2f5QLlHUoGt9MHEOSA6PNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740412911; c=relaxed/simple;
	bh=+WoLFECrq1/sA7ZSENgjsivk/hBFMJC/CUlRi3UpkAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPbP2DJevhBL8aDWP2Ppnb81iajDXLECjXWFbtyForcu191yMzU6wV8Di1PnD1RMsLqmzNfQHEnIOxwFqIq2bQ49UvcJuswlL3rzlC/eu8lV6tACsFgTvLUybCWAViZDEo66BizHvRIVv/BqnXnMHAbl/syN9Ep3/gjaECEMCr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q+uvAVqa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41684C4CED6;
	Mon, 24 Feb 2025 16:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740412910;
	bh=+WoLFECrq1/sA7ZSENgjsivk/hBFMJC/CUlRi3UpkAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+uvAVqazSSrpgiXxIEepHVJjGmULeeVkysSbiiSTe0jGU/UiDHx6XP4sPmOvl6p3
	 ZXU7RhiyMhb+yUmPUCRSmwhg4s+mbsESANfOhJ4z8h6SGChwzyKIIh1voYGP7XeMAX
	 crlRMGEx5EbHmxMJ31RkO4lr7Ix1VUhSOly8I7RxGAVxIcGvFEe3E3M1kgxhc5/aq/
	 IDCLhVJzvEdEn7Mu7Pl9OgL4eQ4s0tSOWmdof+3NRmPWhXiSz7afSSiN5wL3jIagEY
	 Lof4HgSRu8RI9WYheYcCY/VrJ1L+GpVzuQUPV384yUTx6dUluOKyQl1qJaGqE/X9CU
	 by7njgZILLqbA==
Date: Mon, 24 Feb 2025 16:01:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the regulator tree
Message-ID: <7e616125-5909-41fc-a17f-21d07638d72d@sirena.org.uk>
References: <20250219134354.144eb868@canb.auug.org.au>
 <Z7rcC3YskGoNHdvN@dragon>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zAMhU6Hnw1p6ObYP"
Content-Disposition: inline
In-Reply-To: <Z7rcC3YskGoNHdvN@dragon>
X-Cookie: Phone call for chucky-pooh.


--zAMhU6Hnw1p6ObYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 23, 2025 at 04:27:55PM +0800, Shawn Guo wrote:
> On Wed, Feb 19, 2025 at 01:43:54PM +1100, Stephen Rothwell wrote:

> > The following commit is also in the imx-mxs tree as a different commit
> > (but the same patch):

> >   b5ec74c2aec7 ("arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT")

> Any particular reason you picked this DTS change?  Would you drop it
> from regulator tree?

My understanding was that these fixes all needed to go together since
the interface changes were a bit dodgy from an ABI point of view.

--zAMhU6Hnw1p6ObYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme8l+kACgkQJNaLcl1U
h9DDIgf+IVm2htScAsNPorR/RwcMDREc7S7fxmhKce4+jG9hOhP/vx8oKcSN79ez
nJjYLkraYlSKB8br+ahBUUxW8G7RfiSAQa8ONM4KWc5LMfhyXKl7Ove1lJ3h3fVd
+yy2L+N6rlpiV6jigtaHD3r3jylVentu7JbLN+vrsqn+y9Cn+dajP2CJ4W2tNPNy
gw9Wa8OQM5kYAKNyVn09DOReJ7tzE6pimsi/vN12+ngrozjQR9kMqDYBrB9Fa9Ku
nSuL8FqJifrsuH3KR/958nDrd5Sz8QavR/abOe5PTtVP0wwNd8vz4V8oX8WrzrN8
sSefvStuAj31e7UWgApTjlztnMfI8Q==
=hw8Z
-----END PGP SIGNATURE-----

--zAMhU6Hnw1p6ObYP--

