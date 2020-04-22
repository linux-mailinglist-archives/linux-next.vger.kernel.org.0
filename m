Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CE11B40B5
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 12:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729699AbgDVKrZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 06:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729704AbgDVKPu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2020 06:15:50 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B291C03C1A9
        for <linux-next@vger.kernel.org>; Wed, 22 Apr 2020 03:15:50 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id t8so1034330uap.3
        for <linux-next@vger.kernel.org>; Wed, 22 Apr 2020 03:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ent6+GWTAd1CN2cQFL7owIeVj6EL283gNxioSTs4l5o=;
        b=F32QzgthXD2jgAuQ+ulZ7jjKUc5cEILBetXy1JuSILGE0igdjC2J+lnu2jSNRH5O+P
         iUF47dndUkLlazROwjFbGHDTMtiDDzdTJikSM1TF/CvtD9WvqW2VEQhu2wAO7wiglWL6
         MMekwxK9vV8suAiRek8nAFqL0lJwXKAZSg3US0Bj/E8at5iKP/lc/QmsNULdHi2kp33H
         l7srBJ5x4usVwd4oulnyViwGb5/3CGCvs0VwhB5f6oXkQD2pcAy+Y2XagtstUjUHbi+e
         4bHO8GzDRl86l2mdjcRT43iujjarSg946/pa9aUENTDs7od6CaGTzGwAuHdVlQUIjgtm
         v/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ent6+GWTAd1CN2cQFL7owIeVj6EL283gNxioSTs4l5o=;
        b=Wh0VBxO4l8s27qH/aZR0v+hhrzKKh3sD9cwZ/IyIMOxfbEnSuyHfW8PaJpjHwEbAc5
         D9vrCupnwoRkKP7Q30rOu5z4qMLMFd2tu1DKcNHsQmXcr/8TOSJAbg120AP2TQUhneon
         2or8BTj54kzAMr05ukhcF9dxjYtZHXb7oAiOr7UCmMmePfS1ChC5y5+xuMGMkH0zlaMY
         Bst3zADCSMjYHXyJcJOo4pAWoy2PS1raTST1ync6SI6WENTrSD5wDa+CsjeHzFyqAY59
         EFhxg79q5jGj51S3VkC/vkjVCbJxAqiWO9KZBCyVZxolL0hTQ7xePsMXj/5nb4zF6X8c
         pcLg==
X-Gm-Message-State: AGi0Pubqyr1mUbzE0EDx/LStJ6UNYuHPOlnlc88Ek1BUqtDI7XEbSJfN
        4QQcAXsnPl7KLanCBkTfmsMjXOpxuOCxVfSt56NEbQ==
X-Google-Smtp-Source: APiQypLkLgLmjx37u5zwjtD+wcJhoFaiBukTOUSNTmPHeMUtYrDFKBnEw8llvD54u+Y56sM/sAqQ1C17tA2NQVE11MY=
X-Received: by 2002:ab0:2ea:: with SMTP id 97mr15760020uah.129.1587550548143;
 Wed, 22 Apr 2020 03:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200417145017.3932443d@canb.auug.org.au> <995a958c-15a1-cb05-e276-065c7f6e57fd@infradead.org>
 <CAPDyKFqE7zfaKSbpBoBbrSCEnx+70dOrWs+=QG_x2G-Fpt6=ng@mail.gmail.com>
 <ce11a0b5-22a6-dd18-f858-5d30f43e1128@intel.com> <CAK7LNARCT3YQEnVE0NMCphSuqvjLoG2EXdpdcAZuoEOD_mFyEw@mail.gmail.com>
In-Reply-To: <CAK7LNARCT3YQEnVE0NMCphSuqvjLoG2EXdpdcAZuoEOD_mFyEw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 22 Apr 2020 12:15:12 +0200
Message-ID: <CAPDyKFqCnUzHQ9+FKH-w_VLRNQ_UvK4nmxw+hROwXkxucjzrUw@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 17 (mmc/host/sdhci-of-at91.c)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 20 Apr 2020 at 14:28, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Apr 20, 2020 at 7:28 PM Adrian Hunter <adrian.hunter@intel.com> w=
rote:
> >
> > On 20/04/20 12:12 pm, Ulf Hansson wrote:
> > > + Masahiro Yamada, Adrian Hunter
> > >
> > > On Fri, 17 Apr 2020 at 16:48, Randy Dunlap <rdunlap@infradead.org> wr=
ote:
> > >>
> > >> On 4/16/20 9:50 PM, Stephen Rothwell wrote:
> > >>> Hi all,
> > >>>
> > >>> Changes since 20200416:
> > >>>
> > >>
> > >> on i386:
> > >>
> > >>   CC      drivers/mmc/host/sdhci-of-at91.o
> > >> In file included from ../include/linux/build_bug.h:5:0,
> > >>                  from ../include/linux/bitfield.h:10,
> > >>                  from ../drivers/mmc/host/sdhci-of-at91.c:9:
> > >> ../drivers/mmc/host/sdhci-of-at91.c: In function =E2=80=98sdhci_at91=
_set_clks_presets=E2=80=99:
> > >> ../include/linux/compiler.h:394:38: error: call to =E2=80=98__compil=
etime_assert_63=E2=80=99 declared with attribute error: FIELD_PREP: value t=
oo large for the field
> > >>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
> > >>                                       ^
> > >> ../include/linux/compiler.h:375:4: note: in definition of macro =E2=
=80=98__compiletime_assert=E2=80=99
> > >>     prefix ## suffix();    \
> > >>     ^~~~~~
> > >> ../include/linux/compiler.h:394:2: note: in expansion of macro =E2=
=80=98_compiletime_assert=E2=80=99
> > >>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNT=
ER__)
> > >>   ^~~~~~~~~~~~~~~~~~~
> > >> ../include/linux/build_bug.h:39:37: note: in expansion of macro =E2=
=80=98compiletime_assert=E2=80=99
> > >>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg=
)
> > >>                                      ^~~~~~~~~~~~~~~~~~
> > >> ../include/linux/bitfield.h:49:3: note: in expansion of macro =E2=80=
=98BUILD_BUG_ON_MSG=E2=80=99
> > >>    BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
> > >>    ^~~~~~~~~~~~~~~~
> > >> ../include/linux/bitfield.h:94:3: note: in expansion of macro =E2=80=
=98__BF_FIELD_CHECK=E2=80=99
> > >>    __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
> > >>    ^~~~~~~~~~~~~~~~
> > >> ../drivers/mmc/host/sdhci-of-at91.c:185:11: note: in expansion of ma=
cro =E2=80=98FIELD_PREP=E2=80=99
> > >>   caps1 |=3D FIELD_PREP(SDHCI_CLOCK_MUL_MASK, clk_mul);
> >
> > My guess is the compiler has decided clk_mul is constant (probably (uns=
igned
> > int)-1) because there is no CONFIG_COMMON_CLK i.e. clk_get_rate() is 0
> >
> > So maybe add to config MMC_SDHCI_OF_AT91
> >
> >         depends on COMMON_CLK
> >
> > >>            ^~~~~~~~~~
>
>
>
> I checked include/linux/clk.h
>
>
> clk_get_rate() is guarded by CONFIG_HAVE_CLK.
>
> I think
>
>     depends on HAVE_CLK

Do you have the possibility of sending a patch, asap. Otherwise I can
help to do it!?

Kind regards
Uffe
