Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E221932AE
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 22:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgCYVbk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 17:31:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:32970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727374AbgCYVbi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Mar 2020 17:31:38 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B61C2070A;
        Wed, 25 Mar 2020 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585171897;
        bh=3+7KQZJ5Nvd1PglU7AEyPr1ORCka77d+dj1qqmwRAsw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=taDCsXAXa0DN34PtzK/H7wtuMLdFVLQJObxsX5sGYSU8qqa1GZN4G2DQ9OSPdAXi1
         vrIyhbVKoQWs8b4jgtxSOKqSwep42JFo132xGblmHviyJbyfRPU2W1rhih51XbGWvP
         uBz8sZ8EcDWa++3NIhBd3Ix5SdjIThsYnhUU7Igc=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 6C04C3520C5D; Wed, 25 Mar 2020 14:31:37 -0700 (PDT)
Date:   Wed, 25 Mar 2020 14:31:37 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200325213137.GA19107@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200325140845.5705b515@canb.auug.org.au>
 <20200325031809.GQ19865@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325031809.GQ19865@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 24, 2020 at 08:18:09PM -0700, Paul E. McKenney wrote:
> On Wed, Mar 25, 2020 at 02:08:45PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the rcu tree got conflicts in:
> > 
> >   lib/Kconfig.kcsan
> >   kernel/kcsan/report.c
> >   kernel/kcsan/kcsan.h
> >   kernel/kcsan/debugfs.c
> >   kernel/kcsan/core.c
> >   kernel/kcsan/atomic.h
> >   include/linux/kcsan-checks.h
> > 
> > between a series of commits from the tip tree and the same series of
> > patches (but different commits) in the rcu tre (followed by some more
> > changes in the rcu tree).
> > 
> > I fixed it up (I just used the rcu tree versions of these files) and
> > can carry the fix as necessary. This is now fixed as far as linux-next
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> > 
> > Please clean up the rcu tree WRT the tip tree.
> 
> Will do, and apologies for the hassle!

And done.  The rcu/next branch should now be fully compatible with
tip/master.

							Thanx, Paul
