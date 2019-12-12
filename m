Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB0F11C4F7
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 05:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbfLLElH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 23:41:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:48870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727541AbfLLElH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 23:41:07 -0500
Received: from paulmck-ThinkPad-P72.home (199-192-87-166.static.wiline.com [199.192.87.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCAA121655;
        Thu, 12 Dec 2019 04:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576125666;
        bh=5GmQbRriT5eS6CCcsDY5em77nBgKXE40wjB8zeiq0EA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=J/ZxnHkQZTJ3jJT+jaT2VNPkCnYjqvd0FinVpA1iranT9A0IpQAHcrhVCYbw6y+cJ
         y6fxSqh3GBwypW4xRSmIFy4tA5qnP7lTE3ACEZSQlwwlmnFPKyu9c8FfAFhMzMEhQx
         NWcpvDJHKki2zAR/ULXf7tf71Ff/UXU9VdjRDrjw=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 653CA352035F; Wed, 11 Dec 2019 20:41:06 -0800 (PST)
Date:   Wed, 11 Dec 2019 20:41:06 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20191212044106.GU2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191212134516.3b5f4a4e@canb.auug.org.au>
 <20191212040737.GR2889@paulmck-ThinkPad-P72>
 <20191212152613.7ad30842@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212152613.7ad30842@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 12, 2019 at 03:26:13PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Wed, 11 Dec 2019 20:07:37 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >
> > On Thu, Dec 12, 2019 at 01:45:16PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> > > failed like this:
> > > 
> > > drivers/misc/watch_queue.c: In function 'watch_queue_set_filter':
> > > drivers/misc/watch_queue.c:526:2: error: implicit declaration of function 'rcu_swap_protected' [-Werror=implicit-function-declaration]
> > >   526 |  rcu_swap_protected(wqueue->filter, wfilter,
> > >       |  ^~~~~~~~~~~~~~~~~~
> > > 
> > > Caused by commit
> > > 
> > >   af8c9224182e ("rcu: Remove rcu_swap_protected()")
> > > 
> > > interacting with commit
> > > 
> > >   fe78d401ca6b ("General notification queue with user mmap()'able ring buffer")
> > > 
> > > from the keys tree.
> > > 
> > > I have added the following merge fix patch for today:
> > > 
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Thu, 12 Dec 2019 13:37:52 +1100
> > > Subject: [PATCH] rcu: fix up for "Remove rcu_swap_protected()"
> > > 
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>  
> > 
> > Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
> 
> Thanks.
> 
> > I would be happy to take this if desired, but it would probably be better
> > for this to be applied directly to the keys tree.  Either way, please let
> > me know.
> 
> Well, you can't take this fix up without merging the keys tree ... and
> the keys tree is currently in flux so it should be easy for it to be
> applied there since rcu_replace_pointer() already exists in Linus'
> tree, right?.

Yes, so sounds like a plan to me.  ;-)

							Thanx, Paul
