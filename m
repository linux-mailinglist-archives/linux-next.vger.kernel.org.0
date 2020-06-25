Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656992098CD
	for <lists+linux-next@lfdr.de>; Thu, 25 Jun 2020 05:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389351AbgFYDok (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 23:44:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:53498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388485AbgFYDok (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 23:44:40 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95355206FA;
        Thu, 25 Jun 2020 03:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593056679;
        bh=NB+or2ogMHTx4QmjhKeoECd9383Lxo2QG7/ynsH7lM0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=OSIuKFmTHh+X/oV7kDTby52MjnxtLD3RlhqFMfIzGEuRBumBTnwCFn/CVzgTsXaQ4
         Ej8fyAgwGVi4VRkWADtqkJko5zradGWHxrMlYAHTtV3oPUNt8fW6Ipy+hE87uCMwPt
         9sslujrtkSLSytInV3g0cRWBqZVbULMuTVoXVZU0=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 7A20E352327F; Wed, 24 Jun 2020 20:44:39 -0700 (PDT)
Date:   Wed, 24 Jun 2020 20:44:39 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200625034439.GN9247@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200625124452.1310f04f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625124452.1310f04f@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 25, 2020 at 12:44:52PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   include/linux/smp.h
> 
> between commit:
> 
>   380dc20ce843 ("smp, irq_work: Continue smp_call_function*() and irq_work*() integration")
> 
> from the tip tree and commit:
> 
>   7effc6f7b465 ("EXP kernel/smp: Provide CSD lock timeout diagnostics")
> 
> from the rcu tree.
> 
> I have no idea how to fix this up ...

I have an interesting forward-port in my future, it seems.

> I fixed it up (I just effectively reverted the rcu tree commit) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

For the time being, I will move this out of my rcu/next pile.

							Thanx, Paul
