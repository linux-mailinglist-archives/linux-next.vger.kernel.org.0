Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2758D3B19D0
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 14:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhFWMYu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 08:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbhFWMYt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 08:24:49 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A7CC061574
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 05:22:31 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c11so2708118ljd.6
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K1M8efwheuUHkGZYU3icVERiMojYbNdJd5fKUwXRZZM=;
        b=PqWSqBB5OILmf2SkzmT/83btBuqlUDrfdW0JVaEvkWsBEwZrXgtzrqkG5Y59t4gC+L
         1MWQdFS2G6czzHAeq8rheCjGmBWK4wgOIf9feB7XSPbPYq043gM4yN6bAurum7o65wOy
         QRVT7ZPPrUzTjEt78fxI/bzYLbsnux5gf9K80cS0N7kEn1Qb48B5Qu/KDk7k3BVNZLI8
         NBrpRP1Z4o+h5bECZiw2JVXKf7/0sh8BqiARZvqzv8jaTu7/iFfcRXn/QRqio2CwU1kI
         j4JqqO8rfFyoR3p4Y8CedFElWkPcqNzM3QQ3n5fS+baaeJB+/SbdcTVHwKHUczpy8FRS
         v61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K1M8efwheuUHkGZYU3icVERiMojYbNdJd5fKUwXRZZM=;
        b=cTCWm1l64A+V/IBNaYTEVQ2MpZO5u5RuxCH6zfqf8akEdeWx92K8HApLKdokGHY+oR
         23GOViPduWQP4g09Goh5wnAl7zhiUdb58ZhKwpruu9axys+lR6XuvF3SNj4Q00kZKQJY
         9D+h4wS8DrfZOPWgU5v4ndMnSSA0Xs/6ERXtfIaOieVXgwwWWoWgzY0wYdwziiZnKb4U
         lguBFA/eua0ImdvUw15Ih6W1wu9oZqiNqw2yn392ii8hnTgZS0yKrXa7oIFQimctO3I7
         ca+fBcLNCZGTujJaqJ4a7rQbrqCGlP5Z8srSCjU4ZjabG6erFiktoQueB+SIPYxdq6tD
         W+wA==
X-Gm-Message-State: AOAM531wuZMmzFJgmJpg9u80PtEKhwV6SmbqYji6PMIMaQIqsDJcwBlM
        6vkryYltI3OPZO3QKAtgGscVi3246t2kK801ctEgPsIrN8I=
X-Google-Smtp-Source: ABdhPJys7dUDWpg23GwyoqW1L85DcIlBG3yos1lJ32xXK/Xr6ViKTW93rMdD7TS5GB03m2YLXKEaJjFMP4jOp8CLzGI=
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr7469454lji.209.1624450949701;
 Wed, 23 Jun 2021 05:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book> <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book> <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com> <20210623120835.GB29143@vingu-book>
 <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
In-Reply-To: <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 23 Jun 2021 14:22:18 +0200
Message-ID: <CAKfTPtB++3y4VnbKE_n=bgsqCfqXuF0KUsdB_cFhi9xAnMRubw@mail.gmail.com>
Subject: Re: [powerpc][next-20210621] WARNING at kernel/sched/fair.c:3277
 during boot
To:     Odin Ugedal <odin@uged.al>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 23 Jun 2021 at 14:18, Odin Ugedal <odin@uged.al> wrote:
>
> Hi,
>
> Wouldn't the attached diff below also help when load is removed,
> Vincent? Isn't there a theoretical chance that x_sum ends up at zero
> while x_load ends up as a positive value (without this patch)? Can
> post as a separate patch if it works for Sachin.

In theory it should not because _sum should be always larger or equal
to _avg * divider. Otherwise, it means that we have something wrong
somewhere else

>
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index bfaa6e1f6067..def48bc2e90b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -3688,15 +3688,15 @@ update_cfs_rq_load_avg(u64 now, struct cfs_rq *cfs_rq)
>
>                 r = removed_load;
>                 sub_positive(&sa->load_avg, r);
> -               sub_positive(&sa->load_sum, r * divider);
> +               sa->load_sum = sa->load_avg * divider;
>
>                 r = removed_util;
>                 sub_positive(&sa->util_avg, r);
> -               sub_positive(&sa->util_sum, r * divider);
> +               sa->util_sum = sa->util_avg * divider;
>
>                 r = removed_runnable;
>                 sub_positive(&sa->runnable_avg, r);
> -               sub_positive(&sa->runnable_sum, r * divider);
> +               sa->runnable_sum = sa->runnable_avg * divider;
>
>                 /*
>                  * removed_runnable is the unweighted version of
> removed_load so we
