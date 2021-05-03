Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A66371935
	for <lists+linux-next@lfdr.de>; Mon,  3 May 2021 18:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhECQ0B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 3 May 2021 12:26:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:57344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230518AbhECQ0B (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 May 2021 12:26:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B66A61166;
        Mon,  3 May 2021 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620059108;
        bh=6h1WqLswy8wGk439ZHImVGP5MojFtJyUiB0XmRcwSqE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=cdIJZkS0oHWV/DayIp+IHLVc7K4xP2xacpF8LmvJwj/c4EE7WTXxtb7A9LGUhaFCd
         uX9I95/UGwH/4Bh39zJ8QWPkA7/JbpBVeVp3qRLTAG93AFTvVm3koMu14JzUiYnQNQ
         Fkr4qMqSBmYDRBr2tFe3OkemXklpGjC63Ar/X4MJFatIiJBVKrBfNi8/CLeDeKTdHi
         Kr0cDmpBqMxc/CUGY2QNMhtB4U7xGUHacJLS4xvpevxHxujTzw9yn9l65SvrA2DJpo
         D+SX2s+Nu9lC4T3VZiI4C1M9VKf8L+kp8mk+Q5ZnkSl+vPEawbe6/3Ar/i5htKv/ht
         rz0C3VnPK6wPg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 988195C034B; Mon,  3 May 2021 09:25:07 -0700 (PDT)
Date:   Mon, 3 May 2021 09:25:07 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20210503162507.GV975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210503101145.17cb2bdd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503101145.17cb2bdd@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 03, 2021 at 10:11:45AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: modpost: "clocksource_verify_percpu" [kernel/time/clocksource-wdtest.ko] undefined!
> 
> Caused by commit
> 
>   98f0fdb43573 ("clocksource: Provide kernel module to test clocksource watchdog")
> 
> I have used the rcu tree from next-20210430 for today.

Apologies for the hassle and for my losing track of the International
Date Line!  I have updated accordingly.

							Thanx, Paul
