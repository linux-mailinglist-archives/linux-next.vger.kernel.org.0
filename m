Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A6533F49E
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 16:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhCQPw2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 11:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbhCQPv4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 11:51:56 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D7CC061762
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 08:51:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m22so3720298lfg.5
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aTfBh90JXwGff2ZxWuiB3veslzipZjcqWGXtv4mEtkg=;
        b=aefOe8HrK+8l5069etTdhgpdpsTxNKmQ5waNWpfBPc4Vp2tSQ3WYhPKRFUSgm9ctwQ
         WBvCIVuGft3X7461mvj3J+OE0goxWYt7Y1uGsDY0JXTht2umVSP0lcKRIF2B3d5EhXAG
         sxjCber5jF8JJ6zwYaZFATyR+IVEz0lafZkt8tGZvr448ISoGI/dg4+BS+G8QGrIbgx1
         RUwVsvgbKzGswjnORvduCk0WVKYr+aVE00ayw9Oq63fmaaKER4YBLKpat98CmPwNnSFT
         A+5MN0OCtWsTUFacitZqngcNZpgqqYpfNgpKK5vh8qLODjBLoU0Tvr1OWxGt9TAi8MDC
         Xv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aTfBh90JXwGff2ZxWuiB3veslzipZjcqWGXtv4mEtkg=;
        b=Apj1JNP2RNNUGxEe2JoJNtwWbElBO7Npkju2g0+u8qMeT4hiaQuYALu8bUhXOYnz4A
         2QK30A2I/T6XAKfSO7UGf4FCpTuMqh0p6t2fmmVzCmiSDDaIqbvwY7WWq1tvCPe1Scfc
         8dd4d9txIMhPpq5h1xSsgUabjDwLdETwgirckHYCxp2NivR+kmclnZfn47fTpDs2Dby5
         Uc5VVAxlGqddhBu77+w3qC4Si5UMjGH/pqzq1bEkO3I8pOjF9m6/pFOrMXTO38dUKQrh
         EML6uSKm9BJKqdDMvoA4jwa9c6CaIZcWlB9uons1rZDtPi1qAC4th23nSc21uNL3z5B5
         fSag==
X-Gm-Message-State: AOAM530mzhYTg6BUBkHujaP5+nt/Z/6aPGngtVMlqUbp1Y6f5GOi5LNv
        36UT/zvNlpLdPUybg8yVThDHwy9VmeSWfidizYcsklcFLt0Xhw==
X-Google-Smtp-Source: ABdhPJx84cgIxdrUA6ixcUNb6dqmqL7iG5H4YThlUdttX0FkCh+i1V/VAjXiflzPjfe8qHFYLEKRhq3nFvH9+kME+mQ=
X-Received: by 2002:a19:ee19:: with SMTP id g25mr2618624lfb.83.1615995866698;
 Wed, 17 Mar 2021 08:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <YFEeWD7LMPYngtbA@osiris> <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris> <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
 <YFIfjPzLzeJKs3hE@osiris>
In-Reply-To: <YFIfjPzLzeJKs3hE@osiris>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 17 Mar 2021 08:44:14 -0700
Message-ID: <CALvZod6GxjppjNuX5BQD+2WwWsdOcDqbKmCy6XGJyBsT_p2SxA@mail.gmail.com>
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

On Wed, Mar 17, 2021 at 8:26 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Wed, Mar 17, 2021 at 06:33:24AM -0700, Shakeel Butt wrote:
> > > Ah, sorry. This is the s390 output for exception-traces. That is if
> > > /proc/sys/debug/exception-trace is set to one, and a process gets
> > > killed because of an unhandled signal.
> > >
> > > In this particular case sshd was killed because it tried to access
> > > address zero, where nothing is mapped.
> > >
> > > Given that all higher registers are zero in the register dump above my
> > > guess would be this happened because a stack page got unmapped, and
> > > when it got accessed to restore register contents a zero page was
> > > mapped in instead of the real old page contents.
> > >
> > > We have also all other sorts of crashes in our CI with linux-next
> > > currently, e.g. LTP's testcase "swapping01" seems to be able to make
> > > (more or less) sure that the init process get's killed (-> panic).
> >
> > I have tried the elfutils selftests and swapping01 on x86_64 VM and I
> > am not able to reproduce the issue. Can you give a bit more detail of
> > the setup along with the config file? I am assuming you are not
> > creating cgroups as these tests do not manipulate cgroups. Also is the
> > memory controller on your system on v1 or v2?
> >
> > I am fine with dropping the patch from mm-tree until we know more
> > about this issue.
>
> This is a Fedora 33 system with 2 CPUs, 2 GB memory and 20 GB swap
> space (yes...).
>
> It should be cgroups v2:
>
> # mount
> ...
> cgroup2 on /sys/fs/cgroup type cgroup2 (rw,nosuid,nodev,noexec,relatime,seclabel,nsdelegate)
>
> Config below. And the fun thing is that I cannot reproduce it today
> anymore with the elfutils test case - what _seems_ to be different is
> that the test suite runs much faster than yesterday evening. Usually
> an indication that there is no steal time (other guests which steal
> cpu time), which again _could_ indicate a race / lack of locking
> somewhere.
> This is kind of odd, since yesterday evening it was very reliable to
> trigger the bug :/
>

Thanks for the config. One question regarding swap, is it disk based
swap or zram?

By guests, do you mean there was another significant workload running
on the machine in parallel to the tests?

If you don't mind can you try swapping01 as well.
