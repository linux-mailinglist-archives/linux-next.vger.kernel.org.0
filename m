Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCFA2486B4
	for <lists+linux-next@lfdr.de>; Tue, 18 Aug 2020 16:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHROIZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Aug 2020 10:08:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726476AbgHROIZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Aug 2020 10:08:25 -0400
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FD9320786;
        Tue, 18 Aug 2020 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597759704;
        bh=gTniIHzq+b6N51aAyJt0DOJVvbWbr6c5Fi78zNiIl00=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=UfT8HJN+60NmK5dY57smuSuAJ21H7qOEhN41xi9OhoWWw9nfrqqLWhXtNYOGdQ1HR
         WXblTbgOe8fOmXpgbovnU6DbaMn4lbotVOcqIkTEDUOBMoFhnPLhR5FnTxzct5CLLG
         FPNzNexkCsAD2I8ZoC/hgMC3LXx2WxdphqXCcMrI=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 20A9C35228F5; Tue, 18 Aug 2020 07:08:24 -0700 (PDT)
Date:   Tue, 18 Aug 2020 07:08:24 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20200818140824.GA27891@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200818114354.6c7c2142@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818114354.6c7c2142@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 18, 2020 at 11:43:54AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from include/linux/kernel.h:15,
>                  from kernel/rcu/rcuscale.c:13:
> kernel/rcu/rcuscale.c: In function 'rcu_scale_writer':
> kernel/rcu/rcuscale.c:430:6: error: 'perf_type' undeclared (first use in this function); did you mean 'kernfs_type'?
>   430 |      perf_type, PERF_FLAG, me, MIN_MEAS);
>       |      ^~~~~~~~~
> include/linux/printk.h:319:35: note: in definition of macro 'pr_alert'
>   319 |  printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
>       |                                   ^~~~~~~~~~~
> kernel/rcu/rcuscale.c:430:6: note: each undeclared identifier is reported only once for each function it appears in
>   430 |      perf_type, PERF_FLAG, me, MIN_MEAS);
>       |      ^~~~~~~~~
> include/linux/printk.h:319:35: note: in definition of macro 'pr_alert'
>   319 |  printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
>       |                                   ^~~~~~~~~~~
> kernel/rcu/rcuscale.c:430:17: error: 'PERF_FLAG' undeclared (first use in this function)
>   430 |      perf_type, PERF_FLAG, me, MIN_MEAS);
>       |                 ^~~~~~~~~
> include/linux/printk.h:319:35: note: in definition of macro 'pr_alert'
>   319 |  printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
>       |                                   ^~~~~~~~~~~
> kernel/rcu/rcuscale.c:431:27: error: 'n_rcu_perf_writer_finished' undeclared (first use in this function); did you mean 'n_rcu_scale_writer_finished'?
>   431 |    if (atomic_inc_return(&n_rcu_perf_writer_finished) >=
>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                           n_rcu_scale_writer_finished
> 
> Caused by commit
> 
>   a20b5bd09813 ("rcuperf: Change rcuperf to rcuscale")
> 
> I have used the rcu tree from next-20200817 for today.

My test scripts clearly are not dealing gracefully with filename changes,
are they?  :-/

Thank you for catching this one!  I have queued a fix.

							Thanx, Paul
