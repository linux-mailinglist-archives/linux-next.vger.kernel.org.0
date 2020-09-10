Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A71C263BD4
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 06:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgIJETM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Sep 2020 00:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgIJETI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Sep 2020 00:19:08 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F7FC061573;
        Wed,  9 Sep 2020 21:19:08 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bn5HM5Ncqz9sTd;
        Thu, 10 Sep 2020 14:18:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599711538;
        bh=EhVZZhtTZCGxIkbgzYqVicFIUPzGTN9DxCVVPOY1Xss=;
        h=Date:From:To:Cc:Subject:From;
        b=evbTMrD34oqRHtx7o9AHio+LEMg/rNnKdizpFr2dEn4JHdhyKJtxaSjpX/uWXfroX
         jU9wefkUcSN/FZ74YN8rn0SkzBGNSzSeDxsSsC5YKO9vqghY9gQYSWQ15WXQ6NnK23
         Rk+KsUXLBHvx+OzLwGS8DDf3pjVXFJRcgKOnztZDZSiyP9vcZuRy+6RIVL03uiF3Eg
         mNmLWDLrIksfVgRydeCGU1X6K7Gpx26Ff0cockawtd5Oy5qOKf6bigR+rHOdcEPMA+
         Dokh4zzBffQYiKnRLhWZM1a8yeWdr33iPqDXO1epCGdfP7PNrQhvSEyeffyN4NKV7y
         YcdzOVLfdgJ1A==
Date:   Thu, 10 Sep 2020 14:18:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the extcon tree with the drm-misc tree
Message-ID: <20200910141854.1d4b1b10@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e=KaLfUS5Ij0WJmpNj.Op=0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e=KaLfUS5Ij0WJmpNj.Op=0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the extcon tree got a conflict in:

  MAINTAINERS

between commit:

  f61249dddecc ("MAINTAINERS: Add entry for i.MX 8MQ DCSS driver")

from the drm-misc tree and commit:

  d0e3c25150dd ("MAINTAINERS: Add entry for NXP PTN5150A CC driver")

from the extcon tree.

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
index 623c53ab5bd5,da94c9b12f1b..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -12496,14 -12430,13 +12496,21 @@@ F:	drivers/iio/gyro/fxas21002c_core.
  F:	drivers/iio/gyro/fxas21002c_i2c.c
  F:	drivers/iio/gyro/fxas21002c_spi.c
 =20
 +NXP i.MX 8MQ DCSS DRIVER
 +M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
 +R:	Lucas Stach <l.stach@pengutronix.de>
 +L:	dri-devel@lists.freedesktop.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
 +F:	drivers/gpu/drm/imx/dcss/
 +
+ NXP PTN5150A CC LOGIC AND EXTCON DRIVER
+ M:	Krzysztof Kozlowski <krzk@kernel.org>
+ L:	linux-kernel@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
+ F:	drivers/extcon/extcon-ptn5150.c
+=20
  NXP SGTL5000 DRIVER
  M:	Fabio Estevam <festevam@gmail.com>
  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)

--Sig_/e=KaLfUS5Ij0WJmpNj.Op=0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ZqS4ACgkQAVBC80lX
0GzmZQgAhm9Au7ork/yyZ3MKOW+hLWU+QSZsorx+EpWJ0cp7nYN/YDijwMydfpXk
DFf53BByT7rglwvwis8zhMwjoodlGOY6ImkMIIlOZEMZMhaLlZunhTWdeuYCuKvM
xDyjPwQbXK/QCaoYGcTUrvG58IBqOIaeIIgGYc/bgw5aU/KER4syr8XS6KYGWsrX
DQGlzedAMcfsoclBIRMjpuuSIuDHtMwVMa4Pnfz2PNcGnFZ7r5V24Pi4NY5+2zTW
tdrmfs58w3Ilq30feyn5BYae64qwV5Z2jSVJOLYvgl5OS4YP79Q4ivf3738l04eK
SEdOJSIYKI7pZkhmdJNu4fKLkxbENw==
=zfDk
-----END PGP SIGNATURE-----

--Sig_/e=KaLfUS5Ij0WJmpNj.Op=0--
