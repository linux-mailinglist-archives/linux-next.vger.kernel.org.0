Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EE131A284
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 17:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhBLQTP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 11:19:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhBLQTK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Feb 2021 11:19:10 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59FB4C0613D6;
        Fri, 12 Feb 2021 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=TkUYN4LQxgT7TupyOOW/SgGGTc0FM1qxqUxoeeSOi1M=; b=vullsWgJEc/y4AmHD9ghPW37Lw
        4+XLREW85+Mr1uasvjCKS1AW1nSVTyPsyyC79SxFu+i84FU8PT+DjyDcvjJTaz81FhxmV3aIoqSq3
        A66DRVpAUxDgpeM2i/Vtgo1b08XiowKYawrWYgPvGlasdEN1ADoEz7SGsUWfiAt2jPjbv/gb3t0pO
        Jty5Z9sxFSRALP5rrfwSeXv1H6YeLIS9BGu4157y4hPGs9i7k9d1V26R0dkoioAlYPCuXLK7j/Eyc
        1rM4h0ZZnEw0KvQBGncbRkzOvwqv7Tf5AQQCDyUnfWYKRutbtt8xxF8oPqZLdprs4rTmQc8NPYRTR
        znid5lkg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lAb98-00Bp5W-W5; Fri, 12 Feb 2021 16:18:19 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AE9CE300446;
        Fri, 12 Feb 2021 17:18:18 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 375A72C1D2C05; Fri, 12 Feb 2021 17:18:18 +0100 (CET)
Date:   Fri, 12 Feb 2021 17:18:18 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     paulmck@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
        Frederic Weisbecker <frederic@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the block tree
Message-ID: <YCaqSuQBhqgAkWLm@hirez.programming.kicks-ass.net>
References: <20210211164852.7489b87d@canb.auug.org.au>
 <20210211173802.GM2743@paulmck-ThinkPad-P72>
 <d4232318-0e44-445d-a7a3-1e2a018c824e@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4232318-0e44-445d-a7a3-1e2a018c824e@kernel.dk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 12, 2021 at 08:26:56AM -0700, Jens Axboe wrote:
> But I think I made a mistake in that it should've been sched/smp instead,
> which would likely get rid of this issue too? I'll rebase it, it's just
> a single topic branch with just those two patches on top.

Right, I made tip/sched/smp with just that one patch. That _should_ work
for you, if not, please let me know.
