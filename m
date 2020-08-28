Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61BE3255872
	for <lists+linux-next@lfdr.de>; Fri, 28 Aug 2020 12:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgH1KNC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Aug 2020 06:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbgH1KM7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Aug 2020 06:12:59 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EB4C061264
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 03:12:59 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id p186so291122vsa.10
        for <linux-next@vger.kernel.org>; Fri, 28 Aug 2020 03:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6HXUI5DD/tO1jp0etl8fGdPWC411ikUQuHLqZtsU6UI=;
        b=x+bIkP5tr77goYnNf4DekZG+QJ+jHXkO4/FPvOFxRgNHlmJ6xsunxMsebdA9GFg45M
         xGT2/9kHOxpcilvFqcfu2YBahPukoY/4DgWyBz9p8zb8/WM8tAHTcQgYV2egkgd9VdjT
         IhGPP9qIHcZ1CRHRsmLFvX2GvzKgCA9qKhw8gYjghhfXv86MQgNvKjhTYn4d9vqmYAKm
         bLlYRh2MUqr/yhDxxB9FcNfBlORfSyb8K39aN9xZa9RFjlDvdHlLt6LRh4fIBd9v7O3y
         YazOj7mT2LQYJarIFY/tgwB+mZeuMA0UBCNUVuMkWbEi7o40kIEWdbpZP4OlueGUNGIj
         ITOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6HXUI5DD/tO1jp0etl8fGdPWC411ikUQuHLqZtsU6UI=;
        b=SdJlBBfCD7x/QKHsXwJ9716jo9jHGy7AxSbls3/TBZ8PhvPD0PrMtRZ5RPbBUEYW2j
         fjJgzB9t11fD5d0I8L/+QUVjmzH6lOBQkqRSw7JTNpOBF2y6DctVgqen3SZDGhN5vl53
         m6tHKblgv9YgVSPKAWXZlWd2NXpsDF2ouTrxgSOdzuS0hdAaX2SO0Q6FqpK1mgYl0zQG
         IRuIsn1CFAndZpdf2UFLAkjZesvlgsMtBgDMfa+/tHiq+xdV3ZurcPGqNV4hmtvEfnJy
         kseGSGTizLABlzb31k+DbF2vLEUNsZZL+m01uLj2mmp/jf3LQbKUJ8io1FvXlz8LHry8
         ZbnA==
X-Gm-Message-State: AOAM531/dLxTJdOx26VKtInSDRYW1v0GYyp/m9VfVJn5C7DsWi5xyjSc
        yZP/M918s8ovK/6zlAU1R7c10LAqctNbHm/Q6AaodA==
X-Google-Smtp-Source: ABdhPJyZVuGh5RBJk2bXJRF96bDHaTJMZw6jD2kqXZVAAm+GWUOTgbMYGRtiT+o7iBlggckDw3el3rN2C4q/JTGfpFI=
X-Received: by 2002:a67:7905:: with SMTP id u5mr294659vsc.179.1598609578442;
 Fri, 28 Aug 2020 03:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvK5UkERLuBSRH5t2=j5==dbtw45GTMta9MafyJDqFsFA@mail.gmail.com>
 <20200827094651.3grvs6ungv3dh7y3@vireshk-i7> <20200827211832.3ebeda8a@canb.auug.org.au>
 <20200828045128.y7ybkd7dnvn4h6dt@vireshk-i7>
In-Reply-To: <20200828045128.y7ybkd7dnvn4h6dt@vireshk-i7>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 28 Aug 2020 15:42:47 +0530
Message-ID: <CA+G9fYsn1S-SieuP85-Z4qKO+aNyqJarrBR0xx0X-YbtF9eo0g@mail.gmail.com>
Subject: Re: WARNING: at drivers/opp/core.c:678 dev_pm_opp_set_rate+0x4cc/0x5d4
 - on arm x15
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        open list <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, sbhanu@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>, nm@ti.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 28 Aug 2020 at 10:21, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 27-08-20, 21:18, Stephen Rothwell wrote:
> > Hi Viresh,
> >
> > On Thu, 27 Aug 2020 15:16:51 +0530 Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 27-08-20, 15:04, Naresh Kamboju wrote:
> > > > While boot testing arm x15 devices the Kernel warning noticed with linux next
> > > > tag 20200825.
> > > >
> > > > BAD:  next-20200825
> > > > GOOD:  next-20200824
> > > >
> > > > We are working on git bisect and boot testing on x15 and get back to you.

Viresh,
I have applied the v2 patch series on top of linux next-20200824.
and tested again the reported kernel warning is fixed [1]

[1] https://lkft.validation.linaro.org/scheduler/job/1717615#L1881
