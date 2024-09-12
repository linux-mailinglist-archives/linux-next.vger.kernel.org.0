Return-Path: <linux-next+bounces-3800-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15A976CA5
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 16:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2419D280D3C
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887CB1AD276;
	Thu, 12 Sep 2024 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ak6oMl/v"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A491B1509;
	Thu, 12 Sep 2024 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152610; cv=none; b=VDos/bLQnRK1Meh5w/KRh7GnKpSk25noThd5exs+ekdG7qfYGuwWU8JKGBLdCvkDLSExJG8n5uGs6YX0+nlHxFdV4Qff6p6HH+NYm8/KHmhYUAEmth7UaN5bciJLT/l0+gYubY1FQodu4mh51mx5feWboC6kMrM2NE0hG+8FD2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152610; c=relaxed/simple;
	bh=+BgwN9MX/60QTjD/VU3ATqHjFLnavWPc01LGHnKtKoI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iLNugDwzRJQVH/L7JR5DQQmc3aX0XRBv14uvcjaQhvEKTchovAFdsw6K7X1gSEvPDuN2s/6UFyjQ0tug+wleFT9O5IEkGG3lsaupcOIQMN3DZ1Kqar5YOKpWZUpb5GPmFrsJp/gWhBRySR66Aoh8izfLfUSGuuBX3dqd3HKzsjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ak6oMl/v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726152609; x=1757688609;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+BgwN9MX/60QTjD/VU3ATqHjFLnavWPc01LGHnKtKoI=;
  b=Ak6oMl/vsLp0gPZCD/bPIMcct635j+MVdpMBM6vxzPVZGBjz0uAK9sub
   Bh/pSYwhqDpgx7xP/YPQAK6HVG0/scRPYdsBpRCK0k1tbYiLNzVe4SCOF
   jiDK3Y9v1FhDITjPx6+OTCa1kn56Oc4mfjeoJqvupEsZRwHL5DKekNw9q
   ihUuQLpWFHkgEImFmofs59MTJucRes6+jyMQZLU+XZzRt2CcFfvNbyu65
   4H5XqP6wmgg1tmQfV3g7Q9K11rqEFU3cBweLftLL9Q6KqZL73ZWkozfV1
   dDSuYqIXYoJ/mn8nt0JO2UpiBciHsZuEFcBxxCBsUMWluYeH/pTmx1JPB
   g==;
X-CSE-ConnectionGUID: bQKdu7ZhSlKkuA20qhIMdQ==
X-CSE-MsgGUID: vftxy1OWSPqLU4WS5NSN5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="47526685"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="47526685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 07:50:08 -0700
X-CSE-ConnectionGUID: zW8AD8+SRZGJXfRd47DaFQ==
X-CSE-MsgGUID: WFazzlTnRPGa3QkjIV4lJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="68038468"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by orviesa006.jf.intel.com with ESMTP; 12 Sep 2024 07:50:09 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Cc: tglx@linutronix.de,
	hpa@zytor.com,
	sfr@canb.auug.org.au,
	steven.price@arm.com,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [PATCH] perf: Fix topology_sibling_cpumask check warning on ARM
Date: Thu, 12 Sep 2024 07:50:25 -0700
Message-Id: <20240912145025.1574448-1-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

The below warning is triggered when building with arm
multi_v7_defconfig.

kernel/events/core.c: In function 'perf_event_setup_cpumask':
kernel/events/core.c:14012:13: warning: the comparison will always
evaluate as 'true' for the address of 'thread_sibling' will never be
NULL [-Waddress]
14012 |         if (!topology_sibling_cpumask(cpu)) {

The perf_event_init_cpu() may be invoked at the early boot stage, while
the topology_*_cpumask hasn't been initialized yet. The check is to
specially handle the case, and initialize the perf_online_<domain>_masks
on the boot CPU.
X86 uses a per-cpu cpumask pointer, which could be NULL at the early
boot stage. However, ARM uses a global variable, which never be NULL.

Use perf_online_mask as an indicator instead. Only initialize the
perf_online_<domain>_masks when perf_online_mask is empty.

Fix a typo as well.

Fixes: 4ba4f1afb6a9 ("perf: Generic hotplug support for a PMU with a scope")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/lkml/20240911153854.240bbc1f@canb.auug.org.au/
Reported-by: Steven Price <steven.price@arm.com>
Closes: https://lore.kernel.org/lkml/1835eb6d-3e05-47f3-9eae-507ce165c3bf@arm.com/
Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 kernel/events/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7a028474caef..20e97c1aa4d6 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13954,21 +13954,19 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 	struct cpumask *pmu_cpumask;
 	unsigned int scope;
 
-	cpumask_set_cpu(cpu, perf_online_mask);
-
 	/*
 	 * Early boot stage, the cpumask hasn't been set yet.
 	 * The perf_online_<domain>_masks includes the first CPU of each domain.
-	 * Always uncondifionally set the boot CPU for the perf_online_<domain>_masks.
+	 * Always unconditionally set the boot CPU for the perf_online_<domain>_masks.
 	 */
-	if (!topology_sibling_cpumask(cpu)) {
+	if (cpumask_empty(perf_online_mask)) {
 		for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
 			pmu_cpumask = perf_scope_cpumask(scope);
 			if (WARN_ON_ONCE(!pmu_cpumask))
 				continue;
 			cpumask_set_cpu(cpu, pmu_cpumask);
 		}
-		return;
+		goto end;
 	}
 
 	for (scope = PERF_PMU_SCOPE_NONE + 1; scope < PERF_PMU_MAX_SCOPE; scope++) {
@@ -13983,6 +13981,8 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 		    cpumask_any_and(pmu_cpumask, cpumask) >= nr_cpu_ids)
 			cpumask_set_cpu(cpu, pmu_cpumask);
 	}
+end:
+	cpumask_set_cpu(cpu, perf_online_mask);
 }
 
 int perf_event_init_cpu(unsigned int cpu)
-- 
2.38.1


