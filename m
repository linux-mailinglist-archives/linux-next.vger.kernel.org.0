Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D75E318A374
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 21:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgCRUFs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 16:05:48 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52636 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgCRUFr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2020 16:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gkorsAd3/7p8i8lrK7OdE0hB+8nbrVh0s1P6M0zluoI=; b=SUl4y5Z3PgoJ4Tx8P7YHb3xZSm
        1lLwge50z34Q5sqZY0MMIEc0eMOubZkce41p6fbuXSbpxY70gXBcpambdUeh19eLa5T/WRmLYjf6L
        jqgOV6ZnQiFSQbWpghciQk3+wlAnBnn7FlNneweuDHmdgob2rKSolR1dCP2WU1hFWcgA4s13nJ7FJ
        ziI7xzGDYRD+uzAhp7OrL2MKqas3IbZrc+SlqffAsxAi2BYhRsI6XMeLYcRRUrZlJC4X0AJREvonh
        XRXWuxOB03BrRGd3aBPNIoDhO5TS7D9b7fRHo8Ro85YFzqnuabXqfW+q9PzC3pA8QWZiOati+wm/y
        x3NTmaAA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jEewi-0004bA-No; Wed, 18 Mar 2020 20:05:44 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 85DA73010C2;
        Wed, 18 Mar 2020 21:05:42 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4950B28528244; Wed, 18 Mar 2020 21:05:42 +0100 (CET)
Date:   Wed, 18 Mar 2020 21:05:42 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <20200318200542.GK20730@hirez.programming.kicks-ass.net>
References: <20200318220920.48df2e76@canb.auug.org.au>
 <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
 <20200318182352.2dgwwl4ugbwndi4x@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318182352.2dgwwl4ugbwndi4x@treble>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 01:23:52PM -0500, Josh Poimboeuf wrote:
> On Wed, Mar 18, 2020 at 09:48:01AM -0700, Randy Dunlap wrote:
> > On 3/18/20 4:09 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20200317:
> > > 
> > 
> > Hi,
> > 
> > For some reason, the attached .config file generates over 350 objtool warnings.
> > There are all "unreachable instruction" warnings.
> > 
> > Here is a small sample:
> > 
> > mm/page-writeback.o: warning: objtool: __set_page_dirty_nobuffers()+0x25b: unreachable instruction
> > kernel/sched/fair.o: warning: objtool: load_balance()+0x54c: unreachable instruction
> > kernel/power/process.o: warning: objtool: freeze_kernel_threads()+0x115: unreachable instruction
> > mm/readahead.o: warning: objtool: read_cache_pages_invalidate_page()+0x1b5: unreachable instruction
> > kernel/power/suspend.o: warning: objtool: suspend_devices_and_enter()+0x101f: unreachable instruction
> > kernel/sched/rt.o: warning: objtool: dequeue_top_rt_rq()+0x67: unreachable instruction
> 
> This seems to be caused by 
> 
>   545ed6816b72 ("ubsan: add trap instrumentation option")
> 
> Kees, any idea why that commit causes at least some BUG() statements to
> output an extra UD2?

"Built-in Function: void __builtin_trap (void)

    This function causes the program to exit abnormally. GCC implements
    this function by using a target-dependent mechanism (such as
    intentionally executing an illegal instruction) or by calling abort.
    The mechanism used may vary from release to release so you should
    not rely on any particular implementation."

Sounds encouraging :-(

Clearly it now emits UD2, but who knows what it'll do next week.

I think what happens is that we have code that does:

	if (cond)
		BUG()/WARN()

And ubsan figures that @cond is something undefined, and then we get
transformed into:

	if (cond) {
		__builtin_trap();
		BUG()/WARN()
	}

And presto, double UD2.

Since x86 has GENERIC_BUG unconditionally, we should actually have
__bug_table entries for each BUG()/WARN() instance, which should allow
us to distinguish between a proper BUG()/WARN() and this
__builtin_trap() nonsense.


