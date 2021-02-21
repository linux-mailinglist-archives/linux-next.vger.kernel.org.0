Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD13B320AA6
	for <lists+linux-next@lfdr.de>; Sun, 21 Feb 2021 14:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhBUNos (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 08:44:48 -0500
Received: from mga12.intel.com ([192.55.52.136]:6143 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229871AbhBUNoq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Feb 2021 08:44:46 -0500
IronPort-SDR: NNSvCNG1vYVTAnDNlt6oMvFxoSchgs71PObvJRYvAAV+jyqnTjvuhoMOUOd3I1jaoQm+2BEvs5
 M7wzPkE2jh1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9901"; a="163424738"
X-IronPort-AV: E=Sophos;i="5.81,194,1610438400"; 
   d="scan'208";a="163424738"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2021 05:44:05 -0800
IronPort-SDR: 4ihhKjWve1eadzPCXBle+NrQwC6/gIPjABq0xwf2KD0DmlvlfzQoRB4D1V2kH80gBLz+L22x7B
 psmAbCFnviuA==
X-IronPort-AV: E=Sophos;i="5.81,194,1610438400"; 
   d="scan'208";a="402012838"
Received: from shsi6026.sh.intel.com (HELO localhost) ([10.239.147.88])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2021 05:44:03 -0800
From:   shuo.a.liu@intel.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Shuo Liu <shuo.a.liu@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Qais Yousef <qais.yousef@arm.com>
Subject: [PATCH RESEND v2 2/2] virt: acrn: Make remove_cpu sysfs invisible with !CONFIG_HOTPLUG_CPU
Date:   Sun, 21 Feb 2021 21:43:39 +0800
Message-Id: <20210221134339.57851-2-shuo.a.liu@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210221134339.57851-1-shuo.a.liu@intel.com>
References: <20210221134339.57851-1-shuo.a.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Shuo Liu <shuo.a.liu@intel.com>

Without cpu hotplug support, vCPU cannot be removed from a Service VM.
Don't expose remove_cpu sysfs when CONFIG_HOTPLUG_CPU disabled.

Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Qais Yousef <qais.yousef@arm.com>
---
 drivers/virt/acrn/hsm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
index 1f6b7c54a1a4..6996ea6219e5 100644
--- a/drivers/virt/acrn/hsm.c
+++ b/drivers/virt/acrn/hsm.c
@@ -404,6 +404,14 @@ static ssize_t remove_cpu_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(remove_cpu);
 
+static umode_t acrn_attr_visible(struct kobject *kobj, struct attribute *a, int n)
+{
+       if (a == &dev_attr_remove_cpu.attr)
+               return IS_ENABLED(CONFIG_HOTPLUG_CPU) ? a->mode : 0;
+
+       return a->mode;
+}
+
 static struct attribute *acrn_attrs[] = {
 	&dev_attr_remove_cpu.attr,
 	NULL
@@ -411,6 +419,7 @@ static struct attribute *acrn_attrs[] = {
 
 static struct attribute_group acrn_attr_group = {
 	.attrs = acrn_attrs,
+	.is_visible = acrn_attr_visible,
 };
 
 static const struct attribute_group *acrn_attr_groups[] = {
-- 
2.28.0

