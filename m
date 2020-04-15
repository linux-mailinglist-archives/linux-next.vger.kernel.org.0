Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E830B1AAF58
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 19:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404504AbgDORTP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 13:19:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58952 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404387AbgDORTO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2020 13:19:14 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id C024F2A10E6
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     dri-devel@lists.freedsktop.org
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        James Qian Wang <james.qian.wang@arm.com>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org,
        Emil Velikov <emil.velikov@collabora.com>, kernel@collabora.com
Subject: [PATCH] drm: Don't free a struct never allocated by drm_gem_fb_init()
Date:   Wed, 15 Apr 2020 19:19:01 +0200
Message-Id: <20200415171901.23914-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <202004150853.FD574CDD@keescook>
References: <202004150853.FD574CDD@keescook>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

drm_gem_fb_init() is passed the fb and never allocates it, so it should be
not the one freeing it. As it is now the second call to kfree() is possible
with the same fb. Coverity reported the following:

*** CID 1492613:  Memory - corruptions  (USE_AFTER_FREE)
/drivers/gpu/drm/drm_gem_framebuffer_helper.c: 230 in drm_gem_fb_create_with_funcs()
224     	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
225     	if (!fb)
226     		return ERR_PTR(-ENOMEM);
227
228     	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
229     	if (ret) {
vvv     CID 1492613:  Memory - corruptions  (USE_AFTER_FREE)
vvv     Calling "kfree" frees pointer "fb" which has already been freed. [Note: The source code implementation of the function has been overridden by a user model.]
230     		kfree(fb);
231     		return ERR_PTR(ret);
232     	}
233
234     	return fb;
235     }

drm_gem_fb_init_with_funcs() calls drm_gem_fb_init()
drm_gem_fb_init() calls kfree(fb)

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492613 ("Memory - corruptions")
Fixes: f2b816d78a94 ("drm/core: Allow drivers allocate a subclass of struct drm_framebuffer")
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index cac15294aef6..ccc2c71fa491 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -76,10 +76,8 @@ drm_gem_fb_init(struct drm_device *dev,
 		fb->obj[i] = obj[i];
 
 	ret = drm_framebuffer_init(dev, fb, funcs);
-	if (ret) {
+	if (ret)
 		drm_err(dev, "Failed to init framebuffer: %d\n", ret);
-		kfree(fb);
-	}
 
 	return ret;
 }
-- 
2.17.1

