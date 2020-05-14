Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A594B1D31D9
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 15:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgENNyD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 09:54:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbgENNyD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 09:54:03 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97198205CB;
        Thu, 14 May 2020 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589464442;
        bh=bNrG9XA/HjyOs+0yCswb5zYOyQkr7H9bUyY9HpZXdFs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QWJYt4wEUS1rFbebQVlFjN3m/eKsEr/xBfs4ECKjTfE9k0eMwRGO9qWMyqUaRxlLG
         mU2TXve7ph1ssgyQpd6zlo8pGFNEOe2np32uwSi+akKIG7pSOB1AwVI3Obmi+qiRK5
         DtHJmMgY1HOkFUyDjEJaduNRfKNFlfnmFH+UeeO4=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 1F57C35229C5; Thu, 14 May 2020 06:54:02 -0700 (PDT)
Date:   Thu, 14 May 2020 06:54:02 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Qian Cai <cai@lca.pw>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
Message-ID: <20200514135402.GI2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200514222535.259cb69e@canb.auug.org.au>
 <ADC503BE-32C0-46BB-A65E-59FFEC30ED57@lca.pw>
 <20200514133328.GG2869@paulmck-ThinkPad-P72>
 <ADE40EB3-1B1C-4CCF-9B8A-1F2BC585BCFB@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ADE40EB3-1B1C-4CCF-9B8A-1F2BC585BCFB@lca.pw>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 14, 2020 at 09:44:28AM -0400, Qian Cai wrote:
> 
> 
> > On May 14, 2020, at 9:33 AM, Paul E. McKenney <paulmck@kernel.org> wrote:
> > 
> > On Thu, May 14, 2020 at 08:31:13AM -0400, Qian Cai wrote:
> >> 
> >> 
> >>> On May 14, 2020, at 8:25 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>> 
> >>> Hi Paul,
> >>> 
> >>> This patch in the rcu tree
> >>> 
> >>> d13fee049fa8 ("Default enable RCU list lockdep debugging with PROVE_RCU")
> >>> 
> >>> is causing whack-a-mole in the syzbot testing of linux-next.  Because
> >>> they always do a debug build of linux-next, no testing is getting done. :-(
> >>> 
> >>> Can we find another way to find all the bugs that are being discovered
> >>> (very slowly)?
> >> 
> >> Alternatively, could syzbot to use PROVE_RCU=n temporarily because it can’t keep up with it? I personally found PROVE_RCU_LIST=y is still useful for my linux-next testing, and don’t want to lose that coverage overnight.
> > 
> > The problem is that PROVE_RCU is exactly PROVE_LOCKING, and asking people
> > to test without PROVE_LOCKING is a no-go in my opinion.  But of course
> > on the other hand if there is no testing of RCU list lockdep debugging,
> > those issues will never be found, let alone fixed.
> > 
> > One approach would be to do as Stephen asks (either remove d13fee049fa8
> > or pull it out of -next) and have testers force-enable the RCU list
> > lockdep debugging.
> > 
> > Would that work for you?
> 
> Alternatively, how about having
> 
> PROVE_RCU_LIST=n if DEBUG_AID_FOR_SYZBOT
> 
> since it is only syzbot can’t keep up with it?

Sound good to me, assuming that this works for the syzkaller guys.
Or could there be a "select PROVE_RCU_LIST" for the people who would
like to test it.

Alternatively, if we revert d13fee049fa8 from -next, I could provide
you a script that updates your .config to set both RCU_EXPERT and
PROVE_RCU_LIST.

There are a lot of ways to appraoch this.

So what would work best for everyone?

							Thanx, Paul
