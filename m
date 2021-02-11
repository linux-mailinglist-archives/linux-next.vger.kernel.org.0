Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1AA3183FB
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 04:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhBKDab (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 22:30:31 -0500
Received: from mga02.intel.com ([134.134.136.20]:31674 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229478AbhBKDaa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 22:30:30 -0500
IronPort-SDR: RiF5eYBAqzJkLmTQS+l2l/cejBG+prbGwR79sbzAqDldW6jzRGYVv0S2SaHHe8P7c3KX/yidwt
 5YigVXineFhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="169315031"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="169315031"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 19:29:48 -0800
IronPort-SDR: MfbfcWjF2/AeA73asNEIFh0HW5OpiAC1h/QeeqZF7cTb1Lp0DvGX+0QM6mHzDd8YJo2WsR1JF8
 jvqusn39GAlQ==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="397071471"
Received: from sliu49-mobl1.ccr.corp.intel.com (HELO [10.249.171.210]) ([10.249.171.210])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 19:29:46 -0800
Subject: Re: linux-next: Tree for Feb 10 (acrn)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        acrn-dev@lists.projectacrn.org
References: <20210210224220.28657128@canb.auug.org.au>
 <f13e97f3-88b9-294a-71d7-024478c13223@infradead.org>
From:   "Liu, Shuo A" <shuo.a.liu@intel.com>
Message-ID: <eedf6122-ec76-c25a-8d57-4ee0fa9f55d3@intel.com>
Date:   Thu, 11 Feb 2021 11:29:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f13e97f3-88b9-294a-71d7-024478c13223@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2/11/2021 01:52, Randy Dunlap wrote:
> On 2/10/21 3:42 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20210209:
>>
> 
> ../drivers/virt/acrn/hsm.c: In function ‘remove_cpu_store’:
> ../drivers/virt/acrn/hsm.c:389:3: error: implicit declaration of function ‘remove_cpu’; did you mean ‘register_cpu’? [-Werror=implicit-function-declaration]
>    remove_cpu(cpu);
> 
> ../drivers/virt/acrn/hsm.c:402:2: error: implicit declaration of function ‘add_cpu’; did you mean ‘task_cpu’? [-Werror=implicit-function-declaration]
>   add_cpu(cpu);
> 
> 
> Full randconfig file is attached.
> 

Thanks.
The vCPU removing depends on CONFIG_HOTPLUG_CPU. Below change could fix.

---

diff --git a/drivers/virt/acrn/hsm.c b/drivers/virt/acrn/hsm.c
index 1f6b7c54a1a4..e340788aacdf 100644
--- a/drivers/virt/acrn/hsm.c
+++ b/drivers/virt/acrn/hsm.c
@@ -372,6 +372,7 @@ static int acrn_dev_release(struct inode *inode,
struct file *filp)
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
