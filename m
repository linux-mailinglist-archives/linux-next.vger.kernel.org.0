Return-Path: <linux-next+bounces-9680-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F419D30E8E
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B90F30635F1
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41379389452;
	Fri, 16 Jan 2026 12:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oLnHl6WG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA933876CF;
	Fri, 16 Jan 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565481; cv=none; b=A6dQ8jFQrsuRsbYaDizKQG/5cFnGTVG64jSt4ko/9mESAPWE1geEI6kIPjeoof9xDbf7PVFV0hx1ABbnAZdHMPZwdHR+XxDhF0eu2qwMgXXKF9WF58TQm/ydYedI51ZS/AUmeqzREsmHytGb56BiT3I/Vnqlhz0ui8v1N7IUtdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565481; c=relaxed/simple;
	bh=aBdjzpTtcZ0qI5CFPQSxaEtJCSirsILmgGsCZ2lTJWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrW+vKBUtUIA8AGu35kHH4u5j0lfW0IUu/E4ouhVhqjjrx0EA4IqD3meexS3Zg2yeWKvBeJR0vKRG9A0nkoxQZowc7rbxLjwgbrrdmcXeu4EV2BmlDZHaV5XvXBycAZjGaP3MLQMOkDRa7CTmgL3AYnuP07+H2aejgBM/cI5FsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oLnHl6WG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF8CC116C6;
	Fri, 16 Jan 2026 12:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768565480;
	bh=aBdjzpTtcZ0qI5CFPQSxaEtJCSirsILmgGsCZ2lTJWg=;
	h=Date:From:To:Cc:Subject:From;
	b=oLnHl6WG/A0nXEAeinmh1XWCBJCoL1jQ+9hP3DCxyQaJBaJjEqohNgOy4PrZa4r2x
	 g+1MYdXDhI5/fUOtnV3chdzvMX3w9aK1y33uvRUIxXeIE+qkP8FDFE1tbrBYYkRRgu
	 oM+oVlwf2BoAQv0OyUsPHsrVg4/lDEig6NV8FRPgmsACrEtIrI69VQPcnbNwmRzdZy
	 G1hd979ucpS0x1Scn8ZQwEPdhG4J5tkm9J1AXtrx9CCYlbQTqXZyxWK2G+BNKw5Fn+
	 fRGxhFj+L7kmeyM1PANJe1ye3rh+vt1nX4D5BAbLMl980Uai2YkcgqSF9eSoJp5qA4
	 TWtZJ1hQO9Lng==
Date: Fri, 16 Jan 2026 12:11:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the arm-soc-fixes tree
Message-ID: <a28b9f46-c0eb-44da-9555-0534f7ea6eaf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IUSLUm3ia2TJc8nT"
Content-Disposition: inline
X-Cookie: I've only got 12 cards.


--IUSLUm3ia2TJc8nT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In commit

  2150467fc61dd ("Revert "arm64: tegra: Add interconnect properties for Tegra210"")

Fixes tag

  Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Tegra210")

has these problem(s):

  - Target SHA1 does not exist

Thanks,
Mark

--IUSLUm3ia2TJc8nT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqKuQACgkQJNaLcl1U
h9Acewf/U6NL9jU73dD9EFyIMJR2O8crW//rETggk/uIKDwSoGbHF+Te70MPu5BS
9tB0wpRmkEFLNE9/UUUD1UfQtEakRzieNuc4vm6HqIYeDPcTDXszIHeWP2W6VCqi
IPZHIirbWV+3/y4MC/a4Wu5h3d4duWDWMWyC7KnMpwJZJUKTlM6TYsd5FSZFXu29
aQWqoQwQ3D0cJnNvanPQQ7uCrYBvRu0c1kbXmbYrUpOmfRH1fGxm4Re9jVW968gm
D1Df6p7SUpDcE14Xf8KDeTBCi9aDBXWB7JC4po0YNNTg4ZW25HsmdkAy172sg/6W
5nH5ENK1iKWvb0PNAJp+TycADDa4MQ==
=xXHR
-----END PGP SIGNATURE-----

--IUSLUm3ia2TJc8nT--

