Return-Path: <linux-next+bounces-5802-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A0A63D36
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 04:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA9A416C30C
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 03:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1739140E30;
	Mon, 17 Mar 2025 03:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PmuR0G8d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB16FB0;
	Mon, 17 Mar 2025 03:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742182480; cv=none; b=F7hIbe2wM+jVcaeQNtU6jj4TPHmIbnYyD2E+9UIrgsAgOqceC7S95+36rca3+u9lVSjDvKMCTxm5EAZ8X2y8kr+dofWIVs7jhHKxm07Jeq6Bn6+GCVlRvrEyveTUXFTUFIMImXPe4ub+JKAyufU+SuP7u0yFDSVF/4uChnlC81o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742182480; c=relaxed/simple;
	bh=8uZmApkXW7b9Y6jVuKyzuSfXSSnei/g83J+noOsV90Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q5IO3ZlszH5zMlQspqeXQDMUpAAOauhfYGNdlWblfn7BSr8wgERIK/5PIq9VTp/+jcs3qU82lG0Lep2S1vtK3SLvjy5pMngOQucX77vZm12rK1a/KvKVKdFsKaRrfaD5ST09pkychpR/mGTOfocTwkQKjhXcqmOYn+TpCE5l7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PmuR0G8d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742182473;
	bh=qnwInVQxbKwG9LCg+xx1RmsFb5dT9RinSQ7qC0DlDk0=;
	h=Date:From:To:Cc:Subject:From;
	b=PmuR0G8dWg2ey8cBX4Kx9JKtQR8m6NwexRmLyqa9u6DM+FpVm5sP/uoISSj13cPUa
	 N9GyE+uPRmNafwq4S1+nsrA8UaoGc74zOdxEzJDs2GNI9M4hZXnCMtJD5kkUCI0YT4
	 Kkk2umFPf1Tuq9rYoIGR9RdIhjXYQ2Oq20C2++p7Dkm05dEOi2Xk8OsoDPukcsgYO/
	 8qz9GZYoeYJoJ8rwke2vOU1Zi7J07evPqmxGqlG8cLy2iRPLPiECn2il3Br8UcJm8V
	 3QEvFkqn2WeuWkXAfFXY3iuDqmHYzjWLtAfDijSnnWibFeRqyeEVWsSt+3530bkHfI
	 sH159uglmW4vA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGLF43xpjz4wcQ;
	Mon, 17 Mar 2025 14:34:32 +1100 (AEDT)
Date: Mon, 17 Mar 2025 14:34:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Hector Martin
 <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nick Chan <towinchenmi@gmail.com>, Sven Peter
 <sven@svenpeter.dev>
Subject: linux-next: manual merge of the backlight tree with the
 arm-soc-fixes tree
Message-ID: <20250317143431.00ba29bc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YAUj+LTCYJbqdQvoWeUpnul";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YAUj+LTCYJbqdQvoWeUpnul
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the backlight tree got a conflict in:

  MAINTAINERS

between commit:

  4fa911d2d4cf ("MAINTAINERS: Add apple-spi driver & binding files")

from the arm-soc-fixes tree and commit:

  d1ebaf003a06 ("MAINTAINERS: Add entries for Apple DWI backlight controlle=
r")

from the backlight tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 55e367614f61,a576324807f5..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -2266,7 -2254,7 +2267,8 @@@ F:	drivers/nvmem/apple-efuses.
  F:	drivers/pinctrl/pinctrl-apple-gpio.c
  F:	drivers/pwm/pwm-apple.c
  F:	drivers/soc/apple/*
 +F:	drivers/spi/spi-apple.c
+ F:	drivers/video/backlight/apple_dwi_bl.c
  F:	drivers/watchdog/apple_wdt.c
  F:	include/dt-bindings/interrupt-controller/apple-aic.h
  F:	include/dt-bindings/pinctrl/apple.h

--Sig_/YAUj+LTCYJbqdQvoWeUpnul
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXmEcACgkQAVBC80lX
0Gymtwf/UK/EZUcoVy7B62NNMg/gGMWKpKRD30i9gltXYf4jNRcc8ZFUqx4Cf3GQ
WlBxAxclgwwIbunV5y9tYkhHFZlfDfLwUZadyBD1xM25wY4p5+JRtEdcDgdAUn1m
AOJFHNFXxAcN8VOqL+OF9rNb/+xtUuSl9UYBJMD/ksRX7sPM696OYmfGM1ODNnRf
XWZztqGu7r+tthEE2KYsDOncJlNhIg/2AakByv0O4NaivOUpTePup9AfkL9T9rhA
5tBsOu0LWGs0BbT9k0svlv97wcleDDkbZuIcVHfpLXWlFjX6W3qmdElJvj5LPdsM
EHYD8l4pZv3z824Fsu3op2CMi9buvA==
=iimz
-----END PGP SIGNATURE-----

--Sig_/YAUj+LTCYJbqdQvoWeUpnul--

