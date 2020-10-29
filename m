Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA6129E2D2
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 03:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgJ2CWp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 22:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgJ2CWc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 22:22:32 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDDAC0613D1;
        Wed, 28 Oct 2020 19:21:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CM8LZ2QgGz9sTq;
        Thu, 29 Oct 2020 13:20:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603938054;
        bh=gQ9SLQL+lswtFGifeaqA4vO1cSaPFX5eqUzRJZmjfcE=;
        h=Date:From:To:Cc:Subject:From;
        b=RRYocUbUCHj+b8B/qLEF3MqbtLRy/XCtf4JZ2b+CCN0X/eFRkkioNhMPUzfxHW+ok
         342NSZc8u8pBqlsDx5OvzYDlymHK6jQ36JtjDEfEMk6nslqNcmBFiWBb6l+KNOC1dD
         paL6aKzEuxaYgJlpHcfq3UPoeaySQPMb1DUIqcoMSRzs4f7AgTWZvGv716/g9Z55Am
         sDALElvCBHxVT6zdpPQWT2kxKv/TCWGuJymUJDWS3s3hnIp1UdqxixCu7yEW/i4ymJ
         4m2p11zb5uayXSAIDWGaZ0V1mUEeWEwU2CAiSe41MRdaAtUjPtSP3/fZBBC2d/oA32
         d4JTBQ8I5uo6Q==
Date:   Thu, 29 Oct 2020 13:20:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Robert Marko <robert.marko@sartura.hr>
Subject: linux-next: manual merge of the phy-next tree with the
 regulator-fixes tree
Message-ID: <20201029132052.1ac29c18@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GAjBnrG/RkPLr7Y9YtT3KCP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GAjBnrG/RkPLr7Y9YtT3KCP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  MAINTAINERS

between commit:

  43c3e148830a ("MAINTAINERS: Add entry for Qualcomm IPQ4019 VQMMC regulato=
r")

from the regulator-fixes tree and commit:

  c36f74566cef ("MAINTAINERS: Add entry for Qualcomm IPQ4019 USB PHY")

from the phy-next tree.

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
index 0e8f57817184,f01ce8f451c8..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -14552,14 -14547,14 +14552,22 @@@ F:	Documentation/devicetree/bindings/=
ma
  F:	drivers/mailbox/qcom-ipcc.c
  F:	include/dt-bindings/mailbox/qcom-ipcc.h
 =20
+ QUALCOMM IPQ4019 USB PHY DRIVER
+ M:	Robert Marko <robert.marko@sartura.hr>
+ M:	Luka Perkov <luka.perkov@sartura.hr>
+ L:	linux-arm-msm@vger.kernel.org
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
+ F:	drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
+=20
 +QUALCOMM IPQ4019 VQMMC REGULATOR DRIVER
 +M:	Robert Marko <robert.marko@sartura.hr>
 +M:	Luka Perkov <luka.perkov@sartura.hr>
 +L:	linux-arm-msm@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.ya=
ml
 +F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 +
  QUALCOMM RMNET DRIVER
  M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
  M:	Sean Tranchetti <stranche@codeaurora.org>

--Sig_/GAjBnrG/RkPLr7Y9YtT3KCP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+aJwQACgkQAVBC80lX
0GzXNAf8C5LDkVxr32cYtjwKuVDIndwx+8fJJkDW6gKIJMKut/+fbAYPRBa6UjO8
YIKPsbV5PumzX3UEzsrk4+VFO95PTu4quUJx6jLztQc6RpgLogD9B30iYyxcOlRe
ta2Ybdmb60CVMGhWWKD/6CENNfv4Y81pWLkXsjgi4R965oExu6zfvjwd/EXtN0tr
ZFlMawGcv4MDplFal9AJ63c2LGnm1km71LGRoprjKd7GN6LLz2QI4GGJid+ui7mi
KpdF8PT2H6IrmZRDu8AK5T+lHwnfKVx3K97ArsCwdprhihcWsc8hEapezR92irto
fXLBQqGU9z9+3Cz/aC9I1/Qkms+Hng==
=Pu/L
-----END PGP SIGNATURE-----

--Sig_/GAjBnrG/RkPLr7Y9YtT3KCP--
