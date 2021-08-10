Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCD23E5A8C
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 14:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhHJM6j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 08:58:39 -0400
Received: from verein.lst.de ([213.95.11.211]:36051 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239354AbhHJM6j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Aug 2021 08:58:39 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id BE33568B05; Tue, 10 Aug 2021 14:58:13 +0200 (CEST)
Date:   Tue, 10 Aug 2021 14:58:13 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20210810125813.GA9836@lst.de>
References: <20210810203135.7eb7b01a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810203135.7eb7b01a@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The patch below fixes it.

---
From 28be8f9a9da95d54b7fce80332bf2c62abfcdf73 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 10 Aug 2021 14:39:24 +0200
Subject: writeback: make the laptop_mode prototypes available unconditionally

Fix the !CONFIG_BLOCK build after the recent cleanup.

Fixes: 5ed964f8e54e ("mm: hide laptop_mode_wb_timer entirely behind the BDI API")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/writeback.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/writeback.h b/include/linux/writeback.h
index 667e86cfbdcf..270677dc4f36 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -336,14 +336,9 @@ static inline void cgroup_writeback_umount(void)
 /*
  * mm/page-writeback.c
  */
-#ifdef CONFIG_BLOCK
 void laptop_io_completion(struct backing_dev_info *info);
 void laptop_sync_completion(void);
-void laptop_mode_sync(struct work_struct *work);
 void laptop_mode_timer_fn(struct timer_list *t);
-#else
-static inline void laptop_sync_completion(void) { }
-#endif
 bool node_dirty_ok(struct pglist_data *pgdat);
 int wb_domain_init(struct wb_domain *dom, gfp_t gfp);
 #ifdef CONFIG_CGROUP_WRITEBACK
-- 
2.30.2

