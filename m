Return-Path: <linux-next+bounces-6530-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2082AA9E64
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 23:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123DD1A800F1
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 21:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42E620298A;
	Mon,  5 May 2025 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEKs8qiZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4F1E1DE9
	for <linux-next@vger.kernel.org>; Mon,  5 May 2025 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481809; cv=none; b=apXnpnvsiuC9g3W3npbWNIP0Vw8KzWJwNgTuZ+yGF5cjVHKm5lNOJUcYH71eyGub3yanBLFjvM/yuzsluh/BdQLRkWNOomzv1B0/NviXjfMhV3DDKC9aXDF4X+vZgvZa7Ce5Vk4hrnuWTSZHNJEmBbJT+QyvG/AyqFvW9AJ1fTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481809; c=relaxed/simple;
	bh=dPx1OYTiuicCH1EKdvRzybWgwmMJFc8qDEQ2ZP1IWsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mvS/qCF4WeS3JSWe9j7yTcxFyJJhalfhFqByv1wYYBWkl88nHDlPYRrBjxsmKfEMN38QlyCY8cae/EgpzIcavQJA4UmUL2sYlUKOVVgSygT8tHhvJzXtR4gj6peynQsn0Fr7FLHWs3ye/bpZwRz6fn3Lv1xRJq7Ro06BMBo0Boo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEKs8qiZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE11C4CEE4;
	Mon,  5 May 2025 21:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746481809;
	bh=dPx1OYTiuicCH1EKdvRzybWgwmMJFc8qDEQ2ZP1IWsQ=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=CEKs8qiZi5tD1AmuWP44Q00iRQRvYXiaDKNUnXH8YtQJ1r9NB97k1fKBnCM4yJBqG
	 fAGOm3EuDCqcPGZ8C72l1ARcOvj/lKJ66/uE7fh1W3JXMe7SFZIjRsEQsRJpe/4k5s
	 wG/8+xhmxMElCBTb/GBxPVxPvco50ZwbXnn+wKC0cJTO1gfczfqPnA59Qvobn0Crbb
	 m2q0ljIuWVOlqqa1UTnpA6wy76WxFMmjXAfHcgtgmK4rnG7JIu45qJc5jZWgUYZHIQ
	 8HL54xJMqwn/+py4yGVritSwsov0+8tNTlUhZd0X9DYpHY0yJealb3Zi9x+UqbRHtW
	 h3o76y0cnNc+A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8E955CE091E; Mon,  5 May 2025 14:50:08 -0700 (PDT)
Date: Mon, 5 May 2025 14:50:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Junxian Huang <huangjunxian6@hisilicon.com>,
	Leon Romanovsky <leon@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Subject: [BUG] allmodconfig build failure in hns_roce_trace.h
Message-ID: <0ea657ca-71cb-498d-a5d5-43300f30523d@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

I ran into an allmodconfig build error in next-20250505 and a few of
its predecessors on x86.  The patch shown below makes it build without
errors, and might even be a proper patch.

An alternative fix might be to use the "-I" compiler command-line argument
to inform it of this additional place to look for include files.

							Thanx, Paul

------------------------------------------------------------------------

hns: Fix hns_roce_trace.h allmodconfig build failure

When doing an allmodconfig build next-20250505 and a few of its predecessors on x86, I
get the following build error:

In file included from drivers/infiniband/hw/hns/hns_roce_trace.h:213,
                 from drivers/infiniband/hw/hns/hns_roce_hw_v2.c:53:
./include/trace/define_trace.h:110:42: fatal error: ./hns_roce_trace.h: No such file or directory
  110 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
      |                                          ^
compilation terminated.

This appears to have been introduced by this commit:

02007e3ddc07 ("RDMA/hns: Add trace for flush CQE")

Fix (or at least suppress) this by adding the path needed to find the
include file.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

---

diff --git a/drivers/infiniband/hw/hns/hns_roce_trace.h b/drivers/infiniband/hw/hns/hns_roce_trace.h
index 23cbdbaeffaa4..bec69b6dca5da 100644
--- a/drivers/infiniband/hw/hns/hns_roce_trace.h
+++ b/drivers/infiniband/hw/hns/hns_roce_trace.h
@@ -207,7 +207,7 @@ DEFINE_EVENT(cmdq, hns_cmdq_resp,
 #endif /* __HNS_ROCE_TRACE_H */
 
 #undef TRACE_INCLUDE_FILE
-#define TRACE_INCLUDE_FILE hns_roce_trace
+#define TRACE_INCLUDE_FILE ../../../drivers/infiniband/hw/hns/hns_roce_trace
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
 #include <trace/define_trace.h>

