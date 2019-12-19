Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD27E125CD7
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 09:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfLSImQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 03:42:16 -0500
Received: from merlin.infradead.org ([205.233.59.134]:44562 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLSImP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Dec 2019 03:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8wm7887+6a0DJKHssyZYmao6o0ghgf2EN09A1ImkASw=; b=2HwKIgOqT8V+mqHMyRR/2uqUf
        iiAYAwTtiY7fhdaRn65UTUCYk39cz1Cz+P+6QMMRh0dVFNBtBhYjCb6LJon8EGODnNy3fTxPZHiiW
        /OPX5FNFNkwkgHpZPchJl+u+89RsbXj55CDoanfxUW0X8lXapJsWTQWXTA+uQGXZyasBIIASADOYE
        8cbKkT9tIjDhaW4tTNfbpsEI3OPqEYfY5ZvlF8JyyXWIl+/3eaO4nldeS9F/MEtSKqnDywdU5XPx2
        rifKScmsO6wrnWwelgmkrsgR3UOulq3ZMGO9orseIpeEn2NQXR6HyNUA1Ivm6cg1hA85fuMigRD4O
        L+Zvs4+dA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ihrNe-00050W-Qy; Thu, 19 Dec 2019 08:42:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 772C6304D0D;
        Thu, 19 Dec 2019 09:40:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8E81F2B291C48; Thu, 19 Dec 2019 09:41:55 +0100 (CET)
Date:   Thu, 19 Dec 2019 09:41:55 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20191219084155.GU2844@hirez.programming.kicks-ass.net>
References: <20191219115036.4699721c@canb.auug.org.au>
 <20191219012726.GY2889@paulmck-ThinkPad-P72>
 <20191219013151.GA21768@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219013151.GA21768@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Dec 18, 2019 at 05:31:51PM -0800, Paul E. McKenney wrote:
> On Wed, Dec 18, 2019 at 05:27:26PM -0800, Paul E. McKenney wrote:
> > On Thu, Dec 19, 2019 at 11:50:35AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the rcu tree got a conflict in:
> > > 
> > >   kernel/cpu.c
> > > 
> > > between commit:
> > > 
> > >   45178ac0cea8 ("cpu/hotplug, stop_machine: Fix stop_machine vs hotplug order")
> > > 
> > > from the tip tree and commit:
> > > 
> > >   d62c673f4cfc ("cpu/hotplug, stop_machine: Fix stop_machine vs hotplug order")
> > > 
> > > from the rcu tree.
> > > 
> > > I fixed it up (I just used the tip tree version) and can carry the fix
> > > as necessary. This is now fixed as far as linux-next is concerned, but
> > > any non trivial conflicts should be mentioned to your upstream maintainer
> > > when your tree is submitted for merging.  You may also want to consider
> > > cooperating with the maintainer of the conflicting tree to minimise any
> > > particularly complex conflicts.
> > 
> > I will pull this one out of the set that I mark for -next.  That way
> > I can test and you can avoid at least this one conflict.  ;-)
> 
> Heh.  And the reason that it conflicts is that I fixed at least one
> spelling error...  ;-)
> 
> Still, the one in tip is the official one, so I will proceed as planned.

Argh, my bad. I'd forgotten you'd already queued it, and I was holding
onto it to make sure it didn't get lost. Now we haz it twice.
