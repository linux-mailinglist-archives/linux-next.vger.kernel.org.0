Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8852278C4
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 08:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgGUGRP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 02:17:15 -0400
Received: from ozlabs.org ([203.11.71.1]:33463 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbgGUGRP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 02:17:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9pKM2t9Kz9sPB;
        Tue, 21 Jul 2020 16:17:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595312232;
        bh=WZV4+iRfMoNQK9wg0RRfY4PHdeJb/n3hoO/d0GU546o=;
        h=Date:From:To:Cc:Subject:From;
        b=Xw7uJzgIArTiwFZ3/KtVCzAo4+8RWha7oFtD+JuM6HwS0APox65ODZhw9GwM20NT2
         6noQKC+6Fw8fyCEsBktegcA51zIYk+HrtbTyNswEMKpQHDKkzvP+SNvSZcw3BsQPrc
         1NLbiVN3LbV6qURnltHkUTyewCWqUy2WPcRwygduXLX6smi12qQdIGtmuUcNfYEoRw
         +msUArYVxgTvyz8i+/X4xZuJw9AIA8ipyDZac4AGengfBEaH/Aolgb1knBgti6kaqU
         n34GDSLpq0S3CRW3AGRerku01kIB3cMQZlaz/eq+8LxdVLV/BaMy94aMAhko2vEwXT
         GnJLWgUk2aVmg==
Date:   Tue, 21 Jul 2020 16:17:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: linux-next: manual merge of the dmaengine tree with the phy-next
 tree
Message-ID: <20200721161701.64b4245e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JiCKaOVGPzTJDq2Or+8rB07";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JiCKaOVGPzTJDq2Or+8rB07
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmaengine tree got a conflict in:

  MAINTAINERS

between commit:

  4a33bea00314 ("phy: zynqmp: Add PHY driver for the Xilinx ZynqMP Gigabit =
Transceiver")

from the phy-next tree and commit:

  ef9303fdf46f ("dt: bindings: dma: xilinx: dpdma: DT bindings for Xilinx D=
PDMA")

from the dmaengine tree.

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
index 495e4247cbb0,1ba09904354f..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -11432,20 -11364,14 +11434,13 @@@ L:	linux-arm-kernel@lists.infradead.or
  S:	Supported
  F:	drivers/usb/gadget/udc/atmel_usba_udc.*
 =20
 -MICROSEMI ETHERNET SWITCH DRIVER
 -M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 -M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
 -L:	netdev@vger.kernel.org
 +MICROCHIP WILC1000 WIFI DRIVER
 +M:	Ajay Singh <ajay.kathat@microchip.com>
 +M:	Claudiu Beznea <claudiu.beznea@microchip.com>
 +L:	linux-wireless@vger.kernel.org
  S:	Supported
 -F:	drivers/net/ethernet/mscc/
 -F:	include/soc/mscc/ocelot*
 +F:	drivers/net/wireless/microchip/wilc1000/
 =20
- MICROCHIP XDMA DRIVER
- M:	Ludovic Desroches <ludovic.desroches@microchip.com>
- L:	linux-arm-kernel@lists.infradead.org
- L:	dmaengine@vger.kernel.org
- S:	Supported
- F:	drivers/dma/at_xdmac.c
-=20
  MICROSEMI MIPS SOCS
  M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
  M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
@@@ -18990,15 -18847,15 +18985,24 @@@ F:	Documentation/devicetree/bindings/=
me
  F:	drivers/media/platform/xilinx/
  F:	include/uapi/linux/xilinx-v4l2-controls.h
 =20
 +XILINX ZYNQMP PSGTR PHY DRIVER
 +M:	Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
 +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 +L:	linux-kernel@vger.kernel.org
 +S:	Supported
 +T:	git https://github.com/Xilinx/linux-xlnx.git
 +F:	Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
 +F:	drivers/phy/xilinx/phy-zynqmp.c
 +
+ XILINX ZYNQMP DPDMA DRIVER
+ M:	Hyun Kwon <hyun.kwon@xilinx.com>
+ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ L:	dmaengine@vger.kernel.org
+ S:	Supported
+ F:	Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
+ F:	drivers/dma/xilinx/xilinx_dpdma.c
+ F:	include/dt-bindings/dma/xlnx-zynqmp-dpdma.h
+=20
  XILLYBUS DRIVER
  M:	Eli Billauer <eli.billauer@gmail.com>
  L:	linux-kernel@vger.kernel.org

--Sig_/JiCKaOVGPzTJDq2Or+8rB07
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8WiF0ACgkQAVBC80lX
0Gwj/Qf+MKcSU4OQfFBRgPufNkEFYoqsaXF7AuA6u8CqtM0rZHn7PNPg4l0ZctQk
Ra0G76mVnHoPlog12gnGROwHn2dpjuyuknrYKg5fUJEH3J+o72emqexzhCrjm82I
vDjrMBJ5M/ECwnmtj/2UY7dPSC1Dsw+YDzXuxSLlo4t7BJ0HzyglboByIwjgRfDw
6cmqGUHQzdfxpGHmivInBgwa88eFHv7F6pdEKJoZjHmiWY7hlv0IfViH4qj6XuL1
u2MdGKnkIVnkcDKLQvc0GuSlp74ZK6e8jQHFN5zqmEbzoHTYyP3hz0hGxbhjXBa+
d7KV9iDAe6SX/QZ3Xhhrh2oRw/3t2g==
=2GWy
-----END PGP SIGNATURE-----

--Sig_/JiCKaOVGPzTJDq2Or+8rB07--
