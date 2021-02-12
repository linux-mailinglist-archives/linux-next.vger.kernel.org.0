Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56BE319961
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 05:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhBLE6n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 23:58:43 -0500
Received: from mga01.intel.com ([192.55.52.88]:48254 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhBLE6m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 23:58:42 -0500
IronPort-SDR: +5+AAlqeXo0w8Rxg2IOxxt1S+Q5DLaUdp+QudbpEM9QhjoU+Fll96qBIhpdTNY9AlzztZm1FjA
 Z9WcqAcWxMVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="201507727"
X-IronPort-AV: E=Sophos;i="5.81,172,1610438400"; 
   d="scan'208";a="201507727"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 20:57:58 -0800
IronPort-SDR: Bhb41Hyof9aCFk7Ijnlwr7J0Ptu9BWnWM+RXJ9xfmsYD53WXvIJMmJ8v/pz9ZDc7x2uomRd340
 RuuIdx+gFeFw==
X-IronPort-AV: E=Sophos;i="5.81,172,1610438400"; 
   d="scan'208";a="397789020"
Received: from shsi6026.sh.intel.com (HELO localhost) ([10.239.147.88])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 20:57:56 -0800
From:   shuo.a.liu@intel.com
To:     linux-next@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Shuo Liu <shuo.a.liu@intel.com>
Subject: [PATCH] virt: acrn: Fix vCPU removing code build error
Date:   Fri, 12 Feb 2021 12:57:24 +0800
Message-Id: <20210212045724.77846-1-shuo.a.liu@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Shuo Liu <shuo.a.liu@intel.com>

vCPU removing code depends on CONFIG_HOTPLUG_CPU as it uses remove_cpu()
and add_cpu(). Make the vCPU removing interface building with
CONFIG_HOTPLUG_CPU.

../drivers/virt/acrn/hsm.c: In function ‘remove_cpu_store’:
../drivers/virt/acrn/hsm.c:389:3: error: implicit declaration of function ‘remove_cpu’; [-Werror=implicit-function-declaration]
   remove_cpu(cpu);

../drivers/virt/acrn/hsm.c:402:2: error: implicit declaration of function ‘add_cpu’; [-Werror=implicit-function-declaration]
   add_cpu(cpu);

Fixes: 279dcf693ac7 ("virt: acrn: Introduce an interface for Service VM to control vCPU")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
---
 drivers/virt/acrn/hsm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
index 1f6b7c54a1a4..e340788aacdf 100644
--- a/drivers/virt/acrn/hsm.c
+++ b/drivers/virt/acrn/hsm.c
@@ -372,6 +372,7 @@ static int acrn_dev_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+#ifdef CONFIG_HOTPLUG_CPU
 static ssize_t remove_cpu_store(struct device *dev,
 				struct device_attribute *attr,
 				const char *buf, size_t count)
@@ -403,9 +404,12 @@ static ssize_t remove_cpu_store(struct device *dev,
 	return ret;
 }
 static DEVICE_ATTR_WO(remove_cpu);
+#endif
 
 static struct attribute *acrn_attrs[] = {
+#ifdef CONFIG_HOTPLUG_CPU
 	&dev_attr_remove_cpu.attr,
+#endif
 	NULL
 };
 

base-commit: 671176b0016c80b3943cb5387312c886aba3308d
-- 
2.28.0

