Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D851D62DE
	for <lists+linux-next@lfdr.de>; Sat, 16 May 2020 19:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgEPRFF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 16 May 2020 13:05:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726280AbgEPRFF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 16 May 2020 13:05:05 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2EE9F20756;
        Sat, 16 May 2020 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589648705;
        bh=vC5toP+V7UyuME4fDTVFXO5cgjtOJtf6fNOG7Ro76Pg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=CJq0mYxgdtptOGLgyOymIC0FrwAW+ScD8Pwx94lJ5GK3YgMtlyQNkADyZYPA2cmNy
         b1a5B9gUoeYQUlxnaunvTlYUuzTZjabz2/R7TXqHTp61HxJud15M8V1O0P07vu3OUN
         CmDIkPdJrXrdhVy+3uGryyyqBHUHQeoPGb9Qg25g=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 15DE23522CED; Sat, 16 May 2020 10:05:05 -0700 (PDT)
Date:   Sat, 16 May 2020 10:05:05 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20200516170505.GB2639@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200515084317.7deae61a@canb.auug.org.au>
 <20200514230148.GB2869@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514230148.GB2869@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 14, 2020 at 04:01:48PM -0700, Paul E. McKenney wrote:
> On Fri, May 15, 2020 at 08:43:17AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > Commits
> > 
> >   b2998782ded4 ("Documentation/litmus-tests: Clarify about the RCU pre-initialization test")
> >   663f9202eb8a ("Documentation/litmus-tests: Merge atomic's README into top-level one")
> >   f5eff20366f6 ("tools/memory-model: Fix reference to litmus test in recipes.txt")
> > 
> > are missing a Signed-off-by from their committer.
> 
> I knew I was forgetting something...  Will fix, and thank you!!!

And fixed.  But I didn't want you to be too bored, so I have also merged
with the noinstr-rcu-nmi-2020-05-15 branch of Thomas's and Peter's series.  ;-)

https://lore.kernel.org/lkml/20200515234547.710474468@linutronix.de/

							Thanx, Paul
