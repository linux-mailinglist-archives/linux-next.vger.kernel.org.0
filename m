Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5333D2F0530
	for <lists+linux-next@lfdr.de>; Sun, 10 Jan 2021 06:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725270AbhAJFPn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 00:15:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:43228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbhAJFPm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Jan 2021 00:15:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C01D224D3;
        Sun, 10 Jan 2021 05:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610255702;
        bh=de2wN2ZtKGX7Z823FLuUzJFPl1ptPjvYfdxkZir4YbM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HUtOTIeYIiigfB911h2KCAfxR7NakIcKPST+fvPDFTOSZUAJyfCep3F5dUmj5IEhM
         QzhbsoVkYuzdJd/oWDWdsAx1i/7HV9jYBHzHOTlaqHR9CSBC45qw+0lJ1tpwDk0Q5W
         rDCSyEC0xvCXhAiTuBUL41tnXLkoWF9K3+hWz26ef/Hj4yzFQ+Pl8tXNulqdwZ/Lca
         cxvHQ9VlXl28Icm1oSwU9uYiyIgZ9QexGF6jfWzx3v8LWE1vmbP1TurZqbwFHZwORX
         RRfIpvW+1eNDPAIehDS6VP57gHokoR0Y6exdhcNW5K5CINfGlH9F0oerFkMhVha0JI
         4+cpFFiHGFhqQ==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 283723521B79; Sat,  9 Jan 2021 21:15:02 -0800 (PST)
Date:   Sat, 9 Jan 2021 21:15:02 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20210110051502.GX2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210110132432.7eccaaac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110132432.7eccaaac@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jan 10, 2021 at 01:24:32PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   cffdc9c7c24c ("EXP sched: Print list of runnable tasks in the current rq")
> 
> is missing a Signed-off-by from its author.
> 
> Paul, remember the rules for -next:
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Please accept my apologies for my messing this up.

Valentin, may I apply your Signed-off-by?  Otherwise, I am liable to
again get it into -next where it is not yet ready to go.  But without it,
rcutorture gets noise from 12e08bc4d ("sched/hotplug: Consolidate task
migration on CPU unplug") that is otherwise difficult to diagnose.  :-/

							Thanx, Paul
