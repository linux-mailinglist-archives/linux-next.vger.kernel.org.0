Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B28227957
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 09:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGUHPJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 03:15:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbgGUHPJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jul 2020 03:15:09 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FED621702;
        Tue, 21 Jul 2020 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595315708;
        bh=M9u0UwvQ1U8jy95haXD8j/US5/GshtxZT8EktVlMBMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U/Mqcqyp/W3piPJQiCG2iuw/TsYI/zq+KO/gmcZ4rcO1LQHlyQW1AfD+AWdnM9P03
         qglwBmoGXXcBl9bzH7s37dVStFcoLQjGIxKI/MrRzyUT+Ns4NjkTmH4BFRoDQgmsuT
         7MNULnOF/REu4Ax05iFt1nvIyL2ihM2WcsMWXIdY=
Date:   Tue, 21 Jul 2020 12:45:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: linux-next: manual merge of the dmaengine tree with the phy-next
 tree
Message-ID: <20200721071504.GK12965@vkoul-mobl>
References: <20200721161701.64b4245e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721161701.64b4245e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 21-07-20, 16:17, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the dmaengine tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   4a33bea00314 ("phy: zynqmp: Add PHY driver for the Xilinx ZynqMP Gigabit Transceiver")
> 
> from the phy-next tree and commit:
> 
>   ef9303fdf46f ("dt: bindings: dma: xilinx: dpdma: DT bindings for Xilinx DPDMA")
> 
> from the dmaengine tree.

Thanks the fix looks okay.

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc MAINTAINERS
> index 495e4247cbb0,1ba09904354f..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -11432,20 -11364,14 +11434,13 @@@ L:	linux-arm-kernel@lists.infradead.or
>   S:	Supported
>   F:	drivers/usb/gadget/udc/atmel_usba_udc.*
>   
>  -MICROSEMI ETHERNET SWITCH DRIVER
>  -M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
>  -M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
>  -L:	netdev@vger.kernel.org
>  +MICROCHIP WILC1000 WIFI DRIVER
>  +M:	Ajay Singh <ajay.kathat@microchip.com>
>  +M:	Claudiu Beznea <claudiu.beznea@microchip.com>
>  +L:	linux-wireless@vger.kernel.org
>   S:	Supported
>  -F:	drivers/net/ethernet/mscc/
>  -F:	include/soc/mscc/ocelot*
>  +F:	drivers/net/wireless/microchip/wilc1000/
>   
> - MICROCHIP XDMA DRIVER
> - M:	Ludovic Desroches <ludovic.desroches@microchip.com>
> - L:	linux-arm-kernel@lists.infradead.org
> - L:	dmaengine@vger.kernel.org
> - S:	Supported
> - F:	drivers/dma/at_xdmac.c
> - 
>   MICROSEMI MIPS SOCS
>   M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
>   M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
> @@@ -18990,15 -18847,15 +18985,24 @@@ F:	Documentation/devicetree/bindings/me
>   F:	drivers/media/platform/xilinx/
>   F:	include/uapi/linux/xilinx-v4l2-controls.h
>   
>  +XILINX ZYNQMP PSGTR PHY DRIVER
>  +M:	Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
>  +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  +L:	linux-kernel@vger.kernel.org
>  +S:	Supported
>  +T:	git https://github.com/Xilinx/linux-xlnx.git
>  +F:	Documentation/devicetree/bindings/phy/xlnx,zynqmp-psgtr.yaml
>  +F:	drivers/phy/xilinx/phy-zynqmp.c
>  +
> + XILINX ZYNQMP DPDMA DRIVER
> + M:	Hyun Kwon <hyun.kwon@xilinx.com>
> + M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + L:	dmaengine@vger.kernel.org
> + S:	Supported
> + F:	Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dpdma.yaml
> + F:	drivers/dma/xilinx/xilinx_dpdma.c
> + F:	include/dt-bindings/dma/xlnx-zynqmp-dpdma.h
> + 
>   XILLYBUS DRIVER
>   M:	Eli Billauer <eli.billauer@gmail.com>
>   L:	linux-kernel@vger.kernel.org



-- 
~Vinod
