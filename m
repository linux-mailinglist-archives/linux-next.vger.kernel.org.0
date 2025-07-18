Return-Path: <linux-next+bounces-7628-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 385EBB09EA1
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 11:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 751B5169E4E
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 09:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E2F287249;
	Fri, 18 Jul 2025 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qlxnxNCz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D239615278E;
	Fri, 18 Jul 2025 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752829557; cv=none; b=XgOkyTxxL+VzmKqd0tj93UInrmhWM8lsn1dPGcbbo+0MkxM7t90eNERBLjE2LbEyXOPz4DuheLPJO235vT1ZP7JRLSCoSveV0GOR+1sPmqXPdSVHT1cb3u1SMcI/fR72ZuYsMOe9R0DTEDAoJqXQFDaCzOTunlf5+kGvyCVf6iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752829557; c=relaxed/simple;
	bh=f0VVi41T6zivDNd07o+rCixIlib1Ucv02OY8AIYMWsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mO5/lUCx69OHQi3/K+5PakaILACO//SXEbNOCWzdAQl29FBrU8KbWfmDLRJHIUGPEoLH8/++M/wuaR/LKLuyfJpLAT9bxianDNc3q88KHSuzXC7XAOOT9Z+qKSRcJlZBgUbeMp1gfKN6J75sr7Km/Uw7PSbPP2Ad4rO95FR5qd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qlxnxNCz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752829422;
	bh=dxpMyWxXHbMveykbGUEjc+MGNvSTR3m+LR+Y/yUUF7A=;
	h=Date:From:To:Cc:Subject:From;
	b=qlxnxNCzsBiUXktPPpeWzCiLR/MkVImsHYA3CzPCcTNV4XwxERmR9xNSgal4ztxlK
	 Ro+XJ+2JHkkwvFv0swkgVR4fPIETSd+zjpdltxq6HzokoWXMzQHsqZIw36xwP5VgAV
	 DzV/oPna/L0P7cwr15fmJJJ6uiWbhLQNcX73RaOQKq0+T9VeOBa2w+sYR4jd8GRmsE
	 FtZmFHiG0Vt41m+d8ezWBqOqQxL4is2cDaGtpsH3t9f5D7Rx6SVKLXRGGUTWOBvQ0m
	 0H+h6Xf5u0rZMl5ExqrLiBBzBuCrDJNagXdvWw5mkplcVPxQFOTy1iyGoW0Mnafhtg
	 CLaWNBbeOGRwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk3k56Gshz4xcY;
	Fri, 18 Jul 2025 19:03:41 +1000 (AEST)
Date: Fri, 18 Jul 2025 19:05:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>, Xose
 Vazquez Perez <xose.vazquez@gmail.com>
Subject: linux-next: manual merge of the gpio-brgl tree with Linus' tree and
 the jc_docs tree
Message-ID: <20250718190551.6f250af5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gx=cY6idGfCgSEyz0U3=sge";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Gx=cY6idGfCgSEyz0U3=sge
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  MAINTAINERS

between commit:

  edb471108cf1 ("MAINTAINERS: remove bouncing address for Nandor Han")

from Linus' tree, commit:

  739ca710a777 ("MAINTAINERS: replace git protocol for github")

from the jc_docs tree and commits:

  ae455b249449 ("dt-bindings: gpio: Convert qca,ar7100-gpio to DT schema")
  f03a7f20b23c ("dt-bindings: gpio: Create a trivial GPIO schema")

from the gpio-brgl tree.

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
index caf590460070,971ee194ee83..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -3871,8 -3814,8 +3870,8 @@@ ATHEROS 71XX/9XXX GPIO DRIVE
  M:	Alban Bedel <albeu@free.fr>
  S:	Maintained
  W:	https://github.com/AlbanBedel/linux
 -T:	git git://github.com/AlbanBedel/linux
 +T:	git https://github.com/AlbanBedel/linux.git
- F:	Documentation/devicetree/bindings/gpio/gpio-ath79.txt
+ F:	Documentation/devicetree/bindings/gpio/qca,ar7100-gpio.yaml
  F:	drivers/gpio/gpio-ath79.c
 =20
  ATHEROS 71XX/9XXX USB PHY DRIVER

--Sig_/Gx=cY6idGfCgSEyz0U3=sge
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6Dm8ACgkQAVBC80lX
0GynRQf/e3LX/Hs9OIkXnOuabYimeCdKZleUOwwNQmBUY97Cd5B2qfWcM15KOzB2
6LrAOraMBCuJG6Z7TmtiCHpJc1goeI8J6e/TDy5z3wMD80U0jSUGWOA+IymtL6r6
lwNpEB3NgnKasz9c1mNpDYAyL+r74IDqhNq3DBfWw92uaROZ/j9n2sKpw5M0rMCU
oM28zJhXRivTHLgz2b9KCa5HYWI1YDJujNRTz7o2Ur/mgzE9d5KkUsy1mR0HPd5H
xTz9s3Ps/xOL3oDF+wIl5v9gindmv6trSvouSUixP6uhzB08dGb7Ws9P7O3cZm0q
0AiTa8pbGgixgWpYlkv+2bqHIFqk9g==
=8shN
-----END PGP SIGNATURE-----

--Sig_/Gx=cY6idGfCgSEyz0U3=sge--

