Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D95F3B1D96
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 17:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbhFWP1j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 11:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhFWP1j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 11:27:39 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA6BC061574
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 08:25:21 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j2so4746292lfg.9
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWN1jNVFh7vMLUtEdkRQtm2LdDMMDH1982Vnm5Q9SIM=;
        b=m1ekFegoNdrGbxt+7TUKRZ/VO3BsPXgL10cMuDLlUJZXZlwxqvY9tta1wja6faHjpO
         G+CQsu7pYz8vJsBsNcAkJfHrPuyQjGpNU2TBzSIk1HJI+7gj/Fieh4F/DHdx4grkDHY2
         kfB3jdFvWKJ5Qa8LlaVuIlB/pdKuslTtXhbRKqzqMdwGEbH/BcvapozB9bUnnoKNbkmN
         xZr+zY74/6TgBt3N/OUIF54UOm2aEg/kHc2SJSAdCYjf0tFL/lx/osWCfCizbWW73zpt
         sOgiwdiQwRLvQug8IYZDX5r53HI8H3DlUQD7b3NOx5njM+K+Ap1PgyfYJ1GFvoUpbq0Y
         jcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWN1jNVFh7vMLUtEdkRQtm2LdDMMDH1982Vnm5Q9SIM=;
        b=g4W1l7QRfi6dCoudpEq4EEeqz9pNzL952WOYnwQSPo96ELW0bk2dBXBl8zGnmxvnxT
         GHGMZRR/8sjYFwMZaLJJQ9vg+eSFQg57H+/9+YlVVjA9SVGxM65oB5SbiuqenFQ51Crw
         wtZwYDvG0EMDpJEVdTle7qjERrMp1aTQC/CW8EnvftkJ4/RITQUjmt9hh6bwlvsG3zZH
         nJ2HH1AEOjohyjpwdMxuYgq5lZeyZinNGMtZJZHCAi1IzyK15yU/UmOj2QhQ1XbaJB7i
         3L5bRy4HhXZ+Yvj6MveOUK8GNifnIERO3wqkkfUEyLZoucg3RmOrRC79p0m8D6ZAHaDe
         g4dw==
X-Gm-Message-State: AOAM533J1NwS4uaaWZnbDTFzSGbn/gvtmObW3U8raick53n//+AEaQLD
        87pkhiTMwqgEv1PSVsB2yEZXEW/4u9UMsfVAtK25q9itkAzd+w==
X-Google-Smtp-Source: ABdhPJyAwIGUgo68OmahnP4EuuvHtTd1UL9j1UkXicbKw75wPKkSOcVk3aLPokn2FK3hKP2mN+WPLGYKcQULj8B7MQE=
X-Received: by 2002:a05:6512:3694:: with SMTP id d20mr116319lfs.470.1624461919639;
 Wed, 23 Jun 2021 08:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <2ED1BDF5-BC0C-47CD-8F33-9A46C738F8CF@linux.vnet.ibm.com>
 <CAKfTPtDrHv4OOfPvwOE2DMNoucXQJ=yvvEpTVKrXghSdKEnZcA@mail.gmail.com>
 <20210622143154.GA804@vingu-book> <53968DDE-9E93-4CB4-B5E4-526230B6E154@linux.vnet.ibm.com>
 <20210623071935.GA29143@vingu-book> <CCB4222F-000A-44E8-8D61-F69893704688@linux.vnet.ibm.com>
 <6C676AB3-5D06-471A-8715-60AABEBBE392@linux.vnet.ibm.com> <20210623120835.GB29143@vingu-book>
 <CAFpoUr01xb9ZJF9mb2nmZDpUHXFH3VSbY3AU8-1owV-_7wVTPg@mail.gmail.com>
 <CAKfTPtB++3y4VnbKE_n=bgsqCfqXuF0KUsdB_cFhi9xAnMRubw@mail.gmail.com>
 <CAFpoUr3bHzrwvumw6R=2JVbKa_wmtT9cMf-mdDHxY0Png-N9Jw@mail.gmail.com>
 <CAKfTPtAev0VgCmK3AUyTCoVA38YmskpB98q0kTrbEPK6e=1dTA@mail.gmail.com> <CAFpoUr3Q+7Tr3y59H-BiFU7BO=dquhQpJ8M9JtmV0_3ySfp-+Q@mail.gmail.com>
In-Reply-To: <CAFpoUr3Q+7Tr3y59H-BiFU7BO=dquhQpJ8M9JtmV0_3ySfp-+Q@mail.gmail.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 23 Jun 2021 17:25:08 +0200
Message-ID: <CAKfTPtAjWpupvUE_m_KK9o4djQ_m5WmXuMqjxxxsMMRbfHqTmQ@mail.gmail.com>
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

On Wed, 23 Jun 2021 at 17:13, Odin Ugedal <odin@uged.al> wrote:
>
> ons. 23. jun. 2021 kl. 15:56 skrev Vincent Guittot <vincent.guittot@linaro.org>:
> >
> >
> > The pelt value of sched_entity is synced with  cfs and its contrib
> > before being removed.
>
>
> Hmm. Not sure what you mean by sched_entity here, since this is only
> taking the "removed" load_avg
> and removing it from cfs_rq, together with (removed.load_avg *
> divider) from load_sum. (Although. ".removed" comes from
> a sched entity)

The sched_entity's load_avg that is put in removed.load, is sync with
the cfs_rq PELT signal, which includes contrib, before being added to
removed.load.

>
> > Then, we start to remove this load in update_cfs_rq_load_avg() before
> > calling __update_load_avg_cfs_rq so contrib should not have change and
> > we should be safe
>
> For what it is worth, I am now able to reproduce it (maybe
> CONFIG_HZ=300/250 is the thing) as reported by Sachin,
> and my patch makes it disappear. Without my patch I see situations
> where _sum is zero while _avg is eg. 1 or 2 or 14 (in that range).

hmm, so there is something wrong in the propagation

> This happens for both load, runnable and util.
>
> Lets see what Sachin reports back.
>
> Thanks
> Odin
