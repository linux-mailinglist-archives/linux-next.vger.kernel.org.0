Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE743D392A
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 13:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbhGWK3L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Jul 2021 06:29:11 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60006 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbhGWK3K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Jul 2021 06:29:10 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 34A9C22651;
        Fri, 23 Jul 2021 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1627038583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5/VuAuA8TTB/OqfzWiuUX41Ip/fB8TlfGEDwF7IigoI=;
        b=FOb+yjQ4MaUhNtGGVRPLDb3vtFN1lm1zxb1S6okTAfRpEAGH8+DKFbA4+88rj2N350mNbM
        MtL9b8vXxFE4xwjsEAWV2/+BnPwF+D5Ttn1+aWSCngkpa12R2nWT2x9Asp4UwzEjObAnaA
        JLbd+Ll+2ys0QvDl2ygoyBx0Hc2+IPA=
Received: from suse.cz (unknown [10.100.224.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 06037A3B84;
        Fri, 23 Jul 2021 11:09:42 +0000 (UTC)
Date:   Fri, 23 Jul 2021 13:09:42 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Chris Down <chris@chrisdown.name>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] printk/documentation: Update printk()/_printk() documentation
Message-ID: <YPqjdqSH5j69FnHV@alley>
References: <20210720162423.75f61ce0@canb.auug.org.au>
 <YPa/D8tSyk7dw1/l@chrisdown.name>
 <YPbABBSTkN+xNY0w@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPbABBSTkN+xNY0w@chrisdown.name>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The commit 337015573718b161 ("printk: Userspace format indexing support")
caused the following warning when building htmldocs:

kernel/printk/printk.c:1: warning: 'printk' not found

The problem is that printk() became a macro that is defined
in include/linux/printk.h instead of kernel/printk.c. The original
function was renamed to _printk().

Fixes: 337015573718b161 ("printk: Userspace format indexing support")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Petr Mladek <pmladek@suse.com>
Link: https://lore.kernel.org/r/YPbBfdz9srIpI+bb@chrisdown.name
---
This should do the trick. I do not longer see the warning.

Documentation/core-api/printk-basics.rst |  6 +++---
 include/linux/printk.h                   | 12 ++++++++++++
 kernel/printk/printk.c                   |  3 ++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
index 965e4281eddd..3160a73c27b1 100644
--- a/Documentation/core-api/printk-basics.rst
+++ b/Documentation/core-api/printk-basics.rst
@@ -108,8 +108,8 @@ Function reference
 ==================
 
 .. kernel-doc:: kernel/printk/printk.c
-   :functions: printk
+   :functions: _printk
 
 .. kernel-doc:: include/linux/printk.h
-   :functions: pr_emerg pr_alert pr_crit pr_err pr_warn pr_notice pr_info
-      pr_fmt pr_debug pr_devel pr_cont
+   :functions: printk pr_emerg pr_alert pr_crit pr_err pr_warn
+	pr_notice pr_info pr_fmt pr_debug pr_devel pr_cont
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 2651b82ed352..e0e3411db67b 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -431,6 +431,18 @@ struct pi_entry {
 	})
 
 
+/**
+ * printk - Print a message
+ * @fmt: format string
+ * @...: arguments for the format string
+ *
+ * This macro generates metadata for printk indexing and prints the message
+ * using _printk(). It uses pr_fmt() to generate the format string.
+ *
+ * The default log level is used when a particular one is not part of
+ * the message prefix. pr_<level>() macros are preferred because each
+ * caller should know the exact purpose of the message.
+ */
 #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
 #define printk_deferred(fmt, ...)					\
 	printk_index_wrap(_printk_deferred, fmt, ##__VA_ARGS__)
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 765f7af6ce56..2e5559175214 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2187,7 +2187,8 @@ EXPORT_SYMBOL_GPL(vprintk_default);
  * _printk - print a kernel message
  * @fmt: format string
  *
- * This is _printk(). It can be called from any context. We want it to work.
+ * This is printk() implementation. It can be called from any context.
+ * We want it to work.
  *
  * If printk indexing is enabled, _printk() is called from printk_index_wrap.
  * Otherwise, printk is simply #defined to _printk.
-- 
2.26.2

