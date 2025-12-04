Return-Path: <linux-next+bounces-9325-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 07345CA261C
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 06:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 088DE3023181
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 05:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388DD25B1D2;
	Thu,  4 Dec 2025 05:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LTrh+KEu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6BF1E834E;
	Thu,  4 Dec 2025 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764824703; cv=none; b=MUtxKTNoQyxdp/e/yH2HbFuJCWRW3hRAkAoiiuFqeAm2nYu/8B7hqNm99rlxQNWmElxuDFR+fDjhujRt47tYPFLf06oDnG3ore6ky5qt/iJCMuMEK+HinuGqtQbL+k1i95Nsj4YWMNqFMIRakE9wTHJrm/rL5lpjlU2gk62HhzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764824703; c=relaxed/simple;
	bh=IP3u1NEYJ9lfaRyk8GoGAhGrXvjX/glSCzkvdeC9xyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rMmKZDqVb5OXMi5wEpi95Rl6IPtSaCADsIda3vtQYOqcV1Ut3KWG08WcgjHXKFVQI+PCw7MBlFrlHHzipI9a1soNQg4Tx6/7rp15Ly2ZsGP6B4LnioyO9W5znARFOQFvi8I47stgSPRMcS/htj3GR9rk1X87OsoL+M7KBDsU2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LTrh+KEu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764824696;
	bh=FmaeBIxvFuh/BeuSke/ZG/pnNPAJH+VGWW+wM8C0jP8=;
	h=Date:From:To:Cc:Subject:From;
	b=LTrh+KEuyQYilXqOdHkOQXuRg3tbhG+MLGfx7NyWT/2h+JhtMG86+NkfHz7nv3dmK
	 SCfMDinJaYv4AzQZJ2mgzlCKOlw9rnJEdC7cLfYS57DZNtahZ/GBC4Z76MTNeBvSdH
	 ZKWJZsIQfhWneI1BU0Q9X9bBT/zjZL+SdvbW1rGuGDgGoH2xaA0wxjqpwLg7o5RIhJ
	 s9FhlQyLdWbt6BL2Fv2sEdHyVEIzir0RmU5xG8JmrojPo02pWE5tsMwsdx0tycqPqc
	 DMmCpy+7fUO8DzvE+MzPJfa6l/gPnua4duJBinSftaeI2QvO5MnOVpAbeOaaKiQpVB
	 xmvxYZ6emFmWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMMrR6R9Rz4wHF;
	Thu, 04 Dec 2025 16:04:55 +1100 (AEDT)
Date: Thu, 4 Dec 2025 16:04:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pinctrl tree with Linus Torvalds'
 tree
Message-ID: <20251204160455.05a4f7f4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hJj_zX+NmjmOyziDDsjH+K+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hJj_zX+NmjmOyziDDsjH+K+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pinctrl tree got a conflict in:

  MAINTAINERS

between commit:

  2b6d546ba83e ("MAINTAINERS: update my email address")

from Linus' tree and commit:

  ac52b4a98509 ("MAINTAINERS: Change Linus Walleij mail address")

from the pinctrl tree.

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
index afc9ab97b9c6,13f61acdc8f7..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -10787,8 -10669,8 +10787,8 @@@ F:	drivers/gpio/gpio-sloppy-logic-analy
  F:	tools/gpio/gpio-sloppy-logic-analyzer.sh
 =20
  GPIO SUBSYSTEM
- M:	Linus Walleij <linus.walleij@linaro.org>
+ M:	Linus Walleij <linusw@kernel.org>
 -M:	Bartosz Golaszewski <brgl@bgdev.pl>
 +M:	Bartosz Golaszewski <brgl@kernel.org>
  L:	linux-gpio@vger.kernel.org
  S:	Maintained
  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
@@@ -13177,16 -13032,8 +13177,16 @@@ F:	Documentation/ABI/testing/sysfs-bus-
  F:	Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
  F:	drivers/iio/imu/inv_icm42600/
 =20
 +INVENSENSE ICM-456xx IMU DRIVER
 +M:	Remi Buisson <remi.buisson@tdk.com>
 +L:	linux-iio@vger.kernel.org
 +S:	Maintained
 +W:	https://invensense.tdk.com/
 +F:	Documentation/devicetree/bindings/iio/imu/invensense,icm45600.yaml
 +F:	drivers/iio/imu/inv_icm45600/
 +
  INVENSENSE MPU-3050 GYROSCOPE DRIVER
- M:	Linus Walleij <linus.walleij@linaro.org>
+ M:	Linus Walleij <linusw@kernel.org>
  L:	linux-iio@vger.kernel.org
  S:	Maintained
  F:	Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml

--Sig_/hJj_zX+NmjmOyziDDsjH+K+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkxFncACgkQAVBC80lX
0GwdSAgAjaQpwn4ie1zxf3Sd2HlH1hyH5DJMDNnhXnm07Rqisq+aKumflCt4YODe
Z2qLJBcU2M6DWkkwgTWHvEAP/9LCI4ebyyG6YylJn4s0blnAkEMJjl4YUbbrfDyb
Q076BpWEj9EC7yogf/C06cCinWIryKgFfK4UrFy38suAF7Mqk06AIsm/pWVRcalc
HZ6aBaPaU4V+h2nwy/KrfdOMQizSsjSnZ4OSHYpr31ceCSqMpEVy0C+7da2qQapO
LwRzWj7+0KTsXvXPaJygukaFuT3kvPluMu7gEfsqpHkgIPKh6K6q3U6Z8q45YSuB
7Z0W/2BNJGPAKGjGqHtEYzKimEuyBA==
=30FN
-----END PGP SIGNATURE-----

--Sig_/hJj_zX+NmjmOyziDDsjH+K+--

