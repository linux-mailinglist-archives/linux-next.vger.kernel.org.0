Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8B8E8C4C
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 17:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390128AbfJ2QAG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 12:00:06 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39497 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390120AbfJ2QAG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 12:00:06 -0400
Received: by mail-vs1-f68.google.com with SMTP id y129so9075595vsc.6
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7RbkqGbh9IA/JEvFLfGYQjmnKeTMtOGBd0rCBDW1LI=;
        b=VlJn9P93/+GJXnkI0YVl81cXWpN32BsLjxckAajcWxT2TzFp3+3EMPKRP+K+gqZKoi
         roFJ1OJgiYq2YK7ni/d1O9EDBeZlwfaRNyF3P9r3nFZALA4mBXqKksZ97mK/8YcIbC1X
         rMCGbjnc4FgPOTC/m3YgQ9jpZeQWGyAa5ZXGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7RbkqGbh9IA/JEvFLfGYQjmnKeTMtOGBd0rCBDW1LI=;
        b=AI4RjlVIhh8m7jzhg4qeHFlpbsHvZ0Lgh/ShQYW4JfCrbllyFCjelrm87n5UI9BaJR
         I6Yadxem7ud84oG+WS128tyc7AonBCBYDNVXOXNze7mdn+803K63+L3PP1T6XBUlXKnV
         0V1d0Q16C/58CMCVpBlYFR6mUJnLw+HqGXtSJ/Dc77psgkCcz11IY18lSZNb8Juepr9S
         TpLtYc+/UPiqPhkQcZrrUdKaHaPut0I+9TvcHY37/ExeYaQMgMiyGUBojApguglWWBZg
         Ebsd9zN2iQEpZR1B6EKUTy25W8CUwrsO9u8s49V7ljGGNjQ4JnWokMSCp0pZsQknxS5x
         +A7g==
X-Gm-Message-State: APjAAAU7TV8P7TgwzZ4o7n9JHSOJaHqFIO5/hTUJ3I97JYv6QTQNtTdh
        PRKAyUadwhJNdxJMMAxOsKkQlYsuvI0=
X-Google-Smtp-Source: APXvYqy+ZyG+eM1xZFQmhvyfL7HmF+rdw89DLCZH/pduuyGjl9pT4iU7ld/YZzHcMaiJJFsmxjSYRQ==
X-Received: by 2002:a67:2745:: with SMTP id n66mr2314558vsn.32.1572364803420;
        Tue, 29 Oct 2019 09:00:03 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id i7sm4998630vsp.1.2019.10.29.09.00.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2019 09:00:02 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id k15so9093879vsp.2
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 09:00:02 -0700 (PDT)
X-Received: by 2002:a67:2c91:: with SMTP id s139mr2171081vss.26.1572364801490;
 Tue, 29 Oct 2019 09:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <201910281603.E90E9627A@keescook> <0451f7e8-ff96-f411-ed26-1310999be3c5@embeddedor.com>
In-Reply-To: <0451f7e8-ff96-f411-ed26-1310999be3c5@embeddedor.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 29 Oct 2019 08:59:47 -0700
X-Gmail-Original-Message-ID: <CAGXu5jJ+BQEOPnhCtEFARBrMW=0z-+-xHEv1kv-JztG_dt2mwg@mail.gmail.com>
Message-ID: <CAGXu5jJ+BQEOPnhCtEFARBrMW=0z-+-xHEv1kv-JztG_dt2mwg@mail.gmail.com>
Subject: Re: Coverity: calibrate_8976(): Memory - illegal accesses
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Colin King <colin.king@canonical.com>
Cc:     coverity-bot <keescook@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 28, 2019 at 5:08 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Hi,
>
> This one has been addressed already:
>
> https://lore.kernel.org/lkml/CAK7fi1a8CiX=HVqhZSmQJdcjF1X_kdHFDwJhEpYJUcdPTcbMQA@mail.gmail.com/
>

Ah-ha, excellent. Colin, do you want me to CC you on these automatic
reports too?

-Kees

> Thanks
> --
> Gustavo
>
> On 10/28/19 18:03, coverity-bot wrote:
> > Hello!
> >
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191025 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> >
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> >
> > 95ededc17e4e ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")
> >
> > Coverity reported the following:
> >
> > *** CID 1487355:  Memory - illegal accesses  (USE_AFTER_FREE)
> > /drivers/thermal/qcom/tsens-v1.c: 245 in calibrate_8976()
> > 239           int mode = 0, tmp = 0;
> > 240           u32 *qfprom_cdata;
> > 241
> > 242           qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
> > 243           if (IS_ERR(qfprom_cdata)) {
> > 244                   kfree(qfprom_cdata);
> > vvv     CID 1487355:  Memory - illegal accesses  (USE_AFTER_FREE)
> > vvv     Passing freed pointer "qfprom_cdata" as an argument to "PTR_ERR".
> > 245                   return PTR_ERR(qfprom_cdata);
> > 246           }
> > 247
> > 248           mode = (qfprom_cdata[4] & MSM8976_CAL_SEL_MASK);
> > 249           dev_dbg(priv->dev, "calibration mode is %d\n", mode);
> > 250
> >
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include:
> >
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1487355 ("Memory - illegal accesses")
> > Fixes: 95ededc17e4e ("thermal: qcom: tsens-v1: Add support for MSM8956 and MSM8976")
> >
> >
> > Thanks for your attention!
> >



-- 
Kees Cook
