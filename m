Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A6FF2637
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 05:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733062AbfKGEF4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 23:05:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55003 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727280AbfKGEF4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 23:05:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477qZS0FHWz9sRY;
        Thu,  7 Nov 2019 15:05:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573099552;
        bh=2QapZZxv0w8eOLKWxJmjSRY76XAd4sqlYoTQLOXOZ5c=;
        h=Date:From:To:Cc:Subject:From;
        b=IfDSYKKhh2+ECCeQVSboLI/gjCCp9JnwwSYuM3D9CXDKQaW6/vJWvNRU2F9ypRzNW
         y8EL4qYZoMgOJoF06a0E94HW9Wz5WzjOC6TQo+rrjxqjyfdPOABNQ2e+xJLzJPQ4vi
         pW2oekPtX+ZVcGqCGSttDV3rOyO6AGgExUOhMi859vj7XhB/XXm35TQ9JnZf7WJQXI
         XlBHs+67ExtYC1wEJpD3M+QtbJpWaUhMX6woonG4nK0TcU1b8v3ApsNeDUhtv/vsK8
         sk5TA0661D21+f+WVHNLTm9Q/JBMim91nV6ODfPQxlCDDZpXgXa45GvCsm7w+tf3cV
         R+7f/P8YYH1vA==
Date:   Thu, 7 Nov 2019 15:05:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Subject: linux-next: manual merge of the gpio tree with the driver-core tree
Message-ID: <20191107150550.15df2f35@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SJ98=elDCbAvM+46dv4d8lv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SJ98=elDCbAvM+46dv4d8lv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio tree got a conflict in:

  drivers/gpio/gpio-tegra186.c

between commit:

  cc4c831811c2 ("gpio: tegra186: use devm_platform_ioremap_resource_byname(=
)")

from the driver-core tree and commit:

  2a3655056730 ("gpio: tegra186: Implement wake event support")

from the gpio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpio/gpio-tegra186.c
index ef40fbe923cf,8a2a69178925..000000000000
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@@ -407,6 -449,8 +449,7 @@@ static int tegra186_gpio_probe(struct p
  	unsigned int i, j, offset;
  	struct gpio_irq_chip *irq;
  	struct tegra_gpio *gpio;
+ 	struct device_node *np;
 -	struct resource *res;
  	char **names;
  	int err;
 =20

--Sig_/SJ98=elDCbAvM+46dv4d8lv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3DmB4ACgkQAVBC80lX
0GypaAf/cmF8EFtMCIWMpVN3p4PS3N1FaIKHp2iH+ehuV7yYdrjcnTgZPKTZeRUs
N7HitAcXJZZp3P7+HRMBN4QxVorshnQ+KSVTfvrOTEVMlfWm5bQBBaShv9Uk8ZOy
PpBGg9cE6lL23btDY0Tu9n8r17NhP+fcFLOxr/Nw3LF9jVAQG2aYbq8z6lS0Gdqd
tT8HBY22+EDxbR1W2+IOizhkHJ/BFl9NSvjOY3J4aHSVQ1M8pbYQUTMkJWnd8LWf
SMfQiBbgdP+mabqKe0EHzfBZeFI0oNYHXjM1qEN+Ep/H/LDoDESDnsPIiy1H5KPV
B9VzvT+SlH67jbwRj3YLjhARFLN1ZQ==
=E2cZ
-----END PGP SIGNATURE-----

--Sig_/SJ98=elDCbAvM+46dv4d8lv--
