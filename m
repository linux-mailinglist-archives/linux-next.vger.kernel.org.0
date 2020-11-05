Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394712A7A0E
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 10:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKEJJI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 04:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKEJJH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 04:09:07 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E411C0613CF
        for <linux-next@vger.kernel.org>; Thu,  5 Nov 2020 01:09:07 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id a65so460302wme.1
        for <linux-next@vger.kernel.org>; Thu, 05 Nov 2020 01:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qg/zApnm3BiblnpdSeO9YRsP34oz7tFZxKxHQKdua88=;
        b=rC2ubKktpY3ET2FFwX+lU13mPvP9Nhcu2aznqQnIZb503oxdqmp48wHTrUMS6mFmI6
         NJJcP5ZrboVL3teeBu9SXili7ZLpCsszGoHtNQI3M0joQKpTFLGZzANp+ZTwwN9BFAHy
         Ns5JWw3ZWA/NBkDiGBMcZ3p243uGP8SNurcmiv6zthnyqByLnERc4esm+rILLObaPcCP
         kIAZG1bY3HWsdmOTwrw7IR9hHaCwQ5lUVdvrJWTyj5419SjDTcNpCOU0R4648XS8IxlS
         KOovAhj34oV2bU38v5DGt6/o3YQg1ddmTjltP5tGkLrX8Ensj8JOC7PUPeUBkdCdstO5
         kXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qg/zApnm3BiblnpdSeO9YRsP34oz7tFZxKxHQKdua88=;
        b=EgMqag0KvpqfwM2wYYwV6GuiotV20y/m6R1LzQoTIU6/BdOex+RlAEWEf2D/emoLO8
         Go/NA4xMokSCZJXYUd3bZmAwk8ABn29HgG/16ByFZIgueKECUK835Vy1DS1atbyifYZZ
         V7oEj9p3jD3m8A/6/a+0BWho4NOtN3yuicHyw837wFxTiXlf1pTygx/lF3kIcdouxW5g
         DbjNoBxO4EL/wUKQAfeAZLLSKdWuxJLW+6EYsC4yRwyFDOKkDj3DukQYl8wHiSFNUy4Z
         RKOxsHMdP2om8qdaWmozHnjIaVuyhX8mbBi5vz3Lrxpwzvj8reBK1wAvZ6v52XvpPu5V
         /46g==
X-Gm-Message-State: AOAM5314eE472g2g46iyb8XWGuetIK+MvQtvWI6yj3bzeKSf+WxTTDvc
        TrRruBNkBKeMDkoRyVjlVCH+L6CLKPiW09fg
X-Google-Smtp-Source: ABdhPJyje9D6+L2Xcs5hOEMbiZq2bAUd5nSH13POCaewhvoa2q9NYsaT2I/d8uxvm1YtFmDrlvYyxA==
X-Received: by 2002:a1c:6782:: with SMTP id b124mr1690866wmc.117.1604567345642;
        Thu, 05 Nov 2020 01:09:05 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id g17sm1496195wrw.37.2020.11.05.01.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 01:09:04 -0800 (PST)
Date:   Thu, 5 Nov 2020 09:09:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20201105090903.GG4488@dell>
References: <20201105014728.GC17266@qmqm.qmqm.pl>
 <20201105125027.1f4b6886@canb.auug.org.au>
 <20201105015718.GD17266@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201105015718.GD17266@qmqm.qmqm.pl>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 05 Nov 2020, Michał Mirosław wrote:

> On Thu, Nov 05, 2020 at 12:50:27PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the mfd tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > drivers/gpio/gpio-tps65910.c: In function 'tps65910_gpio_get':
> > drivers/gpio/gpio-tps65910.c:31:2: error: implicit declaration of function 'tps65910_reg_read' [-Werror=implicit-function-declaration]
> >    31 |  tps65910_reg_read(tps65910, TPS65910_GPIO0 + offset, &val);
> >       |  ^~~~~~~~~~~~~~~~~
> > drivers/gpio/gpio-tps65910.c: In function 'tps65910_gpio_set':
> > drivers/gpio/gpio-tps65910.c:46:3: error: implicit declaration of function 'tps65910_reg_set_bits' [-Werror=implicit-function-declaration]
> >    46 |   tps65910_reg_set_bits(tps65910, TPS65910_GPIO0 + offset,
> >       |   ^~~~~~~~~~~~~~~~~~~~~
> > drivers/gpio/gpio-tps65910.c:49:3: error: implicit declaration of function 'tps65910_reg_clear_bits' [-Werror=implicit-function-declaration]
> >    49 |   tps65910_reg_clear_bits(tps65910, TPS65910_GPIO0 + offset,
> >       |   ^~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   23feb2c3367c ("mfd: tps65910: Clean up after switching to regmap")
> > 
> > I have used the version of the mfd tree from next-20201104 for today.
> 
> Hi,
> 
> It's missing a patch for gpio part [1].
> 
> [1] https://lkml.org/lkml/2020/9/26/398

I'm aware of it.  Just waiting for Linus' reply.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
