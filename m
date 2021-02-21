Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E25320AA2
	for <lists+linux-next@lfdr.de>; Sun, 21 Feb 2021 14:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhBUNom (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 08:44:42 -0500
Received: from mga12.intel.com ([192.55.52.136]:6134 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229871AbhBUNom (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Feb 2021 08:44:42 -0500
IronPort-SDR: aFrmcwf0rBDW2zYUGjYNbTNlpCdElKLB2x+IAnSIGkMyQeaGcdFYISF+b1IgF/3IGcdvAlXJKK
 Jc+JiZ3mZ3aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9901"; a="163424727"
X-IronPort-AV: E=Sophos;i="5.81,194,1610438400"; 
   d="scan'208";a="163424727"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2021 05:44:01 -0800
IronPort-SDR: PrMCnlPheAYGnrOWVQ4mJikuV4V5DUBeP3/PLvJQpOx5R66Z8+PN71LHr8rcw6S5k0N8sN0tWf
 XvP8GwYE6OOQ==
X-IronPort-AV: E=Sophos;i="5.81,194,1610438400"; 
   d="scan'208";a="402012813"
Received: from shsi6026.sh.intel.com (HELO localhost) ([10.239.147.88])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2021 05:43:58 -0800
From:   shuo.a.liu@intel.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Shuo Liu <shuo.a.liu@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Qais Yousef <qais.yousef@arm.com>
Subject: [PATCH RESEND v2 1/2] cpu/hotplug: Fix build error of using {add,remove}_cpu() with !CONFIG_SMP
Date:   Sun, 21 Feb 2021 21:43:38 +0800
Message-Id: <20210221134339.57851-1-shuo.a.liu@intel.com>
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
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Qais Yousef <qais.yousef@arm.com>
---
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
 

base-commit: abaf6f60176f1ae9d946d63e4db63164600b7b1a
-- 
2.28.0

