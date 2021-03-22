Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE96345364
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 00:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbhCVXxV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 19:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbhCVXw7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Mar 2021 19:52:59 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F39C061574;
        Mon, 22 Mar 2021 16:52:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4BBr4sYlz9sW1;
        Tue, 23 Mar 2021 10:52:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616457173;
        bh=MJi017oQotYoOildABLQeMibodaWQ4ZO3V5ZD6wZvrA=;
        h=Date:From:To:Cc:Subject:From;
        b=jC4hbi9EMy1UH1hRO7SyE4CZTq5A/KA7y+Tes6VSkuBH53ZoZZhlYsxj6rNwwg3AE
         VI9O5Vg2OReyyHFIQf/3HUlH45u2Qbz2/WdreNMBWAPUr7+aZZGOGLpEiwkCgIvjVB
         WL+YhuRMIfmfKcE0kqjyc8mgbzuFYfRnrN96l9zZYLjSsAySB642m4tyzXBOuIX6Bo
         6TIOL8GPO9BM4EFvziNeqPrDpPdIXCqBUIWAokQvh2RHZx47y2XaJmnGBXbG/3VL2M
         ntZahBAWhM3xFl83TQLx4aeh/dGf0w5r0pChpg36vKkC7Fc5Tetqc0U1HJQJ9YsFpv
         BxA6MmYbZkuiw==
Date:   Tue, 23 Mar 2021 10:52:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jonas Malaco <jonas@protocubo.io>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the hwmon-staging
 tree
Message-ID: <20210323105251.3532acea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P15woK9_pXrb171nAFb+RFk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P15woK9_pXrb171nAFb+RFk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  MAINTAINERS

between commit:

  38f15506d965 ("hwmon: add driver for NZXT Kraken X42/X52/X62/X72")

from the hwmon-staging tree and commit:

  be157db0a3d8 ("media: Add maintainer for IMX jpeg v4l2 driver")

from the v4l-dvb tree.

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
index dda782e9e578,04e6df934eb0..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -12941,13 -12910,14 +12941,21 @@@ L:	linux-nfc@lists.01.org (moderated =
fo
  S:	Supported
  F:	drivers/nfc/nxp-nci
 =20
+ NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER
+ M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+ R:	NXP Linux Team <linux-imx@nxp.com>
+ L:	linux-media@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
+ F:	drivers/media/platform/imx-jpeg
+=20
 +NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 +M:	Jonas Malaco <jonas@protocubo.io>
 +L:	linux-hwmon@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/hwmon/nzxt-kraken2.rst
 +F:	drivers/hwmon/nzxt-kraken2.c
 +
  OBJAGG
  M:	Jiri Pirko <jiri@nvidia.com>
  L:	netdev@vger.kernel.org

--Sig_/P15woK9_pXrb171nAFb+RFk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBZLdMACgkQAVBC80lX
0GyYQAf/RygOCF8VnQJtn7NxjWMGYO14vMKBJW7MAYQ4jNC6wb827QqVSHTiXdmL
UBqHn2N0bAPHtIZ/8VXVqs5DKokwQ+ou7dFXEKzTEhDBuTc2rB0eA0o2J5uwR7I9
LhlBUJqGaI5zziOu6xuIM4hy5iPcEvxkwaWdkhFnq7M6S0+6+twwzV5hTjzJB4s/
f2veS+oMy2aKHG/YTpOBUCiVWzG9NUckW19ZVKEJkHlj7Cs319q5rfKAbhE7aWqI
weXLD7ZBSm+PTqqs2tSshKc4wBbGXl1dWTBByKOKOuwG+ffeZb+D17W5+IIPukVB
pH7lJEnwukzssWt6bc52sKrxErZkgg==
=XYet
-----END PGP SIGNATURE-----

--Sig_/P15woK9_pXrb171nAFb+RFk--
