Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63492EF132
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 12:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbhAHLZp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Jan 2021 06:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbhAHLZo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2021 06:25:44 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B193C0612F4;
        Fri,  8 Jan 2021 03:25:04 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 78BB81F416A5
Received: by jupiter.universe (Postfix, from userid 1000)
        id 5A3E74800B9; Fri,  8 Jan 2021 12:24:59 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCHv1] video: omapfb2: Make standard and custom DSI command mode panel driver mutually exclusive
Date:   Fri,  8 Jan 2021 12:24:41 +0100
Message-Id: <20210108112441.14609-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108122540.657501b2@canb.auug.org.au>
References: <20210108122540.657501b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Standard DRM panel driver for DSI command mode panel used by omapfb2 is also
available now. Just like the other panels its module name clashes with the
module from drivers/video/fbdev/omap2/omapfb/displays, part of the deprecated
omapfb2 fbdev driver. As omapfb2 can only be compiled when the omapdrm driver
is disabled, and the DRM panel drivers are useless in that case, make the
omapfb2 panel depend on the standard DRM panels being disabled to fix
the name clash.

Fixes: cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel driver")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Laurent introduced and fixed the same issue for the other panels and
this simply replicates the same solution for DSI command mode panel.
---
 drivers/video/fbdev/omap2/omapfb/displays/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/Kconfig b/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
index 744416dc530e..384d74a126dc 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/displays/Kconfig
@@ -43,6 +43,7 @@ config FB_OMAP2_PANEL_DPI
 config FB_OMAP2_PANEL_DSI_CM
 	tristate "Generic DSI Command Mode Panel"
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_PANEL_DSI_CM = n
 	help
 	  Driver for generic DSI command mode panels.
 
-- 
2.29.2

