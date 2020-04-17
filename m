Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBD941AE860
	for <lists+linux-next@lfdr.de>; Sat, 18 Apr 2020 00:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgDQWp4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 18:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgDQWpz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Apr 2020 18:45:55 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562AFC061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 15:45:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id a23so1495896plm.1
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 15:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1NxEJR9vJnr+yD1ARrFSS8qUWBDHvV43s0nIUZzxKnY=;
        b=JG+wmIo4LkHIVZZuQozLsGmpM0kkDXq1IVtmBxdgPfTMM6WE+3tMIgajbugAytOPIH
         xCTOV5y+PkGU/f22R++ZpHOCu0n1OZXXcgyz6Hu/ivgmmsUBJ14UYhd1eJQ/5JnGHo/B
         H3nJLKrU7wIaEH3XWQVZrPx5F5+iPZzHaiMEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1NxEJR9vJnr+yD1ARrFSS8qUWBDHvV43s0nIUZzxKnY=;
        b=oLhZSs7sVU6whAlhr2DyvGljJ67iYDRONhkk5BfDi+LpWAXM29DS1Oxh5xrIVnfYeR
         aDzGN5aQzLLeMkoa8Kwfj01xG6RQvrzQbw+44Tt3Ld2wHl23eylbKV/wa4IrW28HBbIR
         goC2GqkTcLUTavaQ0KSHDG9QBXh5BWRg3j+xjluFo7hgLaoD990RQTbMTUQV8t8HiP84
         T27XKCf/Ttrl3Op0Wd3+wcoeB7WmMfG9UGExf1oCZhAkhcNl70vlrkqR/M7wMGYwS37g
         eW5ZaiNEQS9IXWGbd9Ac6eiHhNMfnU4jHqJIo5X6ika4L15ANH9QA6m+RGD5myWl1rac
         g2Ug==
X-Gm-Message-State: AGi0PuYl6j+bxIBpDH3qWvvpT//C7+IgHyV7YQ7vEuYiPIKkBhm93lAr
        m9ys8k0jqxsAmHqmEfuejoN2yQ==
X-Google-Smtp-Source: APiQypLCPNdYBl/YmKqAqGkbTXHgRmvqYRcy4QedP7Ah0jGyvpNsQasciqEeUNZgV6ulLQaqCpzP2w==
X-Received: by 2002:a17:90a:33c5:: with SMTP id n63mr6816523pjb.4.1587163553781;
        Fri, 17 Apr 2020 15:45:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k12sm20304881pfk.46.2020.04.17.15.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 15:45:52 -0700 (PDT)
Date:   Fri, 17 Apr 2020 15:45:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: pca953x_gpio_get_multiple(): Uninitialized variables
Message-ID: <202004171542.9D8D6E4@keescook>
References: <202004171458.BEA64B0CF@keescook>
 <CAD56B7fmhDey6hLrA32oRstPRCmKpdvEQ=jLo9PXo6LapgNYXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD56B7fmhDey6hLrA32oRstPRCmKpdvEQ=jLo9PXo6LapgNYXA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 17, 2020 at 06:15:05PM -0400, Paul Thomas wrote:
> On Fri, Apr 17, 2020 at 5:58 PM coverity-bot <keescook@chromium.org> wrote:
> >
> > Hello!
> >
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20200417 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> >
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> >
> >   Tue Apr 14 11:28:42 2020 -0400
> >     96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
> >
> > Coverity reported the following:
> >
> > *** CID 1492652:  Uninitialized variables  (UNINIT)
> > /drivers/gpio/gpio-pca953x.c: 499 in pca953x_gpio_get_multiple()
> > 493                             if (ret < 0)
> > 494                                     return ret;
> > 495                     }
> > 496                     /* reg_val is relative to the last read byte,
> > 497                      * so only shift the relative bits
> > 498                      */
> > vvv     CID 1492652:  Uninitialized variables  (UNINIT)
> > vvv     Using uninitialized value "reg_val".
> > 499                     value = (reg_val >> (i % 8)) & 0x01;
> > 500                     __assign_bit(i, bits, value);
> > 501             }
> > 502             return ret;
> > 503     }
> > 504
> Well for this case it is forced on the first pass with
>        offset = gc->ngpio;
> so 'i' in the for_each_set_bit() loop will always be at lest 1 less
> than gc->ngpio.
> 
> However, I could see how this is a little are hard for a detection
> tool to follow through:
> offset = gc->ngpio;
>        for_each_set_bit(i, mask, gc->ngpio) {
>                if ((offset >> BANK_SFT) != (i >> BANK_SFT)) {

Ah yeah, it can't see through the bounds of the "if" and offset and
the shifts.

> These tools are very cool, and I'd like fix the detection one way or
> another. Any suggestions on a better syntax?

Well... I don't think it's going to improve its checking of that loop. I
can just mark it false-positive and ignore it. :) (Or you can init
reg_val to zero at the top. *shrug*)

Thanks for looking at it!

-Kees

-- 
Kees Cook
