Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B4C31A325
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 17:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhBLQ4m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 11:56:42 -0500
Received: from mga05.intel.com ([192.55.52.43]:8046 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229558AbhBLQ4m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 11:56:42 -0500
IronPort-SDR: u3C5poHwrKM4P8i+a9RVewKD/LXbBz9BKSeKwyZL7VptpOgZoUgTc0n24fAdsqrTS9jUImsUh2
 qmx+gGVxxi1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="267286012"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="267286012"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 08:56:00 -0800
IronPort-SDR: nPRBN+wX/PkTL0QdW70NtiPuey5qKpEICOJfTTRX0ArwH4QodJjXSt+uNK9ZSbu1oogk8HvIpO
 queGjPjZnsWQ==
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="589815520"
Received: from shsi6026.sh.intel.com (HELO localhost) ([10.239.147.88])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 08:55:57 -0800
From:   shuo.a.liu@intel.com
To:     linux-next@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Qais Yousef <qais.yousef@arm.com>,
        linux-kernel@vger.kernel.org, Shuo Liu <shuo.a.liu@intel.com>
Subject: [PATCH v2 2/2] virt: acrn: Make remove_cpu sysfs invisible with !CONFIG_HOTPLUG_CPU
Date:   Sat, 13 Feb 2021 00:55:19 +0800
Message-Id: <20210212165519.82126-2-shuo.a.liu@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210212165519.82126-1-shuo.a.liu@intel.com>
References: <20210212165519.82126-1-shuo.a.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Shuo Liu <shuo.a.liu@intel.com>

Without cpu hotplug support, vCPU cannot be removed from a Service VM.
Don't expose remove_cpu sysfs when CONFIG_HOTPLUG_CPU disabled.

Signed-off-by: Shuo Liu <shuo.a.liu@intel.com>
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

