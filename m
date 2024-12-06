Return-Path: <linux-next+bounces-4883-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A49E6C32
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 11:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5823162DF1
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 10:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6791F9AAE;
	Fri,  6 Dec 2024 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zl0Kz/dx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74A4C83
	for <linux-next@vger.kernel.org>; Fri,  6 Dec 2024 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480500; cv=none; b=V22F3muCdSTG1Z/j9f5gArrXEHKYa5GjMk+jHL2HTP+DylApEPLeu8RD7at1QPS6ArWmCTYDxERKUDnvYgySzcAKYO3Y6sq+TO0Sq7nVcYhOIgW/zj0i/qYjtrtOERd1nhhIe2qn2EHkmvA4r0wLQMcGDjknc3YM2t7oqjKGdZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480500; c=relaxed/simple;
	bh=TsUS6sZWrrgDUnAw53+Vc7CIEpLcSVbqXYnFT63CTBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dIkPxwfVB0D9+GmhR+WvPGA3x5poCGXAql40/hAz8F6PWPLFXWrFLtwfD7DWwdF/JLEEZ8SH6avEjbXri0OuXPrl1CCzEJZSXg4uh02GLVC1n7QWdvryn0RSG9zOwmgSoUPJuPwQ00PetEeXDO1E2z9fJ31sK56MQAjj3OUlEV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zl0Kz/dx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAD7C4CED1;
	Fri,  6 Dec 2024 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733480500;
	bh=TsUS6sZWrrgDUnAw53+Vc7CIEpLcSVbqXYnFT63CTBI=;
	h=Date:From:To:Cc:Subject:From;
	b=Zl0Kz/dxfhrr1jx1Sr2OkOd794PUM8o/Gvc+WFFWJZwIu16Ahj4dsNMOB940zukdN
	 U2esjnLFcNWuQui3svDKr1cJfotvVsB7TR3NcpnD8CA6SGw4JVvMZLNTBvPotqC1H+
	 eLUZSlFJGApxDJHUU99SkTFhv6EzXJvTqExIrfAkR/T9TKb5UnCanj6aQH+ZTRiFir
	 3yRAtuYbMxGKsXUgzUyhriBiOZjvFC6FxqZ2twtVpfhcorGXZfXgXfd9uMsiQBO6mM
	 ba7uC2YJWXlPVgnO1+N+1Rjrhzeyc3T+rhs/6lIgzxaFRNeI8nLEQmJKE4XZMVzQke
	 osSzrvHpkKfWw==
Date: Fri, 6 Dec 2024 10:21:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-next@vger.kernel.org
Subject: Missing signoff in the OMAP tree
Message-ID: <87c2f4d6-2c51-4410-ac3e-764c2cefbf30@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="235DPuaTWPXFAXYa"
Content-Disposition: inline
X-Cookie: Sales tax applies.


--235DPuaTWPXFAXYa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Commits

  93dadbfbd19fa ("ARM: dts: ti/omap: gta04: fix pm issues caused by spi module")
  1d5e14a20dc60 ("arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1")
  d8efc0b428856 ("dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible")
  08272ce1de633 ("ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus")
  eaa64013ad85d ("ARM: OMAP2+: Fix a typo")

are missing a Signed-off-by from their committers.

Thanks,
Mark

--235DPuaTWPXFAXYa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdS0C8ACgkQJNaLcl1U
h9ChaAf7BwqMbDI5pWg6XkqUOvGnYd1Z4ty1yT3VW36O9AaEuF9DjxxzK54W1uoU
jUAj0dJaJJpaMTgtSGGiwcQLd0UyaimGMQ14uU2hRvqkmNC5U4qf3Cio/vB/1VnW
LJUf2vI4MzOja08/BmEgs1TDcDi+UA+bWTsGbl9ipzCiehfrUG1ZwtSFdKbiUkdh
NQBaX60GdIzB9aDg5+183Rg9XA4R5V/M2t4j0ihvsUkRqWoDmEIHJkF0nJQ8BcRW
OTR+dWX+zsVfwQPbcHsGq1t0xomwUfk4K8Q2l8WZMv1KyfLGGge+ZWWWuVxbtF4n
QaohqmSa1rGGMKx3RXw//sz7Ym2oHA==
=5Z4+
-----END PGP SIGNATURE-----

--235DPuaTWPXFAXYa--

