Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418D83CF83E
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 12:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236811AbhGTKFa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 06:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237492AbhGTKC0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 06:02:26 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED107C061768;
        Tue, 20 Jul 2021 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=xNvRDW9ONZjf7Gs+YtUdAugHR2FJ1EQUstu+mZZ9L0Q=; b=U81FZl+vNFO9GD3jInsGgPvHct
        Zf0A71gTS4Md6zf7CRJOAB39THGy6h+2l+/rd7FDQRllwnSdF+h7hl9tgQMQjMHXaH6oZsRZ2vf9L
        6Q0AJmHA9KtPHMvQ+Uqy+y9EG3F8uuWaHdx2PJUcHqq1yU9AfgaR/opzttdYXlQmQ2wUCNTOocWjN
        la8MKImt4/VGhBiyTJjIQcKwLhwMJ8uKkrcV8hcCOJMbVpkfNTr0m/SaOTmbT8LRR2xG/IyNPQ1QW
        GtwUpG1v8slJy1OaI9Y4L0XO/8O1ePZg+oq0rJ4OyCcJ3Z86/Abor8Wkvo7dZEf7SzjXprf9gSLHs
        jHleeoBg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1m5nDF-0000EK-Vy; Tue, 20 Jul 2021 13:42:58 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>,
        kernel test robot <lkp@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] gpu: host1x: Remove unused functions
Date:   Tue, 20 Jul 2021 13:42:03 +0300
Message-Id: <20210720104203.2045449-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210720180805.57baa5c7@canb.auug.org.au>
References: <20210720180805.57baa5c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Remove the host1x_fence_create_fd and host1x_fence_extract
functions that are not used anywhere. host1x_fence_create_fd
is additionally using sync_file_create without there being
a Kconfig dependency to SYNC_FILE, causing builds to fail.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/fence.c | 43 --------------------------------------
 include/linux/host1x.h     |  1 -
 2 files changed, 44 deletions(-)

diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index 06c6b86237bd..5de4affcb918 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -164,46 +164,3 @@ struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold)
 	return &fence->base;
 }
 EXPORT_SYMBOL(host1x_fence_create);
-
-int host1x_fence_create_fd(struct host1x_syncpt *sp, u32 threshold)
-{
-	struct sync_file *file;
-	struct dma_fence *f;
-	int fd;
-
-	f = host1x_fence_create(sp, threshold);
-	if (IS_ERR(f))
-		return PTR_ERR(f);
-
-	fd = get_unused_fd_flags(O_CLOEXEC);
-	if (fd < 0) {
-		dma_fence_put(f);
-		return fd;
-	}
-
-	file = sync_file_create(f);
-	dma_fence_put(f);
-	if (!file)
-		return -ENOMEM;
-
-	fd_install(fd, file->file);
-
-	return fd;
-}
-EXPORT_SYMBOL(host1x_fence_create_fd);
-
-int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32 *threshold)
-{
-	struct host1x_syncpt_fence *f;
-
-	if (fence->ops != &host1x_syncpt_fence_ops)
-		return -EINVAL;
-
-	f = container_of(fence, struct host1x_syncpt_fence, base);
-
-	*id = f->sp->id;
-	*threshold = f->threshold;
-
-	return 0;
-}
-EXPORT_SYMBOL(host1x_fence_extract);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9b6784708f2e..2127762fc63d 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -171,7 +171,6 @@ void host1x_syncpt_release_vblank_reservation(struct host1x_client *client,
 					      u32 syncpt_id);
 
 struct dma_fence *host1x_fence_create(struct host1x_syncpt *sp, u32 threshold);
-int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32 *threshold);
 
 /*
  * host1x channel
-- 
2.30.1

