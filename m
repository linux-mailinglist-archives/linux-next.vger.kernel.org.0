Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E27F3EF3CA
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 22:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbhHQUS2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 16:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234706AbhHQURN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 16:17:13 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27B3C0617AF
        for <linux-next@vger.kernel.org>; Tue, 17 Aug 2021 13:14:48 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w20so43691211lfu.7
        for <linux-next@vger.kernel.org>; Tue, 17 Aug 2021 13:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h6RsJUhKpxPfJy/vKi+nK+rh2IQwDL/mjuuC3wOftzQ=;
        b=SrFvuF80cMzUMX8MpwMTW/YKW/M/N0fRxZSKfBApUBRK3mfLg+xS1wKW4AP9qOm9w1
         4HDy/uG2/zKDqujChe0VQ+QYJyF2tmHo9OYmo5JYxX+YC2zpCz8Oam4wkDXSjoqAE8UU
         vSOcKa1mdSUhL7J9FUt0/70FAIwkPKKRu6bZdR4JQNFCGSI8WHumH3C2VN54omX3V7Sz
         JrR3o4lbI+uVVgHYbqiDos1jQs5/PHOeHNSEaqtYPVyKwBV1Cydj2kqM4+uib8XL7sHa
         f2JdfMlkSp9oRXsPSuV2x+sFAYbieN+7tTG4pdstN0eOzpPQHJKzJk1DuL6xcEIGSsH7
         luKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h6RsJUhKpxPfJy/vKi+nK+rh2IQwDL/mjuuC3wOftzQ=;
        b=n/Sle0iZO82i9M00kGuwTyYZRHAJ9Dq57890zUPLEUUEx5/4o9iXh9FOXzCsNApfVt
         kgOOUdu+apDW5wGqcrVrPWSoA5LpKclF8T348HUMx0Bmtoe3DMfpKW16KixNtAvqlQSm
         mydPzNlme5sc8SLBjBiCTMEgAdcRwVPATfHF5U41iw4H40of23popMD4J9pN7S4W3Avm
         SZEpX2q1NgZBwoaqDyubIrHg+jgNzSQS4lEiQ82OS8nysV9zeiz3Wnb4A7ZJleMnCykQ
         CLRuEXZ5IxpXpYVkk1Laz+5VFyBdvUZOg2loR3VvR12OTrAAczp7wcPUzLg/2astmNWx
         9xIQ==
X-Gm-Message-State: AOAM531NMS5CBK5D2BbQ6tKE3YP9rgyAfs7BD/2WwiV4Gi+kKOdZaUBH
        58chbOVDRz9tP3aYgWRcA5m93OoJHS/vUnAF+fsoEg==
X-Google-Smtp-Source: ABdhPJzI2/LAXqFbf0+ZN+CXOdTsRZqakqH927p1aSOCBGQqotSbLnC5jLzf3rsA++IFCg9q3/ffVekCyzkk3mrzcaM=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr3659449lfd.529.1629231287282;
 Tue, 17 Aug 2021 13:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210817200412.799bd992@canb.auug.org.au>
In-Reply-To: <20210817200412.799bd992@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 22:14:35 +0200
Message-ID: <CACRpkdYNnrk35yA5u8wxMyOquxSovr9xTeYjDd61K=38Vyby4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the irqchip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Marc Zyngier <maz@kernel.org>, Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 17, 2021 at 12:04 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the pinctrl tree got a conflict in:
>
>   drivers/pinctrl/pinctrl-rockchip.c
>
> between commit:
>
>   a9cb09b7be84 ("pinctrl: Bulk conversion to generic_handle_domain_irq()")
>
> from the irqchip tree and commit:
>
>   9ce9a02039de ("pinctrl/rockchip: drop the gpio related codes")
>
> from the pinctrl tree.
>
> I fixed it up (the latter removed the code changed by the former, so I
> did that) and can carry the fix as necessary.

I have created an immutable branch for these changes:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-rockchip

If it helps irqchip they can pull this in (and fix things on top if
need be).

Yours,
Linus Walleij
