Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D4534154E
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 07:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233828AbhCSGSw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 02:18:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13578 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233979AbhCSGS0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Mar 2021 02:18:26 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F1ttj2f29zPkbm;
        Fri, 19 Mar 2021 14:15:57 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Fri, 19 Mar 2021
 14:18:16 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <hjc@rock-chips.com>, <heiko@sntech.de>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <p.zabel@pengutronix.de>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-next@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <john.wanghui@huawei.com>
Subject: [PATCH -next] drm/rockchip: remove unused variable 'old_state'
Date:   Fri, 19 Mar 2021 14:18:12 +0800
Message-ID: <20210319061812.59458-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fix the warning:

    drivers/gpu/drm/rockchip/rockchip_drm_vop.c:882:26:warning: unused variable ‘old_state’ [-Wunused-variable]
      struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,

Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 81c70d7a0471..64469439ddf2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -879,8 +879,6 @@ static void vop_plane_atomic_disable(struct drm_plane *plane,
 static void vop_plane_atomic_update(struct drm_plane *plane,
 		struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_crtc *crtc = new_state->crtc;
-- 
2.17.1

