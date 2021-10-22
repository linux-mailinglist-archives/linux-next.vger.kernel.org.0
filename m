Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAF74372FF
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 09:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhJVHqM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 03:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhJVHqL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 03:46:11 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D8CC061764;
        Fri, 22 Oct 2021 00:43:54 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d3so3333249wrh.8;
        Fri, 22 Oct 2021 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QDe8eGn1242gSfR7Is43fRQHdJR93magL2F5GakfHEE=;
        b=mjxadADG3/7KVemwPXS50oEIEXflR9aiQ/P8tEKIYGuxFixdw96R+9yMdN7mPVO1GS
         eFT2suEIg9Y592iMRV9s40AfwLs2ncJ1aN5UEtbz9WPmR59kzaECpfBS77Anku1YNu3/
         AQC8fl6BZHD6O0CQyj6GvwiVBMLGb4OO9EVt2Et5BkLUGpk8wqt8gZUF6OjIaLIJTaTU
         nL0xiVJgGDKJSGeV6xE5esknbaeq9h6hzoDkP3HnbZTpsyd5dx385PLuqGLirnWTB+zN
         beKDI+MwOBzxNfNJAz5Mb25SN7FSnh0ZLliQ+/H1BKqcD8QUFg+qXThCYX2VsydXZkqg
         uwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=QDe8eGn1242gSfR7Is43fRQHdJR93magL2F5GakfHEE=;
        b=3CGRRlKrg8Q+1kz+DTWLzWoNxEjAZdld4YNj51g7EYATagKD4Rix27g8CJfUY4hdn4
         WQumMdzZlAsvAEGrZClXZ8tONot2d7S1mBqCLPWYjq/eEPOGgeGppZ1xomJTQu3TNH5a
         D4mDe00bigOjCesTflxNgi9/eE0BhVWxfP4F6Anoph1uV2C1bHa+QnEZgDiOLbBhiMna
         WExu9Gvcfggf19DfJd6O3AcgNhJ6XTQ/J9ayJLlyGgz5Rf3TyjkDTa8/Gp1VBJS5tK3c
         6lO/4Gj3DLguwbtQKDMS5B9pxNM3ECmAkysyIWy0Ibw62SkJryak5tBn+5lc/kIaoAtb
         O08w==
X-Gm-Message-State: AOAM533QEP3CgH/QDE9Q2ZUCp3JXzh+j5gRa3ad1qUYQBuYX7yUP7Hce
        CbSzm02MsMrp4E4/4POe1s+F30GdWDc=
X-Google-Smtp-Source: ABdhPJzaRDW7PH4hkD8Yjx/uOud9MZymvRbT6QqTBQp3bTMfCiG+bNXFb4YbR7YmIjI0E5J+khiHjw==
X-Received: by 2002:a5d:64c5:: with SMTP id f5mr13417395wri.321.1634888632758;
        Fri, 22 Oct 2021 00:43:52 -0700 (PDT)
Received: from gmail.com (563BB2F5.dsl.pool.telekom.hu. [86.59.178.245])
        by smtp.gmail.com with ESMTPSA id i203sm10161968wma.48.2021.10.22.00.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 00:43:52 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Fri, 22 Oct 2021 09:43:50 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Qi Zheng <zhengqi.arch@bytedance.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] stacktrace: Provide stack_trace_save_tsk() stub in the
 !CONFIG_STACKTRACE case too
Message-ID: <YXJrtiFgwMCYNAAM@gmail.com>
References: <20211018172330.379b2061@canb.auug.org.au>
 <60e736e7-cc37-9fea-a0fb-6628f87e741c@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60e736e7-cc37-9fea-a0fb-6628f87e741c@bytedance.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> 
> 
> On 10/18/21 2:23 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
> > failed like this:
> > 
> > arch/x86/kernel/process.c: In function '__get_wchan':
> > arch/x86/kernel/process.c:950:2: error: implicit declaration of function 'stack_trace_save_tsk' [-Werror=implicit-function-declaration]
> >    950 |  stack_trace_save_tsk(p, &entry, 1, 0);
> >        |  ^~~~~~~~~~~~~~~~~~~~
> > cc1: some warnings being treated as errors
> > 
> > Caused by commit
> > 
> >    bc9bbb81730e ("x86: Fix get_wchan() to support the ORC unwinder")
> > 
> > stack_trace_save_tsk() requires CONFIG_STACKTRACE which is not set for
> > this build.
> 
> Maybe get_wchan() can be updated to:
> 
> unsigned long get_wchan(struct task_struct *p)
> {
> #ifdef CONFIG_STACKTRACE
> 	unsigned long entry = 0;
> 
> 	stack_trace_save_tsk(p, &entry, 1, 0);
> 	return entry;
> #else /* CONFIG_STACKTRACE */
> 	return 0;
> #endif
> }

And repeat the same ugliness in every single function that happens to use 
the stack_trace_save_tsk() API??

The correct solution is to define stack_trace_save_tsk() in the 
!CONFIG_STACKTRACE case too, as the patch below does.

Thanks,

	Ingo

==============================>
From: Ingo Molnar <mingo@kernel.org>
Date: Fri, 22 Oct 2021 09:40:27 +0200
Subject: [PATCH] stacktrace: Provide stack_trace_save_tsk() stub in the !CONFIG_STACKTRACE case too

The following commit:

  bc9bbb81730e ("x86: Fix get_wchan() to support the ORC unwinder")

Added stack_trace_save_tsk() use to __get_wchan(), while this method is not
unconditionally defined: it's not available in the !CONFIG_STACKTRACE case.

Give a default implementation that does nothing.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: bc9bbb81730e ("x86: Fix get_wchan() to support the ORC unwinder")
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/stacktrace.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/stacktrace.h b/include/linux/stacktrace.h
index 9edecb494e9e..3ccaf599630f 100644
--- a/include/linux/stacktrace.h
+++ b/include/linux/stacktrace.h
@@ -91,8 +91,19 @@ extern void save_stack_trace_tsk(struct task_struct *tsk,
 extern int save_stack_trace_tsk_reliable(struct task_struct *tsk,
 					 struct stack_trace *trace);
 extern void save_stack_trace_user(struct stack_trace *trace);
+
 #endif /* !CONFIG_ARCH_STACKWALK */
-#endif /* CONFIG_STACKTRACE */
+
+#else /* !CONFIG_STACKTRACE: */
+static inline unsigned int
+stack_trace_save_tsk(struct task_struct *task,
+		     unsigned long *store, unsigned int size,
+		     unsigned int skipnr)
+{
+	return -ENOSYS;
+}
+
+#endif /* !CONFIG_STACKTRACE */
 
 #if defined(CONFIG_STACKTRACE) && defined(CONFIG_HAVE_RELIABLE_STACKTRACE)
 int stack_trace_save_tsk_reliable(struct task_struct *tsk, unsigned long *store,
