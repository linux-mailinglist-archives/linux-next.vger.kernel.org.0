Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76EB28B22C
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 12:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgJLKZW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 06:25:22 -0400
Received: from aposti.net ([89.234.176.197]:54906 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgJLKZW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Oct 2020 06:25:22 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-next@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] drm/ingenic: Fix bad revert
Date:   Mon, 12 Oct 2020 12:25:09 +0200
Message-Id: <20201012102509.10690-1-paul@crapouillou.net>
In-Reply-To: <20201012152452.432c4867@canb.auug.org.au>
References: <20201012152452.432c4867@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fix a badly reverted commit. The revert commit was cherry-picked from
drm-misc-next to drm-misc-next-fixes, and in the process some unrelated
code was added.

Fixes: a3fb64c00d44 "Revert "gpu/drm: ingenic: Add option to mmap GEM buffers cached""
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 1be1235bd546..a3d1617d7c67 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -440,20 +440,6 @@ void ingenic_drm_plane_config(struct device *dev,
 	}
 }
 
-static void ingenic_drm_update_palette(struct ingenic_drm *priv,
-				       const struct drm_color_lut *lut)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
-		u16 color = drm_color_lut_extract(lut[i].red, 5) << 11
-			| drm_color_lut_extract(lut[i].green, 6) << 5
-			| drm_color_lut_extract(lut[i].blue, 5);
-
-		priv->dma_hwdescs->palette[i] = color;
-	}
-}
-
 static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 					    struct drm_plane_state *oldstate)
 {
@@ -464,8 +450,6 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	dma_addr_t addr;
 
 	if (state && state->fb) {
-		crtc_state = state->crtc->state;
-
 		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
 		width = state->src_w >> 16;
 		height = state->src_h >> 16;
-- 
2.28.0

