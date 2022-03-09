Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F366E4D3131
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 15:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiCIOpg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 09:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiCIOpf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 09:45:35 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B8613C267
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 06:44:36 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2dbc48104beso25340587b3.5
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 06:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=61OwzzdcNuaafmzqiGoGRT32049t05HT7tBVVqVs134=;
        b=oC4VlLEUKg3s9e7hqE7UJMEM8fGBisF5PvewLWq36Ho3bFdJVehzSQfZA9LDsJu+ca
         FyQYFDs//4dfpjezKbxxWkktFos75aOAYJoYNrCV48P06r2AH6gaXNFcKsL1Lvg/6T82
         QtzdYUNRPJ0NYBhImMJ1RRYalciVsE9LUjFUOMmYnv8g4/RaZJUlsEkCqy3M7b3wnm1d
         GVA952fBWSHJkzDNEqkLuH+XVokmHgky1GgpJy3UrIOJbTJ+4zFnBgpiNZ1Il/rIJ6fa
         ogdm48HZaluMR+wGIF66EgONDBJ0J/kgVSlmM4QYKZA4s6afIOPopjsqniIyLpKEqgGd
         w3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=61OwzzdcNuaafmzqiGoGRT32049t05HT7tBVVqVs134=;
        b=FxSn2zvGQysGwNCk69iyStrnuF2Ci8GyJ44VJCk+sSoBJRaZpl70Fq08Ewb0fLwZTV
         2wD6eUI7xTf24E0z6iOV/dtiKh2rE6i12q94IAzjf2oQnnq/1QiI9p9AHzToRCuEKirb
         rmAtaICygBS1VHPo6rmIZc9ItQFbVs++kDxRQK4lcgxH/5Gt5QDkrlVjqCwoK8dHGUU0
         1bF8gVl925VrBi2rEcZfiatwm/8j+KBCUxL6ttVm2WMbnLywmUMkwb9gra1FXf+UTeRf
         aXFM3ceaMSsFKtjw7p4tGuLYjXraXB+sbo892gJSbgu4R6IyfKeM37x3dNuKx3qJ8L36
         KRyw==
X-Gm-Message-State: AOAM533S730nK+JQ8w959M3negqREag24giuhm+nyCFeQE5/IYDxb60N
        0PNCyTKSMm8w3fw5/NFK3gWr3Ow06hVrjXohs96jYA==
X-Google-Smtp-Source: ABdhPJxg0GSLa0w1rsS+JjtYsA5xH/lttDJb/Ig0K0LHsfUJrF0qY02GtpST0EhkB9+h1Y5PgyqH1bRMW3rFuhF7myM=
X-Received: by 2002:a0d:d187:0:b0:2dc:5d83:217d with SMTP id
 t129-20020a0dd187000000b002dc5d83217dmr35961ywd.189.1646837075761; Wed, 09
 Mar 2022 06:44:35 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtpy8VgK+ag6OsA9TDrwi5YGU4hu7GM8xwpO7v6LrCD4Q@mail.gmail.com>
 <YiiDZ7jjG38gqP+Q@shell.armlinux.org.uk> <CAMj1kXHTdk1Abm7ShoZzrW6EpM9eyFMPSdaa58Ziie4ZMecCnQ@mail.gmail.com>
 <CA+G9fYvCvBBi+dZ+CnUy=ZK6GhCFhBw72_==Cav=Q8QP5T1r5w@mail.gmail.com>
In-Reply-To: <CA+G9fYvCvBBi+dZ+CnUy=ZK6GhCFhBw72_==Cav=Q8QP5T1r5w@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 9 Mar 2022 20:14:24 +0530
Message-ID: <CA+G9fYt73AYs=z-BeZh22RBp==sf73pKky6m4iPSH7a4FssK7w@mail.gmail.com>
Subject: Re: [next] arm: Internal error: Oops: 5 PC is at __read_once_word_nocheck
To:     Ard Biesheuvel <ardb@kernel.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     open list <linux-kernel@vger.kernel.org>,
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

On Wed, 9 Mar 2022 at 19:37, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Wed, 9 Mar 2022 at 16:16, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Wed, 9 Mar 2022 at 11:37, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Wed, Mar 09, 2022 at 03:18:12PM +0530, Naresh Kamboju wrote:
> > > > While boting linux next-20220308 on BeagleBoard-X15 and qemu arm the following
> > > > kernel crash reported which is CONFIG_KASAN enabled build [1] & [2].
> > >
> > > The unwinder is currently broken in linux-next. Please try reverting
> > > 532319b9c418 ("ARM: unwind: disregard unwind info before stack frame is
> > > set up")

I have reverted the suggested commit and built and boot failed due to reported
kernel crash [1].

- Naresh

[1] https://lkft.validation.linaro.org/scheduler/job/4687876
