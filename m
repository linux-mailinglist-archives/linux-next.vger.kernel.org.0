Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2CB130A422
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 10:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbhBAJNE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Feb 2021 04:13:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbhBAJMm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2021 04:12:42 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C51C06174A
        for <linux-next@vger.kernel.org>; Mon,  1 Feb 2021 01:12:01 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id y9so1579961ejp.10
        for <linux-next@vger.kernel.org>; Mon, 01 Feb 2021 01:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=btINpU5HcXL/etWCMn1yPYxaXZUiSUxibTtLRThV+h4=;
        b=asNbPsb0CqUI950B4JBFHUKrn2W7wtaNO1TpKUlfomnOCZLoJ5jym8T1iorvw4MyCc
         6SDuMbtgWmZnOISe33HCz3ZSm2Vwq1jw8Eg4PUeBbrH9Arc7jThBqEoIQclJybsO7mtf
         sPmEDvdAyFpgB/kbykMjb6Ecw5uV+J3zkeIuh7beesbwOtKdPm+hrKsO6UA9C52l+AmY
         3RPthhhaWvG1SD2ecnBaKfY7gRPzyZBK3Ty49v74k0RdCd4bb5NPSh8nAErMR/TmGkwW
         LYeRnWdvkHs7QECGhnkm2CuhJOa0fGWtOLoa3umw03CTOr71I9Lt83cnDE3KLk5yHdpp
         5INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=btINpU5HcXL/etWCMn1yPYxaXZUiSUxibTtLRThV+h4=;
        b=MHvtmAIMuYFHdpUmWyQTEjNroW7H6lxo7b3pIYw9lIrTlgotnynGxoO+uCDx7O2Ide
         fUceiaFYv6LgH8SRG1XerO3PsNZeB2zVv82Olc7Y5eX0xhK9q9usKSJoq6DW0YeTJt5/
         DNLPVuYPik96h7tUZ0sJUGaWzG9YTofn7lhcmhzRd2v0u9sBiIdNSgf91jHAF/5szqIN
         5gYU6XLMJyhAn0B8D25NQsPPeHAIy4BrOFFPGu1EQ20UxBC450/cAz23x12WlibZuQF9
         cykRqY/MKe/QZUz6cdtjeZl6vSIR/nClKynjNL6Tbmgz8UU10XUlBKJdS+dxlfUEA+h3
         bcUQ==
X-Gm-Message-State: AOAM533dSfmwdF/TrS76y7XCic/8Bw650RKYZmtLHiznqkT94uAP8ick
        OWaT8dMK7n1G3w47WKVBygg=
X-Google-Smtp-Source: ABdhPJyVUeqK+Pcc8GO2yWa5gU4CD8oHJGEtNqFtkaMVfEEpPpXR+1r8SrDNZR6IwUAly3xNe7jajg==
X-Received: by 2002:a17:906:408b:: with SMTP id u11mr1222037ejj.299.1612170720380;
        Mon, 01 Feb 2021 01:12:00 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3d31:e37e:e2cc:a5ad])
        by smtp.gmail.com with ESMTPSA id v1sm3259239ejd.3.2021.02.01.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 01:11:59 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sfr@canb.auug.org.au, luben.tuikov@amd.com,
        linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/v3d/v3d_sched: fix scheduler callbacks return status
Date:   Mon,  1 Feb 2021 10:11:59 +0100
Message-Id: <20210201091159.177853-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Looks like this was not correctly adjusted.

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: a6a1f036c74e ("drm/scheduler: Job timeout handler returns status (v3)")
---
 drivers/gpu/drm/v3d/v3d_sched.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index ef2338a294ca..ceb33f8e4379 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -259,7 +259,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 	return NULL;
 }
 
-static enum drm_gpu_sched_status
+static enum drm_gpu_sched_stat
 v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 {
 	enum v3d_queue q;
@@ -294,7 +294,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
  * could fail if the GPU got in an infinite loop in the CL, but that
  * is pretty unlikely outside of an i-g-t testcase.
  */
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		    u32 *timedout_ctca, u32 *timedout_ctra)
 {
@@ -312,7 +312,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);
 }
 
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_bin_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_bin_job *job = to_bin_job(sched_job);
@@ -321,7 +321,7 @@ v3d_bin_job_timedout(struct drm_sched_job *sched_job)
 				   &job->timedout_ctca, &job->timedout_ctra);
 }
 
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_render_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_render_job *job = to_render_job(sched_job);
@@ -330,7 +330,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
 				   &job->timedout_ctca, &job->timedout_ctra);
 }
 
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_generic_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
@@ -338,7 +338,7 @@ v3d_generic_job_timedout(struct drm_sched_job *sched_job)
 	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
 }
 
-static enum drm_task_status
+static enum drm_gpu_sched_stat
 v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_csd_job *job = to_csd_job(sched_job);
-- 
2.25.1

