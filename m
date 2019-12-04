Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E32051121D1
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2019 04:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfLDDYI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Dec 2019 22:24:08 -0500
Received: from ozlabs.org ([203.11.71.1]:52933 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbfLDDYH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Dec 2019 22:24:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47SPMm3wqzz9sPL;
        Wed,  4 Dec 2019 14:24:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575429844;
        bh=9pOHqHVqyFz69Qh8FPY+sejFJqzYJpkamKjDSysAy54=;
        h=Date:From:To:Cc:Subject:From;
        b=VttzH9gUY+qnBf4d8FbK5Tgdv1z1mrzxD5v2AKlsgr2XLyGA1+bAMnXqr7fo96gim
         QFF7ZojHwR+W2f7AhxufoBX77uVLm5I6rp7IS+RlqyGaVp8n2psn2aCfsXVW2nkm8P
         kmWKeHei+7ZrsJTlJCePcdtGW4h06SYQ2u4/Pgbp6yZgutXrWMROn5WWRygMgSyWDw
         CaFOoh3Uxu7Lj7hLcnh9RgOGa8nbTY70Et1+Xpw8BHilOH08FPmICFHmm98GwOWn5q
         BATUFEUzYyJhGy0dvlZ8rmAI3OIO/pd7QXF+Douh5b1Jyz2THyhiEFBSdhPYRilY9M
         6qwhCDvCfLaxw==
Date:   Wed, 4 Dec 2019 14:24:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the vhost tree
Message-ID: <20191204142404.56631d84@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ev3ClIeVg6uVxR1APZsdLSb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ev3ClIeVg6uVxR1APZsdLSb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vhost tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/ethernet/atheros/atlx/atl1.c:2889:21: error: initialization of =
'void (*)(struct net_device *, unsigned int)' from incompatible pointer typ=
e 'void (*)(struct net_device *)' [-Werror=3Dincompatible-pointer-types]
 2889 |  .ndo_tx_timeout  =3D atlx_tx_timeout,
      |                     ^~~~~~~~~~~~~~~
drivers/net/ethernet/atheros/atlx/atl1.c:2889:21: note: (near initializatio=
n for 'atl1_netdev_ops.ndo_tx_timeout')

Caused by commit

  29fd1db09264 ("netdev: pass the stuck queue to the timeout handler")

I applied the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 4 Dec 2019 14:13:18 +1100
Subject: [PATCH] netdev: another fix for "netdev: pass the stuck queue to t=
he
 timeout handler"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/atheros/atlx/atlx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atlx.c b/drivers/net/etherne=
t/atheros/atlx/atlx.c
index 505a22c703f7..0941d07d0833 100644
--- a/drivers/net/ethernet/atheros/atlx/atlx.c
+++ b/drivers/net/ethernet/atheros/atlx/atlx.c
@@ -183,7 +183,7 @@ static void atlx_clear_phy_int(struct atlx_adapter *ada=
pter)
  * atlx_tx_timeout - Respond to a Tx Hang
  * @netdev: network interface device structure
  */
-static void atlx_tx_timeout(struct net_device *netdev)
+static void atlx_tx_timeout(struct net_device *netdev, unsigned int txqueu=
e)
 {
 	struct atlx_adapter *adapter =3D netdev_priv(netdev);
 	/* Do the reset outside of interrupt context */
--=20
2.24.0

Then I got another build failure:

drivers/net/ethernet/natsemi/ns83820.c: In function 'ns83820_tx_watch':
drivers/net/ethernet/natsemi/ns83820.c:1606:3: error: too few arguments to =
function 'ns83820_tx_timeout'
 1606 |   ns83820_tx_timeout(ndev);
      |   ^~~~~~~~~~~~~~~~~~
drivers/net/ethernet/natsemi/ns83820.c:1552:13: note: declared here
 1552 | static void ns83820_tx_timeout(struct net_device *ndev, unsigned in=
t txqueue)
      |             ^~~~~~~~~~~~~~~~~~

At this point, I just used the vhost tree from next-20191203 ...
--=20
Cheers,
Stephen Rothwell

--Sig_/ev3ClIeVg6uVxR1APZsdLSb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3nJtQACgkQAVBC80lX
0GyIfwf/bKVuS6sX71a6FRXBq5iFuB0Y7lemIDdDVL+y4DxU8ReYMTEHbIfb59/R
O1YrUG2dICWvfi13sHSyFAsUbUYpEJiXFvtjASD9rmzhiK0K3JB+fg1P3gAOCMJP
sbCfpbBYPmAmU12xX0G9fq3N1b259FoBROLiz0yHKBZ71/dEfgG6IJy91cOX3n4x
zOTTg0HRt489/iLFocaLUVInLdxwOR3SnhR+iJE0m5cXqycBz7fFvANGa8tfYTZi
p5oAaxgNt5NTJlOOtWMqlR86JilsEXG7yFVaLXE9Pg/8UUDNtnMcSl9xpObOjLXd
jpJTcbRv0A7+p972yAU09jCZYZUGGA==
=hLE2
-----END PGP SIGNATURE-----

--Sig_/ev3ClIeVg6uVxR1APZsdLSb--
