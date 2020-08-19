Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4FB42491C8
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 02:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgHSA2Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Aug 2020 20:28:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44833 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgHSA2Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Aug 2020 20:28:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BWTCV15wmz9sPC;
        Wed, 19 Aug 2020 10:28:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597796903;
        bh=3Td9YjzRiF4H4tu4TurIrcOy3zbpa0CpuzrgWfU0w+U=;
        h=Date:From:To:Cc:Subject:From;
        b=LtJ+6uDj8SSLB2o7dkuACoFCD3UvbKqbi2+TA6cd9LXahNOWPxq99Ylc7zZnVt5h9
         IyGmGBXvE8YlGNY1zX/3D4xt/nHEiyiQ//mgo0oUZC9oir1+SBYtMg3mpZKKFpdeud
         zqzK7t/+frCEoS71x8jAr2KvE2q/lSSo5o1vpNZ/8f9mzySe4BegsdPolpl95nHWSZ
         Dc8j3AzfU+rSi3ukWyUAPisw118w2NgEcirzdrX42KdSvkfCExPY2I+djB3XT3Mv4U
         a7zGl2ygaTeojHhcmwBhwK/PGAHCDhwWto42PTugEnt0Ge7ykoy3wYon9C0v3p3Nu5
         NZaVQboSv8OTw==
Date:   Wed, 19 Aug 2020 10:28:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peng Fan <peng.fan@nxp.com>
Subject: linux-next: manual merge of the reset tree with the kspp-gustavo
 tree
Message-ID: <20200819102819.63c9aa50@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b/KufgxO5Sk9nRQvijoUG/8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b/KufgxO5Sk9nRQvijoUG/8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the reset tree got a conflict in:

  drivers/reset/reset-imx7.c

between commit:

  58e813cceabd ("treewide: Use fallthrough pseudo-keyword")

from the kspp-gustavo tree and commit:

  2983e2385ff6 ("reset: imx7: add the cm4 reset for i.MX8MQ")

from the reset tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/reset/reset-imx7.c
index e8aa8691deb2,b60534a1e0ef..000000000000
--- a/drivers/reset/reset-imx7.c
+++ b/drivers/reset/reset-imx7.c
@@@ -232,12 -235,13 +235,13 @@@ static int imx8mq_reset_set(struct rese
  		break;
 =20
  	case IMX8MQ_RESET_PCIE_CTRL_APPS_EN:
 -	case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN:	/* fallthrough */
 -	case IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N:	/* fallthrough */
 -	case IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N:	/* fallthrough */
 -	case IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N:	/* fallthrough */
 -	case IMX8MQ_RESET_MIPI_DSI_RESET_N:	/* fallthrough */
 -	case IMX8MQ_RESET_MIPI_DSI_RESET_BYTE_N:	/* fallthrough */
 +	case IMX8MQ_RESET_PCIE2_CTRL_APPS_EN:
 +	case IMX8MQ_RESET_MIPI_DSI_PCLK_RESET_N:
 +	case IMX8MQ_RESET_MIPI_DSI_ESC_RESET_N:
 +	case IMX8MQ_RESET_MIPI_DSI_DPI_RESET_N:
 +	case IMX8MQ_RESET_MIPI_DSI_RESET_N:
 +	case IMX8MQ_RESET_MIPI_DSI_RESET_BYTE_N:
+ 	case IMX8MQ_RESET_M4_ENABLE:
  		value =3D assert ? 0 : bit;
  		break;
  	}

--Sig_/b/KufgxO5Sk9nRQvijoUG/8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl88ciMACgkQAVBC80lX
0GzlUAf7BcxfyA5OtemSfOyrmppvSZJs1RHaZYKQM5MDq11cOd2sig54rcxemn4Z
PVjcy5d5Sj7bfh16dKDDWyphfx9ckjpeoWo5xT0ZXV6w8GQEKqw6GsGCUuNTpxL3
12c/Qrrdv/LHSkqFwG6zJp2Exf6vb6DNShjF1mZ3R9xrTc8NGwT7yfSxuyyIWvCa
ZjZJsGz4+eQtdJPVfLlo0yeHg/byvo1LV9JQqmYBf1BsM6nmxOWQBAQim4qJHMRZ
ZsrDCRPon6fAvhfORqKhhsI7PiJEY+NpYGbuE6GN1OK9VKgOLZmgt20flYYhgT/b
qiocTgBZ3c6xlzqjUKfmYMSxQCHo/A==
=pref
-----END PGP SIGNATURE-----

--Sig_/b/KufgxO5Sk9nRQvijoUG/8--
