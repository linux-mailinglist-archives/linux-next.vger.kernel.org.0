Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E406E27F016
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 19:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgI3RRD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 13:17:03 -0400
Received: from crapouillou.net ([89.234.176.41]:33858 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgI3RRB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 13:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601486218; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K4FdEWnxywTg58dVaxSVDCY6CPJH5VaSpaRHUxXoYO8=;
        b=MHTvilFiFcEoV8ERIrzbb2lSr7HlhKRtVWEcAwCR0gCnShWJ90CkLCYMXEbi/NCMHZluMx
        3RXGT3638NQsQ6QarhTsZOtv2vWScq5hVTDCU+HePWop1+dwSJwxWY9TD231Xz7E1Gqvr2
        BbsN3E3GQO9nRiMlFePjh24K6Oc+ys8=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] drm: Add and export function drm_gem_cma_create_noalloc
Date:   Wed, 30 Sep 2020 19:16:42 +0200
Message-Id: <20200930171644.299363-1-paul@crapouillou.net>
In-Reply-To: <20200930165212.GA8833@lst.de>
References: <20200930165212.GA8833@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Add and export the function drm_gem_cma_create_noalloc(), which is just
__drm_gem_cma_create() renamed.

This function can be used by drivers that need to create a GEM object
without allocating the backing memory.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 11 ++++++-----
 include/drm/drm_gem_cma_helper.h     |  3 +++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 59b9ca207b42..6abc4b306832 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -34,7 +34,7 @@
  */
 
 /**
- * __drm_gem_cma_create - Create a GEM CMA object without allocating memory
+ * drm_gem_cma_create_noalloc - Create a GEM CMA object without allocating memory
  * @drm: DRM device
  * @size: size of the object to allocate
  *
@@ -45,8 +45,8 @@
  * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
  * error code on failure.
  */
-static struct drm_gem_cma_object *
-__drm_gem_cma_create(struct drm_device *drm, size_t size)
+struct drm_gem_cma_object *
+drm_gem_cma_create_noalloc(struct drm_device *drm, size_t size)
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *gem_obj;
@@ -76,6 +76,7 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 	kfree(cma_obj);
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(drm_gem_cma_create_noalloc);
 
 /**
  * drm_gem_cma_create - allocate an object with the given size
@@ -98,7 +99,7 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 
 	size = round_up(size, PAGE_SIZE);
 
-	cma_obj = __drm_gem_cma_create(drm, size);
+	cma_obj = drm_gem_cma_create_noalloc(drm, size);
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
@@ -476,7 +477,7 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 
 	/* Create a CMA GEM buffer. */
-	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
+	cma_obj = drm_gem_cma_create_noalloc(dev, attach->dmabuf->size);
 	if (IS_ERR(cma_obj))
 		return ERR_CAST(cma_obj);
 
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 2bfa2502607a..be2b8e3a8ab2 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -83,6 +83,9 @@ int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);
 struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 					      size_t size);
 
+struct drm_gem_cma_object *
+drm_gem_cma_create_noalloc(struct drm_device *drm, size_t size);
+
 extern const struct vm_operations_struct drm_gem_cma_vm_ops;
 
 #ifndef CONFIG_MMU
-- 
2.28.0

