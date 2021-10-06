Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1444248CF
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 23:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239547AbhJFVYC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 17:24:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232152AbhJFVYC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Oct 2021 17:24:02 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D757861040;
        Wed,  6 Oct 2021 21:22:08 +0000 (UTC)
Date:   Wed, 6 Oct 2021 17:22:07 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Oct 5 (warnings: a. trace; b. mm/migrate)
Message-ID: <20211006172207.11982951@gandalf.local.home>
In-Reply-To: <c1d9e328-ad7c-920b-6c24-9e1598a6421c@infradead.org>
References: <20211005190628.1f26b13d@canb.auug.org.au>
        <c1d9e328-ad7c-920b-6c24-9e1598a6421c@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 5 Oct 2021 13:46:52 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> a. randconfig: KCONFIG_SEED=0xBFBEA13C
> ../kernel/trace/trace.c:1712:13: error: 'trace_create_maxlat_file' defined but not used [-Werror=unused-function]
>   static void trace_create_maxlat_file(struct trace_array *tr,

Does this fix it?

-- Steve

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 7896d30d90f7..4520cbab0da5 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1744,16 +1744,15 @@ void latency_fsnotify(struct trace_array *tr)
 	irq_work_queue(&tr->fsnotify_irqwork);
 }
 
-/*
- * (defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)) && \
- *  defined(CONFIG_FSNOTIFY)
- */
-#else
+/* CONFIG_FSNOTIFY else */
+#elif CREATE_MAX_TRACE_FILE
 
 #define trace_create_maxlat_file(tr, d_tracer)				\
 	trace_create_file("tracing_max_latency", 0644, d_tracer,	\
 			  &tr->max_latency, &tracing_max_lat_fops)
 
+#else
+#define trace_create_maxlat_file(tr, d_tracer) do { } while (0)
 #endif
 
 #ifdef CONFIG_TRACER_MAX_TRACE
@@ -9473,9 +9472,7 @@ init_tracer_tracefs(struct trace_array *tr, struct dentry *d_tracer)
 
 	create_trace_options_dir(tr);
 
-#if defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER)
 	trace_create_maxlat_file(tr, d_tracer);
-#endif
 
 	if (ftrace_create_function_files(tr, d_tracer))
 		MEM_FAIL(1, "Could not allocate function filter files");
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index b7c0f8e160fb..680935949aef 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -679,8 +679,11 @@ void update_max_tr_single(struct trace_array *tr,
 #endif /* CONFIG_TRACER_MAX_TRACE */
 
 #if (defined(CONFIG_TRACER_MAX_TRACE) || defined(CONFIG_HWLAT_TRACER) \
-	|| defined(CONFIG_OSNOISE_TRACER)) && defined(CONFIG_FSNOTIFY)
-#define LATENCY_FS_NOTIFY
+	|| defined(CONFIG_OSNOISE_TRACER))
+# define CREATE_MAX_TRACE_FILE
+# ifdef CONFIG_FSNOTIFY
+#  define LATENCY_FS_NOTIFY
+# endif
 #endif
 
 #ifdef LATENCY_FS_NOTIFY
