Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D850C3B1BB1
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 15:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhFWN6T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 09:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbhFWN6S (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 09:58:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7804C061574
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 06:56:00 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id s22so3110774ljg.5
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1f+5SV/sKKdVD+KkZH0IXa6QMqcFSI8JGYCiF1TdD4k=;
        b=dBTP92imt0I9HU+05kls9sQhXxMKLcysBBwH+S4miexo3dqJyu+O+rQynNCgaX0qdm
         eNPI+YUE0oApsiGFtxNHOpXVnRmJS5miXMCAGHXVM8wmxqDMV7gj3eBgohN9RLeCGC9P
         49YJ1XlgShyegR64ROQ7iLwhFZ91jWP5BTcJdyWzYgIznVd05+5H5YHy3hUWHRZV/wmL
         IWGvSS0mzQOYseCSV5uVWAtmZFvzYKVVyQDvG3I0lBJkJFiZWTUpMWXkltpwtLOtsy9c
         jESTDl3aZ8tl/nRmvr5gfs+qDttx04H/Kf+Y1+oMB1rBrNw2gofObjYCgkVyr2zimNVm
         5Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1f+5SV/sKKdVD+KkZH0IXa6QMqcFSI8JGYCiF1TdD4k=;
        b=BhGb0SicsGAh1x6sqwmHn40/tfNSLWJetQq73kLiovGkxZK4HM/2qyeRoS2G3PWgYM
         mU+DbLBcnIGOlfEaRZoqfD6i1vZ1WWCxEfBJqmR33gFWlF91j0twQD/Ds3QOnbcVV+Sz
         4LV5jQquZaYEQ5wMC2T4+Pez2O6Sjx1Gg+eD7/zRXKeq+GG4qibMEZw7bcDJDCri8CkJ
         /ZV993gomI+IwRZ26rGJ+tTgwiE9xc1ajTlEsLpHZ5YZxcQNrExcjpX1VnLiRKXvOrYl
         JNFbvTvfTNayzs5yr4yPYAGsNCO4DaUMv3rs8sBrIXWRGilTiWdDRIkUQbSYX5baZ2mF
         wnVw==
X-Gm-Message-State: AOAM530S+On51N58ESO3hZ8/p5FYwUfp5SQWwNcxIvWG7Xo02sbmAPfv
        uuUt+/KWr3UmerM4zdaFnoPftCbaMbaxlyZp/Rx7lg==
X-Google-Smtp-Source: ABdhPJxlUoNcCWDmNAtxOnwl+M5yGlxw6Qr0+aRWuR5aZ7bwSqa9mI0ZgpmUj6tJ5fQ0P8MVzLExn4R+QzuICDbg4K4=
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr7799901lji.209.1624456559281;
 Wed, 23 Jun 2021 06:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book> <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book> <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com> <20210623120835.GB29143@vingu-book>
 <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
 <CAKfTPtB++3y4VnbKE_n=bgsqCfqXuF0KUsdB_cFhi9xAnMRubw@mail.gmail.com> <CAFpoUr3bHzrwvumw6R=2JVbKa_wmtT9cMf-mdDHxY0Png-N9Jw@mail.gmail.com>
In-Reply-To: <CAFpoUr3bHzrwvumw6R=2JVbKa_wmtT9cMf-mdDHxY0Png-N9Jw@mail.gmail.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 23 Jun 2021 15:55:47 +0200
Message-ID: <CAKfTPtAev0VgCmK3AUyTCoVA38YmskpB98q0kTrbEPK6e=1dTA@mail.gmail.com>
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

On Wed, 23 Jun 2021 at 14:37, Odin Ugedal <odin@uged.al> wrote:
>
> ons. 23. jun. 2021 kl. 14:22 skrev Vincent Guittot <vincent.guittot@linaro.org>:
> >
> > In theory it should not because _sum should be always larger or equal
> > to _avg * divider. Otherwise, it means that we have something wrong
> > somewhere else
>
> Yeah, that might be the case. Still trying to wrap my head around
> this. I might be wrong, but isn't there a possibility
> that avg->period_contrib is increasing in PELTs accumulate_sum,
> without _sum is increasing. This makes the pelt divider increase,
> making the statement "_sum should be always larger or equal to _avg *"
> false? Or am I missing something obvious here?

The pelt value of sched_entity is synced with  cfs and its contrib
before being removed.
Then, we start to remove this load in update_cfs_rq_load_avg() before
calling __update_load_avg_cfs_rq so contrib should not have change and
we should be safe

>
> Still unable to reproduce what Sachin is reporting tho.
>
> Odin
