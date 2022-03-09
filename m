Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B9F4D30CE
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 15:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233222AbiCIOIV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 09:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbiCIOIV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 09:08:21 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4AD817CC7F
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 06:07:18 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id g26so4537759ybj.10
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 06:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5HT2h80lnibZhJBvnGZywx4ZmrOaqIdDqke0BNvZjD8=;
        b=i0P5AaBhFm+ZgOCecsRLrSBiPusUntyyw8Jgsp7c72mfyQdaEBinejSZfSe5Aiy/d0
         EIiUGIagjA7TVUEy+THydeXthBR1/RuBf1lsuCXGhGslyrbiDMkBfYrtl8Bve0QA9sRC
         HnMaPRvX4o1LUyirLTPfZHj37v11xL6pYf5MWpabx97ZO+3kIUO3dfLJT1MbW6WWDWPs
         TOFdx/SszAQO65ZeAa/jaOQ9eFfXfASzfMA9LDKQjb2+pUZL9Gcx+TPnLulR0EfhLRdr
         idCyfJmmTmcRXQ732Lsi3VaUQ0ManV3PmC4lghMtH9Lp+f4ItadekqPxZvid91DeGgvt
         rBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5HT2h80lnibZhJBvnGZywx4ZmrOaqIdDqke0BNvZjD8=;
        b=iPYUYZwQEOGwOlagYWJAoVPBBDjXRY2b8fkTKYpCXJTYc8r+sfpb99yjEyqQZHU/zy
         kGF0qygVkotM38jCim2d96hjZRUgrcIizQr7WQik5eVgXEo5S2p6T9QDt5JaF+RHS/ju
         sxo5A5nNEg0IWewFCzhSte5QR7QpBZFLgdaPCizvT0TjYm1LmRZZCcxmeV5YvX4clNl6
         hecU4za3VL7EeXJ7vGd6K9DYazB0LvBDoYh3v8Qxiygy+I4QWW9zYhTZLAFGjz2sT3f+
         VafneOnV/4zFuovP8he1vaJQ3t6cAl4peiTAfU5Eb9fcrNHerJm3Fm03ap/64EtI4DW8
         P38w==
X-Gm-Message-State: AOAM532INTMDZURpUpVW4jpCYTimmatuyqpGv0wNaHcw1LvcBtqGtu64
        ICNHKsWFxqd4XA6uYJlRL8cL4dLvg0g4vc/Rw9rTNw==
X-Google-Smtp-Source: ABdhPJxUAt2jKYmOxzjRz1AanW9ecIVOygJFBDur3mBMmvMhF4ZpUyB+1V8daMxrIshDfw0fRbKA9Qljv+MCcWgZj3s=
X-Received: by 2002:a25:4109:0:b0:628:7778:fb18 with SMTP id
 o9-20020a254109000000b006287778fb18mr16149936yba.412.1646834837778; Wed, 09
 Mar 2022 06:07:17 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtpy8VgK+ag6OsA9TDrwi5YGU4hu7GM8xwpO7v6LrCD4Q@mail.gmail.com>
 <YiiDZ7jjG38gqP+Q@shell.armlinux.org.uk> <CAMj1kXHTdk1Abm7ShoZzrW6EpM9eyFMPSdaa58Ziie4ZMecCnQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHTdk1Abm7ShoZzrW6EpM9eyFMPSdaa58Ziie4ZMecCnQ@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 9 Mar 2022 19:37:06 +0530
Message-ID: <CA+G9fYvCvBBi+dZ+CnUy=ZK6GhCFhBw72_==Cav=Q8QP5T1r5w@mail.gmail.com>
Subject: Re: [next] arm: Internal error: Oops: 5 PC is at __read_once_word_nocheck
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 9 Mar 2022 at 16:16, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 9 Mar 2022 at 11:37, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Wed, Mar 09, 2022 at 03:18:12PM +0530, Naresh Kamboju wrote:
> > > While boting linux next-20220308 on BeagleBoard-X15 and qemu arm the following
> > > kernel crash reported which is CONFIG_KASAN enabled build [1] & [2].
> >
> > The unwinder is currently broken in linux-next. Please try reverting
> > 532319b9c418 ("ARM: unwind: disregard unwind info before stack frame is
> > set up")
> >
>
> Yeah.
>
> This is the same spot Corentin hit before, where the double
> dereference of vsp is not guarded by anything like
> get_kernel_nofault(). We should probably fix that, but that doesn't
> address the underlying issue, of course.
>
> I'm a bit puzzled, though, that this appears now, and didn't before.
>
> Naresh, I take it you did not see this occurring on earlier linux-nexts?

Yes.
Earlier  linux-next arm boot failed due to [1],
         unwind: Index not found

> I'll try to reproduce this, and see if I can make sense of it. In the
> mean time, please do the revert Russell suggested, and if that doesn't
> help, maybe try a bisect?

I will try your suggestions and get back to you.

- Naresh

[1] https://lore.kernel.org/linux-arm-kernel/20220301220536.1302898-1-ardb@kernel.org/T/
