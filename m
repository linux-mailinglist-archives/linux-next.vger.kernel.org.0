Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22502253549
	for <lists+linux-next@lfdr.de>; Wed, 26 Aug 2020 18:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgHZQrz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Aug 2020 12:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbgHZQrx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Aug 2020 12:47:53 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31DDC061574;
        Wed, 26 Aug 2020 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=b4MA5TpSwk2Pnubg8wuSz4Ft23kjXnr6s/x3xGVfM+o=; b=Jbc2/quwfgWiTnjRfTG/KEzz2Y
        J4zprwW81y8Q/7NQYGOfaeyzmBlRKJT08kxTZUwZ8rYxi981RqXykckkHuGQ1rIp1KYT4oeF/vImS
        +swAZiv3EdCES26pTEVVU9p1lkH2twWmLxU7mMYN88lFVrfFscuqKtSiCtg2rQ6Fg4IDq0IXZeR0e
        rDpr37I2BFCjdBwO2FCyHScxkqH+h+crnu4zeNsVOh5M9PqEVBDoWRlYa2/oTyOtbFIWGgaEogDlI
        XmUOv3KKEnbBm8C09HuBKDWP3OByNTJLHezjX3SsfH+r2OgSyMxZ7vHII5PHtoKwqKslTjP3RRudS
        0/UAW5BQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kAyaR-0008Au-ME; Wed, 26 Aug 2020 16:47:47 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: virtio: fix kconfig dependency warning
Message-ID: <d3643dcf-87f4-ff45-fb90-9945458438f9@infradead.org>
Date:   Wed, 26 Aug 2020 09:47:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix kconfig dependency warning by using a different Kconfig symbol.

WARNING: unmet direct dependencies detected for VIRTIO_DMA_SHARED_BUFFER
  Depends on [n]: VIRTIO_MENU [=n] && DMA_SHARED_BUFFER [=y]
  Selected by [y]:
  - DRM_VIRTIO_GPU [=y] && HAS_IOMEM [=y] && DRM [=y] && VIRTIO [=y] && MMU [=y]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: virtualization@lists.linux-foundation.org
---
Found in linux-next but applies to mainline.

 drivers/gpu/drm/virtio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200826.orig/drivers/gpu/drm/virtio/Kconfig
+++ linux-next-20200826/drivers/gpu/drm/virtio/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_VIRTIO_GPU
 	tristate "Virtio GPU driver"
-	depends on DRM && VIRTIO && MMU
+	depends on DRM && VIRTIO_MENU && MMU
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select VIRTIO_DMA_SHARED_BUFFER

