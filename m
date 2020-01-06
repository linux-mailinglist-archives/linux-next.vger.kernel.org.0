Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34C9D13173F
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 19:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgAFSKJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 13:10:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:40654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgAFSKH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 13:10:07 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 01E0D2072C;
        Mon,  6 Jan 2020 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578334207;
        bh=arsveJq0EXpuHjbM0berwr0UlFHCz70bOB+vWGvE1VY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=fVN5/OudB2YehRnliAeW+mOotlQXg7CT4j2xOmrHSU4s2qf6Hf7dB+IkYEu4VJIjH
         uyao6GqCG7naR6fk84/zzR6YFHuv6ObBnB4QmN9Csdr9SCWFSrfj+dPT7vbC+IufqS
         DuTAFGmx47M193lpAjUCV9cXS/csnccXeraewWtw=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id C9484352274D; Mon,  6 Jan 2020 10:10:06 -0800 (PST)
Date:   Mon, 6 Jan 2020 10:10:06 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Olof Johansson <olof@lixom.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20200106181006.GL13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191212160622.021517d3@canb.auug.org.au>
 <CAOesGMiabP7nAPYKrmP=j_8bSj-UfUSFoiD0W+kqzaBp-6J2hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMiabP7nAPYKrmP=j_8bSj-UfUSFoiD0W+kqzaBp-6J2hQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 06, 2020 at 09:51:47AM -0800, Olof Johansson wrote:
> Hi,
> 
> On Wed, Dec 11, 2019 at 9:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the rcu (I think) tree, today's linux-next build (x86_64
> > allnoconfig) produced this warning:
> >
> > kernel/time/timer.c: In function 'schedule_timeout':
> > kernel/time/timer.c:969:20: warning: 'timer.expires' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >   969 |   long diff = timer->expires - expires;
> >       |               ~~~~~^~~~~~~~~
> >
> > Introduced by (bisected to) commit
> >
> >   c4127fce1d02 ("timer: Use hlist_unhashed_lockless() in timer_pending()")
> >
> > x86_64-linux-gnu-gcc (Debian 9.2.1-21) 9.2.1 20191130
> 
> This is still there as of last night's -next. Any update on getting a
> fix queued together with the offending patch?

Hello, Olof,

Thank you, I had indeed lost track of this one.  :-/

Does Eric's patch fix things for you?

https://lore.kernel.org/lkml/CANn89i+xomdo4HFqewrfNf_Z4Q5ayXuW6A4SjSkE46JXP9KuFw@mail.gmail.com/

							Thanx, Paul
