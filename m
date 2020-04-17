Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC761AE80E
	for <lists+linux-next@lfdr.de>; Sat, 18 Apr 2020 00:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgDQWPT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 18:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728765AbgDQWPT (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 18:15:19 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7382C061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 15:15:18 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id l11so3071701lfc.5
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 15:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OWAMCznxPWDCXNA91H3ADkFYFjiVufBRCRxOlm2nv5s=;
        b=pitsqXMzwPj6OjvKm5rfJ82etIanSuI2eZsvVkMXFU4hqqIsIngwHrW8nvf3vknoTY
         mdb1O/NodfYW5xgNuSGX3um8T0hhn1LgEjxC3yA8m/yU9JH1K4Z4xLHCt6qGVDGo3og1
         t85PQUVSQOoFdxDMEYlCQ4aieg9o1Vo7VbkxYnsMvwozzvcGhxXhsDbEOP/+pnfOYhJL
         GAtMr4mtfDan07gELtNEqTRNZIvjS/ojWkdHtQFE92h/sIGKw8yzQIDK+dIE7u4pysd4
         nE2Mf9nH7SnyxecdPzskLAHaXx8BiYyM5/ToERYtLlDY+g0zHfpvOs1rD6r9ZaE/TF5N
         IqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OWAMCznxPWDCXNA91H3ADkFYFjiVufBRCRxOlm2nv5s=;
        b=G3Lu2is9B4I4hqRVwvLK9N3Ym7jcTa4nhorgpGtAe0L1mC2SrGMRuGCFD7Mtl2YmS4
         18kDG8X1m/IHpjEheyK6GJkuYVgSoACQD8T27BWvEJ/F2SMuco4rSqppP3qdXxBdOR9n
         nDB5/6zJkYh6DyrHIjRB/2vDJ8Zabksh+60WHRtqBP/6RpVIXYsVQMG2d2KmmxcTpaTc
         TlZHD7K8gumdas1L06jVYq3Fff/ez0kamFRVYYeBbWyW/4zyzlyajebUJc5rD+SzcZr8
         k4Krk9izXE8wVETk2DWpXR6B+KvCeLjvazPyj23topkiZjSNLHC5RXmYpBMLkj/QT3BK
         UJig==
X-Gm-Message-State: AGi0PuZN8Z0SRj4UynQo+YJoJNS0ZUdbEB8YnIoSDeVIW2JcTqSrJmW7
        LoaOQ12H9J6y7xRKxlJRr1L5+Hw5stpJL1wHTdc=
X-Google-Smtp-Source: APiQypJgdb/7+/n/8GbBPYDIrryWSTCeoXxJaRj8Fc1RKlYB8Oxf3eTmfY1o7IIbfUYui3mJZ6KrplCEQ046j7BlCuE=
X-Received: by 2002:a19:88a:: with SMTP id 132mr3380472lfi.130.1587161717257;
 Fri, 17 Apr 2020 15:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <202004171458.BEA64B0CF@keescook>
In-Reply-To: <202004171458.BEA64B0CF@keescook>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Fri, 17 Apr 2020 18:15:05 -0400
Message-ID: <CAD56B7fmhDey6hLrA32oRstPRCmKpdvEQ=jLo9PXo6LapgNYXA@mail.gmail.com>
Subject: Re: Coverity: pca953x_gpio_get_multiple(): Uninitialized variables
To:     coverity-bot <keescook@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 17, 2020 at 5:58 PM coverity-bot <keescook@chromium.org> wrote:
>
> Hello!
>
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20200417 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>
>   Tue Apr 14 11:28:42 2020 -0400
>     96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
>
> Coverity reported the following:
>
> *** CID 1492652:  Uninitialized variables  (UNINIT)
> /drivers/gpio/gpio-pca953x.c: 499 in pca953x_gpio_get_multiple()
> 493                             if (ret < 0)
> 494                                     return ret;
> 495                     }
> 496                     /* reg_val is relative to the last read byte,
> 497                      * so only shift the relative bits
> 498                      */
> vvv     CID 1492652:  Uninitialized variables  (UNINIT)
> vvv     Using uninitialized value "reg_val".
> 499                     value = (reg_val >> (i % 8)) & 0x01;
> 500                     __assign_bit(i, bits, value);
> 501             }
> 502             return ret;
> 503     }
> 504
Well for this case it is forced on the first pass with
       offset = gc->ngpio;
so 'i' in the for_each_set_bit() loop will always be at lest 1 less
than gc->ngpio.

However, I could see how this is a little are hard for a detection
tool to follow through:
offset = gc->ngpio;
       for_each_set_bit(i, mask, gc->ngpio) {
               if ((offset >> BANK_SFT) != (i >> BANK_SFT)) {

These tools are very cool, and I'd like fix the detection one way or
another. Any suggestions on a better syntax?

thanks,
Paul
