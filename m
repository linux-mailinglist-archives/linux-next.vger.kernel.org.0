Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80D62548EE
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 17:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgH0PQ7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 11:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728739AbgH0Lg5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 07:36:57 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90F3C061232
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 04:36:52 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id x142so1168925vke.0
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ooHzlcK9ygV09BpTK5pdlKAaPmSuGBA3cYk3HsnGhI=;
        b=gyvCYGNTxFHy28eyjnJaOniu3Ngpdp7FgF/p36fg9mx0sA+iQINbuS4hvhSRgQZG4K
         M+praVM2M8rDtJE7oKQfrwNOlajEgitaFZ8KpSeGAgp/KojD+cIX5zlMCVGzOsQKlQyt
         pn9rgMBtz7Vo0inQZZ6f8dOZyO/B/86EIiCgW01LQI+LSfo0KB6Eup4DDxOEChXFXVYb
         VPQ49zrePMz2XHowV2ZJ7YId4fRiik+AUkqioR5XowJ5khWUi/UZRIl/z//ErbCUw8i6
         lqZNx4cuUfQYKlWVDbtoB7wzyjoQOA+zcQmP1fZC/iCVWRMKlOmZL3sMkZNfXFHyHKUi
         qx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ooHzlcK9ygV09BpTK5pdlKAaPmSuGBA3cYk3HsnGhI=;
        b=D4/XOB4+6XMgpDQ1ErieCUu+6v5w7rhmjcZXKckj78M46yQWFkvKMrG0pnXUtcQ9iX
         0rq2QFfdlqQyhL9SXVSHuGDkyG3XXQw115NGs1Wg6vVWyvO0lyYcAPmX8FqAhohi6jXt
         9oKFbk5vAFVRAXBzoByRPMG2SXcqGv/dp7pa/WqKIUN4Lj5RANEiRU1CYlfCdbNnZpaA
         5r1UC23Mq+ZjGsGUj9JrwCPRSMeboGBUFI5pNT5nouMStZGg0ALPgxbtzTHajBIbkMuF
         fNI5mNWZ3FmKTapIbSaKlvZkSau14gM9+e0POa6rN6aZpOg6xSJpYNjegyOUngeNCGCc
         cqcg==
X-Gm-Message-State: AOAM531qhyVvz79tkzxD3/HRBe79o2h+IUrHAXgLgVf/fcQaaSlSU9AP
        iFl6H4wLVM0ffCVuc/HSow87CYv+29ZKgTkUNojehw==
X-Google-Smtp-Source: ABdhPJz2Kvyqr5m8SmXHIOwki3A50F7P9NH0AKIKPv9pKYpv2hoW0Imfg7W4iRAq/QvR+EZlcoBfEV1GThBF0OW1ank=
X-Received: by 2002:a05:6122:5ad:: with SMTP id w13mr1188574vko.11.1598528210107;
 Thu, 27 Aug 2020 04:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvUwH2FA9GOeA_7GYpLA31uOmEpg32VKnJ8-d5QSK4PdQ@mail.gmail.com>
 <20200827090813.fjugeqbb47fachy7@vireshk-i7> <CAK8P3a2zxybiMDzHXkTsT=VpHJOLkwd1=YTtCNU04vuMjZLkxA@mail.gmail.com>
 <20200827101231.smqrhqu5da6jlz6i@vireshk-i7>
In-Reply-To: <20200827101231.smqrhqu5da6jlz6i@vireshk-i7>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 27 Aug 2020 17:06:38 +0530
Message-ID: <CA+G9fYv=XLtsuD=tVR1HHotwpKLkbwZVyPr4UhY-jD+6-duTmw@mail.gmail.com>
Subject: Re: Kernel panic : Unable to handle kernel paging request at virtual
 address - dead address between user and kernel address ranges
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        lkft-triage@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        madhuparnabhowmik10@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 27 Aug 2020 at 15:42, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 27-08-20, 11:48, Arnd Bergmann wrote:
> > > > [    3.680477]  dev_pm_opp_put_clkname+0x30/0x58
> > > > [    3.683431]  sdhci_msm_probe+0x284/0x9a0
> >
> > dev_pm_opp_put_clkname() is part of the error handling in the
> > probe function, so I would deduct there are two problems:
> >
> > - something failed during the probe and the driver is trying
> >   to unwind
> > - the error handling it self is buggy and tries to undo something
> >   again that has already been undone.
>
> Right.
>
> > This points to Viresh's
> > d05a7238fe1c mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()
>
> I completely forgot that Ulf already pushed this patch and I was
> wondering on which of the OPP core changes I wrote have done this :(
>
> > Most likely this is not the entire problem but it uncovered a preexisting
> > bug.
>
> I think this is.
>
> Naresh: Can you please test with this diff ?

I have applied your patch and tested but still see the reported problem.
Link to test job,
https://lkft.validation.linaro.org/scheduler/job/1715677#L1886

- Naresh
