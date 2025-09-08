Return-Path: <linux-next+bounces-8215-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 765D5B483B3
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 07:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1936E175440
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 05:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D2B225779;
	Mon,  8 Sep 2025 05:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f8J2Qqvl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE82F32;
	Mon,  8 Sep 2025 05:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310211; cv=none; b=FtF18KP9sPrOvVp50ZE+xpBpdZ8RnUnBmQDVRYmryfT3M4ZSAA0BcjVMyJQ/p67mKLUrp04VfPVj3KuYktxn7XzLrujzK6A8Ux2o/z84yCeWChTGnxBGM6ljrUpzWbPayjPwhviLxILmUR7qw34kMQ0P2S3wcnvlp6bEbHLmlok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310211; c=relaxed/simple;
	bh=3E80mFKUJO7He8kRl00iwPtI8HDqMr8BQFVUl2Vl4hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lVg0zQsL8iq9PBjuB2eE0GqcYj1kg+k4Edg0kkLqVVX7izluv9Em1wwRkx0vJeoUo/Uc7KFoanezcW/7K02iY53jUKtn6llljwOURp8IcpZn08JdW1gnsaBRtCMcpEI8WSOjalr5f4L2SdLEMJb1QAaHnjt2qky0+lS6jq0Jzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f8J2Qqvl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757310204;
	bh=lZMc3U3VUuv5ZTx0hQkkhHGKIj0TFGXvIrQe6Pmgx/M=;
	h=Date:From:To:Cc:Subject:From;
	b=f8J2QqvlyYFxt5MoGB5S1Havl/OlE4s20SMr7TXyC8ENmPzR0XTh0by3UM5TiTn30
	 bQGjab+7xtxuAr/DzmYpSxrUGVv96jsh8gCkSM3Mc1I+SyothiUfQDCFibDlbtBDiD
	 Ta7bqjCkLMF2xHc15HwB7VBC1G6vs4MhjAQFtcM8wXN7kL/zidLJodxThlMYnpbwAh
	 Gfc907j8nl6/dF2ko5m+wc0RRix1WL2PXXJaxZIKxATao+Q3vK9iXYmy3tPEEOIFaT
	 +EMZyT8tjlk8vERY1ZK3KEfSLmq95V4qjJKsJV0T/alhKCeoAG9ZbBeD0zzRZ+glwt
	 eXxDle+qqViVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKwpy3NRgz4w9d;
	Mon,  8 Sep 2025 15:43:22 +1000 (AEST)
Date: Mon, 8 Sep 2025 15:43:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wei Fang <wei.fang@nxp.com>, Woodrow Douglass
 <wdouglass@carnegierobotics.com>
Subject: linux-next: manual merge of the regulator tree with the net-next
 tree
Message-ID: <20250908154320.2ec4138b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y9KJNNUPkvw7OKqBnLvqJ9K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y9KJNNUPkvw7OKqBnLvqJ9K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the regulator tree got a conflict in:

  MAINTAINERS

between commit:

  dc331726469d ("MAINTAINERS: add NETC Timer PTP clock driver section")

from the net-next tree and commit:

  b497e1a1a2b1 ("regulator: pf530x: Add a driver for the NXP PF5300 Regulat=
or")

from the regulator tree.

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
index 28249f3e8dba,b4fc45b008ed..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -18386,15 -18291,12 +18386,21 @@@ F:	Documentation/devicetree/bindings/=
cl
  F:	drivers/clk/imx/
  F:	include/dt-bindings/clock/*imx*
 =20
 +NXP NETC TIMER PTP CLOCK DRIVER
 +M:	Wei Fang <wei.fang@nxp.com>
 +M:	Clark Wang <xiaoning.wang@nxp.com>
 +L:	imx@lists.linux.dev
 +L:	netdev@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/ptp/nxp,ptp-netc.yaml
 +F:	drivers/ptp/ptp_netc.c
 +
+ NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
+ M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/regulator/nxp,pf5300.yaml
+ F:	drivers/regulator/pf530x-regulator.c
+=20
  NXP PF8100/PF8121A/PF8200 PMIC REGULATOR DEVICE DRIVER
  M:	Jagan Teki <jagan@amarulasolutions.com>
  S:	Maintained

--Sig_/y9KJNNUPkvw7OKqBnLvqJ9K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+bPgACgkQAVBC80lX
0GzZAwf/XdSSq3tOwys+9e4wdQh686guXKX/CATAjTJS8PWV2Kz6aDl3PfQ8ChOK
fmPXpAivZvqkgLMSC4KxUdaaeaJwXlT7eMIIthWK0XDjrzUvZD+0MAL3VC32hxpF
8Tsd3JmgUV8rr1+BWuzS6ErSssEkmt/60pXuM9h6c6HKL0HXn0RJWcRfHozrjoK5
n7Wvmhu2Uv5TcJF9VsPHKGc6gJcQpMpwHBmF/FjVa6mZ/lE3ToH+Mx3OThFeRiWu
Hr3UO70QtITJum1YT4lE3QAJekp7w392oEaONUvP1m2Xk/l8GJfocVn9Aq5W2PwX
g8cUskrJIkXh+lqIdRxquQP9v84RpQ==
=Ny1n
-----END PGP SIGNATURE-----

--Sig_/y9KJNNUPkvw7OKqBnLvqJ9K--

