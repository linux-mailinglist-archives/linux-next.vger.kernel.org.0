Return-Path: <linux-next+bounces-5566-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81592A44123
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 14:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C485D161CFC
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 13:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E30A26989E;
	Tue, 25 Feb 2025 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vzr0UviP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05417269892;
	Tue, 25 Feb 2025 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490683; cv=none; b=SdBHkjYRGURUl6F/JlSqXJy03Uy0b2o16m0V+IwrnLP1OHqeTFnAqrHA4uD2DiIjbw8g7SECLpXcoIEysYCTQDve2s9/nxKvKe1uvnX9Wsnpwn9bbHDrtqpKG3KEjdvcQZK79C8hxMM7I8F581Y0mQr68BP2SzWEVmvhAOnIdZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490683; c=relaxed/simple;
	bh=JYEdD1tBVq5up75p3PFSoX3c/LQwNmnNkC7z1D8MSiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsRjVUvK7j3oQGLP8dcPwBDeVBTjCr8LHPpkgFksXDCQCRxRb2O4sACy6tRygNqtR2C57SLrXft5SYYoRrDXMgk43/lgP96sU1i0USIKdPFcsRxWgTbnPTMIzPEqSjFoW17BTgNYwbBK9bZkbzcVbIu2WbTZ2z1wIQ64ePt3His=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vzr0UviP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFE9C4CEE6;
	Tue, 25 Feb 2025 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740490682;
	bh=JYEdD1tBVq5up75p3PFSoX3c/LQwNmnNkC7z1D8MSiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vzr0UviPefhrBxkDc87rjrCWuWcw2pcS4toSRObzQi8lf3HNk2aHTYJRCfr4vmvi/
	 o8UQPYh/8GKuniJAgKwiqxxwOwG5oRlmbQzQjqrIDkz3HwkA/l87aKbJxm4cHx3nT6
	 yxW2sqaXOr6ZzfESs4SSFJl3zfuIdPPHf+zk8oCgztaJYJJA4LzpbXNIjUowpzFW5B
	 0jbHG8iSkp0rb84sKq722grizm7l/7O3BEDrsnFq+OMAv5cJnYwYeeirzudpJzN6Pz
	 bgQGoXMS0SJcuqiQv8d2FztGxhmlvAc+ES9CoNWr1vzU1ZG9UWpdbd8tuiUOuJt8hT
	 +RyrouA6p2OYw==
Date: Tue, 25 Feb 2025 13:37:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the regulator tree
Message-ID: <8e01b9e4-1ed9-4424-bd51-ea7e441a8fff@sirena.org.uk>
References: <20250219134354.144eb868@canb.auug.org.au>
 <Z7rcC3YskGoNHdvN@dragon>
 <7e616125-5909-41fc-a17f-21d07638d72d@sirena.org.uk>
 <Z70QuuHrIbirDZiB@dragon>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AVummlCmt3sTaiGz"
Content-Disposition: inline
In-Reply-To: <Z70QuuHrIbirDZiB@dragon>
X-Cookie: I'm not available for comment..


--AVummlCmt3sTaiGz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 25, 2025 at 08:37:14AM +0800, Shawn Guo wrote:
> On Mon, Feb 24, 2025 at 04:01:46PM +0000, Mark Brown wrote:
> > On Sun, Feb 23, 2025 at 04:27:55PM +0800, Shawn Guo wrote:

> > > Any particular reason you picked this DTS change?  Would you drop it
> > > from regulator tree?

> > My understanding was that these fixes all needed to go together since
> > the interface changes were a bit dodgy from an ABI point of view.

> Let it be with regulator tree.  I dropped it from imx tree.

OK, great - that's obviously easy for me!

--AVummlCmt3sTaiGz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme9x7UACgkQJNaLcl1U
h9B/igf/WpORtbnpKNHhxEFIJPGm6GX0skFVjL734UmftawnA2SlIeDRpNGotyGJ
eWUBOUSDA16T1t3F3VqQTKvs+iYOmMPKSbmIpQISZPpin3vKuEjJgosDJIMbxXlQ
yH6r+iwoAM8xgvzjXxgmfa2UiwdZkpc6WCXDW1+B2mUJSRZKtLHVsFjxcqYXisml
EpYUcpFuIgXeE4BqXiKiHqzsgHK+rKqaCaRzGAypgZDnGIvjARrwcXmp6AGaFbmF
wiVbBIP4iZAfWyDntV0qZoMlJ/yN3gFpp2zNAbo3YNfCr1i5uSLC5XV57txDW5eT
28cHW03+PTGe2tZZLUZpw/z3wpIqRg==
=/Qt+
-----END PGP SIGNATURE-----

--AVummlCmt3sTaiGz--

