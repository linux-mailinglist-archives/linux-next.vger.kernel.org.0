Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B9733FA87
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 22:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhCQVkU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 17:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbhCQVkN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 17:40:13 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4778C06174A
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 14:40:12 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o10so1192730lfb.9
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 14:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mu5e6+It/toze5nJGnhIyFS0VJ3FbuiNzP5J0FSxmiM=;
        b=DExLC+oYUenazcr0dKVDGwfYs4fAuUS8PyKvtqHRLy0vitmoMWLq5mtJJGCC17fHKU
         /gPuDO0l+PheRgNSVvs1q8yy5O0fhQIY01LMhruronV2BfshPA+OHTmgH5qK/KcbJFii
         ezZ1Lh6uODmI6uKX+OtgAM3Xcw9SkAtJkXevxvcjKpLBIbdbhB8NddeenstoT0gl+n/4
         EP4fzxXsNgkPAO2vRQ5Q25J3NU9X/8UVIAgZpEZGzw9kN3O0LrIU9Iug3Lj11u6QLQG7
         l9s0+JClecd6FUc51BsqVLYFPv3qX1b7Sdpluw2VffiXMH2rEURXILi8/tePN2IVXxjo
         C/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mu5e6+It/toze5nJGnhIyFS0VJ3FbuiNzP5J0FSxmiM=;
        b=pRat3XajuRUrhKKVxVivjhJdfOYRH214+eD4zXgu19KiOYoQdWRCdgi5EjV5kiPEXT
         QLt9P5+Hva3s/6BGEwPcXwee4d2Ag90/CPIpKzVDuKnYHWzIF/3f8tmoYjx37VxzUf2+
         p1fe5Wsq/Tmr5VT6Wox753UTZigTZN82+2BM9mwBaphyQ58CCXBHluG/8ufsduM8qXMM
         Yz12wWPZ0dv4PmZnaR1J2mV2fLxFlBR/gd7EaZWRcpdVId3fjhZKvhXL0Lsuywlcv2uU
         c+CNpJMoX32ZBm3FNeiDR2Tp0JbJrNS4i1cWY775wDMXJ006ji/LxBzIFsFr3XZVTouZ
         taPg==
X-Gm-Message-State: AOAM532nR3ly0l36oSM7P25GwmsLozPnqC4Ebynb5kK12KWZ0jthMnYP
        9JiWNDEgCiigeQi3ZkaV12fSWKgYkwYEbQ2hWqFmBQ==
X-Google-Smtp-Source: ABdhPJxzzg2E6OLr9amBx/f+18p6p59ql3Wg/KVdN4jUu8TXJXogvqiL3IU0qvTFyjQDkMrvZVVGBjdIDrn/efRjrwI=
X-Received: by 2002:a19:c14a:: with SMTP id r71mr3357493lff.358.1616017211101;
 Wed, 17 Mar 2021 14:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <YFEeWD7LMPYngtbA@osiris> <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris> <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
 <YFIfjPzLzeJKs3hE@osiris> <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
 <YFJqJeMDc/JCjfSv@osiris> <YFJwZoUalBM/lBBr@osiris>
In-Reply-To: <YFJwZoUalBM/lBBr@osiris>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 17 Mar 2021 14:39:58 -0700
Message-ID: <CALvZod6EEyqyQD_AvcyTfxj+f0M+X1D1b50HWdaqL1qX69iaMQ@mail.gmail.com>
Subject: Re: [BUG -next] "memcg: charge before adding to swapcache on swapin" broken
To:     Heiko Carstens <hca@linux.ibm.com>
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

On Wed, Mar 17, 2021 at 2:11 PM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Wed, Mar 17, 2021 at 09:44:21PM +0100, Heiko Carstens wrote:
> > On Wed, Mar 17, 2021 at 08:44:14AM -0700, Shakeel Butt wrote:
> > > > Config below. And the fun thing is that I cannot reproduce it today
> > > > anymore with the elfutils test case - what _seems_ to be different is
> > > > that the test suite runs much faster than yesterday evening. Usually
> > > > an indication that there is no steal time (other guests which steal
> > > > cpu time), which again _could_ indicate a race / lack of locking
> > > > somewhere.
> > > > This is kind of odd, since yesterday evening it was very reliable to
> > > > trigger the bug :/
> > > >
> > >
> > > Thanks for the config. One question regarding swap, is it disk based
> > > swap or zram?
> >
> > Swap device is a real disk.
> >
> > > By guests, do you mean there was another significant workload running
> > > on the machine in parallel to the tests?
> >
> > That I don't know. I didn't check. I still can't reproduce with
> > elfutils anymore, however...
> >
> > > If you don't mind can you try swapping01 as well.
> >
> > ltp's swapping01 test triggers immediately random processes being
> > killed with SIGSEGV. I also tested with linux-next 20210316 and _only_
> > "memcg: charge before adding to swapcache on swapin" being reverted on
> > top, and the problem is away - so it looks like the result of
> > yesterday's bisect is indeed valid.
>
> I have to correct myself, actually the system has both: a real disk
> _and_ zram as swap devices:
>
> # swapon -s
> Filename                                Type            Size    Used    Priority
> /dev/dasdb1                             partition       21635084        0       -2
> /dev/zram0                              partition       1014780 0       100
>
> When I disable /dev/zram with "swapoff /dev/zram0" the problem is away
> as well, even with your patch applied.

Thanks a lot. This was really helpful. I will try with zram on my setup.

Can you also try with just one type of swap at the time for both? I
really appreciate your help.
