Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2EDB19A42E
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 06:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731763AbgDAETM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 00:19:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57801 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731589AbgDAETM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Apr 2020 00:19:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sXyQ1lnNz9sR4;
        Wed,  1 Apr 2020 15:19:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585714750;
        bh=Ip9w489n84fN4lJPHrqx/kGSK1wuNSUz56EVAHU0vIY=;
        h=Date:From:To:Cc:Subject:From;
        b=BWMgP7SW5RNf4nTV0Td2uQDVfvMAWSzKg+wljSgebOwn+9gaMJRq0e0622KhyxYz6
         UFstpIBkeyjTNCRUNfhtaxaP1aMLoWpJXX9PahRQ39JQFLv0CPaVGzs8CRD9fkqlsr
         pMI2De2EeG1hNrg6EkwEM/uR29JmRi5JmH24ORy7CJtm4tV9e0pDKucSl0GdCl5kf4
         y0Kpd9C16BASqkc56YcZoZkbQQCeaLXjfK8FoxLBls+kPmAh80pxcSy9s4LpoEK0/M
         E76BArAQQt57Yg6BhxCA1Gsheth1JqRqkun32vzXntsT8tg2RQN5NKlOZpbfsFQy3Z
         f7RdV8ZJHlwog==
Date:   Wed, 1 Apr 2020 15:19:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Subject: linux-next: build failure after merge of the gpio tree
Message-ID: <20200401151904.6948af20@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mRsf+L7XTQT3RnhT7qNvor_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mRsf+L7XTQT3RnhT7qNvor_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "of_pinctrl_get" [drivers/gpio/gpio-tegra186.ko] undefined!

Caused by commit

  b64d6c9a6a05 ("gpio: tegra186: Add support for pin ranges")

and not fixed by commit

  e45ee71ae101 ("pinctrl: Define of_pinctrl_get() dummy for !PINCTRL")

CONFIG_OF=3Dy
CONFIG_PINCTRL=3Dy
CONFIG_GPIO_TEGRA186=3Dm

I applied this patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 1 Apr 2020 15:14:32 +1100
Subject: [PATCH] gpio: export of_pinctrl_get to modules

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pinctrl/devicetree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 1ed20ac2243f..c6fe7d64c913 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -103,6 +103,7 @@ struct pinctrl_dev *of_pinctrl_get(struct device_node *=
np)
 {
 	return get_pinctrl_dev_from_of_node(np);
 }
+EXPORT_SYMBOL_GPL(of_pinctrl_get);
=20
 static int dt_to_map_one_config(struct pinctrl *p,
 				struct pinctrl_dev *hog_pctldev,
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/mRsf+L7XTQT3RnhT7qNvor_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6EFjgACgkQAVBC80lX
0GzG4ggAmeAd11AKyKyb9YJREascIZWfbQe6eXDmdJVh/7ZOzObQKyTngmCN0XPg
m2Un89Ykqcton7KmhHNRwTsjLTqOfrjfzOLpFg8cDydsqN6FxTmYy/DHJjnyszZR
XMbtNiBy7m4YyEZnGP+RzoPdczcqvvVt9uDm5mvStIUOtmCQXRMws3ZElaKExnz5
zVYT/VRXM+e6kiS5zeEJJItXBsd6O0OA3t/7z8MjewNyh0n/XP17b1noAcGgMdc4
/mBnaOgkbxMTj5HuxvvGyTs+jRdYDdRieOc3KSh631bP2lzm3QIZ+pbI7sXPVhn0
Jlwaj9HDR0H3nsNYY2EvyyPb3VSBJA==
=KLU6
-----END PGP SIGNATURE-----

--Sig_/mRsf+L7XTQT3RnhT7qNvor_--
