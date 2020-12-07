Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A7F2D18CD
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 19:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgLGSy1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 13:54:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:41972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgLGSy1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Dec 2020 13:54:27 -0500
Date:   Mon, 7 Dec 2020 10:53:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607367227;
        bh=gnPDSoguAFWz2QTc7VzDko3GeSPnJqSfO6jczrH6R04=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=un7ro+BPT7RvbeJl3ZxUBZa2yP1qk3RNRrbeZiRL/8svwzc3EF226eL/Xcu9QTitE
         VAueDjBi8t+9PqHwSvcwOeanpFInIYAPBX7iefDWkkwr0N9CSKOPNZ6RtDX4PS/vCS
         8kKvcD2vHKCbr/ZikacevHf1J3d33acTLgR4r2mlWcaksEchtweABQnBUYg74v6XR0
         Ivxa8QtwZIkizDld4QMQmkeX+PxHP5MEbOCdTOwaGOS8hfrvCVR1eeEVtXDuTyHoL4
         eLBIRI1dsAB7oZxRu897DFFV2PyBvQIJr0KFchhae7W+4KdBCNv/nW6HD/Czajxh//
         wERnSWE6anXvg==
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20201207185346.GJ2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201207192028.5333e4d7@canb.auug.org.au>
 <20201207164704.GH2657@paulmck-ThinkPad-P72>
 <20201207104851.20400bba@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207104851.20400bba@lwn.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 07, 2020 at 10:48:51AM -0700, Jonathan Corbet wrote:
> On Mon, 7 Dec 2020 08:47:04 -0800
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > I freely confess that I have absolutely no idea what it doesn't like.
> > It is complaining about this header comment, correct?
> > 
> > /**
> >  * kmem_last_alloc_stack - Get return address and stack for last allocation
> >  * @object: object for which to find last-allocation return address.
> >  * @stackp: %NULL or pointer to location to place return-address stack.
> >  * @nstackp: maximum number of return addresses that may be stored.
> >  *
> >  * If the pointer references a slab-allocated object and if sufficient
> >  * debugging is enabled, return the return address for the corresponding
> >  * allocation.  If stackp is non-%NULL in %CONFIG_STACKTRACE kernels running
> >  * the slub allocator, also copy the return-address stack into @stackp,
> >  * limited by @nstackp.  Otherwise, return %NULL or an appropriate error
> >  * code using %ERR_PTR().
> >  *
> >  * Return: return address from last allocation, %NULL or negative error code.
> >  */
> 
> The problem is the %ERR_PTR().  I'm honestly not quite sure why, Sphinx is
> being a little weird there.  But in any case the % notation is supposed to
> mark a constant, which is not the case here.  I'd just take the % signs
> out.

Thank you, will do!

							Thanx, Paul
