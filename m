Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E69206ADD
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 06:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725831AbgFXEGW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 00:06:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:56920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbgFXEGV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 24 Jun 2020 00:06:21 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57F5C2085B;
        Wed, 24 Jun 2020 04:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592971581;
        bh=Ua6lB42IyABJSBPH2fW/GfDOYG86wj9YaP8tlq4CKuQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=lPYww/NXRZWF9cd//sbPGLIXeNwDD2PGE3vAi40h3KeJig255CjrlifOAL8MFKvJf
         WlUqMEpSMZJwoPVfSbFln2SCxqi49RasZxS8UizPJNa8iE/Mhb6s293GC/s2XHAH3r
         dOsx0EH6kCfFXbwKt+40hObQfa3gwzqkowc6ttbE=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 3F7EA352265B; Tue, 23 Jun 2020 21:06:21 -0700 (PDT)
Date:   Tue, 23 Jun 2020 21:06:21 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200624040621.GC9247@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200624130450.57e793f9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624130450.57e793f9@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 24, 2020 at 01:04:50PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/sched/core.c
> 
> between commit:
> 
>   964ed98b0752 ("sched/core: Fix ttwu() race")
> 
> from the tip tree and commit:
> 
>   3c88d09bfb1b ("EXP sched: Alleged fix for v5.8 merge-window scheduler issue")
> 
> from the rcu tree.
> 
> I fixed it up (I used the version from the tip tree) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Gah.  I will move my copy of this patch out of the rcu/next batch.
I included it so that I could find other bugs.  ;-)

							Thanx, Paul
