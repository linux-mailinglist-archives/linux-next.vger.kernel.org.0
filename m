Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F780250C62
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 01:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728148AbgHXXcS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 19:32:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37751 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbgHXXcN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Aug 2020 19:32:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bb7gs0HBHz9sTX;
        Tue, 25 Aug 2020 09:32:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598311931;
        bh=SwkRNpaLSIIubkfSUG1oYIMG1JGbIM6aYFzSpUYzBwE=;
        h=Date:From:To:Cc:Subject:From;
        b=YhvPHezVr3k1yKYSWhr0lMdJg3qM1mhgZb/5xhyRUpRMCmx/jxfmcgPMQ27A3U2X0
         y3SEZIWdBQuAX0FOLnfAa8Fgb/MOjQUU1JGq4DRxdjOxnMJ8pNUnxADjRqagvjNp5W
         vpL5uQPic/MnHJjQaAIKGAOqdEMC7+eOhGqRdTYbhOlQCbUcC4VQ2SLPuo7oYZyms7
         gI6ilqh8EowiQCZrym8Ag0NGmcsj0rSPx60hQM0pKWYijTgYvoNvOCtaTwvRp0dh+G
         XsIrUg7CdlSjOyDlGMlQrMYZyux+MtSRC5258byidN3Ik9qlYEj57FruWg/gZ9nSRr
         8a9waDK/ji2Cg==
Date:   Tue, 25 Aug 2020 09:32:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guido =?UTF-8?B?R8O8bnRoZXI=?= <agx@sigxcpu.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: linux-next: manual merge of the qcom tree with the imx-mxs tree
Message-ID: <20200825093208.0b14ab2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hB9Wh69cPQebzrYhyiHxju5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hB9Wh69cPQebzrYhyiHxju5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the qcom tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  0c08ed48c956 ("arm64: defconfig: Enable imx8mq-librem5-devkit display sta=
ck")

from the imx-mxs tree and commit:

  8a3b3373891c ("arm64: defconfig: Enable Lontium LT9611 driver")

from the qcom tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index 185904e0c5d5,947d8e0f50b3..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -640,12 -622,11 +640,13 @@@ CONFIG_DRM_MSM=3D
  CONFIG_DRM_TEGRA=3Dm
  CONFIG_DRM_PANEL_LVDS=3Dm
  CONFIG_DRM_PANEL_SIMPLE=3Dm
 -CONFIG_DRM_SIMPLE_BRIDGE=3Dm
 +CONFIG_DRM_PANEL_SITRONIX_ST7703=3Dm
  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=3Dm
  CONFIG_DRM_DISPLAY_CONNECTOR=3Dm
+ CONFIG_DRM_LONTIUM_LT9611=3Dm
 +CONFIG_DRM_NWL_MIPI_DSI=3Dm
  CONFIG_DRM_SII902X=3Dm
 +CONFIG_DRM_SIMPLE_BRIDGE=3Dm
  CONFIG_DRM_THINE_THC63LVD1024=3Dm
  CONFIG_DRM_TI_SN65DSI86=3Dm
  CONFIG_DRM_I2C_ADV7511=3Dm

--Sig_/hB9Wh69cPQebzrYhyiHxju5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ETfgACgkQAVBC80lX
0Gxozgf/SgmI+LnsjwpnoNZ2I56nI7vbIteDq6oN2cmrZm6wNfFxgQFb/1hzPErp
lVz2rUSrq2+eQpiHDNVmjhpjw0uSugp/bNvkvqGxPx9TPwqWInP4Wog3Pnlq/aFz
Pi4uWXKKfvUSpjxZcb+GyZpGhYvaT1/nmjrU5sZtRHeUFyDH+XNATSnrNNsetw7Y
Hz5DJi6lg7xM1wVYy0YSt2HhjrDHWSwqx8G05ej66Eu5ppKb3DrvrDm5/2ixQ5AA
AQUvh/OPR212wrNWy945L3QwUkaXTHTSYUAXV2VjiY/cVRFXgLaoeRC8rpCoCoqx
/bq5SpfQKhPvJpSaD8N0JXQ2arWq7A==
=7L0y
-----END PGP SIGNATURE-----

--Sig_/hB9Wh69cPQebzrYhyiHxju5--
