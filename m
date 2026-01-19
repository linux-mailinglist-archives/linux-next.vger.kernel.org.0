Return-Path: <linux-next+bounces-9702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FCDD3AEE8
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D53A73043919
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 15:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EF538A71C;
	Mon, 19 Jan 2026 15:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHk55XwW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F30361DDC;
	Mon, 19 Jan 2026 15:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836109; cv=none; b=ScC1/4vh6awPMq46grgT4j3IS/LNqiP2JhaLErXV4NPkLItZiaVFsEVD01Mu3nAFksPJdD2xD2sFOzxxm3olM5cgzB34nAU5v/cD4i+WT3sQBZlyvuTLQS2iGEQr9vz98HziB35ABgzMyskmRAmCC+sJyx5nFJZcH234MexYzTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836109; c=relaxed/simple;
	bh=hP6yANx7F87RWnkcJh47nQU8SBhuU++7n0hYiK1jqEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRuPWbJ2jbUS3qIetUSY2xQIgAMozFdnbYTxcwzsrXOKQskzEPlzkjCm0r0C0rcWHvUzr3vJH2KRlbwNLO4rzVlykcYK1CzRRThCR+a24nPz61nOTdUYUHlXfzgW0LK5QdvHOXyR/LeCh7Uqc+uQAWPJC4MPBAATAeYENk176/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHk55XwW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4EDC116C6;
	Mon, 19 Jan 2026 15:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768836108;
	bh=hP6yANx7F87RWnkcJh47nQU8SBhuU++7n0hYiK1jqEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHk55XwWFo1X4RctMEQ8g+bZRDJFRGzVgF07sh9JY4BZ3NzX5c8TUaZ40NgmCqYJA
	 x2BCxOX0UUVfIaweUlZmYhxCAlpZwHwPxfRMU6bTbi8LWVbzn9UZ1kkZ3qlGvhFr//
	 gb9+J5M5JSwsaCkOv2teBpiD5ZWmjXalXJ4qFy9ksCOGi2aL53WpQFAm4dXhrg4qTh
	 Hsvw6AUjgJAmFCaczGV4nqlwEeSbMTDdQOVdm2TrdAVcyaq/78oAd1uO+mGWt8tEaz
	 xPuKGdMgiI9pdbzRkBQ7UetwfZJ6YFzooPVEKVWAF9Zv/b50sZRXY1A076aJHxHuE7
	 Grstg6R9ca/HQ==
Date: Mon, 19 Jan 2026 15:21:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Michal Simek <monstr@monstr.eu>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>
Subject: Re: linux-next: manual merge of the xilinx tree with the ti tree
Message-ID: <c9d3063a-a652-4db9-8e62-3be34ccb27ef@sirena.org.uk>
References: <aW5KbYimWKx7obE9@sirena.org.uk>
 <723362a0-579a-4ed4-ad90-dc5eea4ae902@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+VuaZBVZ3M17mIkF"
Content-Disposition: inline
In-Reply-To: <723362a0-579a-4ed4-ad90-dc5eea4ae902@amd.com>
X-Cookie: Does not include installation.


--+VuaZBVZ3M17mIkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 04:17:46PM +0100, Michal Simek wrote:

> I have sent merge request to Arnd today. My 2 patches are in Linux-next for
> a while that's why it is new change coming from that second tree.

The merge order is fixed so it's just a question of which tree was
already merged which shows as the conflicting tree.

--+VuaZBVZ3M17mIkF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluTAcACgkQJNaLcl1U
h9AQ5Af+NikxdUzWZ3CwSgcyfzIKof39dGMZIZjIXkFxjLFX5zQlzI8YX2abNN8d
VNignp6MbOMiGybbASS3QYn6XJU4McF7dI86/BkePWSUx1b7x1t8BsDtCP6/a3NA
aFjIfzCfV8HhlhMYxf5bizXD6V3184bRpvNqSZcd0UEmN878xfeTIavE3WGGBXFH
G4e/J5y0kAzMqM2/fdgp376rc98pq1grWnPSVdEb+kI3VUh+9/CdijuEc15irbvU
1zrZayfE8D0WV02H1GhRlHqyCZKtXqscexpeBdHldp6zfqTbBwuwysZRQLQIgJ8d
uP4i4CQ9dc5aRBdluUe5lM+oFsxDCA==
=H1mN
-----END PGP SIGNATURE-----

--+VuaZBVZ3M17mIkF--

