Return-Path: <linux-next+bounces-3832-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FA19785AA
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 18:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80D47B23F0D
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 16:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874E455769;
	Fri, 13 Sep 2024 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8JzeIf9"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22CA14A85;
	Fri, 13 Sep 2024 16:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726244598; cv=none; b=Mr+mnp1/kS45VeNQnxijzJ8i9ZsA05uyFBaMclECQavwRawSGBGx8D80+Lmw1xAzTf7t2ad7ivgdqfgKIDLcDh03JQHEfxBkF/ZINz/MqT3/ZJck4XUWGxildEcrJkpDQRHPhi5/mbW+CupPYdmTFR/GXcvj+Obq1SE6OJBiUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726244598; c=relaxed/simple;
	bh=xPaBfHmiDOQqdl2HEej4im/bq3I5EDwYcwH4PiP9kR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l30kCxkkEb9V+wwU/FlyApkkTbnwmmbx+ZmMa8lY7ZG81K5yoqrWXGC7sJXo1n95RlGxY6XsoS+kQZ9ObexYTpAYMHkf8RgkyEEg5OqJ4Lt8Xn/haANTYrLP5F7ywpS0F7sVZ/f85c+m221WfCooWRK7L3H1A1FKFBMyayZR2V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8JzeIf9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726244597; x=1757780597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xPaBfHmiDOQqdl2HEej4im/bq3I5EDwYcwH4PiP9kR0=;
  b=I8JzeIf9Agyid1FMd+/fABCXTpWK+6XwkJZ8HetdUiDLTR5FUJXVdHgS
   z71opI5p7FlWeEWK50qQ9o0UY1JE0xia+E4yEfSt7VopsPb/3tRF9sdEa
   qQgSFfAY14E5S1TWJVOqe2DOs9yrc+KfDK1NVd1re3zvJhnNKyf5kCB0M
   OTaOQoR9bUcGFzxrZyjs8pRNUuVbaOddGrmUTZ20l736jf5T13KDYIde+
   6f28LOvEejlr0UF+D8ppv7fAimdUX8PovBtLo22tUOatYXo4JRKM1RsiR
   BPNZQ2thJ8RFSkYI0agqkqGnSqiRoO8oMwPB1yIAUsR8u8yUuhwMhPixm
   g==;
X-CSE-ConnectionGUID: SXtTqjU4QHqZ/lY3xKno5Q==
X-CSE-MsgGUID: 1c/gGpLMR2SVWZHIDsDQeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25350582"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="25350582"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 09:23:15 -0700
X-CSE-ConnectionGUID: J4PvnfFKQOmIn/+UrDwK8A==
X-CSE-MsgGUID: 0Yi3hYBBSjWGNjktLeAm8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="98958333"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa001.fm.intel.com with ESMTP; 13 Sep 2024 09:23:14 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH] perf: Fix missing RCU reader protection in perf_event_clear_cpumask()
Date: Fri, 13 Sep 2024 09:23:40 -0700
Message-Id: <20240913162340.2142976-1-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

Running rcutorture scenario TREE05, the below warning is triggered.

[   32.604594] WARNING: suspicious RCU usage
[   32.605928] 6.11.0-rc5-00040-g4ba4f1afb6a9 #55238 Not tainted
[   32.607812] -----------------------------
[   32.609140] kernel/events/core.c:13946 RCU-list traversed in non-reader section!!
[   32.611595] other info that might help us debug this:
[   32.614247] rcu_scheduler_active = 2, debug_locks = 1
[   32.616392] 3 locks held by cpuhp/4/35:
[   32.617687]  #0: ffffffffb666a650 (cpu_hotplug_lock){++++}-{0:0}, at: cpuhp_thread_fun+0x4e/0x200
[   32.620563]  #1: ffffffffb666cd20 (cpuhp_state-down){+.+.}-{0:0}, at: cpuhp_thread_fun+0x4e/0x200
[   32.623412]  #2: ffffffffb677c288 (pmus_lock){+.+.}-{3:3}, at: perf_event_exit_cpu_context+0x32/0x2f0

In perf_event_clear_cpumask(), uses list_for_each_entry_rcu() without an
obvious RCU read-side critical section.

Either pmus_srcu or pmus_lock is good enough to protect the pmus list.
In the current context, pmus_lock is already held. The
list_for_each_entry_rcu() is not required.

Fixes: 4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")
Reported-by: Paul E. McKenney <paulmck@kernel.org>
Closes: https://lore.kernel.org/lkml/2b66dff8-b827-494b-b151-1ad8d56f13e6@paulmck-laptop/
Tested-by: Paul E. McKenney <paulmck@kernel.org>
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202409131559.545634cc-oliver.sang@intel.com
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 20e97c1aa4d6..5ba9934b49df 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13912,7 +13912,7 @@ static void perf_event_clear_cpumask(unsigned int cpu)
 	}
 
 	/* migrate */
-	list_for_each_entry_rcu(pmu, &pmus, entry, lockdep_is_held(&pmus_srcu)) {
+	list_for_each_entry(pmu, &pmus, entry) {
 		if (pmu->scope == PERF_PMU_SCOPE_NONE ||
 		    WARN_ON_ONCE(pmu->scope >= PERF_PMU_MAX_SCOPE))
 			continue;
-- 
2.38.1


