Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4942D25588B
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 12:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgH1K3l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 06:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728991AbgH1K3e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 06:29:34 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961D4C061264
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 03:29:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c15so449118lfi.3
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 03:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QVZYq2PBPO60+hzu+DH/FiN1wZH0KS7M3eptGgjOhVE=;
        b=COZoZdwmI7PziLKiORCTiWJDGnCuoz7Y3bWHJ2oAICLzYBX2r0BR8efZez4ilASG1W
         kaYUjOIqVzFdQRCfzuQOH6fo3FlcWH2L1WW8wrUCtoSXi4L8H75fgRt9SgIwy0u0sHyg
         jE5+7xEi52Qf7F6bYe2vYA/sfnrl/iTTe16xU1v8qkv6ji0lXChDS9fqWadnRxJg5Wwx
         PvND1ssAKs/wDsIp3Kb+krUb5LvrIpMfKX7O3xyfFrFYv54LFh1IUsawP9sk1gXbsKDW
         IbK90giBWIXG0N+/DsisILRpLosibuaxOR10V5YHH6QlODOfxldsZKWTguOEG0DSIirV
         qr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QVZYq2PBPO60+hzu+DH/FiN1wZH0KS7M3eptGgjOhVE=;
        b=Rl4GzW/DvF6Pztox4XfNxGjePfHGjSW6ROKlIynV0ZBeUH2ExsGNk90aKAqxQ/gx9m
         EZdgF/G9t35nR8rXvhT5ZJJ7Iblz07fswpgt3jyuzIHdEZtxeZSMUz3Br5V8RW/8u2/R
         UXJV/LBAoLO+2DUAMFdihEw5+XlXsg1qBgeN+cYlfhXxaVJt7hKQX9Bor0Y/SHffCiA1
         WyIU4gfTXEDBy9MZBuEQaONr0bVVadnwBJcvEblAlG+5Sq+sJhlZV2pmVEZius78yT45
         5ljbTTj4nqv3Gxw18gKY/OPczrRB2i7IOL2ss4JwCwgGm/vW8o1OVmaeZkaEG8pDPurv
         Hjaw==
X-Gm-Message-State: AOAM533L1N1u1Px4qEeFubMSNG0Zun4lCRXGgYCL4DjKwxkV+Y+FLcYQ
        USN/RXVkFHD8nZzVgKqxkWZsoaLPh74oQdgRCbkXnQ==
X-Google-Smtp-Source: ABdhPJz+qwt3X7HgwHyJ4lpLawfdxGagKrMWAvsaV5ZAG+gYUecbHreIkxf2KT8piK7zCbe9pYFyRHUfVwV16+Iet6Q=
X-Received: by 2002:ac2:58c6:: with SMTP id u6mr481701lfo.105.1598610571828;
 Fri, 28 Aug 2020 03:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvUwH2FA9GOeA_7GYpLA31uOmEpg32VKnJ8-d5QSK4PdQ@mail.gmail.com>
 <20200827090813.fjugeqbb47fachy7@vireshk-i7> <CAK8P3a2zxybiMDzHXkTsT=VpHJOLkwd1=YTtCNU04vuMjZLkxA@mail.gmail.com>
 <20200827101231.smqrhqu5da6jlz6i@vireshk-i7> <CA+G9fYv=XLtsuD=tVR1HHotwpKLkbwZVyPr4UhY-jD+6-duTmw@mail.gmail.com>
 <CA+G9fYvSEHua0EpW64rASucWuS-U2STAZxufrfN75UDspGt2cA@mail.gmail.com> <CAPDyKFrpOqpBiSvkvO7sXHiQDOwdXYmx-80Ji5wW79QF-MrOuQ@mail.gmail.com>
In-Reply-To: <CAPDyKFrpOqpBiSvkvO7sXHiQDOwdXYmx-80Ji5wW79QF-MrOuQ@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 28 Aug 2020 12:29:20 +0200
Message-ID: <CADYN=9K3D3OZ5T_K+6MfcgVLRoktPB6LvwDiXGj-+Zpq3faYfg@mail.gmail.com>
Subject: Re: Kernel panic : Unable to handle kernel paging request at virtual
 address - dead address between user and kernel address ranges
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
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
        madhuparnabhowmik10@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 28 Aug 2020 at 11:35, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 28 Aug 2020 at 11:22, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Thu, 27 Aug 2020 at 17:06, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > On Thu, 27 Aug 2020 at 15:42, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > On 27-08-20, 11:48, Arnd Bergmann wrote:
> > > > > > > [    3.680477]  dev_pm_opp_put_clkname+0x30/0x58
> > > > > > > [    3.683431]  sdhci_msm_probe+0x284/0x9a0
> > > > >
> > > > > dev_pm_opp_put_clkname() is part of the error handling in the
> > > > > probe function, so I would deduct there are two problems:
> > > > >
> > > > > - something failed during the probe and the driver is trying
> > > > >   to unwind
> > > > > - the error handling it self is buggy and tries to undo something
> > > > >   again that has already been undone.
> > > >
> > > > Right.
> > > >
> > > > > This points to Viresh's
> > > > > d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
> > > >
> > > > I completely forgot that Ulf already pushed this patch and I was
> > > > wondering on which of the OPP core changes I wrote have done this :(
> > > >
> > > > > Most likely this is not the entire problem but it uncovered a preexisting
> > > > > bug.
> > > >
> > > > I think this is.
> > > >
> > > > Naresh: Can you please test with this diff ?
> > >
> > > I have applied your patch and tested but still see the reported problem.
> >
> > The git bisect shows that the first bad commit is,
> > d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Reported-by: Anders Roxell <anders.roxell@linaro.org>
>
> I am not sure what version of the patch you tested. However, I have
> dropped Viresh's v1 and replaced it with v2 [1]. It's available for
> testing at:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
>
> Can you please check if it still causes problems, then I will drop it, again.

I tried to run with a kernel from your tree and I could see the same
kernel panic on db410c [1].

Cheers,
Anders
[1] https://lkft.validation.linaro.org/scheduler/job/1717770#L1912
