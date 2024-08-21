Return-Path: <linux-next+bounces-3385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D860495A2FF
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 18:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15CA11C22076
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 16:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678BC152199;
	Wed, 21 Aug 2024 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BecZtf5G"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF3914F138;
	Wed, 21 Aug 2024 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258376; cv=none; b=RDq1qp+5rjeToReoNk145Eh2mt9DupnmlklLIzrOEi8vgTN29LARcoXBy54wDh+7HU73GnvvuPWNSE+GkgDTKKCu7Dxgm9wjbNUHtQn5C5OoaldLmOzLvzlxMCeWQY4YPdaAFSfxnLhoed/htwcvdfuBVShQrO17Qa6EkB3i6ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258376; c=relaxed/simple;
	bh=4IxCpBBcSL1rILicr6UJlxNz94zMMsQynUCP/kwtyHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9IXBJDt1d6qulliTnP6xvsPEA42IdhfWl59mRWY8MJZFjqLUwyJRoUMlyvHi3EuE02JbbBl9JzRlQQ7yMIAFQPDu47MYcqfA1M3rDovlVJvmbke5pJ3Q84XrGgiYFyMtPBaM/+6gI11nQ78rip18IT3C2Rl+W5TMc7dR5HJAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BecZtf5G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBF2C32781;
	Wed, 21 Aug 2024 16:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724258375;
	bh=4IxCpBBcSL1rILicr6UJlxNz94zMMsQynUCP/kwtyHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BecZtf5GmxwB2tNmhhWMCb02x4NdhBwyFYndFJ7DONsKh0FCUF5yqNIkk3Ebt3Wog
	 IYp0nl7VED9KDDMtdOAN4UD35BZ+vxWgb9mb5kotwsWRNXVkfws7Ut4VIrj9V4uj7E
	 HjIg7GpxO+PG+5wxj9LrLPmFw90NCG7RQfHO7tPzPdlFqVAd4wwol5oHHNtnFc7b39
	 6nkROA1LiP2k4Wuzr1kTREEjvjXc4i/5yzUQblXdSrGzLQWaPYweQm5ZM2PLK8Fat+
	 zJcZb+FIsMKdGNUezaOrV4Icw3iBMgg/dCA9d1nzvgct4MKpZgQbsQrQLDJnDPzXXJ
	 oBpYtt7b7iJGA==
Date: Wed, 21 Aug 2024 06:39:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH wq/for-6.12] workqueue: Fix another htmldocs build warning
Message-ID: <ZsYYRtpi3l50_Jzy@slm.duckdns.org>
References: <20240821134531.1da04ae7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821134531.1da04ae7@canb.auug.org.au>

From d156263e247c334a8872578118e0709ed63c4806 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Wed, 21 Aug 2024 06:37:39 -1000

Fix htmldocs build warning introduced by 9b59a85a84dc ("workqueue: Don't
call va_start / va_end twice").

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 include/linux/workqueue.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index f3cc15940b4d..59c2695e12e7 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -534,7 +534,7 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
  * @fmt: printf format for the name of the workqueue
  * @flags: WQ_* flags (only WQ_FREEZABLE and WQ_MEM_RECLAIM are meaningful)
  * @lockdep_map: user-defined lockdep_map
- * @...: args for @fmt
+ * @args: args for @fmt
  *
  * Same as alloc_ordered_workqueue but with the a user-define lockdep_map.
  * Useful for workqueues created with the same purpose and to avoid leaking a
@@ -544,7 +544,8 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
  * Pointer to the allocated workqueue on success, %NULL on failure.
  */
 #define alloc_ordered_workqueue_lockdep_map(fmt, flags, lockdep_map, args...)	\
-	alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, lockdep_map, ##args)
+	alloc_workqueue_lockdep_map(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags),	\
+				    1, lockdep_map, ##args)
 #endif
 
 /**
-- 
2.46.0


