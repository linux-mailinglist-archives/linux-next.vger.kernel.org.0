Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E326C26E7CE
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 00:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgIQWBq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 18:01:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:59670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbgIQWBq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 18:01:46 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E139E20872;
        Thu, 17 Sep 2020 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600380105;
        bh=iSS3yVNSP4VslVAf8MgGuHdapmuSuK442eTIBtSj0SU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JdyyX1wORgeZqLB4rR/p3TPUNlpPVkqqJ657t4PhebdQfbw0Ev0DT1jcr6HG97ANB
         N18Wv8e6+aFtBIIkCP80aoptKXbo6cAujzY5y4n/MwasGqTASCi26E9OLh4lpMSf4Y
         gULHhI2/+P+pI/Qti6wnlx0iHhGWN7usS0rn9Y0c=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id A63313522887; Thu, 17 Sep 2020 15:01:45 -0700 (PDT)
Date:   Thu, 17 Sep 2020 15:01:45 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20200917220145.GQ29330@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200917151909.01fa6684@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917151909.01fa6684@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 17, 2020 at 03:19:09PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from kernel/rcu/update.c:578:
> kernel/rcu/tasks.h:601:20: error: static declaration of 'show_rcu_tasks_classic_gp_kthread' follows non-static declaration
>   601 | static inline void show_rcu_tasks_classic_gp_kthread(void) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from kernel/rcu/update.c:49:
> kernel/rcu/rcu.h:537:6: note: previous declaration of 'show_rcu_tasks_classic_gp_kthread' was here
>   537 | void show_rcu_tasks_classic_gp_kthread(void);
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   675d3ca52626 ("rcutorture: Make grace-period kthread report match RCU flavor being tested")
> 
> I have used the rcu tree from next-20200916 for today.

Please accept my apologies for the hassle!  I believe that I finally
have this straightened out.

Please ignore if you already pulled -rcu for today, as I previously
set rcu/next back to a commit preceding the offending one.

							Thanx, Paul
