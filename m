Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E8A1AE88D
	for <lists+linux-next@lfdr.de>; Sat, 18 Apr 2020 01:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgDQXSL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 19:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgDQXSL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Apr 2020 19:18:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D19AC061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 16:18:11 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u15so3766472ljd.3
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 16:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+DtkfB6cR5TvBxrEv2KNmT6gI8AFZzYMAbkPB95xPg=;
        b=gElakf37iUNqIof67t0UdjQW/d2b9NhEwhBYVIxUuQ/HMDLuYVi5z9vLnccdoodau/
         cuOu43xwC8W2qHXtZKhM5IxXNNtgH0IRNdGevi0zgqbpPHtxtjeDf6oaVuGZWe3CdKw9
         pE4urLRaXEwWGnNm/6xU6/h43AENn+xn/Ta1iiMxHNW+owM/e5q7hD+3GL4NdFRBs9it
         XacLLnjIiaNWNDVi6FpbKpKWI93HYjuicuyfg1RwvlhDsy45qZxvEvWBiqinTxMXKFdB
         uaiy/7opXmF32FLs6XyoVHzoiSiSg0aZyrONoRdia2oraQqof73Nr0LL2trCduyHsEFH
         q+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+DtkfB6cR5TvBxrEv2KNmT6gI8AFZzYMAbkPB95xPg=;
        b=Qj3vzRDPyookjz8+kWsLh1zXERjiOR7M2KFIkYXRL22qgbWHYj5k9NdjnUihN2OSwH
         /Vail/LdHMHx1VwWjMmRS1cpwLvGaYvkWlBakSF6GntfHX+8FPSXMokPiIMd0/6SZmpQ
         GC/n5c7kIuZ2gRLrrCgJpDFUxpnT+0ByrWjNM6EukS0I2e2r6ViD1vfBl47Oh2UFILzB
         lT+cNa5iudebdnSH5yxnYCiqCo5VHsqBmP6EyCbZET46/FL28XPvDLRyZ7XU/SleVcD2
         qeQFv4WdymEwvRs2O5tDJik+8Wj4JiiTi/SrbRGmQ/AeKhfI3dnirlw6IKxGHykLAS0u
         8ySg==
X-Gm-Message-State: AGi0PuaLu9eT/C4gTFJ9A3ezhjLSMKhjv7cK/Xsp5FVIT53ZcetcHsAn
        66P/8NXY+kOsvZsB+wcubFAWEjJ3Ficis4IExtw=
X-Google-Smtp-Source: APiQypJvfb3Q6o3Hb+RVPgKowYtdd1ySQlCn2jFyX/Nr3hzmY+TymiUJg+MFtD3htXmkrhqol3MMSc1Y29fKrmLkuew=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr3340619ljh.258.1587165489516;
 Fri, 17 Apr 2020 16:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <202004171458.BEA64B0CF@keescook> <CAD56B7fmhDey6hLrA32oRstPRCmKpdvEQ=jLo9PXo6LapgNYXA@mail.gmail.com>
 <202004171542.9D8D6E4@keescook>
In-Reply-To: <202004171542.9D8D6E4@keescook>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Fri, 17 Apr 2020 19:17:57 -0400
Message-ID: <CAD56B7cDd8wYkZYcQyTcwPDe2C5hNM7a21mK-tf+_TCXKEk+-Q@mail.gmail.com>
Subject: Re: Coverity: pca953x_gpio_get_multiple(): Uninitialized variables
To:     Kees Cook <keescook@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 17, 2020 at 6:45 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Apr 17, 2020 at 06:15:05PM -0400, Paul Thomas wrote:
> > On Fri, Apr 17, 2020 at 5:58 PM coverity-bot <keescook@chromium.org> wrote:
> > >
> > > Hello!
> > >
> > > This is an experimental semi-automated report about issues detected by
> > > Coverity from a scan of next-20200417 as part of the linux-next scan project:
> > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > >
> > > You're getting this email because you were associated with the identified
> > > lines of code (noted below) that were touched by commits:
> > >
> > >   Tue Apr 14 11:28:42 2020 -0400
> > >     96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple function")
> > >
> > > Coverity reported the following:
> > >
> > > *** CID 1492652:  Uninitialized variables  (UNINIT)
> > > /drivers/gpio/gpio-pca953x.c: 499 in pca953x_gpio_get_multiple()
> > > 493                             if (ret < 0)
> > > 494                                     return ret;
> > > 495                     }
> > > 496                     /* reg_val is relative to the last read byte,
> > > 497                      * so only shift the relative bits
> > > 498                      */
> > > vvv     CID 1492652:  Uninitialized variables  (UNINIT)
> > > vvv     Using uninitialized value "reg_val".
> > > 499                     value = (reg_val >> (i % 8)) & 0x01;
> > > 500                     __assign_bit(i, bits, value);
> > > 501             }
> > > 502             return ret;
> > > 503     }
> > > 504
> > Well for this case it is forced on the first pass with
> >        offset = gc->ngpio;
> > so 'i' in the for_each_set_bit() loop will always be at lest 1 less
> > than gc->ngpio.
> >
> > However, I could see how this is a little are hard for a detection
> > tool to follow through:
> > offset = gc->ngpio;
> >        for_each_set_bit(i, mask, gc->ngpio) {
> >                if ((offset >> BANK_SFT) != (i >> BANK_SFT)) {
>
> Ah yeah, it can't see through the bounds of the "if" and offset and
> the shifts.
>
> > These tools are very cool, and I'd like fix the detection one way or
> > another. Any suggestions on a better syntax?
>
> Well... I don't think it's going to improve its checking of that loop. I
> can just mark it false-positive and ignore it. :) (Or you can init
> reg_val to zero at the top. *shrug*)
Yeah, init to zero sounds good to me, one instruction is nothing
compared to what this saves by not doing the same i2c transaction
multiple times.

Bart do you want the original patch updated or something else?

Nice work on Coverity Kees!

thanks,
Paul

>
> Thanks for looking at it!
>
> -Kees
>
> --
> Kees Cook
