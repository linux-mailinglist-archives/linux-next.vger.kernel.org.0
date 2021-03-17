Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0187B33F282
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 15:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhCQOYA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 10:24:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:52452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231139AbhCQOXv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 10:23:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5F7D64F26;
        Wed, 17 Mar 2021 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615991030;
        bh=JYn4ilW4yR/GNK9YFAJ+3j22BGLGZ6dc4O+X0LJU1T4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HLIavrV6qYHdxZsWCsw7EiumTCCuqFt+lda3GxQndKs5YZOX93WACe3rK0EZAvsMA
         XVkUkekkBPMtDwP3wDajy68q68KGhxX2JaLXiOeeaF7TI2LYJICb2/goK8S4I7A6c9
         WWw/hIeFkPXv03ZUNroYQwwpMEgko7gCUNldRm3Ej9XO1ryjUK2EqCq1e7cnIzirTY
         bgDzqMZK/at9ROPYn2AQy3K3ynh22pnSzPqx6zXXMXxhJEWrKyebXEOf/yMnSiYoJS
         YLH9FBmhWpySB37XVW5vw57W/mwEIgxvZF1iu1dn4AIiUUjWK/4XIWq4L5j2UxyW/N
         qz/oc8Is3Bf8Q==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 2A2E735226FD; Wed, 17 Mar 2021 07:23:50 -0700 (PDT)
Date:   Wed, 17 Mar 2021 07:23:50 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20210317142350.GC2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210317163613.02cd2246@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317163613.02cd2246@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 04:36:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: modpost: "rcu_read_lock_longwait_held" [kernel/rcu/rcutorture.ko] undefined!
> ERROR: modpost: "rcu_read_unlock_longwait" [kernel/rcu/rcutorture.ko] undefined!
> ERROR: modpost: "rcu_read_lock_longwait" [kernel/rcu/rcutorture.ko] undefined!
> 
> Caused by commit
> 
>   bd6ae31d1b1f ("rcutorture: Add the ability to torture RCU longsleep")
> 
> CONFIG_LONGWAIT_RCU=y
> CONFIG_RCU_TORTURE_TEST=m
> 
> I have used the rcu tree from next-20210316 for today.

Gah!  Rebase first, then retest, -then- adjust rcu/next...

Will fix, apologies for the hassle!

							Thanx, Paul
