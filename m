Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C24B18A0F8
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 17:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgCRQzV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 18 Mar 2020 12:55:21 -0400
Received: from muru.com ([72.249.23.125]:60734 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbgCRQzV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 12:55:21 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0F27580B6;
        Wed, 18 Mar 2020 16:56:06 +0000 (UTC)
Date:   Wed, 18 Mar 2020 09:55:17 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: linux-next: manual merge of the drm tree with the omap tree
Message-ID: <20200318165517.GO37466@atomide.com>
References: <20200318135034.242d9edf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200318135034.242d9edf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [200318 02:51]:
> Hi all,
> 
> Today's linux-next merge of the drm tree got a conflict in:
> 
>   arch/arm/configs/omap2plus_defconfig
> 
> between commit:
> 
>   98c2cc359f8f ("ARM: omap2plus_defconfig: Update for moved and dropped options")
> 
> from the omap tree and commit:
> 
>   e7e67d9a2f1d ("drm/omap: Switch the HDMI and VENC outputs to drm_bridge")
> 
> from the drm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

OK thanks!

Tony


> diff --cc arch/arm/configs/omap2plus_defconfig
> index eedb26ff93f9,54f1a21de7e0..000000000000
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@@ -360,10 -353,10 +360,9 @@@ CONFIG_OMAP2_DSS_DSI=
>   CONFIG_DRM_OMAP_PANEL_DSI_CM=m
>   CONFIG_DRM_TILCDC=m
>   CONFIG_DRM_PANEL_SIMPLE=m
> + CONFIG_DRM_DISPLAY_CONNECTOR=m
> + CONFIG_DRM_SIMPLE_BRIDGE=m
>  -CONFIG_DRM_TI_TFP410=m
> + CONFIG_DRM_TI_TPD12S015=m
>   CONFIG_DRM_PANEL_LG_LB035Q02=m
>   CONFIG_DRM_PANEL_NEC_NL8048HL11=m
>   CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m


