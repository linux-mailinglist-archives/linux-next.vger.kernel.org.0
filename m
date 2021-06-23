Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54E53B1FA2
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 19:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhFWRkT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 13:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhFWRkS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 13:40:18 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4D4C061574
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 10:38:00 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id g4so7314025qkl.1
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uged.al; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5o1VpdMcZrmQnyC6VaIuCe6zHlh4bhQF/lUKDsspdg=;
        b=uyCNzWi7QuYZIzhGrc5Gb0sdMjZK3o6D0PuYZzJifbcz5wgi1WYMMQLGlIjgLaTWiV
         Y4aa2KgTJlvAvMQgmqyviyjzKaEw0jufgBBV0MDw9vzaM9Nm4/BsgAmh0UmIq5qmRIVy
         iyjfe0Ng8PLGeYGk/YSVvr9pWYTZhy7WC/hqAWcRnXRZE1WQPk4VgRskrvGwvNKXusZ6
         b8mwxVPmkgqS0o8quY79rwRVrItOcHsvvrvnr7DBPQXwCW4lqX1En11ySqqyjWAaxLyp
         h2WPhz0s73bmvf73nVMXj6PPZv9uYKZleOl7R/tkmOjDmAT8zD5eKrJtiOqLI/E/rNkM
         mSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5o1VpdMcZrmQnyC6VaIuCe6zHlh4bhQF/lUKDsspdg=;
        b=foAQ9aaDAb7L5TOrfw2AL+gMsgkc8Lme/Hg+uVCWQeytA9fuIyHRG4wY0LOS0tiRIJ
         DMySGppqxoMj2x1NbFf/FQX6uLeVqnzx0ZcqPogfpzQUCziGmVgWHK69T+kVooCxiti0
         b+QKF7R/y10vV8GaqPXkwLo9huqMLwAgDTDUlQDDvmaGtb0HmjVEctBvvNT8u64Zaatc
         oLvT+Rye6Ec0c9TeTYq035yPxGxMcrNshe+85QClQ9ybuG19A0PGtA16wG2Qvq+ZUYfJ
         C6dSZ+WwVGMAZTgc+RH1/05WS7vOaTHvFKed10G4mH1oS++XyCndJ3Ob5adMYP/If3t2
         Nb9w==
X-Gm-Message-State: AOAM530H1DVu3iPsOwy8io2Wqqjk1/+OBzaRjlD26uBX5EdUgDyicZIk
        4GmjRgdaCMfQUM/1zpBu5tAxsT5slTxp7Gge4sIrkA==
X-Google-Smtp-Source: ABdhPJyS501FUMJKU2Fd8GSeFaTNJquoa/D16LPwAed/qRy5fatTpVdAvkwHb8W/LsdshZn6oTNpuwnYHJodG440fwc=
X-Received: by 2002:ae9:dd06:: with SMTP id r6mr1270322qkf.74.1624469879194;
 Wed, 23 Jun 2021 10:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book> <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book> <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com> <20210623120835.GB29143@vingu-book>
 <5D874F72-B575-4830-91C3-8814A2B371CD@linux.vnet.ibm.com> <CAKfTPtBKn27=jryS_sxsVb+0yHDze_PMcLuyFtDkDo0H9Nzqww@mail.gmail.com>
 <CAKfTPtDFUBe+qD9z0YYb7yyup_mhdNNX+zopFwcnyh+G41viAw@mail.gmail.com>
In-Reply-To: <CAKfTPtDFUBe+qD9z0YYb7yyup_mhdNNX+zopFwcnyh+G41viAw@mail.gmail.com>
From:   Odin Ugedal <odin@uged.al>
Date:   Wed, 23 Jun 2021 19:37:23 +0200
Message-ID: <CAFpoUr1kLf3knmVG4HjPaOLzbs0bz+YpRf_uno233ZPO9xxCdQ@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Odin Ugedal <odin@uged.al>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

ons. 23. jun. 2021 kl. 19:27 skrev Vincent Guittot <vincent.guittot@linaro.org>:
>
> On Wed, 23 Jun 2021 at 18:55, Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Wed, 23 Jun 2021 at 18:46, Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
> > >
> > >
> > > > Ok. This becomes even more weird. Could you share your config file and more details about
> > > > you setup ?
> > > >
> > > > Have you applied the patch below ?
> > > > https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/
> > > >
> > > > Regarding the load_avg warning, I can see possible problem during attach. Could you add
> > > > the patch below. The load_avg warning seems to happen during boot and sched_entity
> > > > creation.
> > > >
> > >
> > > Here is a summary of my testing.
> > >
> > > I have a POWER box with PowerVM hypervisor. On this box I have a logical partition(LPAR) or guest
> > > (allocated with 32 cpus 90G memory) running linux-next.
> > >
> > > I started with a clean slate.
> > > Moved to linux-next 5.13.0-rc7-next-20210622 as base code.
> > > Applied patch #1 from Vincent which contains changes to dequeue_load_avg()
> > > Applied patch #2 from Vincent which contains changes to enqueue_load_avg()
> > > Applied patch #3 from Vincent which contains changes to attach_entity_load_avg()
> > > Applied patch #4 from https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/
> > >
> > > With these changes applied I was still able to recreate the issue. I could see kernel warning
> > > during boot.
> > >
> > > I then applied patch #5 from Odin which contains changes to update_cfs_rq_load_avg()
> > >
> > > With all the 5 patches applied I was able to boot the kernel without any warning messages.
> > > I also ran scheduler related tests from ltp (./runltp -f sched) . All tests including cfs_bandwidth01
> > > ran successfully. No kernel warnings were observed.
> >
> > ok so Odin's patch fixes the problem which highlights that we
> > overestimate _sum or don't sync _avg and _sum correctly
> >
> > I'm going to look at this further
>
> The problem is  "_avg * divider" makes the assumption that all pending
> contrib are not null contributions whereas they can be null.

Yeah.

> Odin patch is the right way to fix this. Other patches should not be
> useful for your problem

Ack. As I see it, given how PELT works now, it is the only way to
mitigate it (without doing a lot of extra PELT stuff).
Will post it as a patch together with a proper message later today or tomorrow.

>
> >
> > >
> > > Have also attached .config in case it is useful. config has CONFIG_HZ_100=y
> >
> > Thanks, i will have a look
> >
> > >
> > > Thanks
> > > -Sachin
> > >

Thanks for reporting Sachin!

Thanks
Odin
