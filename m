Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBD61EFBC9
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 16:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgFEOsF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 10:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgFEOsE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2020 10:48:04 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D5FC08C5C3
        for <linux-next@vger.kernel.org>; Fri,  5 Jun 2020 07:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=hpjN+dCqjd7JlhxdTjYdm5wzduowVVIDE+7t2H7LGHc=; b=Hj69LtCl52galcAU2GlvlFen1Y
        n+nyuN4l1PIrA9wS7DPHxduFMqeikaE5UXNNn5yto9428Wh0hs3uilwCnJlLYhS7W3cYOjxZlsfg6
        RPmW80NthJz/Aafklg3vqOKXI2wxltdPwqQcm19xxWuEToMfp0HjGVyCNWv7PyGb4AsK7M7Uu/HNS
        iitod6g3duVaCJn7VOnhuq6NzMO2afJHHLwx1baFOZm/3QajpVA4zuC9B5ljm7C5ni2Z1vTSJP+E1
        WQatglJwcXZLK9Qxmfk8q29GpVCBUzb+UFJyi5vGkgbbV0pzDPXWkFpvApcg0+nWRhW2itlI68gvg
        r2AdqOjg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jhDdZ-0006VQ-BL; Fri, 05 Jun 2020 14:48:01 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CEC92301DFC;
        Fri,  5 Jun 2020 16:47:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8DD6621A74B42; Fri,  5 Jun 2020 16:47:59 +0200 (CEST)
Date:   Fri, 5 Jun 2020 16:47:59 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>, linux-next@vger.kernel.org
Subject: Re: Fw: next/pending-fixes build: 162 builds: 2 failed, 160 passed,
 2 errors, 109 warnings (v5.7-8671-g086779e58c68)
Message-ID: <20200605144759.GG4117@hirez.programming.kicks-ass.net>
References: <20200605115213.2836fccf@canb.auug.org.au>
 <20200605083855.GH3976@hirez.programming.kicks-ass.net>
 <202006050734.97C4AB35CF@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202006050734.97C4AB35CF@keescook>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 05, 2020 at 07:36:02AM -0700, Kees Cook wrote:
> On Fri, Jun 05, 2020 at 10:38:55AM +0200, Peter Zijlstra wrote:
> > On Fri, Jun 05, 2020 at 11:52:13AM +1000, Stephen Rothwell wrote:
> > > Commit
> > > 
> > >   a148866489fb ("sched: Replace rq::wake_list")
> > > 
> > > added
> > > 
> > > BUILD_BUG_ON(offsetof(struct task_struct, wake_entry_type) - offsetof(struct task_struct, wake_entry) !=
> > > 		     offsetof(struct __call_single_data, flags) - offsetof(struct __call_single_data, llist));
> > > 
> > > in kernel/smp.c.  This seems to be failing - at least for gcc-8 (I
> > > haven't seen any failures in my linux-next testing).
> > 
> > CONFIG_GCC_PLUGIN_RANDSTRUCT=y
> 
> (FWIW, the plugins will only be enabled if the gcc plugins-dev package is
> installed)

Which I hadn't, which is why I'd never seen it. I have now.

> > working on it.
> 
> Either of these solutions should fix it. I'm not sure which is
> preferred.

I posted in another thread that had earlier raised the issue:

https://lkml.kernel.org/r/20200605093704.GB2948@hirez.programming.kicks-ass.net
