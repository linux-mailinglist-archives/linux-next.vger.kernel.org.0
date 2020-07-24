Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E2522BDD5
	for <lists+linux-next@lfdr.de>; Fri, 24 Jul 2020 08:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgGXGCF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jul 2020 02:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgGXGCF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2020 02:02:05 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6BEC0619D3;
        Thu, 23 Jul 2020 23:02:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BCdrS5SZRz9sPB;
        Fri, 24 Jul 2020 16:02:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595570521;
        bh=ZKoeWu2Fy7x0ZmF1R0cKOvkiiZg4eMaO/xTCLzdKRLs=;
        h=Date:From:To:Cc:Subject:From;
        b=uWnwjB2om+TK7zyuYxPtB/mXftRuav5Wl5SUrqayxaN/HhOQzsj8LDf9n6aIT8OR6
         w4ZlufqFVO8XzI7/nAZI1JKMquNnMyTGB9kANRlFmGhiZXWqlibePgUgPDsXlLuSG0
         QPjamoJd3Gqh8umuqsOt9Q5tUdTqkwg2qBT5IUR+8CL/8xEfDqUTbOgKPckwnSD7u3
         sWPNpGsgzXJ7w0DR3xDttMjmTE1OBtWzlF3X0W4WtPBJ0hip9RvWGGJViO6yujcSph
         /nTM5bYVPPWQjmKycBwnfyRtGO7iPV2yzwgorLn/vdoX5C62G4c6cXoLK3+kVvKTsG
         r8NwI9GSvToNg==
Date:   Fri, 24 Jul 2020 16:01:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Subject: linux-next: manual merge of the phy-next tree with the dmaengine
 tree
Message-ID: <20200724160158.2528b206@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UjTBlGdmxb5RkwLT0mfITu5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UjTBlGdmxb5RkwLT0mfITu5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  MAINTAINERS

between commit:

  ef9303fdf46f ("dt: bindings: dma: xilinx: dpdma: DT bindings for Xilinx D=
PDMA")

from the dmaengine tree and commit:

  4a33bea00314 ("phy: zynqmp: Add PHY driver for the Xilinx ZynqMP Gigabit =
Transceiver")

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
index f9bba40873cc,82a12abe24c6..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -19007,15 -18852,15 +19007,24 @@@ F:	Documentation/devicetree/bindings/=
me
  F:	drivers/media/platform/xilinx/
  F:	include/uapi/linux/xilinx-v4l2-controls.h
 =20
 +XILINX ZYNQMP DPDMA DRIVER
 +M:	Hyun Kwon <hyun.kwon@xilinx.com>
 +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 +L:	dmaengine@vger.kernel.org
 +S:	Supported
 +F:	Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
 +F:	drivers/dma/xilinx/xilinx_dpdma.c
 +F:	include/dt-bindings/dma/xlnx-zynqmp-dpdma.h
 +
+ XILINX ZYNQMP PSGTR PHY DRIVER
+ M:	Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
+ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ L:	linux-kernel@vger.kernel.org
+ S:	Supported
+ T:	git https://github.com/Xilinx/linux-xlnx.git
+ F:	Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
+ F:	drivers/phy/xilinx/phy-zynqmp.c
+=20
  XILLYBUS DRIVER
  M:	Eli Billauer <eli.billauer@gmail.com>
  L:	linux-kernel@vger.kernel.org

--Sig_/UjTBlGdmxb5RkwLT0mfITu5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8aeVYACgkQAVBC80lX
0Gyj8gf8DwURldT+aWkhMW00tf5C08+KY+8i20Yuj+EU0d4u12Ama/Ok8lOhk6ii
qhrbBwijCmnjEQzyB1SqNLHMPulZtUQqkQanhnLqjDFreHnmMnxGHRjpafJAxCJB
qJZJghXgF+/hCWb86zmX/Tj8gDUSjbmWvZkM04smgS643hNzZdaR8/Y+PDaRRtG/
3kNbAoDqYSdeHB/UtcCNBI2Q55IE/OEBBbtZy3GNlR2hIHsbXArJDZ3GdsX2p200
DlIDdxmJlwDbabAFWPq4x4fdg0qZy9iMD01FcnPEXdU3PNA45bdCJ6j4FrNNtJQR
fD25eauILRAYCcgs+dXm0s2t/aN3fw==
=++5F
-----END PGP SIGNATURE-----

--Sig_/UjTBlGdmxb5RkwLT0mfITu5--
