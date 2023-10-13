Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5C77C7E6F
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 09:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjJMHOy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Oct 2023 03:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjJMHOx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2023 03:14:53 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD56B7
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 00:14:52 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a7b3d33663so23890017b3.3
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697181291; x=1697786091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FDl3hcA4Kpjn0WDz3Qx+R+wRCdAyRoZ2EDAKSDTUus=;
        b=FnxoMLhWoUG/mMX5W8wBiCYQU11JcSCoEFHXZbtrYCtsoSS90nD4smlku+jtgi3FTw
         DTxnDGwd0hSbT7z059bb2QsZQwmSvl1z9/l/0cSPveHidB7Rh5eo7rzg20Rdjf1gjPmx
         LdY3dImeniHb9eFDSjwWJ6YghAC4xbJkB9Jjsfa9e3PBR8FdtMfrfg/uZZ3rFvoAU+yM
         Rmzb6W2JeQuLiCWi+4cRd3eXL/y9lYCCJUpVNGdAE36QPwA5zO1REEDgNdcqz7IPt74J
         XjZGaU16nVUzpRDrVBGxBy67l8yJm760yxLPZB0ZRfy1onKfK80zuLOscEfku3lavQk2
         YFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697181291; x=1697786091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FDl3hcA4Kpjn0WDz3Qx+R+wRCdAyRoZ2EDAKSDTUus=;
        b=SySEpJRCEJTPsfk3Uw/9KoZgWhXh/ily1KF89zThjejxLOB9JTogzHHZRKroVnOMc4
         4dWzMmw4gXM/p8LoIPek0E2miesv/VyJ++T5EOH7E2Zi522/HhOqAKadFHf+glEuqBbe
         Mwq3hRmwTT6ZYn5qWGCZ5PQuHX30bEE9JbCKCFPzymiISRxtkk2UT1c7abjMS+t2m+tG
         onZOjM+icRRVvFZgm2+STSPOdNfjdlClNy3Shwjlh1efpycMMXenrZID+NubCZQAtoGu
         BPi1ZpE8p9ui3HbLTx/tvN++ayIQRuIURdtz2v5vFyXf5yr5dPO7UXGrt4O8mMHLgira
         Ec1A==
X-Gm-Message-State: AOJu0YxcV54PLM0IR09TPCvQ43JpW1BtDJcrhX1bbs5/LVMYKr6gfdJa
        7dlQ2nj5pfmk8Xuqk0TohFtnbld8ER8DZgAgeHvkrg==
X-Google-Smtp-Source: AGHT+IE733mw1TRoz7bn6IyqWjJR2AUmVHKbaLWKeU9ZAQgJOheExDrPdtR4nozBVlPlF7/mWMIisXj3teTO0r84B4A=
X-Received: by 2002:a81:a542:0:b0:5a1:d4f7:8b65 with SMTP id
 v2-20020a81a542000000b005a1d4f78b65mr26403317ywg.27.1697181291569; Fri, 13
 Oct 2023 00:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091831.60a032c2@canb.auug.org.au> <CACRpkdaEVUfFg-O53NBiyWPsjx0VZVMKK7o2ikUMSCy0_AJUGQ@mail.gmail.com>
 <CAMuHMdX3LXZiRRAHSb1FU6nrgtPnyewbUwp7R9Rw2zbxziYz7w@mail.gmail.com>
In-Reply-To: <CAMuHMdX3LXZiRRAHSb1FU6nrgtPnyewbUwp7R9Rw2zbxziYz7w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Oct 2023 09:14:40 +0200
Message-ID: <CACRpkdYNRyL-hywayP97PsLvhEk_Dm4HdnYHHo9N50GXMuxWCg@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the pinctrl tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 13, 2023 at 9:10=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Fri, Oct 13, 2023 at 12:44=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> > On Fri, Oct 13, 2023 at 12:18=E2=80=AFAM Stephen Rothwell <sfr@canb.auu=
g.org.au> wrote:
> > > The following commit is also in Linus Torvalds' tree as a different c=
ommit
> > > (but the same patch):
> > >
> > >   73394a1b2194 ("pinctrl: renesas: rzn1: Enable missing PINMUX")
> > >
> > > This is commit
> > >
> > >   f055ff23c331 ("pinctrl: renesas: rzn1: Enable missing PINMUX")
> > >
> > > in Linus' tree.
> >
> > I had to fix up the commit message, sorry,
>
> The only difference is your added SoB?

No, I'm not that vain...

The merge commit got screwed up (random characters I don't know why).

So since it's just one patch I simply rebased the one patch to the top.

But if I do that, the tools will complain about "non-author signoff".
So I had to sign it off.

> > I'll rebuild my branch for -next.
>
> I'm afraid that won't help, as the original one (from
> renesas-pinctrl-fixes-for-v6.6) is also part of
> renesas-pinctrl-for-v6.7, which I'm gonna send you a PR for later today.
>
> I guess we'll just have to live with it?

It's fine if you drop it and rebase from my side, I understand the
hashes will be different but the content is the same so it is the
same tested.

But I guess there could be reasons for not to, so then we can
live with it I guess.

Yours,
Linus Walleij
