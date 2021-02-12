Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17C431A188
	for <lists+linux-next@lfdr.de>; Fri, 12 Feb 2021 16:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhBLPVl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Feb 2021 10:21:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:53688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229475AbhBLPTg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 12 Feb 2021 10:19:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26B3860C41;
        Fri, 12 Feb 2021 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613143135;
        bh=5m7qNeM+iZGkaEN9U3T+IB2rVlBvv/69Py0HDS2w5A4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t2vdBIm1rWDCTIOTLgQ/AgdEa6rcWJ/yOTMSWoqsJQ/SC4rBL1szYvIccyOdShr+9
         7Kes6omLBYp6gGDNlga1IUx4kcAIZ5Mbv9/oDvL3VuOoT+bkNpJfjUH2OZjbH8IsS+
         DZ6NuEns8ODSB7MKZUkcnJ5sFWhkcw4654DcIl9cy/r7pPpjznj8xfSIzUGb2aqUmU
         2Vcp5tiAmk9IC2w1vSiDUYyeFQAbwc4H7lb/znERvsM0LVZHBAmxT3NpHiK1vCitCP
         sdYw0aMSR9UZ5jgoqd7hoM1DYpSmDITNpDrdQt0ZlkKZJlCHAloBX8jE/A5L1J5Eil
         Yiw2JCfA/Rxsg==
Date:   Fri, 12 Feb 2021 16:18:53 +0100
From:   Frederic Weisbecker <frederic@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the rcu tree with the block tree
Message-ID: <20210212151853.GC94816@lothringen>
References: <20210211164852.7489b87d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211164852.7489b87d@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 11, 2021 at 04:48:52PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got conflicts in:
> 
>   include/linux/rcupdate.h
>   kernel/rcu/tree.c
>   kernel/rcu/tree_plugin.h
> 
> between commits:
> 
>   3a7b5c87a0b2 ("rcu/nocb: Perform deferred wake up before last idle's need_resched() check")
>   e4234f21d2ea ("rcu: Pull deferred rcuog wake up to rcu_eqs_enter() callers")
>   14bbd41d5109 ("entry/kvm: Explicitly flush pending rcuog wakeup before last
>   rescheduling point")
> from the block tree and commits:

Isn't it tip:/sched/core instead of block?
