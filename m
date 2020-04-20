Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB731B0052
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 05:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgDTDvT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Apr 2020 23:51:19 -0400
Received: from mga14.intel.com ([192.55.52.115]:60073 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgDTDvT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Apr 2020 23:51:19 -0400
IronPort-SDR: g5sExSVW+Gq8V5grouvunPStRJQM/wLfhb8Da0LQ9Qgiv/u7orBF6DDQqy1uMj48LI/80mh6N3
 FWyebe3R2JTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2020 20:51:19 -0700
IronPort-SDR: CfFEBT4MLSVTlHmccAs4qtToM21XwPEYk5B9Ya1uEWAivPvPZXEGASbBg4GLYgh0jooea0EBUq
 p1rXpAxK/UgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; 
   d="scan'208";a="401692193"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.147.105])
  by orsmga004.jf.intel.com with ESMTP; 19 Apr 2020 20:51:17 -0700
Date:   Mon, 20 Apr 2020 11:51:16 +0800
From:   Feng Tang <feng.tang@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Corey Minyard <cminyard@mvista.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ipmi tree
Message-ID: <20200420035116.GA61926@shbuild999.sh.intel.com>
References: <20200420130959.489a4136@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420130959.489a4136@canb.auug.org.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 20, 2020 at 01:09:59PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the ipmi tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/char/ipmi/ipmi_msghandler.c: In function 'free_user_work':
> drivers/char/ipmi/ipmi_msghandler.c:1156:2: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
>  1156 |  vfree(user);
>       |  ^~~~~
>       |  kvfree
> drivers/char/ipmi/ipmi_msghandler.c: In function 'ipmi_create_user':
> drivers/char/ipmi/ipmi_msghandler.c:1188:13: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
>  1188 |  new_user = vzalloc(sizeof(*new_user));
>       |             ^~~~~~~
>       |             kvzalloc
> drivers/char/ipmi/ipmi_msghandler.c:1188:11: warning: assignment to 'struct ipmi_user *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>  1188 |  new_user = vzalloc(sizeof(*new_user));
>       |           ^
> 
> Caused by commit
> 
>   d6850a47c933 ("ipmi: use vzalloc instead of kmalloc for user creation")
> 
> I have applied the following patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 20 Apr 2020 13:03:29 +1000
> Subject: [PATCH] ipmi: vzalloc use requires vmallo.h inclusion
> 
> Fixes: d6850a47c933 ("ipmi: use vzalloc instead of kmalloc for user creation")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 96f157323646..9afd220cd824 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -33,6 +33,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/uuid.h>
>  #include <linux/nospec.h>
> +#include <linux/vmalloc.h>

Thanks for the fix! I just compiled and tested the patch on x86 platforms.

Hi Corey,

Will you folder it into your tree, or you prefer me to send a v2? 

Anyway, I prepared a v2 here:

Thanks,
Feng


From b39b962a49efd6d7a6ea70f0a2ec8828a1d01768 Mon Sep 17 00:00:00 2001
From: Feng Tang <feng.tang@intel.com>
Date: Fri, 17 Apr 2020 12:48:28 +0800
Subject: [PATCH] ipmi: use vzalloc instead of kmalloc for user creation

We met mulitple times of failure of staring bmc-watchdog,
due to the runtime memory allocation failure of order 4.

     bmc-watchdog: page allocation failure: order:4, mode:0x40cc0(GFP_KERNEL|__GFP_COMP), nodemask=(null),cpuset=/,mems_allowed=0-1
     CPU: 1 PID: 2571 Comm: bmc-watchdog Not tainted 5.5.0-00045-g7d6bb61d6188c #1
     Hardware name: Intel Corporation S2600WFT/S2600WFT, BIOS SE5C620.86B.00.01.0015.110720180833 11/07/2018
     Call Trace:
      dump_stack+0x66/0x8b
      warn_alloc+0xfe/0x160
      __alloc_pages_slowpath+0xd3e/0xd80
      __alloc_pages_nodemask+0x2f0/0x340
      kmalloc_order+0x18/0x70
      kmalloc_order_trace+0x1d/0xb0
      ipmi_create_user+0x55/0x2c0 [ipmi_msghandler]
      ipmi_open+0x72/0x110 [ipmi_devintf]
      chrdev_open+0xcb/0x1e0
      do_dentry_open+0x1ce/0x380
      path_openat+0x305/0x14f0
      do_filp_open+0x9b/0x110
      do_sys_open+0x1bd/0x250
      do_syscall_64+0x5b/0x1f0
      entry_SYSCALL_64_after_hwframe+0x44/0xa9

Using vzalloc/vfree for creating ipmi_user heals the
problem

Thanks to Stephen Rothwell for finding the vmalloc.h
inclusion issue.

Signed-off-by: Feng Tang <feng.tang@intel.com>
---
  v2:
     * explicitely include vmalloc.h, otherwise there
       will be compilation error as found by Stephen
       Rothwell  
 
 drivers/char/ipmi/ipmi_msghandler.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index c48d8f0..9afd220 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -33,6 +33,7 @@
 #include <linux/workqueue.h>
 #include <linux/uuid.h>
 #include <linux/nospec.h>
+#include <linux/vmalloc.h>
 
 #define IPMI_DRIVER_VERSION "39.2"
 
@@ -1153,7 +1154,7 @@ static void free_user_work(struct work_struct *work)
 					      remove_work);
 
 	cleanup_srcu_struct(&user->release_barrier);
-	kfree(user);
+	vfree(user);
 }
 
 int ipmi_create_user(unsigned int          if_num,
@@ -1185,7 +1186,7 @@ int ipmi_create_user(unsigned int          if_num,
 	if (rv)
 		return rv;
 
-	new_user = kmalloc(sizeof(*new_user), GFP_KERNEL);
+	new_user = vzalloc(sizeof(*new_user));
 	if (!new_user)
 		return -ENOMEM;
 
@@ -1232,7 +1233,7 @@ int ipmi_create_user(unsigned int          if_num,
 
 out_kfree:
 	srcu_read_unlock(&ipmi_interfaces_srcu, index);
-	kfree(new_user);
+	vfree(new_user);
 	return rv;
 }
 EXPORT_SYMBOL(ipmi_create_user);
-- 
2.7.4
