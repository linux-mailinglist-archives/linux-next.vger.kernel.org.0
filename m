Return-Path: <linux-next+bounces-6899-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F85AC0339
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 05:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AC27169869
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 03:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4D2134CF;
	Thu, 22 May 2025 03:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CsekdJ0B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B797713C8EA;
	Thu, 22 May 2025 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747886077; cv=none; b=HOSRD1411uX1/lCYcw2DMoUiZxJfTSrC8RBm5ywDjIgMFcSr903NwNMY9B6th9Uxm/bUipBUP78bnIYJqqh6Ui4j87OPMMAAlrpREX0lkZdGFzAlfSqImsPyGadhbAHwzrB4spmqSTCTsH4BMKQqYeOkrAdVQ5hmBsuaLjV+kMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747886077; c=relaxed/simple;
	bh=2+jQzFNVa5cgzz6j8aCJcHo+8eX7DJJvhxssxR/Deyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RgeeOqa80JHF5Y7xgZU4lt/t0U4drR1c0LXD18ed+LiOx9RtpyeS6De9u9Yf2iqqcnsLZ7cKPp8HCj+zY8Dc6p7o0bKds4M+ihMYlYT7EFBmld0spn2mhB/FgZ5ox8EDegqLax/geIdSvV85/SoD07iZ8vcoUOnvwsb79bwM7SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CsekdJ0B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747886068;
	bh=E5969M2rt8A9H8jXyAe1CRFepbcBCsnguHNEWanyUaM=;
	h=Date:From:To:Cc:Subject:From;
	b=CsekdJ0BbTNqTMFXEQe5LFbH2KPAKBh5GP57BjIjX2tO8fsVL9TLlDUB58qnKJtSA
	 VAB6i/7Uht8V7hwz+w5fbhh8hhdtqDXzpeBGXXKN6Vnn9zC5DOkmuYnE1qMPEftoMo
	 86Y9wA8IugGY4ey2XaR/Ow4xCxoQWe00I8uIMvKMKF32D3hTd2xxLZmeh3uHaPeLKM
	 NB7A6sSu0qxQFGKJNP3XiQJ6Nj4Es3OwOU5A4ykzLOmRdEhX+v0X02SyPdqLhho7BQ
	 aRBb9IEJSb/M8OJJ62WEbIsNcz0p2mos/FZESwaJmB37iZEbxa9/xcz0Brc4MeJkH8
	 RjXaXfinVoWiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2vYb1RDkz4wcx;
	Thu, 22 May 2025 13:54:27 +1000 (AEST)
Date: Thu, 22 May 2025 13:54:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>, Eric Biggers <ebiggers@google.com>,
 Fabio Estevam <festevam@denx.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the crypto tree with the arm-soc-fixes
 tree
Message-ID: <20250522135426.31baa98c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ImKYQSiFcD9J_N.rImKCANl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ImKYQSiFcD9J_N.rImKCANl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  6c9ab811871b ("arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected")

from the arm-soc-fixes tree and commit:

  3357b6c94569 ("crypto: tcrypt - rename CRYPTO_TEST to CRYPTO_BENCHMARK")

from the crypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index e0d6ac7fd91a,4166bc4d3cec..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -1724,15 -1729,14 +1724,14 @@@ CONFIG_NLS_CODEPAGE_437=3D
  CONFIG_NLS_ISO8859_1=3Dy
  CONFIG_SECURITY=3Dy
  CONFIG_CRYPTO_USER=3Dy
 +CONFIG_CRYPTO_CHACHA20=3Dm
- CONFIG_CRYPTO_TEST=3Dm
+ CONFIG_CRYPTO_BENCHMARK=3Dm
  CONFIG_CRYPTO_ECHAINIV=3Dy
  CONFIG_CRYPTO_MICHAEL_MIC=3Dm
  CONFIG_CRYPTO_ANSI_CPRNG=3Dy
  CONFIG_CRYPTO_USER_API_RNG=3Dm
 -CONFIG_CRYPTO_CHACHA20_NEON=3Dm
  CONFIG_CRYPTO_GHASH_ARM64_CE=3Dy
  CONFIG_CRYPTO_SHA1_ARM64_CE=3Dy
- CONFIG_CRYPTO_SHA2_ARM64_CE=3Dy
  CONFIG_CRYPTO_SHA512_ARM64_CE=3Dm
  CONFIG_CRYPTO_SHA3_ARM64=3Dm
  CONFIG_CRYPTO_SM3_ARM64_CE=3Dm

--Sig_/ImKYQSiFcD9J_N.rImKCANl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgun/IACgkQAVBC80lX
0GyPogf9FadLTwEAH1WdTiF1LfsqmcK2B26c+1VO43iD8/S8a2oCTMzPROrwkG57
f1dO+XZs9ty4ypHdJSa9wO2xPSlxBaOEHYbBhaiMCXrlKcCVqAFyPKQkxBPyyzM+
j6syCdxJ/ISlshRqhWnMyqusN44d4XlFsC7rOoyLeBwgmv1Cthtzw1yD9zfJIkEX
rnUiuOgoM7LTyIIZeAtjdr8ADCasWmSTPWfqz+CPXUieMSOU1dFlvT0RIv2L80Zw
ytUlzcoI2eO+bTk+Ffm+Rbgy8ndnOXSldDYR0K5O0sJkfSMV/cmeBFvfbiRi3phz
edwWNOjwW+sq1VkG0gVqu+fNFSkRYA==
=4qkD
-----END PGP SIGNATURE-----

--Sig_/ImKYQSiFcD9J_N.rImKCANl--

