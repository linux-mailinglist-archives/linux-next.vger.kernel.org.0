Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E4433FC30
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 01:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhCRAXe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 20:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhCRAXU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 20:23:20 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13496C06174A
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 17:23:19 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z7so1721108lfd.5
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 17:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qdeLCRQNx93p7KXnnXp7pVWMHGb2Aan+xzQMuMpfLuc=;
        b=KtTFu3obYd+2Wuiod7MhzCP/71wWAPzmCO7htBRVUPCmp/FqNaKBg8SExZEmBV/GJW
         EAAHrNgJefOqwlcctKQoWP9RP+stvITagdOrNiMDYR/zoAHzfo/QLC2OUoI/vJmGrvQB
         KFa7i9UZsphY53DhdJNkPGQEWWUasOodFGmd4O0QRHmb6c45RuuFAOb76UMbOWXvNcLB
         pvgbl2KvglicattGFZbH+rRzk1xG1ZhAYfSNpl+Nl/LEqhkTZ0JZ09QPpp6FVYH5x5K6
         ybJ0bipD8MkNaAhJUKXiNG5cXHDz0cFp9zRdFtwPZJtfK0JFELKsld+FhLD/ZD4sznUA
         OG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qdeLCRQNx93p7KXnnXp7pVWMHGb2Aan+xzQMuMpfLuc=;
        b=p2pJtKQ9vyBKQ+7Iur/E7Dxk7Zz0OlCbtM83y8evbNTQQu3f63Kv3y8LAjaZYUKnec
         3y/ns3kW8f/WsDIjCkshIBCNq3SHEYXrSMTZ1pfd2jt9tmdOzXDnB/Wz3DRQAOFRufHT
         NX2pjLmv+xyARfGuD3I/jFjqDRJkf96x7duFLDkuOjuQJqptbX9dwBVFD+id4MtxciC8
         j5264ZT4qtniV4gj87Db2rlmTIni1F+mBJ/uV3x7wf5zVF82pA9b+HRRj4PK4w8Imsn3
         VTeASPBOxWS55FNHgGfjwI5D2doWsxPQdDdnQBKwY66oM3IZz6L3trRH6/9OGDL49TME
         cyAA==
X-Gm-Message-State: AOAM531X2MGakX3ss12WJvKA0tSpJINAXl6IIpk/AuqU37HphyNNLPBF
        /b/x8S2HSYQss15qBOB4oLV9dcZULAtKcILrxF4kKQ==
X-Google-Smtp-Source: ABdhPJz3/bDxbj0h3gPjjr2oxsV0RNgVgq1Du7S3XCjwLMWtmr5teSUTbDYXiQgl47snmj6f6vTwjFNcadodn18KXyo=
X-Received: by 2002:a05:6512:6c6:: with SMTP id u6mr3555998lff.347.1616026997164;
 Wed, 17 Mar 2021 17:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <YFEeWD7LMPYngtbA@osiris> <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris> <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
 <YFIfjPzLzeJKs3hE@osiris> <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
 <YFJqJeMDc/JCjfSv@osiris> <YFJwZoUalBM/lBBr@osiris> <CALvZod6EEyqyQD_AvcyTfxj+f0M+X1D1b50HWdaqL1qX69iaMQ@mail.gmail.com>
In-Reply-To: <CALvZod6EEyqyQD_AvcyTfxj+f0M+X1D1b50HWdaqL1qX69iaMQ@mail.gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 17 Mar 2021 17:23:04 -0700
Message-ID: <CALvZod5QjGy+WDOX=2mLB4ZgaRLk4kSu3y8ge+YqfHDacF2kKQ@mail.gmail.com>
Subject: Re: [BUG -next] "memcg: charge before adding to swapcache on swapin" broken
To:     Heiko Carstens <hca@linux.ibm.com>,
        Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Juergen Christ <jchrist@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

CC: Minchan

On Wed, Mar 17, 2021 at 2:39 PM Shakeel Butt <shakeelb@google.com> wrote:
>
> On Wed, Mar 17, 2021 at 2:11 PM Heiko Carstens <hca@linux.ibm.com> wrote:
> >
> > On Wed, Mar 17, 2021 at 09:44:21PM +0100, Heiko Carstens wrote:
> > > On Wed, Mar 17, 2021 at 08:44:14AM -0700, Shakeel Butt wrote:
> > > > > Config below. And the fun thing is that I cannot reproduce it today
> > > > > anymore with the elfutils test case - what _seems_ to be different is
> > > > > that the test suite runs much faster than yesterday evening. Usually
> > > > > an indication that there is no steal time (other guests which steal
> > > > > cpu time), which again _could_ indicate a race / lack of locking
> > > > > somewhere.
> > > > > This is kind of odd, since yesterday evening it was very reliable to
> > > > > trigger the bug :/
> > > > >
> > > >
> > > > Thanks for the config. One question regarding swap, is it disk based
> > > > swap or zram?
> > >
> > > Swap device is a real disk.
> > >
> > > > By guests, do you mean there was another significant workload running
> > > > on the machine in parallel to the tests?
> > >
> > > That I don't know. I didn't check. I still can't reproduce with
> > > elfutils anymore, however...
> > >
> > > > If you don't mind can you try swapping01 as well.
> > >
> > > ltp's swapping01 test triggers immediately random processes being
> > > killed with SIGSEGV. I also tested with linux-next 20210316 and _only_
> > > "memcg: charge before adding to swapcache on swapin" being reverted on
> > > top, and the problem is away - so it looks like the result of
> > > yesterday's bisect is indeed valid.
> >
> > I have to correct myself, actually the system has both: a real disk
> > _and_ zram as swap devices:
> >
> > # swapon -s
> > Filename                                Type            Size    Used    Priority
> > /dev/dasdb1                             partition       21635084        0       -2
> > /dev/zram0                              partition       1014780 0       100
> >
> > When I disable /dev/zram with "swapoff /dev/zram0" the problem is away
> > as well, even with your patch applied.
>
> Thanks a lot. This was really helpful. I will try with zram on my setup.
>
> Can you also try with just one type of swap at the time for both? I
> really appreciate your help.

Never mind I think I found the issue. Can you please add
set_page_private(page, entry.val) before swap_readpage(page, true) in
function do_swap_page() in mm/memory.c and try the swapping01 test
again?

Michan, for SWP_SYNCHRONOUS_IO swap, do we ever reset page->private?
Normally for swapcache pages, it gets reset on delete from swap cache
but these types of swap skips swapcache, so, I think we never reset
page->private.

The simplest solution I can think of is to do set_page_private(page,
entry.val) before swap_readpage(page, true) and set_page_private(page,
0) after.
