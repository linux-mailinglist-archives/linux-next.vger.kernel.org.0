Return-Path: <linux-next+bounces-5483-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 460BFA3A74F
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 20:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFACE7A3E3B
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2025 19:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF08A21B9F6;
	Tue, 18 Feb 2025 19:24:46 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D791B21B9C7;
	Tue, 18 Feb 2025 19:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739906686; cv=none; b=jkyRe5B/ANxqHxt4rAEfXyK4GUnUuIKYnxOexECx6nZpCv9kvtFs/O6Vvvrh5gV3gCfLtrOU9mhdtnPmMv9SFjMC2wC1ccAnQzB12x5gbZXtW3b3ZaoGS1Z2T2mvlju0Vf0aPs53EKDUdOXdKy03uwFX32TO8pTgZOLxxDqhY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739906686; c=relaxed/simple;
	bh=gkq0bzBew/gK9mIUYB/45V624O4MpHtRd83Uovjs+M8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kbg/jG7YDW4AQ5zuCz8kuT6aGb3U6HXleg2E2axIf0sYP/SQQPOqoDq8vfnunjQO89h2ZbD5j57y7fo5hZGTijNgJtLmx+zZ2uaQ57w+VA2FJS3CQFJ48YBfzH2zp8hdNVq+cvyMmZcZ1rRF4JFkEleOurIoraQKLLAJVvhktcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91CC9152B;
	Tue, 18 Feb 2025 11:24:59 -0800 (PST)
Received: from e125905.cambridge.arm.com (e125905.cambridge.arm.com [10.1.194.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B07CD3F6A8;
	Tue, 18 Feb 2025 11:24:38 -0800 (PST)
From: Beata Michalska <beata.michalska@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	sfr@canb.auug.org.au
Cc: ionela.voinescu@arm.com,
	yury.norov@gmail.com,
	linux-next@vger.kernel.org,
	sumitg@nvidia.com,
	yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com,
	zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: [PATCH] arm64: Utilize for_each_cpu_wrap for reference lookup
Date: Tue, 18 Feb 2025 19:24:12 +0000
Message-Id: <20250218192412.2072619-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While searching for a reference CPU within a given policy,
arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
all available CPUs and to ensure each is verified only once.
Recent changes to cpumask_next_wrap will handle the latter no more,
so switching to for_each_cpu_wrap, which  preserves expected behavior
while ensuring compatibility with the updates.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
---
 based on arm64 for-next/amuv1-avg-freq

 arch/arm64/kernel/topology.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index a09b0551ec59..9e3583720668 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -254,7 +254,7 @@ int arch_freq_get_on_cpu(int cpu)
 		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
 		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
 			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
-			int ref_cpu = cpu;
+			int ref_cpu;
 
 			if (!policy)
 				return -EINVAL;
@@ -265,11 +265,15 @@ int arch_freq_get_on_cpu(int cpu)
 				return -EOPNOTSUPP;
 			}
 
-			do {
-				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
-							    start_cpu, true);
-
-			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
+			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
+				if (ref_cpu == start_cpu) {
+					/* Prevent verifying same CPU twice */
+					ref_cpu = nr_cpu_ids;
+					break;
+				}
+				if (!idle_cpu(ref_cpu))
+					break;
+			}
 
 			cpufreq_cpu_put(policy);
 
-- 
2.25.1


