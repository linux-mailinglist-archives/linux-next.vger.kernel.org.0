Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B5A43D594
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 23:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbhJ0V3G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 17:29:06 -0400
Received: from mout.perfora.net ([74.208.4.196]:52859 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236746AbhJ0V2L (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 17:28:11 -0400
Received: from toolbox.cardiotech.int ([194.191.235.54]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MNa9c-1mZono1QFO-007BhL;
 Wed, 27 Oct 2021 23:25:14 +0200
From:   Marcel Ziswiler <marcel@ziswiler.com>
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2] drm: import DMA_BUF module namespace
Date:   Wed, 27 Oct 2021 23:25:05 +0200
Message-Id: <20211027212506.3418521-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/EW1KHq6JOS45VcqOsIkE6SaDE6tPSUuItgHgntq/Eo7T8y418u
 DLncPtwYU3quKjvGFC7pJ1PXofJed2tHxjT/ohX5akjVujoHnXaKGhQNWDi6Bb6vRf3VhyO
 ptPtaOGiUfgdst50xRSGABOig9tMxTO2DJayOx91DQajyzdO8D53uIj12xXO5Hkmh46ntsd
 2EFpKfxw6bbqh+EAwrFjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T/4P8uXEbB4=:WPqN5r5fs2uVwzAGtuvEJY
 zBsZMlGXCb1HwJNr7smGq5KFTIeu/mpnAt4oGwP/g06QnArYDCLKOYeuCBG5lHFrjZ9e4+3Ql
 KarH9kTwqWuc9SW8qQUOZGQns9VdE9m0shNXPCkZwp4QdYuN5JZyArIxDGrN7Y2CKhZx4sGmI
 ToxX6j/QuAWgB7/lEInRI4ta9Gyukdw4XzMxT/vnsqO4b4sGXI2mi3HAMMeQ6aDntW+hOg8Jn
 k5jWxDtZA1vIU6TVsZvWK1Z6WnDJ0GiCm5q2yA93sRORUNuPPF82cyCyk/w5Roi4fFqTcig+8
 /ssAasetbvuioF1RBG6q9bbF7Z/TpbJH1oMuACttCHApQQ1S/FaZWZJNqd4HUlOnSraWHKwa2
 K+Bzry+OhztoF8wg/QtUw2LF/eeASxbpp/yu9DTX2e/Q88zhhI1tXlxmaVIQLuAOqbKSAPdxz
 oURMd9VG9RUGkkxu8uySBgtVx4m55cW/VOWYiO1Ra3asuZtgtRYNjUnofKfagHwLTSVET4Rx4
 Sq+x4XrEwcqo5VAfagwzVTm9wDIIY9dZ06ReScZAdMGeBIWFnZ128Li6r3SypW062mqSzSxh7
 j/v6kRRGzbqi3x9+2hMn7ANPaoxx6yB1LjF6K2wGhOaHXymrvZCdKQFvI/LJgEr5BXik+FDd+
 uHle0yfrEVee6CZ57RlNgEd3uPQb3bdItJ6e84w0r4vUtXsxq8IELPv8Bj+qq+1GatkI=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Today's -next fails building arm64 defconfig as follows:

ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap from
 namespace DMA_BUF, but does not import it.
ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vmap from
 namespace DMA_BUF, but does not import it.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Fixes: commit 4b2b5e142ff4 ("drm: Move GEM memory managers into modules")
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- After consulting the documentation move it to the bottom of the file
  where the other MODULE statements are as suggested by Thomas.
- Also move it down there for the drm_gem_shmem_helper.c file.

 drivers/gpu/drm/drm_gem_cma_helper.c   | 1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 6f7b3f8ec04d3..2a34241fee025 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -581,4 +581,5 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
 
 MODULE_DESCRIPTION("DRM CMA memory-management helpers");
+MODULE_IMPORT_NS(DMA_BUF);
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f7324582afe71..a5b743a83ce99 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -22,8 +22,6 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
-MODULE_IMPORT_NS(DMA_BUF);
-
 /**
  * DOC: overview
  *
@@ -779,4 +777,5 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
+MODULE_IMPORT_NS(DMA_BUF);
 MODULE_LICENSE("GPL v2");
-- 
2.26.2

