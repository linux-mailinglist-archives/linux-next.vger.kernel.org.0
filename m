Return-Path: <linux-next+bounces-8489-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A098B9F6C3
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 15:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A13417CB17
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 13:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BA6211460;
	Thu, 25 Sep 2025 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDgAzpsJ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9381A5B9E;
	Thu, 25 Sep 2025 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805684; cv=none; b=o1bcQWkigRlDRqOmscw8CKfukl/qdg7n8yxThaLY+nk6nAsY0H3SunOrrERs9EPn1Wor9S85ldalu2NHO/HQP/ZZCHAdZ5VEB4OLtEfSAjRIcfH1a+BX8E30yTSPziYqppPumHb20rmgmFUtHzlRcm1OjrlbZWXPjp1aNd3C+wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805684; c=relaxed/simple;
	bh=LQO1dP39U2Cxosje9Q5tN17uTsyOAVGbRI0tYUogzAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hSrHRgO3Cd6/d0zrVToHwyy1vbKU4iOIbAR/ls3rYMXWd18Iq3mrj6Znonvb/QQzO6/lSkIEajPBru+ANPreyOQfrAMkXqulwUjn3U9FI+mGmB0jlpXcT5mCvlDauJrisPi3JU8IBRRmydes6Vl5/tLgfx4G0ycWxmSnnMzvPUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDgAzpsJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F188DC4CEF0;
	Thu, 25 Sep 2025 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758805684;
	bh=LQO1dP39U2Cxosje9Q5tN17uTsyOAVGbRI0tYUogzAc=;
	h=Date:From:To:Cc:Subject:From;
	b=SDgAzpsJL0w67pW8eZx5BdEQYDQjb3IBT9+08vQK8YnkLP5PVIiZ77SqZT/wShMZ/
	 jEIjBy6Iu1PPYGUSMUt1Taw9hq0WXDFVi3lUonlzVaPgI/0jCwuJKPEC+Q8NFEdP/V
	 osLe68AWpD6NbQ6EnC4sh4bOCDziSIbhYIaRkfjp80mQclqAtBI3jFzYenGxD1uAWn
	 k4wuuKL5fpAfF+NfXhcs1UP+RtUIQj36GsPhkb6la0E0cOrjZWnZ/DJFI/v6eRyEPK
	 /p2945jstDxA8izX0qa5156fb+8fyDNSM8fjtV+7faykIs/0Z8DhHMv4bry1JQyKR3
	 ILx4hBpsg/2Dw==
Date: Thu, 25 Sep 2025 14:08:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: linux-next: manual merge of the arm64 tree with the kbuild tree
Message-ID: <aNU-sG84vqPj7p7G@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MLxiuIvv79xjXb7v"
Content-Disposition: inline


--MLxiuIvv79xjXb7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/Kconfig

between commit:

  23cb0514208da ("arm64: Remove tautological LLVM Kconfig conditions")

=66rom the kbuild tree and commit:

  1cf89b6bf660c ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN")

=66rom the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/arm64/Kconfig
index 56eec3586ff77,69bde40e19e23..0000000000000
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@@ -1492,6 -1494,8 +1494,7 @@@ choic
 =20
  config CPU_BIG_ENDIAN
  	bool "Build big-endian kernel"
 -	# https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c=
2ba5308da1161c
 -	depends on (AS_IS_GNU || AS_VERSION >=3D 150000) && BROKEN
++	depends on BROKEN
  	help
  	  Say Y if you plan on running a kernel with a big-endian userspace.
 =20

--MLxiuIvv79xjXb7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVPq8ACgkQJNaLcl1U
h9CPTQf+J1B2deU7wIoa/pYzY46+jKkSOHLWisiXxE+G4KwkC6kC8gWfl+ilc7eL
+lxAC11gDQwqqSwttOA2cYSeio+qnlxoaPbf9hJFA0Qlsg/9tu/2kREXC8mRAuzr
2E/DKHfB0cpGPM4QarS8VwdNqbG3D92h9Gvk4tzPKag+wlbuO8ZsldXYYVZ3vR+b
DMkuWJPiyidb0jnt5MGayq+uIO0n09xbdMgufdGif5MGHVe/IMCyax2BFg9k/rli
81Vwo9mvKoM9oDCO4m/QXCnkJcz/RqPZvTvSKI/V9lH5DruUiEK/z6koobYxXJLd
Ts3YYS9ic2W29qAtQU7fwuRLdIcTvA==
=iwaA
-----END PGP SIGNATURE-----

--MLxiuIvv79xjXb7v--

