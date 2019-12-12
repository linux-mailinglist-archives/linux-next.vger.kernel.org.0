Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4837411C5C2
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 07:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfLLGCB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 01:02:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:48268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726775AbfLLGCB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Dec 2019 01:02:01 -0500
Received: from paulmck-ThinkPad-P72.home (199-192-87-166.static.wiline.com [199.192.87.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A63F724656;
        Thu, 12 Dec 2019 06:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576130520;
        bh=NO9m42cW/b/BbBvcGzyWKOv1cE/P07W3l66y4FInuOA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=E0uFtmRXSBVlI1RcyyNz/6sv9u/zPh/p7GN5DY2KmyydUz9M1Zhl1mGzvopFHNOa/
         7IIrL6QcFn1mmU3QdtlGEeuDMs8U5NQDTunxc1W+VV6PpVv4GNfIScdm2J8isSYbJr
         fxupr4VqlnUVBNfAm1+nCVp5dh0sw1j8IGWAZc9g=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 506C435203A1; Wed, 11 Dec 2019 22:02:00 -0800 (PST)
Date:   Wed, 11 Dec 2019 22:02:00 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20191212060200.GW2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191212160622.021517d3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212160622.021517d3@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 12, 2019 at 04:06:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu (I think) tree, today's linux-next build (x86_64
> allnoconfig) produced this warning:
> 
> kernel/time/timer.c: In function 'schedule_timeout':
> kernel/time/timer.c:969:20: warning: 'timer.expires' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   969 |   long diff = timer->expires - expires;
>       |               ~~~~~^~~~~~~~~
> 
> Introduced by (bisected to) commit
> 
>   c4127fce1d02 ("timer: Use hlist_unhashed_lockless() in timer_pending()")
> 
> x86_64-linux-gnu-gcc (Debian 9.2.1-21) 9.2.1 20191130

Well, if the timer is pending, then ->expires has to have been
initialized, but off where the compiler cannot see it, such as during a
previous call to __mod_timer().  And the change may have made it harder
for the compiler to see all of these relationships, but...

I don't see this warning with gcc version 7.4.0.  Just out of curiosity,
what are you running, Stephen?

Eric, any thoughts for properly educating the compiler on this one?

							Thanx, Paul
