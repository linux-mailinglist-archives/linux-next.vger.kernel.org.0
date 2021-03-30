Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1042734E28E
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 09:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhC3HwQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 03:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhC3Hv5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 03:51:57 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0259AC061762
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 00:51:55 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u20so18781530lja.13
        for <linux-next@vger.kernel.org>; Tue, 30 Mar 2021 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4bR91hVaQuhkq7prB2DJMRMoItZp2usIm5Lfsjq4H+c=;
        b=D4kTEgHiL9UcbL1p2yps8tU9MWyBfg9V/wJ/2Lav4TFVkf975HoHiNVVuCEZbuikkb
         famnldkdnwX+TuqxelPfcnvGsj4pZ57a53fOEpmubm+ymKRdFbCKf+YB9Pn22vw+oMxB
         8WtuKWTvAOimTePb3ha4uorypQNTbA0afmDfHRuJm/Dl75US8gVxGFgBOpRegaR7klFt
         UwZ8st4gR+hg7IgSRn3cOqsjhGwqRfNopxoV/EOL7xSIRiyVxw0WshaDCp40vbgZdIpC
         WDvMEe27sGMYShZ+pJr8cGkGlxUvZQmrE8DsSGCfByK2UomtgEuP3jgBMJDc1v7SrrZW
         Yp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4bR91hVaQuhkq7prB2DJMRMoItZp2usIm5Lfsjq4H+c=;
        b=Irj5bvb0pPz+d1XmOjaKnGEYsllmSCQLDX6Jh7MM++uN4NoM810txwXuzvuKpWCdoc
         Yvr3lSUz6Bx556dVc7g1O/iJ87uK0XKf0OfMTel111mWvKl7sL5GQocRKB0XV1Pke+Ih
         F2D9kyQkz9SMmPtM3UlJq4SZMq+oQWZfeT+XkhfWQW0Q///W3O33NX6HDCuze1xEE4ng
         ykOwnBWtmYyvJ+Z5Z2BE+l3HmMh4g9GO6MG2ZbSmu4TU6MeFJvauJ6sO1tsjiVwZPiAb
         6O7onhaEVdOEgwUhKr/eWOq+/rcsCGj/dxm0xMyyqH1GaLMzmXiEdJ617/hRLEg0dhu5
         tw9Q==
X-Gm-Message-State: AOAM533V9JTooKlWgPIPbteYtvWaaqAc/bwk1mwRSs7M9nm91M+I3Sjh
        t2uoQS6PhKBz6PLquA9HADNGC2f5fPKfeCzZfA6jrQ==
X-Google-Smtp-Source: ABdhPJz1NH+JXKQexPTRlKiKVrKyjqbUEtqREnX4wfoexJ/3UI3TNYufIOZ6bNmvLK/UQ0bqGfbIIOQC/jFiZFOGHaE=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr21254807ljw.74.1617090714352;
 Tue, 30 Mar 2021 00:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210330170744.6a1519b0@canb.auug.org.au>
In-Reply-To: <20210330170744.6a1519b0@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 30 Mar 2021 09:51:41 +0200
Message-ID: <CACRpkdZbtr3igRpzfpujH3WA3Es6JGu7GxTFTCSKX9f-3uYOpw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 30, 2021 at 8:07 AM Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/pinctrl/bcm/pinctrl-bcm6362.c: In function 'bcm6362_set_gpio':
> drivers/pinctrl/bcm/pinctrl-bcm6362.c:503:8: warning: cast from pointer t=
o integer of different size [-Wpointer-to-int-cast]
>   503 |        (uint32_t) desc->drv_data, 0);
>       |        ^
>
> Introduced by commit
>
>   705791e23ecd ("pinctrl: add a pincontrol driver for BCM6362")

Ha! The 0day robot didn't see it. Good that we have so many layers.

I bet =C3=81lvaro will have a patch to fix it in no time.

Yours,
Linus Walleij
