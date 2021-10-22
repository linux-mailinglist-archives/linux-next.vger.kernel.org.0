Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E41437624
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 13:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbhJVLpG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 07:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbhJVLpF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 Oct 2021 07:45:05 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A28C061764;
        Fri, 22 Oct 2021 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xeADkuqCOpwfr1CSb8KryudrbaGzyqB+ns7lUoHxEKg=; b=kEO15SjbDqTOm1uzqsW7CvfczN
        EI0L+QyFJbPMtAXWwHM96vyqutx3uxGit/hX/QvYGnSPOhE4QMscQQdY5mmHfAMG2+PVRt7HUCfS4
        Nx7rpK44fck1hteJS+6KTWb9cuqdoHp/Uybzy9y/26lzhlVojt+ygTn4tuTgEeb98ZGj9tEPJBqRZ
        OSi+5cWCYCP81MhKVABo2+31JuGjVNeZRZtCNSFy+pFau9AuVUM/TwgTRQXT8Nr0cARb2RmN/WhMk
        4Ah8O1lbgdNz3lbZ/hhPhs+NLQTsm7iRyyI65WFT+yZBwrUWo1GFlUMQK983IUX0YwgDqkxhebIq2
        b3bh8Rdw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mdssf-00DsT1-8q; Fri, 22 Oct 2021 11:39:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AE81B300233;
        Fri, 22 Oct 2021 13:38:35 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 503F120A958AD; Fri, 22 Oct 2021 13:38:35 +0200 (CEST)
Date:   Fri, 22 Oct 2021 13:38:35 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Qi Zheng <zhengqi.arch@bytedance.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] stacktrace: Provide stack_trace_save_tsk() stub in the
 !CONFIG_STACKTRACE case too
Message-ID: <YXKiu6U2aK//va1G@hirez.programming.kicks-ass.net>
References: <20211018172330.379b2061@canb.auug.org.au>
 <60e736e7-cc37-9fea-a0fb-6628f87e741c@bytedance.com>
 <YXJrtiFgwMCYNAAM@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXJrtiFgwMCYNAAM@gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 22, 2021 at 09:43:50AM +0200, Ingo Molnar wrote:
> 
> * Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> > 
> > 
> > On 10/18/21 2:23 PM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
> > > failed like this:
> > > 
> > > arch/x86/kernel/process.c: In function '__get_wchan':
> > > arch/x86/kernel/process.c:950:2: error: implicit declaration of function 'stack_trace_save_tsk' [-Werror=implicit-function-declaration]
> > >    950 |  stack_trace_save_tsk(p, &entry, 1, 0);
> > >        |  ^~~~~~~~~~~~~~~~~~~~
> > > cc1: some warnings being treated as errors
> > > 
> > > Caused by commit
> > > 
> > >    bc9bbb81730e ("x86: Fix get_wchan() to support the ORC unwinder")
> > > 
> > > stack_trace_save_tsk() requires CONFIG_STACKTRACE which is not set for
> > > this build.
> > 
> > Maybe get_wchan() can be updated to:
> > 
> > unsigned long get_wchan(struct task_struct *p)
> > {
> > #ifdef CONFIG_STACKTRACE
> > 	unsigned long entry = 0;
> > 
> > 	stack_trace_save_tsk(p, &entry, 1, 0);
> > 	return entry;
> > #else /* CONFIG_STACKTRACE */
> > 	return 0;
> > #endif
> > }
> 
> And repeat the same ugliness in every single function that happens to use 
> the stack_trace_save_tsk() API??
> 
> The correct solution is to define stack_trace_save_tsk() in the 
> !CONFIG_STACKTRACE case too, as the patch below does.

That doesn't make sense for x86. We have an unconditional unwinder
present.

I've got these, meant to post them later today:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=sched/wchan
