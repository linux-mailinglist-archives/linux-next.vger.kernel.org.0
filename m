Return-Path: <linux-next+bounces-2565-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD490B6CC
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 18:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5246D1C2366C
	for <lists+linux-next@lfdr.de>; Mon, 17 Jun 2024 16:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D8D13AD11;
	Mon, 17 Jun 2024 16:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6rsFGtM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B41553B5;
	Mon, 17 Jun 2024 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642687; cv=none; b=C1pywx4Dg4JmOYn59yO3KL8kaZwpROM5Vkt/i/1eldTayn0ESwUotelEg5m8l3xVNbxsQG6I5GHhOWq2bGlMQhvPg1mqnSdWHmxWVeCj085Jj83kRq8yoccwVIq4lrFj8cBHuEpm9LR0n54GrJsEsHaI1WXgADq5i310e2GRaw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642687; c=relaxed/simple;
	bh=fxLVzo+2ZT7HYt/prqGCBsBTnbT0PD7moPGAuSTb58I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SEABPy5Zc+2bzR3QduWPqmUrUJ3aseIPAg5mIj4gLZbBqUMLRaiHqo7eoW7VNY56cZU3JOVe0AKbTx/piZgyaoGMKueFgAYTu7SBKLHPNnKbENi4c/DQ8k8bw+s8sH4ZDSbKZdak+wpCMQ7o2us2TuFXMocfB9Hh5S7CCLX6PRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6rsFGtM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B542C2BD10;
	Mon, 17 Jun 2024 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718642686;
	bh=fxLVzo+2ZT7HYt/prqGCBsBTnbT0PD7moPGAuSTb58I=;
	h=Date:From:To:Cc:Subject:From;
	b=n6rsFGtMKSkTIFSXpIMdCwQio9jYicY3Ddbzy6orElrR1tnxanBGgNjbXwJSJIjyB
	 IhwVeAw8XBAC6ZG+Y/f0wlSWy7QhAMtcBa0y6/Ypw0AzySQgR0qhpJxapBxtEpa1hD
	 HN1WefaINoB2hkWQ37taBKTSETTmJ8bmkJgX1HoNcE6eRYVikjkvytdBcv1Y/J3fax
	 Ev6CTM3VpwNcnYZIl1th47/BlYRgHAXuYIl2QzCqVw7PP+uvpnJu9kXicPV4FHR/0n
	 uERUuZZ/hqEIBKIeZXLI50rY+G9ejxZnE4y/tkDxrGNbTtb09hH2Ttws1dD0UuVOr2
	 UxltFgEPuZA3g==
Date: Mon, 17 Jun 2024 17:44:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	Julien Panis <jpanis@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mediatek tree
Message-ID: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eu5EAOr3acTKhxzD"
Content-Disposition: inline


--eu5EAOr3acTKhxzD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mediatek tree, today's linux-next build (arm64
defconfig) failed like this:

/tmp/next/build/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display.dtsi:113.6-121.3: Warning (graph_port): /fragment@4/__overlay__: graph port node name should be 'port'
Error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 syntax error
FATAL ERROR: Unable to parse input tree
make[4]: *** [/tmp/next/build/scripts/Makefile.lib:431: arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb] Error 1

Caused by commit

  d7c1bde38bf37a5 ("arm64: dts: mediatek: mt8186: add default thermal zones")

I have used the last version of the mediatek tree from 20240613 instead.

--eu5EAOr3acTKhxzD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwZ/kACgkQJNaLcl1U
h9ARbAf/SbPmuU+REdW5OOksuv162VL/mtRNAgoP5stk1AWd6okamA4YiGYHq9Xk
pxJ6yGMpAkYINGy2FYsPYDLbHojkC5UR7wb168Y96NwsvPcvXipsCYLEwM3pObGv
o+jAXUAmF8WqpRyT6ZdzNloBrmO3lu9DumZEY/BgofpDol3/+8ufVpMOYEFWocO3
OJc4RS7jMJfPSHI+szTapuKBmNpp+ZfUvuZwGBHCSohejQOD9aHSp6Hsa4FavwsI
8Q8GIubgBlzSqI1t1QMG49vVw8mdgX9+yVZG6mgo4WDmNc/rAsNHiqnaDvcg5rCC
p94GMAKYMBRhvVgLc4X0c3hfcrOLAQ==
=SUL0
-----END PGP SIGNATURE-----

--eu5EAOr3acTKhxzD--

