Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A81131A323
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 17:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhBLQ4h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 11:56:37 -0500
Received: from mga14.intel.com ([192.55.52.115]:16371 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229558AbhBLQ4g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 11:56:36 -0500
IronPort-SDR: nzMvWrzl9mJqCasW2D8NzZ5MaNpM/1cRnjqFdL4gFWCG2cK3yrqZEKARsQJ8ydVJ0iPaM5P7Qc
 LRoEn6sz2xxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="181665137"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="181665137"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 08:55:55 -0800
IronPort-SDR: zZemSbYRA2DitIWANy+76U3L/CTOlpIiUmUBBHydrnsmVbA7k+6FkGAJWCml1kRdRpKFynDsqz
 kSK6PNHTK8vg==
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="398055793"
Received: from shsi6026.sh.intel.com (HELO localhost) ([10.239.147.88])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 08:55:52 -0800
From:   shuo.a.liu@intel.com
To:     linux-next@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Qais Yousef <qais.yousef@arm.com>,
        linux-kernel@vger.kernel.org, Shuo Liu <shuo.a.liu@intel.com>
Subject: [PATCH v2 1/2] cpu/hotplug: Fix build error of using {add,remove}_cpu() with !CONFIG_SMP
Date:   Sat, 13 Feb 2021 00:55:18 +0800
Message-Id: <20210212165519.82126-1-shuo.a.liu@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Shuo Liu <shuo.a.liu@intel.com>

279dcf693ac7 ("virt: acrn: Introduce an interface for Service VM to
control vCPU") introduced {add,remove}_cpu() usage and it hit below
error with !CONFIG_SMP:

../drivers/virt/acrn/hsm.c: In function ‘remove_cpu_store’:
../drivers/virt/acrn/hsm.c:389:3: error: implicit declaration of function ‘remove_cpu’; [-Werror=implicit-function-declaration]
   remove_cpu(cpu);

../drivers/virt/acrn/hsm.c:402:2: error: implicit declaration of function ‘add_cpu’; [-Werror=implicit-function-declaration]
   add_cpu(cpu);

Add add_cpu() function prototypes with !CONFIG_SMP and remove_cpu() with
!CONFIG_HOTPLUG_CPU for such usage.

Fixes: 279dcf693ac7 ("virt: acrn: Introduce an interface for Service VM to control vCPU")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
---
I followed Greg's idea that add {add,remove}_cpu() functions prototypes.
The v2 solution is different from the v1, so i removed Randy's Acked-by.
Randy, please help have a look on v2.

v2:
  - Drop the #ifdef in .c solution. Add {add,remove}_cpu() prototypes. (Suggested by Greg)

 include/linux/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 3aaa0687e8df..94a578a96202 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -108,6 +108,8 @@ static inline void cpu_maps_update_done(void)
 {
 }
 
+static inline int add_cpu(unsigned int cpu) { return 0;}
+
 #endif /* CONFIG_SMP */
 extern struct bus_type cpu_subsys;
 
@@ -137,6 +139,7 @@ static inline int  cpus_read_trylock(void) { return true; }
 static inline void lockdep_assert_cpus_held(void) { }
 static inline void cpu_hotplug_disable(void) { }
 static inline void cpu_hotplug_enable(void) { }
+static inline int remove_cpu(unsigned int cpu) { return -EPERM; }
 static inline void smp_shutdown_nonboot_cpus(unsigned int primary_cpu) { }
 #endif	/* !CONFIG_HOTPLUG_CPU */
 

base-commit: 671176b0016c80b3943cb5387312c886aba3308d
-- 
2.28.0

