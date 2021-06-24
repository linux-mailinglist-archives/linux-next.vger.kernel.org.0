Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B533B2439
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 02:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFXAVq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 20:21:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhFXAVp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Jun 2021 20:21:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 444E060FE9;
        Thu, 24 Jun 2021 00:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624493967;
        bh=AtqOXuFkUgj4Uw6L34Q2JkL/gHj3bAFNWm5XuAg3J9Y=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=sHaCwDoxOLnGsBg6LMDJfltO7Y5YHW+98bWv6JJlkaLdJwecfSrUBw3l+FPkjkJ18
         KtseNH7ayhB9X7G74mQ+8D3Dq9Efq1Y7hYn5CzxMPdUnyAS0989W/24bp7UtsrXVYA
         6paBpVPYIalgfoiuqh6XtlVzfui9Ce0p4yHOnoHCjn+QcmIUcseC1Y8l6239tqv4aj
         5LSBgMKXbvWtBE9ZLT5xGmqLkYwn2adMuJEDFHgtl0F84VdJGHU0Hz7zLBPOutyV1S
         OtCzwBxpL3JjIg596m/mGerGzJClzs98BjrgTOS1EIUGNVA3u/R8Dada7yy42mydhJ
         qhGYQTcHTpcNQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 186885C08D8; Wed, 23 Jun 2021 17:19:27 -0700 (PDT)
Date:   Wed, 23 Jun 2021 17:19:27 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     aneesh.kumar@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Marco Elver <elver@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: Build failure in -next
Message-ID: <20210624001927.GS4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210623223015.GA315292@paulmck-ThinkPad-P17-Gen-1>
 <CAKwvOd=Y1fhJM7NpotvjNy3OE+JtqEBy046ctwE=cqV_ge5tgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=Y1fhJM7NpotvjNy3OE+JtqEBy046ctwE=cqV_ge5tgw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 23, 2021 at 04:39:11PM -0700, Nick Desaulniers wrote:
> On Wed, Jun 23, 2021 at 3:30 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > Hello, Aneesh!
> >
> > Yesterday evening's next-20210622 testing gave me the following
> > kernel-build error:
> >
> > ld: mm/mremap.o: in function `move_huge_pud':
> > /home/git/linux-next/mm/mremap.c:372: undefined reference to `__compiletime_assert_395'
> >
> > Bisection landed on this commit:
> >
> > 257121c5aabe ("mm/mremap: convert huge PUD move to separate helper")
> >
> > I have no idea how this commit relates to that error message, but
> > reverting this commit on top of next-20210622 really does get rid of
> > the problem.
> >
> > The following reproducer provokes this error:
> >
> > tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --torture lock --configs LOCK07 --build-only --kconfig "CONFIG_DEBUG_LOCK_ALLOC=y CONFIG_PROVE_LOCKING=y" --kmake-arg "CC=clang-11"
> >
> > Run the above command in the top-level directory of your -next source
> > tree, and using this compiler:
> >
> > $ clang-11 -v
> > Ubuntu clang version 11.1.0-++20210428103817+1fdec59bffc1-1~exp1~20210428204431.166
> > Target: x86_64-pc-linux-gnu
> >
> > Thoughts?
> >
> >                                                         Thanx, Paul
> 
> ++beers_owed; for the report and bisection. Also reported
> https://lore.kernel.org/lkml/YM0mrZIPM+sWTDHf@Ryzen-9-3900X.localdomain/,
> let's chat over there.

And thank you for the redirection!

							Thanx, Paul
