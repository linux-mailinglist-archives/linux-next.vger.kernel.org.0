Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C036B43CD96
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 17:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242778AbhJ0Pek (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 11:34:40 -0400
Received: from mout.perfora.net ([74.208.4.196]:38129 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242712AbhJ0Pej (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 11:34:39 -0400
X-Greylist: delayed 350 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Oct 2021 11:34:39 EDT
Received: from toolbox.cardiotech.int ([194.191.235.54]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0M0fUG-1mwrBg1nTC-00uuPU;
 Wed, 27 Oct 2021 17:25:42 +0200
From:   Marcel Ziswiler <marcel@ziswiler.com>
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        dri-devel@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v1] drm: import DMA_BUF module namespace
Date:   Wed, 27 Oct 2021 17:25:34 +0200
Message-Id: <20211027152534.3366799-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Bl5t3lSPLC2ho7JrhNFfE+Mz2QikL3xU5MGZYbgo/rT3YQWwu/H
 Aktrk+pIqxAdQG37K73bbvCQyf+Oj1szWKgs7pLxr8gNdrbecyBVwdI4GZcltKzXnU6Kh2o
 57exL4Pa/C8CVet8SbO1s2k+ry1nT+aIlceX5zk8uXbSINtaC5C6Rs63bHwipB1fulM2RA5
 A20AZqjcfKUVY5w3EsWhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:irZk7Ltqw/4=:hRJQVkrPrmPkRkTnpp4RYr
 gqp4aJwY9n1vN62JB0vS545paEQcOfRm+7t24d+S9dzXQg6YF0O+esFgR1zlAfA2/t1+OR8b8
 Z5ofERtipgRd3s/jnh3PHwGt2gwTT8vAqui0RPQSDMCXaVd0WHEQaayTMC2CB6Qj8RRXhHIbO
 IvOcreAABzCHGfevCt6CYJ7J+Kbf08XQf9rdFgQ95qLaIV4r2+EHk0v6ZXN9tGdu+QY6k88/w
 ezy9+dyFsCpKrR6URqtK1tZ4y8rvgzKpm7cCNWHBXTZQ41DNofc0tjdeTvVes35Czd8aVDTth
 FNhUJOuHsz+Xp3w3GgLVvXTh0uxoQIjDAAaBVaqlenjTKxcRWHP+7ycwCtBxEYCGQ2/d4OmVm
 0ZF+eN5SHdJ4OFaAVAvytCIVPGB3eNfe7Rs8P1B1KNszMF+NPZx4GmPbzJlUzHWyOL1VHfuAB
 U8zlDtY7CJGfFUd31EGrSk+lt0a5pcabuHrXm3SKNw+6vXDxS8QH2WdW1MfVJJ6GffKqbWwEO
 XB2fwVsYn5GzHen4yfrbovCbdAI6q/4PTuIwDszayBo96OZJWNdBj8tgyJHlqSsxOwjtQYL39
 bra/VjgLFAsLhFYc4OC/OXgGP6W+1q76a0nWaJ43ZmCKaVfg7qdU0eDRbGFI/VJ62QgBE/VD/
 nBVDQsU2wXhNz8EV2+Q7Apni9qSYIRAShw40IChKwoDtKYrCNC9Ct/9jKRzYftTEjzYs=
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

 drivers/gpu/drm/drm_gem_cma_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 6f7b3f8ec04d3..69f8564ad11cd 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -23,6 +23,8 @@
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_vma_manager.h>
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 /**
  * DOC: cma helpers
  *
-- 
2.26.2

