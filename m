Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CB42F4038
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 01:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393935AbhAMAnP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 19:43:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:48290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392342AbhAMAUk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Jan 2021 19:20:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0767623120;
        Wed, 13 Jan 2021 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610497200;
        bh=Wn1iOrNk2oDkf48K6nW1qlxJTGCky6NIywERUoMPzkw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ORD9hj6SCGHt4ZRxxVygaXS7f/wbj1909zbzdQCCMbOankJGS2/3ahx6StfPjxXVl
         ZWipJ6zund2T/7V5IFbrrphCZNvDXbFz3/h0jU56E8SMg2IFbcw10gC5JM4BKfGrSz
         SDCUS8tnozWYup6K5+V3leUcA8WBcNmbIWPwH2O6nQRZAXyvx79cITKXz6QVUqT7BT
         X/tY3fOi9O+0PyGoyc/AsK9pgD9+aKwzMN5bL0AtJzhnVbSxrVHcHYu8fDs85b4XAL
         k86hZqrvCoZLGqzboN8ORBpsABADz71GM4M7505358MCayYQl/QXyrm75vMINF8AIK
         qqVz2c+Gq/wJg==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id CF3B43522AC3; Tue, 12 Jan 2021 16:19:59 -0800 (PST)
Date:   Tue, 12 Jan 2021 16:19:59 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20210113001959.GO2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210113090356.3ef1b139@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113090356.3ef1b139@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 13, 2021 at 09:03:56AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   32678deac9cd ("timer: Report ignored local enqueue in nohz mode")
>   8beeef08bd76 ("entry: Report local wake up on resched blind zone while resuming to user")
>   7b3f45a1ad1f ("sched: Report local wake up on resched blind zone within idle loop")
>   4d19f38bb06c ("entry: Explicitly flush pending rcuog wakeup before last rescheduling points")
>   a5b60c670b22 ("rcu/nocb: Trigger self-IPI on late deferred wake up before user resume")
>   679a2750284c ("rcu/nocb: Perform deferred wake up before last idle's need_resched() check")
>   785ff6abc514 ("rcu: Pull deferred rcuog wake up to rcu_eqs_enter() callers")
>   d32f638a57e4 ("rcu: Remove superfluous rdp fetch")
>   97e90370b8f3 ("rcu/nocb: Detect unsafe checks for offloaded rdp")
> 
> are missing a Signed-off-by from their committer.

Thank you, fixed, and apologies for the hassle.

(This is what happens when "git am" doesn't like a patch series,
so I enlist git's help by pulling it from the author's tree to its
natural location, rebasing it, but then forgetting to manually add my
Signed-off-by...)

							Thanx, Paul
