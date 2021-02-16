Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A3831CA87
	for <lists+linux-next@lfdr.de>; Tue, 16 Feb 2021 13:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhBPM3c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Feb 2021 07:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhBPM3c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Feb 2021 07:29:32 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36093C061574
        for <linux-next@vger.kernel.org>; Tue, 16 Feb 2021 04:28:51 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id j9so1638454edp.1
        for <linux-next@vger.kernel.org>; Tue, 16 Feb 2021 04:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ad0+hgLlbWAESKKkbH6rvkNj9FtIWIxrAmb+RGMe7ic=;
        b=hmdEOrq8aGYVphRb0xLQbltwSKM1v64gQ7+Z1usYWrz4e6Npg5tiGyhS8XrkDdozDz
         jd9bn9AzBl96asFpAUtYo6TWuwjIXKz5vXFOL6O8Y/dlxTCCoFfsmGyYjRvJCempXIu9
         EiLMDj1v9w30TYSyrpWVs+cOqbTJ1fk4yqrk7cd7CPqwLtlmYedcYSCowk1cTtBHE0N0
         qQeXgt1HoZMNazcGjZWcZbW0cEldV2Ncf64qh6OCBw9724pX0zWHF7BTPt/ppWBrPUxE
         rM3LGdT+04W+qjUbDh3+tV5TRLpwITOkPLqfYsbwjUmI2I9mKi7KIZI5A70XsL6VG/dx
         6Z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ad0+hgLlbWAESKKkbH6rvkNj9FtIWIxrAmb+RGMe7ic=;
        b=GPieG3sO9vxkplQnEqBoA9+mbgSfirIFirCQQPzNuYkhyO2gLv/KSRsZc6Nr3x2743
         s5pRcZ3j3zPXS3HpZWZyq4YEvKpg7urnzav0us18L+yxZ9oPs7P3XcDicfc8SLtNxLPn
         dqKaXKpv0XaxsfaI+xWpxv7xr0rk/eNNeNpAyC3XNB9JZYeTkEUTTT+ytAZL+Ymy1Z+u
         +jdPUaEnV2J5UugeLZUUmMJjXCRwGDnPsqtfV9fGLaADHCemuBxKIy5j9VkMH87krlm3
         ZgZr6Qtxt7cI+kEwfuzETRbVSvlf0/CQ9YXL0Hl7allxiZkn6skHFLUK6sdpxkxaDDFM
         hkOw==
X-Gm-Message-State: AOAM5313oUNOiMGnj6QeG37bM37EyVrrBSOJBHhPlln+OERCjOCrxTNi
        4JjZIq4r6rP6JlntgWXML/nfjDK/ggVAsQ0oU1Y2aw==
X-Google-Smtp-Source: ABdhPJx1kTTMrI1vyBayi9doeB7HmGyLN/m0li19/DR4J5ALuju+ZbVIXbvEL2KZzwzShAQySLZCByQL+KjH1b9u8uc=
X-Received: by 2002:a05:6402:2053:: with SMTP id bc19mr20101713edb.230.1613478529527;
 Tue, 16 Feb 2021 04:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20210216130449.3d1f0338@canb.auug.org.au> <TY2PR01MB3692F75AF6192AB0B082B493D8879@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692F75AF6192AB0B082B493D8879@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 16 Feb 2021 17:58:38 +0530
Message-ID: <CA+G9fYs=hDh7mYb0E=9hC14f5dSNocH=dANLrvMfxk+hSjS5bg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the arm-soc tree
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 16 Feb 2021 at 17:26, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hi,
>
> > From: Stephen Rothwell, Sent: Tuesday, February 16, 2021 11:05 AM
> <snip>
> > diff --cc arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > index 2407b2d89c1e,48fa8776e36f..000000000000
> > --- a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > @@@ -42,11 -42,20 +42,29 @@@
> >       clock-names = "apb_pclk";
> >   };
> >
> >  +&wdt {
> >  +    status = "okay";
> >  +    clocks = <&wdt_clk>;
> >  +};
> >  +
> >  +&gpio {
> >  +    status = "okay";
> > ++};`
>

LKFT builders also found this problem while building arm64 dtb.

> This ` causes the following build error on the next-20210216.
>
>   DTC     arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb
> Error: arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts:52.3-4 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:336: recipe for target 'arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb' failed
> make[2]: *** [arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb] Error 1
> scripts/Makefile.build:530: recipe for target 'arch/arm64/boot/dts/toshiba' failed

ref:
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1033072509#L382

- Naresh
