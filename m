Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8F82559F9
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 14:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbgH1MXr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 08:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729216AbgH1MXm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 08:23:42 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7C2C061264
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 05:23:39 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id e14so460074vsa.9
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l+h+5XJ+em1JYNkK91WZyfQCnc3U3ITRWLKDQcz7Tz8=;
        b=Nk2iyxnX3VcxNGcUkNfIcs/0gqMCwNoJycWt9IuI72hQw1RDzGqQYv7T/Oci9THJPg
         YsMMWXtr8YQ7KsKBT36Oi7lM1LgchA/VZvPxFTBcCFQtxVh/gw0x3onsqlTtfi5PhfKv
         R+V/gIIDTMO/xIcnZfV3eS5Zd+KV+JAc0VjP+eOxgIGsySwx3cEJgIu5Thcl/c/sOacK
         UY9ynuhxom0XR3cLW31i2OeeFecjBDmU67bQbmlGl9u5FY6LzL14w5AAFFlROCh6GuNz
         sqk41UtOVvJrfnbDIcYXZ+ta3tieXLtw4292FTBf+++492g/DGSMpiVeowZXfWh0OGId
         Q6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l+h+5XJ+em1JYNkK91WZyfQCnc3U3ITRWLKDQcz7Tz8=;
        b=W4IisvP6SImrH7SBRpLVyPIzziXcBZhsdIlpnUz9w94i70oPX+OhCOq/CB2mB2eXVc
         hJ8RS+QpyG7+3mQqUobq89vSy3nbj3DwAejclfLJgkbLOV6wMF+hY0lJm+TbsQR7WdlX
         qkbDQpFaxt5AVjKJ41jR+0x6lI4Wm7J11IBGHt+Z6+v8zwpZ2jzeGLet6HKgYl6G4K1B
         VOxsK0m1vakSj0DdRxNXHMdjsckC++QL9MwbtRJzIBhYq1Q/u+ZUPZR5zuuJ493GYIqD
         GKuCuxxfVmRmGe2oQbA/1YNPW8h8RWH+bYN9e/fL0BZeZynUzQssCUw4aRZ8OPL56b+m
         /8jg==
X-Gm-Message-State: AOAM531tuIsMy3Mc2Ac48MZNlmA0pxe8AzVhv3UFUGWEwVdMkYvU5ETW
        imLRPSQ8hqf9890s1AH+mde3HOhZoGFOEz+rDABL3A==
X-Google-Smtp-Source: ABdhPJyjruMDViNwBvxoZ1ZSIkD9wSIeXDFzCU5GboJ6CETuh0DyRNRlHDBPQo2WEgCHhwlh2jCNV5uFFcOWjVVFIfw=
X-Received: by 2002:a67:f8ce:: with SMTP id c14mr634530vsp.14.1598617419004;
 Fri, 28 Aug 2020 05:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvUwH2FA9GOeA_7GYpLA31uOmEpg32VKnJ8-d5QSK4PdQ@mail.gmail.com>
 <20200827090813.fjugeqbb47fachy7@vireshk-i7> <CAK8P3a2zxybiMDzHXkTsT=VpHJOLkwd1=YTtCNU04vuMjZLkxA@mail.gmail.com>
 <20200827101231.smqrhqu5da6jlz6i@vireshk-i7> <CA+G9fYv=XLtsuD=tVR1HHotwpKLkbwZVyPr4UhY-jD+6-duTmw@mail.gmail.com>
 <CA+G9fYvSEHua0EpW64rASucWuS-U2STAZxufrfN75UDspGt2cA@mail.gmail.com>
 <CAPDyKFrpOqpBiSvkvO7sXHiQDOwdXYmx-80Ji5wW79QF-MrOuQ@mail.gmail.com> <CADYN=9K3D3OZ5T_K+6MfcgVLRoktPB6LvwDiXGj-+Zpq3faYfg@mail.gmail.com>
In-Reply-To: <CADYN=9K3D3OZ5T_K+6MfcgVLRoktPB6LvwDiXGj-+Zpq3faYfg@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 28 Aug 2020 14:23:02 +0200
Message-ID: <CAPDyKFpNVJZ0FddJ8naXYp-oZr-mYSOH-5iXG-wASZEFozBJJQ@mail.gmail.com>
Subject: Re: Kernel panic : Unable to handle kernel paging request at virtual
 address - dead address between user and kernel address ranges
To:     Anders Roxell <anders.roxell@linaro.org>
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

On Fri, 28 Aug 2020 at 12:29, Anders Roxell <anders.roxell@linaro.org> wrote:
>
> On Fri, 28 Aug 2020 at 11:35, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Fri, 28 Aug 2020 at 11:22, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >
> > > On Thu, 27 Aug 2020 at 17:06, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > On Thu, 27 Aug 2020 at 15:42, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > >
> > > > > On 27-08-20, 11:48, Arnd Bergmann wrote:
> > > > > > > > [    3.680477]  dev_pm_opp_put_clkname+0x30/0x58
> > > > > > > > [    3.683431]  sdhci_msm_probe+0x284/0x9a0
> > > > > >
> > > > > > dev_pm_opp_put_clkname() is part of the error handling in the
> > > > > > probe function, so I would deduct there are two problems:
> > > > > >
> > > > > > - something failed during the probe and the driver is trying
> > > > > >   to unwind
> > > > > > - the error handling it self is buggy and tries to undo something
> > > > > >   again that has already been undone.
> > > > >
> > > > > Right.
> > > > >
> > > > > > This points to Viresh's
> > > > > > d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
> > > > >
> > > > > I completely forgot that Ulf already pushed this patch and I was
> > > > > wondering on which of the OPP core changes I wrote have done this :(
> > > > >
> > > > > > Most likely this is not the entire problem but it uncovered a preexisting
> > > > > > bug.
> > > > >
> > > > > I think this is.
> > > > >
> > > > > Naresh: Can you please test with this diff ?
> > > >
> > > > I have applied your patch and tested but still see the reported problem.
> > >
> > > The git bisect shows that the first bad commit is,
> > > d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
> > >
> > > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > > Reported-by: Anders Roxell <anders.roxell@linaro.org>
> >
> > I am not sure what version of the patch you tested. However, I have
> > dropped Viresh's v1 and replaced it with v2 [1]. It's available for
> > testing at:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
> >
> > Can you please check if it still causes problems, then I will drop it, again.
>
> I tried to run with a kernel from your tree and I could see the same
> kernel panic on db410c [1].

Anders, Naresh - thanks for testing and reporting. I am dropping the
patch from my tree.

Viresh, I suggest to keep Anders/Naresh in the cc, for the next
version. Then I can wait for their tested-by tag before I apply again.

Kind regards
Uffe
