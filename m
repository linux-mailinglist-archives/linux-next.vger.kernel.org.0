Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10242E8C67
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 17:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390308AbfJ2QIK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 12:08:10 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33737 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390283AbfJ2QIJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 12:08:09 -0400
Received: by mail-qk1-f195.google.com with SMTP id 71so12798978qkl.0
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkiyYj3R1Y/RPSbNRY420lfIlKetblDpcGMlTBY1rT8=;
        b=Rq9bc/MuxhGlRTd7mKHTwZ3ZDV8NVJCs0MsEw00TuOFNe5/aFyr3idgK9NUqTFJMn7
         G6sGwfD/dOUANWI/gg5OODJWi401zsqqGHNZtjCHPcG0/K4kBF+1z1iAabzK/nqCJ2rj
         k1UWXQvv/iPulGjh5qWXVRnOdXWA5vXtvfdJ/7TN8cSiQ+1BYMgy5Ka+T8S64upevFZP
         bT0jPoyprshye9drRb7U7320p9bk4rhUQl69eUJOjDVZ3bsJ2mg3HWR8ZOO2z2GLDdIY
         cTLvVeS4Z9gs0jRDtACpKfCAIqLzHsfRVYaRfB0/Nd1bvQUWx2ogC+JPjDTjQHGLNn1v
         68Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkiyYj3R1Y/RPSbNRY420lfIlKetblDpcGMlTBY1rT8=;
        b=s3QKJZK7g4fT1KhBqYDELqyuap4QnUqZoNm1QGJXxlRpLs0/coGgPSK7oNP4+1J5Ba
         HBkyt9YKoiTS6/Z9AcL1uteowp2kG1uvBk1dCBA1wg4DYOvK6vUyjA3kQaXbzXCOkfst
         ndTypgpnqy8eFhhaXgS1fJFswiwfg5ENFoGnSDYR5/Cu6DUxdnb7EMkVCQFaRR40NW9H
         ySHGlAuGw1mmbD3UikRA0ojWw5FMxcAE15YztgZF5trkuOJuIU5XJG2ggc98EiZ5CuPz
         XMNX4yPuTCrLd7UwOYoC4Si00hH9ch3uH9eh1qoQ8lMWaHaO3KciDQZFdKG+z42+HLdj
         qU/A==
X-Gm-Message-State: APjAAAVbe6q42KVYqygzfnpHOE4B4o17c5TncBJ6bN2fbX5v4JYZxcds
        B1d1thBLkFdcuuQH+MeCt4uXu3C3bVfQk4ZafLQ8KQ==
X-Google-Smtp-Source: APXvYqzEm35dfH7sna/gzwgftzz9cPUPG0ImyFeiMXHETohQzvYBN9sfuy4ud5PICff/WEoLsbiuft+sdHHSCTI177g=
X-Received: by 2002:a37:9d44:: with SMTP id g65mr447070qke.302.1572365288819;
 Tue, 29 Oct 2019 09:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <201910281603.E90E9627A@keescook> <0451f7e8-ff96-f411-ed26-1310999be3c5@embeddedor.com>
 <CAGXu5jJ+BQEOPnhCtEFARBrMW=0z-+-xHEv1kv-JztG_dt2mwg@mail.gmail.com>
In-Reply-To: <CAGXu5jJ+BQEOPnhCtEFARBrMW=0z-+-xHEv1kv-JztG_dt2mwg@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 29 Oct 2019 21:37:57 +0530
Message-ID: <CAP245DWT+5xhqHY2w-WPH+-Q0Tujw57UaezqqrT3JRwSVq5iSQ@mail.gmail.com>
Subject: Re: Coverity: calibrate_8976(): Memory - illegal accesses
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Colin King <colin.king@canonical.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 29, 2019 at 9:30 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Oct 28, 2019 at 5:08 PM Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
> >
> > Hi,
> >
> > This one has been addressed already:
> >
> > https://lore.kernel.org/lkml/CAK7fi1a8CiX=HVqhZSmQJdcjF1X_kdHFDwJhEpYJUcdPTcbMQA@mail.gmail.com/
> >
>
> Ah-ha, excellent. Colin, do you want me to CC you on these automatic
> reports too?
>

Hi Kees,

Is coverity being run just on linux-next or on mainline too? I've
noticed it found at least one error that has existed for a long-time
only when that code was moved around.

Regards,
Amit

> > On 10/28/19 18:03, coverity-bot wrote:
> > > Hello!
> > >
> > > This is an experimental automated report about issues detected by Coverity
> > > from a scan of next-20191025 as part of the linux-next weekly scan project:
> > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > >
> > > You're getting this email because you were associated with the identified
> > > lines of code (noted below) that were touched by recent commits:
> > >
> > > 95ededc17e4e ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")
> > >
> > > Coverity reported the following:
> > >
> > > *** CID 1487355:  Memory - illegal accesses  (USE_AFTER_FREE)
> > > /drivers/thermal/qcom/tsens-v1.c: 245 in calibrate_8976()
> > > 239           int mode = 0, tmp = 0;
> > > 240           u32 *qfprom_cdata;
> > > 241
> > > 242           qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
> > > 243           if (IS_ERR(qfprom_cdata)) {
> > > 244                   kfree(qfprom_cdata);
> > > vvv     CID 1487355:  Memory - illegal accesses  (USE_AFTER_FREE)
> > > vvv     Passing freed pointer "qfprom_cdata" as an argument to "PTR_ERR".
> > > 245                   return PTR_ERR(qfprom_cdata);
> > > 246           }
> > > 247
> > > 248           mode = (qfprom_cdata[4] & MSM8976_CAL_SEL_MASK);
> > > 249           dev_dbg(priv->dev, "calibration mode is %d\n", mode);
> > > 250
> > >
> > > If this is a false positive, please let us know so we can mark it as
> > > such, or teach the Coverity rules to be smarter. If not, please make
> > > sure fixes get into linux-next. :) For patches fixing this, please
> > > include:
> > >
> > > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > > Addresses-Coverity-ID: 1487355 ("Memory - illegal accesses")
> > > Fixes: 95ededc17e4e ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")
> > >
> > >
> > > Thanks for your attention!
> > >
>
>
>
> --
> Kees Cook
