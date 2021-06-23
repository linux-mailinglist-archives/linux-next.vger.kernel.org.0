Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441F93B1F6C
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 19:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFWR3i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 13:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhFWR3i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 13:29:38 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE7AC06175F
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 10:27:20 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a16so3990536ljq.3
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 10:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q2d2sQHy0KntFj7PyfcvDTPhCqiaY/wl1GYeGVevyXY=;
        b=cPVdN6PDfWFEKRnik7cWwwE2fuQoRkEUgYdGwM27Vslnjn6NScjASeLKUvFlLUy1fa
         YXUAtS1SSrQbJJQlZ2efFgnnrPWZiW04wQ7FvzRE38YrO12OoZGIOklD5hkfp6MB68OA
         SfQUOdH7RhRTnUfD/jg5jAIXBApRwAtdcgh895kz/BsXk26Ga/0j5nPYOctu/Pw5UgmT
         1JMpZBvjggPUqdlW5aZtJUx5D0OCzO0zs8ct+cEbq/aIBxEevuysksboegpZhScn9etZ
         e7FZI6h13VkR/pzJv64UlKW7uEqGqSAcjFBGzC2s/TeO0Sza0buUk/FtfmJo2PWSVNKE
         hW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q2d2sQHy0KntFj7PyfcvDTPhCqiaY/wl1GYeGVevyXY=;
        b=NZZstAMy6waKwAgDPFE0yfAaU3Y1kKenei3yG0inf3d1itImjMp14J7hs0643+cRuR
         1lzCnRRe/3ZlNxON2wvEslLCJEzCK24mWNWZucj/+DvsxWVw2KzK+49XHxQ4TfzewXkO
         fwl43R6wGJbOO7TjWCS8REge8l1T6lHxi0mAQ2L5fE3FdFeVvBX4AX4+Oph0hVEoZJ/S
         BE+rQo+uwwWzp6OCB/K8fMWKnMbB3S83VT3WAPQ6RhZBzXtaUwWKF2sHxQO6sdb/7dWq
         yIOIxhmOedV3zUeoRol1E6EUCNg3HVlzOpOf5XDcKkEM51FoBSuHNPXBII3lyUHDWJ2w
         04Bw==
X-Gm-Message-State: AOAM532ZBNoINSs0nsdcd1UpjUBsHcVOEQBSiYn0Kr/jcvsC4Im9B0ra
        I05/CzDACA2zLut3j88i67cXDHYdqleIgFe/Yd/HwA==
X-Google-Smtp-Source: ABdhPJyc3ed/8kGPnbAGbdKUWTuzqOmrBvOtjBG7eXcy78/JpI6wipxa14CPu+ThHwFHhGlwP4yOZgSH2Lml/drFtZg=
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr585757lji.209.1624469238388;
 Wed, 23 Jun 2021 10:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book> <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book> <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com> <20210623120835.GB29143@vingu-book>
 <5D874F72-B575-4830-91C3-8814A2B371CD@linux.vnet.ibm.com> <CAKfTPtBKn27=jryS_sxsVb+0yHDze_PMcLuyFtDkDo0H9Nzqww@mail.gmail.com>
In-Reply-To: <CAKfTPtBKn27=jryS_sxsVb+0yHDze_PMcLuyFtDkDo0H9Nzqww@mail.gmail.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 23 Jun 2021 19:27:07 +0200
Message-ID: <CAKfTPtDFUBe+qD9z0YYb7yyup_mhdNNX+zopFwcnyh+G41viAw@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>
Cc:     Odin Ugedal <odin@uged.al>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 23 Jun 2021 at 18:55, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Wed, 23 Jun 2021 at 18:46, Sachin Sant <sachinp@linux.vnet.ibm.com> wrote:
> >
> >
> > > Ok. This becomes even more weird. Could you share your config file and more details about
> > > you setup ?
> > >
> > > Have you applied the patch below ?
> > > https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/
> > >
> > > Regarding the load_avg warning, I can see possible problem during attach. Could you add
> > > the patch below. The load_avg warning seems to happen during boot and sched_entity
> > > creation.
> > >
> >
> > Here is a summary of my testing.
> >
> > I have a POWER box with PowerVM hypervisor. On this box I have a logical partition(LPAR) or guest
> > (allocated with 32 cpus 90G memory) running linux-next.
> >
> > I started with a clean slate.
> > Moved to linux-next 5.13.0-rc7-next-20210622 as base code.
> > Applied patch #1 from Vincent which contains changes to dequeue_load_avg()
> > Applied patch #2 from Vincent which contains changes to enqueue_load_avg()
> > Applied patch #3 from Vincent which contains changes to attach_entity_load_avg()
> > Applied patch #4 from https://lore.kernel.org/lkml/20210621174330.11258-1-vincent.guittot@linaro.org/
> >
> > With these changes applied I was still able to recreate the issue. I could see kernel warning
> > during boot.
> >
> > I then applied patch #5 from Odin which contains changes to update_cfs_rq_load_avg()
> >
> > With all the 5 patches applied I was able to boot the kernel without any warning messages.
> > I also ran scheduler related tests from ltp (./runltp -f sched) . All tests including cfs_bandwidth01
> > ran successfully. No kernel warnings were observed.
>
> ok so Odin's patch fixes the problem which highlights that we
> overestimate _sum or don't sync _avg and _sum correctly
>
> I'm going to look at this further

The problem is  "_avg * divider" makes the assumption that all pending
contrib are not null contributions whereas they can be null.

Odin patch is the right way to fix this. Other patches should not be
useful for your problem

>
> >
> > Have also attached .config in case it is useful. config has CONFIG_HZ_100=y
>
> Thanks, i will have a look
>
> >
> > Thanks
> > -Sachin
> >
