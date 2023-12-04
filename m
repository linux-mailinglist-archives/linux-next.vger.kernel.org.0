Return-Path: <linux-next+bounces-220-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA71803B0D
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 18:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA1BC1F2121F
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 17:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A01B2E417;
	Mon,  4 Dec 2023 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGvBZLtY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25781171D9;
	Mon,  4 Dec 2023 17:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5F8C433C7;
	Mon,  4 Dec 2023 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701709269;
	bh=PrQN3LxsLo0hnYtX+mHxOw3BE7UQ018hcELFYEAwoxQ=;
	h=From:To:Cc:Subject:Date:From;
	b=iGvBZLtYs7yHtlLTahRlEyaMg77PkPNKCUnY79j+4a+CQ0rzo/s8oWQILhuPdvPah
	 DXg32bDyS/S+oRwZ/rTx+ePKScRNqgIcPlsFAlXdMrwxfzGqc/48qdxze/hx9zZHv4
	 FfghEKC/+5gGgaUZUYSWaVNMcBHvC9WDKTVAyXUxCVQle9dgrLwZnKVMwRjumzvyKy
	 HbwQ/G80otDrUBS13rwTJK+5hCsXWO8VYjkXJ2AmSvqeNrKo26vG+Mbn2ej+ak+6lJ
	 PbYedmzbC9cXA0f/a4J9cx2Kos0QLDzgLekg7WZItSI4QvlSTYhLxm1CwwCc8yiVcC
	 BIrLl4SrYaj5Q==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable] mm/damon: document get_score_arg field of struct damos_quota
Date: Mon,  4 Dec 2023 17:01:06 +0000
Message-Id: <20231204170106.60992-1-sj@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 99b36eab9c05 ("mm/damon/core: implement goal-oriented
feedback-driven quota auto-tuning") on mm-unstable missed documenting
'get_score_arg' field of 'struct damos_quota' on the kernel-doc comment.
Fix it.

Fixes: 99b36eab9c05 ("mm/damon/core: implement goal-oriented feedback-driven quota auto-tuning") on mm-unstable
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 include/linux/damon.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 508a262418a2..aa34ab433bc5 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -137,6 +137,7 @@ enum damos_action {
  * @weight_age:		Weight of the region's age for prioritization.
  *
  * @get_score:		Feedback function for self-tuning quota.
+ * @get_score_arg:	Parameter for @get_score
  *
  * To avoid consuming too much CPU time or IO resources for applying the
  * &struct damos->action to large memory, DAMON allows users to set time and/or
@@ -156,10 +157,10 @@ enum damos_action {
  * &weight_nr_accesses, and &weight_age, because monitoring operations are
  * encouraged to respect those.
  *
- * If @get_score function pointer is set, DAMON calls it back and get the
- * return value of it for every @reset_interval.  Then, DAMON adjusts the
- * effective quota using the return value as a feedback score to the current
- * quota, using its internal feedback loop algorithm.
+ * If @get_score function pointer is set, DAMON calls it back with
+ * @get_score_arg and get the return value of it for every @reset_interval.
+ * Then, DAMON adjusts the effective quota using the return value as a feedback
+ * score to the current quota, using its internal feedback loop algorithm.
  *
  * The feedback loop algorithem assumes the quota input and the feedback score
  * output are in a positive proportional relationship, and the goal of the
-- 
2.34.1


