Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A684827A927
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 09:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgI1H5f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 03:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbgI1H5f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Sep 2020 03:57:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733CEC0613CE;
        Mon, 28 Sep 2020 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ACq0Ns8qpygXghwpUaRPThPaadKbyOkCpocoksti52M=; b=XXQPiT/wuZpdIOY0D7eVkjNXCD
        hMiiq2T+g0WsnhstcoVUVeDvy0+zatliBt+VqM9QjUdOae885Nt3+y3S9ZNvECY7Nb5OWgGyuDMkT
        OdkAo465l+N5glHNF54phRF3mn0TP6ej6+b0XtXjU2A17fWoBc1Wq7X4y7PNMVjDfKpXs2I29CZ/R
        z4O0QMvyyPIbeFUj2NMZ5Zh4fpE8nvh0xbRo5RciCqzWUzShlINp4G83ihYq+5Pb4uu2NEBwTx+pr
        47RBBByXHzo8T/l6nSpskovwmJ6umpvzGnpw05UcgnKj5UyG9arMDhB1Dj7x51c0xzLxsEjeceBkq
        yIDTkhww==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kMo2M-00049I-W1; Mon, 28 Sep 2020 07:57:31 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9842A303F45;
        Mon, 28 Sep 2020 09:57:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id F258C20CB21EE; Mon, 28 Sep 2020 09:57:29 +0200 (CEST)
Date:   Mon, 28 Sep 2020 09:57:29 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20200928075729.GC2611@hirez.programming.kicks-ass.net>
References: <20200917132652.738c4cc2@canb.auug.org.au>
 <20200917180005.GM29330@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917180005.GM29330@paulmck-ThinkPad-P72>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 17, 2020 at 11:00:05AM -0700, Paul E. McKenney wrote:
> On Thu, Sep 17, 2020 at 01:26:52PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   903c5302fa2d ("sched/core: Allow try_invoke_on_locked_down_task() with irqs disabled")
> > 
> > is missing a Signed-off-by from its author and committer.
> > 
> > I didn't complain about this when it was first present because I figured
> > it was just a debugging commit that would be removed quickly.  However,
> > there are now quite a few follow up commits ...
> 
> Without Peter's Signed-off-by, I clearly won't be submitting it to the
> upcoming merge window.
> 
> Peter, this is now quite close to your original patch.  May I please
> add your Signed-off-by?

Sure!
