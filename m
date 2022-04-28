Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19379512F14
	for <lists+linux-next@lfdr.de>; Thu, 28 Apr 2022 10:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbiD1I5L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Apr 2022 04:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiD1I5J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Apr 2022 04:57:09 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 084C336E09;
        Thu, 28 Apr 2022 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651136036; x=1682672036;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X3OOmtCe+RtZnYz/y8LBsTsqOgyRUd+KMRuagy9DkO4=;
  b=lgn5rF3k70JaiYep7LUW0LVTtLm4cmapSaMsYhNeZsObmWQ/lZkyXTw4
   mQCcv69K56EAiT+xBHat1MNbxmlUQ6FDMjAMMlfhtf3/8F0yg75uaBaSg
   6QWsz5gUAF5Dl3TGujXLbS8S8NKY+ycc4GEC9GIwsfGxBVXKhRNxkwsJ+
   7OpFjW7QFG8qsFQxL7kfDIiYUnt/O1fJbN/ncDwD+RkFDOHHpfzljeO8+
   BlZvz1viBEGnOIEHak080tmEsPN2XBNmDrH0TyhDbYHF7kkeTA7W3Lre0
   aJU+4RiwoLStKaEZmOYNQURiSOhn7j1PigaEow7wloLsF04ZvexKwgeHR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265061725"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; 
   d="scan'208";a="265061725"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 01:53:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; 
   d="scan'208";a="541008605"
Received: from yingyuqu-mobl1.ccr.corp.intel.com ([10.249.171.194])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 01:53:53 -0700
Message-ID: <d4c9337e369d2bd0a3a8c0bf9fffcc18937a08e8.camel@intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree
From:   Zhang Rui <rui.zhang@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Thu, 28 Apr 2022 16:53:50 +0800
In-Reply-To: <20220428110030.7090a45b@canb.auug.org.au>
References: <20220428110030.7090a45b@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 2022-04-28 at 11:00 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pm tree, today's linux-next build (x86_64
> allmodconfig)
> failed like this:
> 
> drivers/idle/intel_idle.c: In function 'adl_idle_state_table_update':
> drivers/idle/intel_idle.c:1701:17: error: 'disable_promotion_to_c1e'
> undeclared (first use in this function)
>  1701 |                 disable_promotion_to_c1e = true;
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/idle/intel_idle.c:1701:17: note: each undeclared identifier
> is reported only once for each function it appears in
> drivers/idle/intel_idle.c:1706:9: error: implicit declaration of
> function 'c1e_promotion_enable' [-Werror=implicit-function-
> declaration]
>  1706 |         c1e_promotion_enable();
>       |         ^~~~~~~~~~~~~~~~~~~~
> drivers/idle/intel_idle.c: At top level:
> drivers/idle/intel_idle.c:1854:13: error: conflicting types for
> 'c1e_promotion_enable'; have 'void(void)' [-Werror]
>  1854 | static void c1e_promotion_enable(void)
>       |             ^~~~~~~~~~~~~~~~~~~~
> drivers/idle/intel_idle.c:1854:13: error: static declaration of
> 'c1e_promotion_enable' follows non-static declaration
> drivers/idle/intel_idle.c:1706:9: note: previous implicit declaration
> of 'c1e_promotion_enable' with type 'void(void)'
>  1706 |         c1e_promotion_enable();
>       |         ^~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   39c184a6a9a7 ("intel_idle: Fix the 'preferred_cstates' module
> parameter")
> 
> interacting with commit
> 
>   cc6e234b8264 ("intel_idle: Add AlderLake support")
> 
> Presumably this should have been fixed up in commit
> 
>   55ecda6f25ef ("Merge branch 'intel-idle' into linux-next")
> 
> I have used the pm tree from next-20220427 for today.
> 

TBH, I'm not quite sure about the Fixes tag below.

Although commit 39c184a6a9a7 is merged later and breaks commit
cc6e234b8264, but given that commit 39c184a6a9a7 is for -rc material
and commit cc6e234b8264 and this patch are for next merge window, so I
still use the orginal ADL intel_idle commit for Fixes tag.

thanks,
rui

From 9b784d7f9ea5593a92eb6d616523b5f47464e981 Mon Sep 17 00:00:00 2001
From: Zhang Rui <rui.zhang@intel.com>
Date: Thu, 28 Apr 2022 09:37:10 +0800
Subject: [PATCH] intel_idle: fix C1E handling for AlderLake

commit cc6e234b8264 ("intel_idle: Add AlderLake support") disables the C1E
promotion using the 'disable_promotion_to_c1e' variable, but enables the
the C1E promotion by invoking c1e_promotion_enable() directly.

Then, commit 39c184a6a9a7 ("intel_idle: Fix the 'preferred_cstates' module
parameter") removes the 'disable_promotion_to_c1e' variable and introduces
a new tri-state 'c1e_promotion' variable that can be used for both
enabling and disabling C1E promotion, on a per CPU basis.

Switch to use the new 'c1e_promotion' variable to fix the build failure,
and also to do C1E promotion bit update on all CPUs.

Fixes: commit cc6e234b8264 ("intel_idle: Add AlderLake support")
Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 drivers/idle/intel_idle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index 7c081ed26b64..2de6e0a2d9a1 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -1698,12 +1698,12 @@ static void __init adl_idle_state_table_update(void)
 		cpuidle_state_table[1].flags |= CPUIDLE_FLAG_UNUSABLE;
 
 		/* Disable C1E by clearing the "C1E promotion" bit. */
-		disable_promotion_to_c1e = true;
+		c1e_promotion = C1E_PROMOTION_DISABLE;
 		return;
 	}
 end:
 	/* Make sure C1E is enabled by default */
-	c1e_promotion_enable();
+	c1e_promotion = C1E_PROMOTION_ENABLE;
 }
 
 /**
-- 
2.17.1



