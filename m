Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E797733F136
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 14:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhCQNdn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 09:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbhCQNdj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 09:33:39 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A43C06174A
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 06:33:38 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s13so2255109lfb.2
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPa9rDa49UNNnQMdwv/eJ8utZNtZAg0Q98cQ0MWyQlI=;
        b=lwK7MsEvMqy4KvVa1Tn9DSU+5SlncjOC9miTC+98wKxArloBqN/YSoAVyPzzzig/Ba
         Ll6pIL8lrA72BBkyX4z7w3nDyfKpEt0/fvQs2y9PPDxvm5JgePvUn9DhZTyYHJfg+vVD
         un4DZ2CR40sJD+qtyMLLXzuCk3flzDBkm62JdTZVNMVHuhg3oSwHMVOQaaiU3cByu5ad
         FYOlOGuxxfDZg1N1ImDP8yd9xyX5ApfqXlAw5f+T8bbA2vbgpIHF89RoUEDmj5fkwIGu
         fQ9YwjeUhKLOURmA5bHOdcmlRx89T4f5nzYuCQ8jIBlTcd1rbvvHluXXLeZmn/Ew2po6
         0MmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPa9rDa49UNNnQMdwv/eJ8utZNtZAg0Q98cQ0MWyQlI=;
        b=VJL7kq6Kc1sqtPPGBHH3nfbxPFD9GjN9bUM9VXPsTOHkO1X0JkCiOmBjsCMjOBGACc
         B37NcxZn8tP6TJUQv4nYalE6fbpwlbeRMMY4owSEHOIE0Q3D4nwioa/H74g88aZNRMCh
         y77lXrWQ+G1B+WLUmXSIN6YAWYT/vq4o74Y2gA+bkBa8qWSuCzjweeJiXMOQBxyfjaFQ
         f26j0JY0Bdpi+Gui5hv/hGH4D9MQuxydL0N3obJ9PqemuTQi+Gz9QV8i/xp3noBzgUdE
         lvgO85j20T1ORUzjTSd4GzYGlv31L/kUF5WZ54OSdspQi3cky0jiUUd/EDqV6ROAyFfo
         4OIQ==
X-Gm-Message-State: AOAM531ZLtt1BZ5pymC2ev3+rMK0wC2v+/5YAlTP/Smdg7tSJBu9XwXo
        cZGC9ahEpVQOYHkLN+tQXQsRqFk/7mRjjaqZVfkBnA==
X-Google-Smtp-Source: ABdhPJx0KbjNeKjr4XlvLNYsA7PvXKn9q0aM3+HA9JqVeBbsfrOhJe3lVT3QXsfFWnA/WNkVKG4M2NYSqf1FfJu4wKs=
X-Received: by 2002:a05:6512:6c6:: with SMTP id u6mr2269739lff.347.1615988017179;
 Wed, 17 Mar 2021 06:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <YFEeWD7LMPYngtbA@osiris> <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
 <YFFRcPUtddlIB21l@osiris>
In-Reply-To: <YFFRcPUtddlIB21l@osiris>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 17 Mar 2021 06:33:24 -0700
Message-ID: <CALvZod5k5wgE-d=U=thhQp5bwQ6t0ugKDtZj75qSSYVB27uCuQ@mail.gmail.com>
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

On Tue, Mar 16, 2021 at 5:46 PM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> Hi Shakeel,
>
> > > your commit 3a9ca1b0ac0f ("memcg: charge before adding to swapcache on
> > > swapin") in linux-next 20210316 appears to cause user process faults /
> > > crashes on s390 like:
> > >
> > > User process fault: interruption code 003b ilc:3 in sshd[2aa15280000+df000]
> > > Failing address: 0000000000000000 TEID: 0000000000000800
> > > Fault in primary space mode while using user ASCE.
> > > AS:00000000966b41c7 R3:0000000000000024
> > > CPU: 0 PID: 401 Comm: sshd Not tainted 5.12.0-rc3-00048-geba7667a8534 #10
> > > Hardware name: IBM 8561 T01 703 (z/VM 7.2.0)
> > > User PSW : 0705000180000000 0000000000000000
> > >            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:1 AS:0 CC:0 PM:0 RI:0 EA:3
> > > User GPRS: 0000000000000000 fffffffffffff000 0000000000000001 000002aa157b88f0
> > >            000002aa157c43c0 0000000000000000 0000000000000000 0000000000000000
> > >            0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > >            0000000000000000 0000000000000000 0000000000000000 0000000000000000
> > > User Code: Bad PSW.
> >
> > Thanks for the report. Can you please explain a bit what the above report tells?
>
> Ah, sorry. This is the s390 output for exception-traces. That is if
> /proc/sys/debug/exception-trace is set to one, and a process gets
> killed because of an unhandled signal.
>
> In this particular case sshd was killed because it tried to access
> address zero, where nothing is mapped.
>
> Given that all higher registers are zero in the register dump above my
> guess would be this happened because a stack page got unmapped, and
> when it got accessed to restore register contents a zero page was
> mapped in instead of the real old page contents.
>
> We have also all other sorts of crashes in our CI with linux-next
> currently, e.g. LTP's testcase "swapping01" seems to be able to make
> (more or less) sure that the init process get's killed (-> panic).

I have tried the elfutils selftests and swapping01 on x86_64 VM and I
am not able to reproduce the issue. Can you give a bit more detail of
the setup along with the config file? I am assuming you are not
creating cgroups as these tests do not manipulate cgroups. Also is the
memory controller on your system on v1 or v2?

I am fine with dropping the patch from mm-tree until we know more
about this issue.
