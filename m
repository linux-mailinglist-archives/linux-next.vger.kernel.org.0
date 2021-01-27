Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBC63052A9
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 07:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbhA0F71 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 00:59:27 -0500
Received: from mga18.intel.com ([134.134.136.126]:42570 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237608AbhA0Dzf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 22:55:35 -0500
IronPort-SDR: 4neyQmTp2DOKMZJuGVDs3fR8/QFsQotwmgwOREQAU85OiK5MfOIwuV+XwR5JHcDTr2yG/6QB5s
 H0aSLWKfJvhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="167684743"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="167684743"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 19:54:54 -0800
IronPort-SDR: zUQpenv7S1YPTdoCBnbHAiu/wM0L/F0BKuoVZbQJ78z1FKrzRPZThfc/ZEYvVgPHqjCfKsTLBO
 yWxpBD5vmXPg==
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="362253675"
Received: from yuankuns-mobl.ccr.corp.intel.com ([10.249.169.180])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 19:54:53 -0800
Message-ID: <e1fcf35b21e7e4af67621bd4f037e3f07af756e1.camel@intel.com>
Subject: Re: linux-next: build warning after merge of the pm tree
From:   Zhang Rui <rui.zhang@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Wed, 27 Jan 2021 11:54:50 +0800
In-Reply-To: <20210127124324.29b7c4d4@canb.auug.org.au>
References: <20210127124324.29b7c4d4@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi, Stephen,

Sorry that I missed this build warning in the first place, thanks for
reporting.
The patch below fixes it.

BTW, Rafael, I think acpi_fpdt_init() also needs to be fixed to have
proper return value.
Do you prefer an incremental patch or a V2 of 208757d71098 ("ACPI:
tables: introduce support for FPDT table"), which includes all these
fixes?

thanks,
rui

From 2b8ed148351875b4bf227602a97edba12d08af7e Mon Sep 17 00:00:00 2001
From: Zhang Rui <rui.zhang@intel.com>
Date: Wed, 27 Jan 2021 11:33:33 +0800
Subject: [PATCH] ACPI: FPDT: fix build warning

Fix a build warning,
In file included from ./include/linux/printk.h:7:0,
                 from ./include/linux/kernel.h:16,
                 from ./include/linux/list.h:9,
                 from ./include/linux/kobject.h:19,
                 from ./include/linux/of.h:17,
                 from ./include/linux/irqdomain.h:35,
                 from ./include/linux/acpi.h:13,
                 from drivers/acpi/acpi_fpdt.c:11:
drivers/acpi/acpi_fpdt.c: In function ‘acpi_init_fpdt’:
./include/linux/kern_levels.h:5:18: warning: too many arguments for format [-Wformat-extra-args]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^
./include/linux/kern_levels.h:14:19: note: in expansion of macro ‘KERN_SOH’
 #define KERN_INFO KERN_SOH "6" /* informational */
                   ^~~~~~~~
./include/linux/printk.h:373:9: note: in expansion of macro ‘KERN_INFO’
  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         ^~~~~~~~~
drivers/acpi/acpi_fpdt.c:255:4: note: in expansion of macro ‘pr_info’
    pr_info(FW_BUG, "Invalid subtable type %d found.\n",
    ^~~~~~~

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/acpi/acpi_fpdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_fpdt.c b/drivers/acpi/acpi_fpdt.c
index b8108117262a..64d5733dca0b 100644
--- a/drivers/acpi/acpi_fpdt.c
+++ b/drivers/acpi/acpi_fpdt.c
@@ -252,7 +252,7 @@ void acpi_init_fpdt(void)
 					      subtable->type);
 			break;
 		default:
-			pr_info(FW_BUG, "Invalid subtable type %d found.\n",
+			pr_info(FW_BUG "Invalid subtable type %d found.\n",
 			       subtable->type);
 			return;
 		}
-- 
2.17.1


On Wed, 2021-01-27 at 12:43 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pm tree, today's linux-next build (x86_64
> allmodconfig)
> produced this warning:
> 
> In file included from include/linux/printk.h:7,
>                  from include/linux/kernel.h:16,
>                  from include/linux/list.h:9,
>                  from include/linux/kobject.h:19,
>                  from include/linux/of.h:17,
>                  from include/linux/irqdomain.h:35,
>                  from include/linux/acpi.h:13,
>                  from drivers/acpi/acpi_fpdt.c:11:
> drivers/acpi/acpi_fpdt.c: In function 'acpi_init_fpdt':
> include/linux/kern_levels.h:5:18: warning: too many arguments for
> format [-Wformat-extra-args]
>     5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
>       |                  ^~~~~~
> include/linux/kern_levels.h:14:19: note: in expansion of macro
> 'KERN_SOH'
>    14 | #define KERN_INFO KERN_SOH "6" /* informational */
>       |                   ^~~~~~~~
> include/linux/printk.h:373:9: note: in expansion of macro 'KERN_INFO'
>   373 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~~~~
> drivers/acpi/acpi_fpdt.c:255:4: note: in expansion of macro 'pr_info'
>   255 |    pr_info(FW_BUG, "Invalid subtable type %d found.\n",
>       |    ^~~~~~~
> 
> Introduced by commit
> 
>   208757d71098 ("ACPI: tables: introduce support for FPDT table")
> 

