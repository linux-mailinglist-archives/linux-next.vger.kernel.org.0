Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA8F118B220
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 12:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgCSLMp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 07:12:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45238 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgCSLMp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2020 07:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9stYWxdJp36g8rLWHqSWCUo3F2n7SRE1lKvnUXKPdz8=; b=L7luK57bfFJoO2hpPmPtU3WT7i
        7lFS0PpKekYPt/w+iG/iEIhPcfrOMXSaY9brHULkiX/0DRm3zosA1gSi/1CJpytC7LAEuFFuzcNjv
        m6kc1tSc7LDtmBZN8IWhZmxSnOz/wZTFzOdGc87lx2/Z4iCFx5bjkw7FnyWbyB8ZiJB3bOustrB04
        /1XFTDWc/YBKZ9GfYMwD8+edC1HcU0eygeIsSqjqxuYPvtyX1NMxIBas9lutafn3q2b0Dq1Zg+iFL
        H33sOEMPxfkySYaElBcWniBEhtf0LwUANcPPqoVuVR5qU8froBwOAsMegmp4BRzMg3Y6af/RELXXi
        8CxD9pyg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jEt6N-0008SD-RC; Thu, 19 Mar 2020 11:12:39 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3CE07300235;
        Thu, 19 Mar 2020 12:12:36 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id CDE17286A8B7A; Thu, 19 Mar 2020 12:12:36 +0100 (CET)
Date:   Thu, 19 Mar 2020 12:12:36 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>, jakub@redhat.com,
        dvyukov@google.com
Subject: Re: linux-next: Tree for Mar 18 (objtool)
Message-ID: <20200319111236.GC20760@hirez.programming.kicks-ass.net>
References: <20200318220920.48df2e76@canb.auug.org.au>
 <d7dc5b4a-9a7e-ccf7-e00e-2e7f0e79a9bc@infradead.org>
 <20200318182352.2dgwwl4ugbwndi4x@treble>
 <20200318200542.GK20730@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318200542.GK20730@hirez.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 09:05:42PM +0100, Peter Zijlstra wrote:
> On Wed, Mar 18, 2020 at 01:23:52PM -0500, Josh Poimboeuf wrote:

> >   545ed6816b72 ("ubsan: add trap instrumentation option")
> > 
> > Kees, any idea why that commit causes at least some BUG() statements to
> > output an extra UD2?
> 
> "Built-in Function: void __builtin_trap (void)
> 
>     This function causes the program to exit abnormally. GCC implements
>     this function by using a target-dependent mechanism (such as
>     intentionally executing an illegal instruction) or by calling abort.
>     The mechanism used may vary from release to release so you should
>     not rely on any particular implementation."
> 
> Sounds encouraging :-(

Kees, can you tell the GCC/LLVM folks that now you've used it in the
kernel we have very definite expectations of the implementation. Them
changing it is no longer an option.
