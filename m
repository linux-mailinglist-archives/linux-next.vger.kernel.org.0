Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E982E955D
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 13:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbhADM5M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 07:57:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:54002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbhADM5M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Jan 2021 07:57:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19DA1207B1;
        Mon,  4 Jan 2021 12:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609764991;
        bh=MI++1bdO+nPC62h/WnOJfCwXl2nKAz5VwOY3jvxSDxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kM/cifXUNn9i29s+dCPVb5xSVuloSe4hlgZmjVPt1UuuIVxLqttcjhc3ndORPYZQM
         SzNCkbDYTeO3x+clwyLgmSc91EDA/z1c5Q1xb9XLGkfkwT6Wu8whnq56/0kv8S56Mn
         xMS1iAqNiox/RpARiNlsap6act4xP9HQWT9rdGzIjPJY9YLULtIZureu76nbWiyRsM
         ZI7Uv917L2SxxsfmNMVw1wyQn2pHdrE/B3t1YKI71ksMkl8JSuT0Lt8CBINVDYFeo7
         FeXXHQ/bPh7lKngg42JYYYIQXRC2rAEOVKSK/XH7EagmA+CluemDGzI1jSO/5Ci+og
         zEZNH33KV/tmQ==
Date:   Mon, 4 Jan 2021 13:56:29 +0100
From:   Frederic Weisbecker <frederic@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20210104125629.GA32553@lothringen>
References: <20210104113736.23ab7690@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104113736.23ab7690@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 04, 2021 at 11:37:36AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/mach-imx/cpuidle-imx6q.c: In function 'imx6q_enter_wait':
> arch/arm/mach-imx/cpuidle-imx6q.c:32:7: error: implicit declaration of function 'need_resched'; did you mean 'tif_need_resched'? [-Werror=implicit-function-declaration]
>    32 |  if (!need_resched())
>       |       ^~~~~~~~~~~~
>       |       tif_need_resched
> 
> Caused by commit
> 
>   7ca83ec735ce ("ARM: imx6q: Fix missing need_resched() check after
>   rcu_idle_enter()")

Thanks for the report, I'm checking that.

> 
> I have used the rcu tree from next-20201223 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


