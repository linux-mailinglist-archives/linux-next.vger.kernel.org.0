Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07171EFB81
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 16:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbgFEOgF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 10:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgFEOgF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 10:36:05 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B85AC08C5C2
        for <linux-next@vger.kernel.org>; Fri,  5 Jun 2020 07:36:05 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id d6so2813973pjs.3
        for <linux-next@vger.kernel.org>; Fri, 05 Jun 2020 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uVV33T79CctEeCSAbQD8PlwGmUrApJgkdCW7UYxeezY=;
        b=NPtcaBQgbB1/00a9XakNexkNCkKc7lSlJszMgA5aRcbqdqEToEtalwQAf17y3kDTag
         9MKhJTDw4ropOSBiyIT5Wg4Iw18bJhURcHLAvoMNa/RzJDh49O/fNb63GQIBqZJJ594j
         6uB+KGPGni5Px9KQm3hPNc0SA6wckTFZ1EqcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uVV33T79CctEeCSAbQD8PlwGmUrApJgkdCW7UYxeezY=;
        b=iwzQs+BmcG+btqDmKGovZ8m1Cm0TiLx27QxDjKKQ8hpb0Hq2VFWKl8/POgHB0jCK/2
         7xwt38Bm2KqcHmOHtYS0+D0rCRZLA++akShf3V6WhCU6iG8qf0esuG3meDXB5g0EH/xf
         3simpZFHpXxF/zjjBga2jcwlX62Nat5qFS6spT7G3PikJJ3ej3X2CiEHs95tdVLwAFxD
         jETT701K2OLvw1GVxHiPO2XsAOsOavopJywKXFsgpxovgNap2dXI12V+8VLDAv277CZE
         qDdmoI6PSZhafQybY2EjxGYXJfG3wH6IpvPcRvaV+k6EoLC9prcG/lGT7nF874iTASK6
         sGtQ==
X-Gm-Message-State: AOAM5320D/sSiaHe16OnJy/t5Jv12v9E/DQdfnCRvTLD0MMOcW+y9xIm
        8mpiLvGCv0UwdfkSiM/0IBiH4Q==
X-Google-Smtp-Source: ABdhPJxe9gBDupDXdiegPA7hIpej1PdcLVmXYreyfxbI3th7NMSyasslvLDoQ9x2SeFrP5xHsmvN+A==
X-Received: by 2002:a17:90a:36d0:: with SMTP id t74mr3156599pjb.27.1591367764941;
        Fri, 05 Jun 2020 07:36:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k101sm9052663pjb.26.2020.06.05.07.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 07:36:03 -0700 (PDT)
Date:   Fri, 5 Jun 2020 07:36:02 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>, linux-next@vger.kernel.org
Subject: Re: Fw: next/pending-fixes build: 162 builds: 2 failed, 160 passed,
 2 errors, 109 warnings (v5.7-8671-g086779e58c68)
Message-ID: <202006050734.97C4AB35CF@keescook>
References: <20200605115213.2836fccf@canb.auug.org.au>
 <20200605083855.GH3976@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605083855.GH3976@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 05, 2020 at 10:38:55AM +0200, Peter Zijlstra wrote:
> On Fri, Jun 05, 2020 at 11:52:13AM +1000, Stephen Rothwell wrote:
> > Commit
> > 
> >   a148866489fb ("sched: Replace rq::wake_list")
> > 
> > added
> > 
> > BUILD_BUG_ON(offsetof(struct task_struct, wake_entry_type) - offsetof(struct task_struct, wake_entry) !=
> > 		     offsetof(struct __call_single_data, flags) - offsetof(struct __call_single_data, llist));
> > 
> > in kernel/smp.c.  This seems to be failing - at least for gcc-8 (I
> > haven't seen any failures in my linux-next testing).
> 
> CONFIG_GCC_PLUGIN_RANDSTRUCT=y

(FWIW, the plugins will only be enabled if the gcc plugins-dev package is
installed)

> working on it.

Either of these solutions should fix it. I'm not sure which is
preferred.


Collect them into a separate anonymous struct to keep them together
under randomization:

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 613bf7a21ae2..0f90239501c8 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -654,8 +654,11 @@ struct task_struct {
 	unsigned int			ptrace;
 
 #ifdef CONFIG_SMP
-	struct llist_node		wake_entry;
-	unsigned int			wake_entry_type;
+	/* Keep these members together under __randomize_struct. */
+	struct {
+		struct llist_node		wake_entry;
+		unsigned int			wake_entry_type;
+	};
 	int				on_cpu;
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	/* Current CPU: */


or just explicitly move them out of the randomized section:

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 613bf7a21ae2..f97b41ce1b13 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -641,6 +641,10 @@ struct task_struct {
 	/* -1 unrunnable, 0 runnable, >0 stopped: */
 	volatile long			state;
 
+#ifdef CONFIG_SMP
+	struct llist_node		wake_entry;
+	unsigned int			wake_entry_type;
+#endif
 	/*
 	 * This begins the randomizable portion of task_struct. Only
 	 * scheduling-critical items should be added above here.
@@ -654,8 +658,6 @@ struct task_struct {
 	unsigned int			ptrace;
 
 #ifdef CONFIG_SMP
-	struct llist_node		wake_entry;
-	unsigned int			wake_entry_type;
 	int				on_cpu;
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 	/* Current CPU: */

-- 
Kees Cook
