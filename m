Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B893D5016
	for <lists+linux-next@lfdr.de>; Sun, 25 Jul 2021 23:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhGYUfc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Jul 2021 16:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhGYUfc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 25 Jul 2021 16:35:32 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537C9C061757
        for <linux-next@vger.kernel.org>; Sun, 25 Jul 2021 14:16:02 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 676C02E6;
        Sun, 25 Jul 2021 21:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 676C02E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1627247761; bh=ha6zQ/lQ89wnLjJN9FZzRbJvHPDXNDngMT6ZHwKPkKc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VX+ALNFNqJ8v2HjmoNofjL9fDoqpoNt457tfCRUOfcd5oO+nYWVvQrcoEVjEMS5m9
         mIhaSanNmVbHBniRD88uzcWS+YgqHKFgtjpZ/wuDs+bgvBIto1r949Jue7A3uyKRVn
         ppTPttKmLLK206AesY60EsuFyuycBMNNXVAIzFU1eVSDdM/FqX8/tfIUhbqZFBIkj2
         mUKsfCLhfC9VEOT9zQHc2VVBjvc5OQfakA8R2zXOusxMQwD1sVZb1mzPYjm1pvwmTC
         4GfL/lu+dx9oedWtW6KRtKWOOhQZ8kBeCyUBoNI5dNUl7s9/iP0C8Klxv3rDd+K3ju
         yxZtZV/IZr3dQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Chris Down <chris@chrisdown.name>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     linux-doc@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the printk tree
In-Reply-To: <YPbABBSTkN+xNY0w@chrisdown.name>
References: <20210720162423.75f61ce0@canb.auug.org.au>
 <YPa/D8tSyk7dw1/l@chrisdown.name> <YPbABBSTkN+xNY0w@chrisdown.name>
Date:   Sun, 25 Jul 2021 15:16:00 -0600
Message-ID: <87o8aqt7qn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Chris Down <chris@chrisdown.name> writes:

> Chris Down writes:
>>+Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
>
> Well, let's actually Cc them this time...
>
>>Stephen Rothwell writes:
>>>After merging the printk tree, today's linux-next build (htmldocs)
>>>produced this warning:
>>>
>>>kernel/printk/printk.c:1: warning: 'printk' not found
>>>
>>>Introduced by commit
>>>
>>> 337015573718 ("printk: Userspace format indexing support")
>>>
>>>I presume that "printk" is referred to elsewhere in the documentation
>>>as being in this file.
>>
>>Hmm, this is an interesting one, because I think we still generally 
>>just want to refer to the API as being `printk()`. Changing it all 
>>over the place seems wrong. As you'd imagine, there are quite a few 
>>references to this name, so it requires a lot of noise all over the 
>>docs and inline comments.
>>
>>Jonathan and other docs folks, how can one tell Sphinx that when it 
>>sees printk() it's referring to a function-like macro, or otherwise 
>>squelch this reasonably? :-)

The problem is that you moved printk(), but left the associated
kerneldoc comment tied to _printk(), which isn't what you really want to
document.  The fix should look something like the attached.

Thanks,

jon

--------snip here----------------------
printk: Move the printk() kerneldoc comment to its new home

Commit 337015573718 ("printk: Userspace format indexing support") turned
printk() into a macro, but left the kerneldoc comment for it with the (now)
_printk() function, resulting in this docs-build warning:

  kernel/printk/printk.c:1: warning: 'printk' not found

Move the kerneldoc comment back next to the (now) macro it's meant to
describe and have the docs build find it there.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/printk-basics.rst |  5 +----
 include/linux/printk.h                   | 24 ++++++++++++++++++++++++
 kernel/printk/printk.c                   | 24 ------------------------
 3 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
index 965e4281eddd..2dde24ca7d9f 100644
--- a/Documentation/core-api/printk-basics.rst
+++ b/Documentation/core-api/printk-basics.rst
@@ -107,9 +107,6 @@ also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.
 Function reference
 ==================
 
-.. kernel-doc:: kernel/printk/printk.c
-   :functions: printk
-
 .. kernel-doc:: include/linux/printk.h
-   :functions: pr_emerg pr_alert pr_crit pr_err pr_warn pr_notice pr_info
+   :functions: printk pr_emerg pr_alert pr_crit pr_err pr_warn pr_notice pr_info
       pr_fmt pr_debug pr_devel pr_cont
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 2651b82ed352..c1e176403967 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -431,6 +431,30 @@ struct pi_entry {
 	})
 
 
+/**
+ * printk - print a kernel message
+ * @fmt: format string
+ *
+ * This is printk(). It can be called from any context. We want it to work.
+ *
+ * If printk indexing is enabled, _printk() is called from printk_index_wrap.
+ * Otherwise, printk is simply #defined to _printk.
+ *
+ * We try to grab the console_lock. If we succeed, it's easy - we log the
+ * output and call the console drivers.  If we fail to get the semaphore, we
+ * place the output into the log buffer and return. The current holder of
+ * the console_sem will notice the new output in console_unlock(); and will
+ * send it to the consoles before releasing the lock.
+ *
+ * One effect of this deferred printing is that code which calls printk() and
+ * then changes console_loglevel may break. This is because console_loglevel
+ * is inspected when the actual printing occurs.
+ *
+ * See also:
+ * printf(3)
+ *
+ * See the vsnprintf() documentation for format string extensions over C99.
+ */
 #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
 #define printk_deferred(fmt, ...)					\
 	printk_index_wrap(_printk_deferred, fmt, ##__VA_ARGS__)
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9b3bd6e017f1..63176be3b50c 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2186,30 +2186,6 @@ int vprintk_default(const char *fmt, va_list args)
 }
 EXPORT_SYMBOL_GPL(vprintk_default);
 
-/**
- * _printk - print a kernel message
- * @fmt: format string
- *
- * This is _printk(). It can be called from any context. We want it to work.
- *
- * If printk indexing is enabled, _printk() is called from printk_index_wrap.
- * Otherwise, printk is simply #defined to _printk.
- *
- * We try to grab the console_lock. If we succeed, it's easy - we log the
- * output and call the console drivers.  If we fail to get the semaphore, we
- * place the output into the log buffer and return. The current holder of
- * the console_sem will notice the new output in console_unlock(); and will
- * send it to the consoles before releasing the lock.
- *
- * One effect of this deferred printing is that code which calls printk() and
- * then changes console_loglevel may break. This is because console_loglevel
- * is inspected when the actual printing occurs.
- *
- * See also:
- * printf(3)
- *
- * See the vsnprintf() documentation for format string extensions over C99.
- */
 asmlinkage __visible int _printk(const char *fmt, ...)
 {
 	va_list args;
-- 
2.31.1

