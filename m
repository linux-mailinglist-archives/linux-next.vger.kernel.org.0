Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DF1441BA5
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 14:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhKANXI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 09:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbhKANXG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 09:23:06 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98101C061764
        for <linux-next@vger.kernel.org>; Mon,  1 Nov 2021 06:20:33 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id j21so41443871edt.11
        for <linux-next@vger.kernel.org>; Mon, 01 Nov 2021 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KxiC8TOCDYGZGvzRqJnkq0LwxmwjLEv2v/sIODiLxJc=;
        b=wdIdVhPNOzx5jnUpsM3GCx+83Yp9a+mAZg+BSUg4BVZTw+MBvJnq9bBEOfYUcSRNP6
         4Zl7V6Yss3Erb4jFTCwZOXmWVi+J3gMiYzK+g5RyLgcegrwhI11YQheWUb8U0ZahWD+3
         +Dlto0wjcj3wiIA+be1d4QIdBIxFmEmdAnS2ZQuhcYZr1r/G3ofMMBIfrboU19sMXyBH
         nTIcr+xNtmjm+oBmoyuJeN5zgCKo0cUX1WAHtELHPy44TPdm1/4PgasIsOHCGaDAa5u/
         gZOeqAK83aPzVWHG3YWhREbYPeMIq3PZWUj17zD/es0jH7OTapW5GRldzEqCrMfERPP2
         kWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KxiC8TOCDYGZGvzRqJnkq0LwxmwjLEv2v/sIODiLxJc=;
        b=u3VNfodrTQoHf+rAToBLWTHm0zBcS0hsoZWYT0MhqTnX5lQCkSk2jC9VamQAN8QrCm
         vxJAdsHNYRfwhuwpvd8WDnmutSK0fGaH+RitKn+t02g2eRXw7BJTrc7CSSPDPf7+9DN2
         YZp9K9fqaGTbJwoGcklANk4JlePlPAPypN5aQ9iHIea5z3NNnyuiS9dJvUYJFkq78rKn
         YTbTviBYcrg33F4em91j7q7yil2eyJzB033hvjy29cIEGqX4d8t5FV2usrb7/f4AhD7K
         cRAjqfCbC0VcdI5ULdC30xUXTIXjv2O/ph43RLpu/pvc699Z0CKEKC6jjr77EYrll4YS
         Qbcg==
X-Gm-Message-State: AOAM530RDx9p7Vnq+uCWzI5Zby6n4okTepjMcV7Qd7cFGEo1xSN9vDcQ
        C8mUGExPOmFtPsJee8/NWTf5Jt1AT+Bc20BGyeH7GQ==
X-Google-Smtp-Source: ABdhPJyJQqeGbufX4I+U4qbdDbwM8MR69cxMk6BiNOWW7zXqiwCalLSYDDuw+wdQdZflvS6F5WohciNSyvkn0xthNf8=
X-Received: by 2002:a17:906:9f21:: with SMTP id fy33mr36364553ejc.567.1635772832049;
 Mon, 01 Nov 2021 06:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYso1sBLRAMpc0bdPiim8GvMhmwuRDaEZ0xbP1TZz864ZA@mail.gmail.com>
 <CAK8P3a1mP_ZvigBj5+pRSSf-OsvX70BSJByGfqcDjE5pXLD9Yw@mail.gmail.com>
In-Reply-To: <CAK8P3a1mP_ZvigBj5+pRSSf-OsvX70BSJByGfqcDjE5pXLD9Yw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 1 Nov 2021 18:50:20 +0530
Message-ID: <CA+G9fYt3EjUTF+C26x8sCRc+4R8raCDUOF03qmcwP820QEKgbg@mail.gmail.com>
Subject: Re: [next] Error: selected processor does not support `isb ' in ARM mode
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Juerg Haefliger <juergh@canonical.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Arnd,

On Mon, 1 Nov 2021 at 18:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Nov 1, 2021 at 2:00 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > [Please ignore this email report if it is already reported]
> >
> > Regression found on arm gcc-11 built with following config
> > Following build warnings / errors reported on linux next-20211101.
> >
> > metadata:
> >     git_describe: next-20211101
> >     git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >     git_short_log: 9febf1194306 (\"Add linux-next specific files for 20211101\")
> >     target_arch: arm
> >     toolchain: gcc-11
>
> Is this a Debian gcc? If so, this one should fix it, I need to send
> that to Russell's
> patch tracker:
>
> https://lore.kernel.org/linux-arm-kernel/20211018140735.3714254-1-arnd@kernel.org/
>

Yes.
This is Debian gcc-11

- Naresh
