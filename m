Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800CF2CA206
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 13:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389039AbgLAL6A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 06:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387394AbgLAL57 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 06:57:59 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38D6C0613D2;
        Tue,  1 Dec 2020 03:57:19 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id s18so1477663oih.1;
        Tue, 01 Dec 2020 03:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAXFY6fJ1YLQju/dgAT7ymnIazjqdCFT7ZohpiAR7h0=;
        b=B5oZFdGisxiEfLGaypmeD6FFwPEpgdc+deqKKz8AjHK9t8Bp332JjduLj8je/+LURv
         dqjHbFK9qNDMgcyscLQeS/CdJxrPduCZwpEC7/TtpPxgTuUYK8VTAwPgH6bAjmDQqjs4
         6p/uK79kfcfOjS4HQUdgcemxzjAojGDhYfTi2945fC4oSJnEz8T2UuQwm5qAEHuCkT1A
         od0CRW2JiWvsjha63CoDBvRGRdNWV2u2LKEbIyKX0DwQ2gGY4TdSIJApx/4fRDgdk7lO
         3ps/BJ3DbZQ9lWqFwjDo1OxZWahYRbJGOga9sCz7Z4Vjlo7fk/JnjWYXbZlufQEqK4YA
         PX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAXFY6fJ1YLQju/dgAT7ymnIazjqdCFT7ZohpiAR7h0=;
        b=pFloeUkpgT0g0WZ88Q3a1Ks5aXUvbHXFtA4zngjAjXe4c5yPZQiVKaZlZl2C40IhUe
         7ik6jpcA2HaDbrLtVijHVIKz57OoIzgJeFgXbWnhWTDrjC3cp5mP04gJGc3C1dnrgUYv
         K2JoN6XhKeRjxOWxx6YcK+3YjPjmQwqT1fPg9LCBCqLnaUvtRPgKmH54F6f0JR4v2etI
         CxcbBfohu0PSd1aGwbUbEoDbtW9cr62QeBIyzCj3c2ftbvYxhxyg8PmLivWqDcYKze1c
         /5153DJo1vmN3aNpRKiy4xM9FsUMpdUK+8k1ms8Wtg3RAFLwxj0DCqvhSzRvPqBtjjHW
         reaw==
X-Gm-Message-State: AOAM531s9Bp1Z5d36QawS+nGzCg8HV7GjDalzjNzrX+2ug4KeNbAF/oa
        Kka7YGPJh7Xx/7UBnXx0QsU7q7KfPVmE5chwdJU=
X-Google-Smtp-Source: ABdhPJyZ2TQsP+JkXdvjbZgCeRRu8qSVaZ8b9BjgQupepn8HPr6x5f6QArKfwsnB47bn+5cDjsN4fGHMXYUyiLMxvSU=
X-Received: by 2002:aca:6106:: with SMTP id v6mr1433151oib.158.1606823839282;
 Tue, 01 Dec 2020 03:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20201201112051.17463-1-sergio.paracuellos@gmail.com> <20201201114453.GC8403@vkoul-mobl>
In-Reply-To: <20201201114453.GC8403@vkoul-mobl>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 1 Dec 2020 12:57:08 +0100
Message-ID: <CAMhs-H9PtGs8uO-Hg0o7YL2+HKQKrRC-gRJs3sFH04bz2SsMng@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] phy: ralink: phy-mt7621-pci: some fixes for COMPILE_TEST
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 1, 2020 at 12:44 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 01-12-20, 12:20, Sergio Paracuellos wrote:
> > Hi Vinod,
> >
> > After merging the phy-next tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > drivers/phy/ralink/phy-mt7621-pci.c:17:10: fatal error: mt7621.h: No such file or directory
> > 17 | #include <mt7621.h>
> >  |          ^~~~~~~~~~
> >
> > This driver has two includes which are in
> > "arch/mips/include/asm/mach-ralink" and are directly included in the
> > driver:
> > * mt7621.h
> > * ralink_regs.h
> >
> > This is because this path is directly included in 'arch/mips/ralink/Platform'
> > for "ralink".
> >
> > Adding the include search path to the phy ralink directory fix the problem but
> > as you told me I finally end up removing COMPILE_TEST from Kconfig.
> >
> > Making 'allmodconfig' in x86_64 also showed two warnings for this driver
> > because of pointer size and not valid name for MODULE_DEVICE_TABLE ids.
> >
> > Ids for the macro has been also included in this series.
>
> Applied, thanks
>

Thanks for letting me know.

Best regards,
    Sergio Paracuellos
> --
> ~Vinod
