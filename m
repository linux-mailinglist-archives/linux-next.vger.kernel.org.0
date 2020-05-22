Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62FB1DDF73
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 07:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgEVFjn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 01:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgEVFjm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 01:39:42 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C7B1C05BD43
        for <linux-next@vger.kernel.org>; Thu, 21 May 2020 22:39:41 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id s3so11600005eji.6
        for <linux-next@vger.kernel.org>; Thu, 21 May 2020 22:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CqYPjIYXrmaZh1pcb7Hru9zoJQGqnxH9Aw5pMpXidZM=;
        b=aYQyOOGYpTK506neKROafbVlLAM6zZWflTaTxbOTlno9UdTylN2QDKgpzPOPDyFfTF
         CmoRZ3VWFKuQDI3sZpQxxvEu5MwUfJJBUICT+V+2wdAdlKF3lc7d24impuPgDdfpG629
         9FJ66bkZBb1gIsL+gwnVw2mxksHPRgd8DMOPM4qJL+6Gvg+DuZvIViNVocpSWoAVgEUW
         fYoUahjTtCl23DzT7h4Dp66pnB1b+WNdClhsLoi6ADDMhqoZ/nbAdRq+eYAEkAn7vWLe
         VeROqDTviZ/nzpcySbHjbAaHzDSW+oDsOjK3CL0RAPtnplFbF67tvK0iOQtGxuYgB9/P
         T1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CqYPjIYXrmaZh1pcb7Hru9zoJQGqnxH9Aw5pMpXidZM=;
        b=pTddU2o23HczvaD0MzU+kpjVjtQ2It4le97L2hsubGg8lQcTANflXS0Dh4QUwO1JcM
         T8R+OU9oBay/MB962XUiwAlDyGgpsV1Luxkj37zDBd+m9XbOyVVxjEPrak2tQCmBk+ZN
         anU70UiSzWJt/yQ+47srIMfe4jDo6n6IgHFXld9r4YnK+HNZW7Pfoe+qAdrwEOlLUk6A
         3FluB3aPaKVHHQYUd58ii25QFWH3yg8x5b7LnK3nwY5KUtkHbtrAyhCJanysWFdJyizI
         3rJMidXVfxFXWmfHQNTNBEiBUkiXjn/5893tIOj13LJUtPQsFN+0qLmfyAFJCIw3HOq8
         WAlA==
X-Gm-Message-State: AOAM531zewRqB5W+bWD+PmPHNoUc1FOmVLupmQyqSu1JyieQEDZTDG/s
        3nHbEYO/CqZ5HakbIr/60sN8
X-Google-Smtp-Source: ABdhPJy9uq8m2rKxx7uq0I34Kzy/WwnDjRO8dUM+LKlxkdxUSne7RB9jAb8jIaXI2nuz36i0IY94QQ==
X-Received: by 2002:a17:906:e2d2:: with SMTP id gr18mr6423821ejb.312.1590125979781;
        Thu, 21 May 2020 22:39:39 -0700 (PDT)
Received: from dkxps.local (dslb-002-204-227-207.002.204.pools.vodafone-ip.de. [2.204.227.207])
        by smtp.gmail.com with ESMTPSA id c12sm6845358ejm.36.2020.05.21.22.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 22:39:39 -0700 (PDT)
From:   Danil Kipnis <danil.kipnis@cloud.ionos.com>
To:     linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-next@vger.kernel.org, bvanassche@acm.org,
        dledford@redhat.com, jgg@ziepe.ca
Cc:     axboe@kernel.dk, danil.kipnis@cloud.ionos.com, lkp@intel.com,
        jinpu.wang@cloud.ionos.com
Subject: [PATCH] RDMA/rtrs: get rid of the do_next_path while_next_path macros
Date:   Fri, 22 May 2020 07:39:24 +0200
Message-Id: <20200522053924.528980-1-danil.kipnis@cloud.ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200520191105.GK31189@ziepe.ca>
References: <20200520191105.GK31189@ziepe.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The macros do_each_path/while_each_path lead to a smatch warning:
drivers/infiniband/ulp/rtrs/rtrs-clt.c:1196 rtrs_clt_failover_req() warn: inconsistent indenting
drivers/infiniband/ulp/rtrs/rtrs-clt.c:2890 rtrs_clt_request() warn: inconsistent indenting

Also checkpatch complains:
ERROR: Macros with multiple statements should be enclosed in a do - while loop

The macros are used only in two places: for a normal IO path and for the
failover path triggered after errors.

Get rid of the macros and just use a for loop iterating over the list
of paths in both places. It is easier to read and also less lines of code.

Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
---
 drivers/infiniband/ulp/rtrs/rtrs-clt.c | 29 ++++++++++++--------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
index 468fdd0d8713..45ea5aa5f406 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
@@ -727,18 +727,6 @@ struct path_it {
 	struct rtrs_clt_sess *(*next_path)(struct path_it *it);
 };
 
-#define do_each_path(path, clt, it) {					\
-	path_it_init(it, clt);						\
-	rcu_read_lock();						\
-	for ((it)->i = 0; ((path) = ((it)->next_path)(it)) &&		\
-			  (it)->i < (it)->clt->paths_num;		\
-	     (it)->i++)
-
-#define while_each_path(it)						\
-	path_it_deinit(it);						\
-	rcu_read_unlock();						\
-	}
-
 /**
  * list_next_or_null_rr_rcu - get next list element in round-robin fashion.
  * @head:	the head for the list.
@@ -1177,7 +1165,10 @@ static int rtrs_clt_failover_req(struct rtrs_clt *clt,
 	int err = -ECONNABORTED;
 	struct path_it it;
 
-	do_each_path(alive_sess, clt, &it) {
+	rcu_read_lock();
+	for (path_it_init(&it, clt);
+	     (alive_sess = it.next_path(&it)) && it.i < it.clt->paths_num;
+	     it.i++) {
 		if (unlikely(READ_ONCE(alive_sess->state) !=
 			     RTRS_CLT_CONNECTED))
 			continue;
@@ -1193,7 +1184,9 @@ static int rtrs_clt_failover_req(struct rtrs_clt *clt,
 		/* Success path */
 		rtrs_clt_inc_failover_cnt(alive_sess->stats);
 		break;
-	} while_each_path(&it);
+	}
+	path_it_deinit(&it);
+	rcu_read_unlock();
 
 	return err;
 }
@@ -2862,7 +2855,9 @@ int rtrs_clt_request(int dir, struct rtrs_clt_req_ops *ops,
 		dma_dir = DMA_TO_DEVICE;
 	}
 
-	do_each_path(sess, clt, &it) {
+	rcu_read_lock();
+	for (path_it_init(&it, clt);
+	     (sess = it.next_path(&it)) && it.i < it.clt->paths_num; it.i++) {
 		if (unlikely(READ_ONCE(sess->state) != RTRS_CLT_CONNECTED))
 			continue;
 
@@ -2887,7 +2882,9 @@ int rtrs_clt_request(int dir, struct rtrs_clt_req_ops *ops,
 		}
 		/* Success path */
 		break;
-	} while_each_path(&it);
+	}
+	path_it_deinit(&it);
+	rcu_read_unlock();
 
 	return err;
 }
-- 
2.25.1

