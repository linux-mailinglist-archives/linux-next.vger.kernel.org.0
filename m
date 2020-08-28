Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D1F255776
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 11:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbgH1JWz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 05:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728785AbgH1JWu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 05:22:50 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC164C061234
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 02:22:49 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id g20so166309uap.8
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+h9ZmfHl6gD6OPpN/SlVWioXyrTiMAhgaOR2eUM9lrs=;
        b=Yw5Y94hLnxuDQc0xMuJ3wJ0zdgZ5TprcSHRASqRPnFiahEe7Jsrt1CJdobZrJZZuVu
         pKBbKeRpUXw5iAK+LJuHCKgKNyb9VYPWO+O2N9iyV+R7ZnBZQyfgmeo5pOWKWzuIwVl+
         fGx4lWMXvwCfhSKDJ/Y5BzMivxP0K4t1RbiqXmsncmXuWJrllCE1gs8deO3ML2EUaPjE
         tj5Ab5rOzBDdvxSxqEE0uNP/KfRRugqhQawuXjH2/BrKM+tfPomu3Vuo+xls34YG4128
         MR98sjAjeqAL5LSR1wPQT6djpvD3rN6T888qiuFx30am718+PJsJefUh+1ZRx8PQFYgO
         D0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+h9ZmfHl6gD6OPpN/SlVWioXyrTiMAhgaOR2eUM9lrs=;
        b=RnI8GG81RjIIjeoJ9EP3RUs/Te8Hv/6WVag/dp+0KHK7zdqMH7R9sNBP6t7i8FBGOV
         Il/BYphNU54fMqlrf7FA6bweQaDzie5V+ETCqGDMU45FKULMEPU7y2EXbwYGHVNW/nvH
         j8P2EW4lYuN8ETY/QdMos1Loap5AxrRRFFRq4XDDlAlbPLnUQr3i45SC6D1TbQ8MZLbA
         OGfeDERW5q+5wnOOS3OzqL2uH1m2GhN6r1u0YEsr/WmswFFaEmAy9byrSdtbYtNDeH5h
         nc7CPzHnD0EaR/gOx7d6bHvfu4aoCyza1ZiR4rZ9tDGQpgHGE5aa3C7nWEvW5ywHAAJK
         Dhcg==
X-Gm-Message-State: AOAM5317QOVEccYabk2jrcvfsYdH/6zZ3LKEp1dZkd9klgOY7g9In+yI
        WNGguKzAfAZh645JJVcKyuj4lMrDHATgG103GQC0Ng==
X-Google-Smtp-Source: ABdhPJxy4rF0dUrJQq4+r6O19pPIHqxVxrAFH3xWa3DmfMA4EagdwmwABlFGcsGn23M3lc2uXFNy1Q0PgUxY25Tr2zA=
X-Received: by 2002:ab0:3443:: with SMTP id a3mr372138uaq.6.1598606568733;
 Fri, 28 Aug 2020 02:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvUwH2FA9GOeA_7GYpLA31uOmEpg32VKnJ8-d5QSK4PdQ@mail.gmail.com>
 <20200827090813.fjugeqbb47fachy7@vireshk-i7> <CAK8P3a2zxybiMDzHXkTsT=VpHJOLkwd1=YTtCNU04vuMjZLkxA@mail.gmail.com>
 <20200827101231.smqrhqu5da6jlz6i@vireshk-i7> <CA+G9fYv=XLtsuD=tVR1HHotwpKLkbwZVyPr4UhY-jD+6-duTmw@mail.gmail.com>
In-Reply-To: <CA+G9fYv=XLtsuD=tVR1HHotwpKLkbwZVyPr4UhY-jD+6-duTmw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 28 Aug 2020 14:52:37 +0530
Message-ID: <CA+G9fYvSEHua0EpW64rASucWuS-U2STAZxufrfN75UDspGt2cA@mail.gmail.com>
Subject: Re: Kernel panic : Unable to handle kernel paging request at virtual
 address - dead address between user and kernel address ranges
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
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

On Thu, 27 Aug 2020 at 17:06, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Thu, 27 Aug 2020 at 15:42, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 27-08-20, 11:48, Arnd Bergmann wrote:
> > > > > [    3.680477]  dev_pm_opp_put_clkname+0x30/0x58
> > > > > [    3.683431]  sdhci_msm_probe+0x284/0x9a0
> > >
> > > dev_pm_opp_put_clkname() is part of the error handling in the
> > > probe function, so I would deduct there are two problems:
> > >
> > > - something failed during the probe and the driver is trying
> > >   to unwind
> > > - the error handling it self is buggy and tries to undo something
> > >   again that has already been undone.
> >
> > Right.
> >
> > > This points to Viresh's
> > > d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
> >
> > I completely forgot that Ulf already pushed this patch and I was
> > wondering on which of the OPP core changes I wrote have done this :(
> >
> > > Most likely this is not the entire problem but it uncovered a preexisting
> > > bug.
> >
> > I think this is.
> >
> > Naresh: Can you please test with this diff ?
>
> I have applied your patch and tested but still see the reported problem.

The git bisect shows that the first bad commit is,
d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Anders Roxell <anders.roxell@linaro.org>

>
> - Naresh
