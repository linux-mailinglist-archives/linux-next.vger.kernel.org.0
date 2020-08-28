Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580F32557BF
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 11:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgH1Jfb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 05:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbgH1JfZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 05:35:25 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C1CC06121B
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 02:35:25 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id z12so171014uam.12
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 02:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/mdittT6+6EzCIerCsP+eMrYewGCwnIzPurZ3euQ7cw=;
        b=xrmlci1XQklPdv8VwdCziv8Ar/UxceOi05ImtRTPFIMg7t76W0VOXgbBWgcSxJjQkG
         7OJJGmztUHDLhPlStrGS21cIy5G6Pdq52sx8L7JibwmnsKieNyqGFvCapPJ8yi2BDPDJ
         CgTRJM8yNZAoZXqD+jmroylm/y1t+0HhlTzN1rbouTe7W23Peslwhhfnh4ywe1FFVZic
         O/JgK5vKgaqEaa9wlPsvOpPgYkM9103S/GERZ5qOGtuZhDMhq6PMFsYao4NsTuvl/BK4
         lSouNSllEvVZ6zGY0cl/i5I6yOn8sKy4YCKbn5aOCd8rM+cQQDHY1BfGR/48IyyGYfg5
         QugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/mdittT6+6EzCIerCsP+eMrYewGCwnIzPurZ3euQ7cw=;
        b=iL7Cagb7zezwo/SNsCdAA8vZik3absiS9MktVya1KnuvMfQwmlYfVQeQVurCMn5I0+
         OqiXWJ0LTtJFFTskrFRUUnES8iX9Rm8RaqVgcQDJotC1mxApzSCRUbc28Geuptionh0+
         QDJ2YIAdJPHp801UN3ZcUWw1GHuAdY+HbKGfyJY4Ow3hNV6TL0JScL+uvBymxC6x7Civ
         8nRGEjoYaoOwPG3wZEJOT3JrNggdQQMVRs6m8absO9ALb8bPTtg36BTPKFXtLSwdZpUY
         CbZDBPCfmZl1+6V4eWqLbN7kvc7AxWzSf3uYftCYueVYuIesPzj+sg+IZdL2Kd+I3CXu
         fcNw==
X-Gm-Message-State: AOAM5339kebioN3D121dnew8EYtL0VhvCay8YIQgTFxJH01cVfEBAMrJ
        N3XCEFm2yD/1Ka8n8XdEdHNnIT3vfrYhc/4iHIVi5w==
X-Google-Smtp-Source: ABdhPJzxNEeZfoY+k3gp0uBoTm4yCYE5kPlcV9PGhfGkgvhiqDyqVKsddEc6lWq8Z8xFJlOpwC9vsbIVbRpsPgjPmsM=
X-Received: by 2002:ab0:3114:: with SMTP id e20mr380470ual.104.1598607324469;
 Fri, 28 Aug 2020 02:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvUwH2FA9GOeA_7GYpLA31uOmEpg32VKnJ8-d5QSK4PdQ@mail.gmail.com>
 <20200827090813.fjugeqbb47fachy7@vireshk-i7> <CAK8P3a2zxybiMDzHXkTsT=VpHJOLkwd1=YTtCNU04vuMjZLkxA@mail.gmail.com>
 <20200827101231.smqrhqu5da6jlz6i@vireshk-i7> <CA+G9fYv=XLtsuD=tVR1HHotwpKLkbwZVyPr4UhY-jD+6-duTmw@mail.gmail.com>
 <CA+G9fYvSEHua0EpW64rASucWuS-U2STAZxufrfN75UDspGt2cA@mail.gmail.com>
In-Reply-To: <CA+G9fYvSEHua0EpW64rASucWuS-U2STAZxufrfN75UDspGt2cA@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 28 Aug 2020 11:34:47 +0200
Message-ID: <CAPDyKFrpOqpBiSvkvO7sXHiQDOwdXYmx-80Ji5wW79QF-MrOuQ@mail.gmail.com>
Subject: Re: Kernel panic : Unable to handle kernel paging request at virtual
 address - dead address between user and kernel address ranges
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        lkft-triage@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        madhuparnabhowmik10@gmail.com,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 28 Aug 2020 at 11:22, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Thu, 27 Aug 2020 at 17:06, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Thu, 27 Aug 2020 at 15:42, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 27-08-20, 11:48, Arnd Bergmann wrote:
> > > > > > [    3.680477]  dev_pm_opp_put_clkname+0x30/0x58
> > > > > > [    3.683431]  sdhci_msm_probe+0x284/0x9a0
> > > >
> > > > dev_pm_opp_put_clkname() is part of the error handling in the
> > > > probe function, so I would deduct there are two problems:
> > > >
> > > > - something failed during the probe and the driver is trying
> > > >   to unwind
> > > > - the error handling it self is buggy and tries to undo something
> > > >   again that has already been undone.
> > >
> > > Right.
> > >
> > > > This points to Viresh's
> > > > d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
> > >
> > > I completely forgot that Ulf already pushed this patch and I was
> > > wondering on which of the OPP core changes I wrote have done this :(
> > >
> > > > Most likely this is not the entire problem but it uncovered a preexisting
> > > > bug.
> > >
> > > I think this is.
> > >
> > > Naresh: Can you please test with this diff ?
> >
> > I have applied your patch and tested but still see the reported problem.
>
> The git bisect shows that the first bad commit is,
> d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Anders Roxell <anders.roxell@linaro.org>

I am not sure what version of the patch you tested. However, I have
dropped Viresh's v1 and replaced it with v2 [1]. It's available for
testing at:

https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next

Can you please check if it still causes problems, then I will drop it, again.

Kind regards
Uffe

[1] https://lkml.org/lkml/2020/8/28/43
