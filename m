Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9337F2EF879
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 21:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbhAHT7f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Jan 2021 14:59:35 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:59142 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbhAHT7f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2021 14:59:35 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 1984E20021;
        Fri,  8 Jan 2021 20:58:40 +0100 (CET)
Date:   Fri, 8 Jan 2021 20:58:39 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv1] video: omapfb2: Make standard and custom DSI command
 mode panel driver mutually exclusive
Message-ID: <20210108195839.GA1429715@ravnborg.org>
References: <20210108122540.657501b2@canb.auug.org.au>
 <20210108112441.14609-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108112441.14609-1-sebastian.reichel@collabora.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=rOUgymgbAAAA:8 a=QX4gbG5DAAAA:8 a=7gkXJVJtAAAA:8
        a=bFzB3eAsRtkcaW2KersA:9 a=CjuIK1q_8ugA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
        a=AbAUZ8qAyYyZVLSsDulk:22 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Sebatian,

On Fri, Jan 08, 2021 at 12:24:41PM +0100, Sebastian Reichel wrote:
> Standard DRM panel driver for DSI command mode panel used by omapfb2 is also
> available now. Just like the other panels its module name clashes with the
> module from drivers/video/fbdev/omap2/omapfb/displays, part of the deprecated
> omapfb2 fbdev driver. As omapfb2 can only be compiled when the omapdrm driver
> is disabled, and the DRM panel drivers are useless in that case, make the
> omapfb2 panel depend on the standard DRM panels being disabled to fix
> the name clash.
> 
> Fixes: cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

For a backport this looks good:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

But why is it it we need omapfb at all when we have omapdrm?
Can we sunset all or some parts of omap support in video/?
If not, what is missing to do so.

	Sam

> ---
> Laurent introduced and fixed the same issue for the other panels and
> this simply replicates the same solution for DSI command mode panel.
> ---
>  drivers/video/fbdev/omap2/omapfb/displays/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/Kconfig b/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
> index 744416dc530e..384d74a126dc 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
> @@ -43,6 +43,7 @@ config FB_OMAP2_PANEL_DPI
>  config FB_OMAP2_PANEL_DSI_CM
>  	tristate "Generic DSI Command Mode Panel"
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on DRM_PANEL_DSI_CM = n
>  	help
>  	  Driver for generic DSI command mode panels.
>  
> -- 
> 2.29.2
