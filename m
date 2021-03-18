Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574AC33FCB2
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 02:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhCRBbM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 21:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhCRBa6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 21:30:58 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6DEC06174A
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 18:30:57 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2280235pjv.1
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 18:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O+gSC6NwZyh8GlX0/8rGOK7WJ2Eoitq1cIB93Dk3fiI=;
        b=Mr2SQcUowt+olEIVnlHcI56EdJLfM6579naHTxVZiFoeSoKX8HlRpLCVJQySmk7P70
         VJ0CCZzUYn1exrxgpYTl8EJHahEK1OSDO6Q2iAyqVkU3Hg4iEZZCS1AgkOpGNUZXk/YJ
         WCqEhi6NyNCHeplRuJr/BmY+xNohgAgcPAXlIbfavh28BjHhe/ZEjew/kQvUytr0tIf4
         ivzqFbstCDp3FmrkGep1vaTcqovMXb65h+A2OgIqeQeMfC8mRDWkQYRAMtmgP+8pybKm
         pkP4+q8X9EmrtYta9QZWu5YWky3+72+Iz+A3AcwVt5owr/uMj+l9zqEwNtX+bg7jno5O
         gg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=O+gSC6NwZyh8GlX0/8rGOK7WJ2Eoitq1cIB93Dk3fiI=;
        b=ZG8MbSskoC0xKijwTVloHuNy/RQA2t/OnNQwYHaqauA039kLbZG93DYIxSoqPNnZqA
         zUq5KW419wm3cqacWSp5UWqb0Ck5I490MmO1LlNPZsyeA8mkfoEtEAOsdLYMquQ5cj9Y
         FxsP067ZK6XUTIoRmk/15Uv0SSL3dikWMTN9Mn70kez31EkFE7+A2b2aoAtRpTX4c4GV
         bwHGy67v33p6FM6hFd+7jnYE4Ywf9PaZqK4Dbg2GFsMALQtZ9dD+nUHCYBBN8VzrJRz/
         MtV30lSvf663xt5SA3VAGSf+DIFBgJYP/sy1631YlBXzUKNScLZ78uzgjYXxWVr2J1ZE
         bLUA==
X-Gm-Message-State: AOAM531E30/mopaqWTHFacFUI8RR/SZgugz3iS9AFWZvpAP8PctvO8uX
        6BFvhEW4pdJc7yIHVOmllwg=
X-Google-Smtp-Source: ABdhPJzxzA3PSz9nd3PAoOKl6zTaPAC8eDBvwsJaCf+JAKnGA96Prxa+MCZN+ZjYThVc3T8uIDvtOw==
X-Received: by 2002:a17:902:e5c7:b029:e5:df58:8155 with SMTP id u7-20020a170902e5c7b02900e5df588155mr7084649plf.55.1616031057186;
        Wed, 17 Mar 2021 18:30:57 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:8914:cdf:bafb:bf7b])
        by smtp.gmail.com with ESMTPSA id w189sm286969pfw.86.2021.03.17.18.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 18:30:56 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 17 Mar 2021 18:30:53 -0700
From:   Minchan Kim <minchan@kernel.org>
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Juergen Christ <jchrist@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [BUG -next] "memcg: charge before adding to swapcache on swapin"
 broken
Message-ID: <YFKtTWk3eAsyqssD@google.com>
References: <YFEeWD7LMPYngtbA@osiris>
 <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris>
 <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
 <YFIfjPzLzeJKs3hE@osiris>
 <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
 <YFJqJeMDc/JCjfSv@osiris>
 <YFJwZoUalBM/lBBr@osiris>
 <CALvZod6EEyqyQD_AvcyTfxj+f0M+X1D1b50HWdaqL1qX69iaMQ@mail.gmail.com>
 <CALvZod5QjGy+WDOX=2mLB4ZgaRLk4kSu3y8ge+YqfHDacF2kKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvZod5QjGy+WDOX=2mLB4ZgaRLk4kSu3y8ge+YqfHDacF2kKQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 05:23:04PM -0700, Shakeel Butt wrote:
> CC: Minchan
> 
> On Wed, Mar 17, 2021 at 2:39 PM Shakeel Butt <shakeelb@google.com> wrote:
> >
> > On Wed, Mar 17, 2021 at 2:11 PM Heiko Carstens <hca@linux.ibm.com> wrote:
> > >
> > > On Wed, Mar 17, 2021 at 09:44:21PM +0100, Heiko Carstens wrote:
> > > > On Wed, Mar 17, 2021 at 08:44:14AM -0700, Shakeel Butt wrote:
> > > > > > Config below. And the fun thing is that I cannot reproduce it today
> > > > > > anymore with the elfutils test case - what _seems_ to be different is
> > > > > > that the test suite runs much faster than yesterday evening. Usually
> > > > > > an indication that there is no steal time (other guests which steal
> > > > > > cpu time), which again _could_ indicate a race / lack of locking
> > > > > > somewhere.
> > > > > > This is kind of odd, since yesterday evening it was very reliable to
> > > > > > trigger the bug :/
> > > > > >
> > > > >
> > > > > Thanks for the config. One question regarding swap, is it disk based
> > > > > swap or zram?
> > > >
> > > > Swap device is a real disk.
> > > >
> > > > > By guests, do you mean there was another significant workload running
> > > > > on the machine in parallel to the tests?
> > > >
> > > > That I don't know. I didn't check. I still can't reproduce with
> > > > elfutils anymore, however...
> > > >
> > > > > If you don't mind can you try swapping01 as well.
> > > >
> > > > ltp's swapping01 test triggers immediately random processes being
> > > > killed with SIGSEGV. I also tested with linux-next 20210316 and _only_
> > > > "memcg: charge before adding to swapcache on swapin" being reverted on
> > > > top, and the problem is away - so it looks like the result of
> > > > yesterday's bisect is indeed valid.
> > >
> > > I have to correct myself, actually the system has both: a real disk
> > > _and_ zram as swap devices:
> > >
> > > # swapon -s
> > > Filename                                Type            Size    Used    Priority
> > > /dev/dasdb1                             partition       21635084        0       -2
> > > /dev/zram0                              partition       1014780 0       100
> > >
> > > When I disable /dev/zram with "swapoff /dev/zram0" the problem is away
> > > as well, even with your patch applied.
> >
> > Thanks a lot. This was really helpful. I will try with zram on my setup.
> >
> > Can you also try with just one type of swap at the time for both? I
> > really appreciate your help.
> 
> Never mind I think I found the issue. Can you please add
> set_page_private(page, entry.val) before swap_readpage(page, true) in
> function do_swap_page() in mm/memory.c and try the swapping01 test
> again?
> 
> Michan, for SWP_SYNCHRONOUS_IO swap, do we ever reset page->private?
> Normally for swapcache pages, it gets reset on delete from swap cache
> but these types of swap skips swapcache, so, I think we never reset
> page->private.

Yub, you are correct.

> 
> The simplest solution I can think of is to do set_page_private(page,
> entry.val) before swap_readpage(page, true) and set_page_private(page,
> 0) after.

Since I did't read the bug in detail, I couldn't come up with how the
missing reset is connected the problem while missing set_page_private
with entry.val is clear.

Anyway, your point is correct and I cannot think better way.

Thanks.
