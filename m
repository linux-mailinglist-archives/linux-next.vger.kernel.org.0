Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012E71B41BF
	for <lists+linux-next@lfdr.de>; Wed, 22 Apr 2020 12:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731723AbgDVKzP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 06:55:15 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63110 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728407AbgDVKzM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Apr 2020 06:55:12 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 03MAsqcF021330;
        Wed, 22 Apr 2020 19:54:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 03MAsqcF021330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587552893;
        bh=jfh1cK7HJOI325fUjanL8XPRkeokyI4Z/JTzo0Sr8Do=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B80hubZ2FF2o4Lwg7A6dE55/FK55YkMbcV5VTqzDz1p5tgc6FqY7550SeasM8YlVa
         UeFowE8sIQje/lY6KdTEL1qbZJ6owtDuynRDgUTmLz+d4w1aeNgSMq8ZZXaISqggo5
         76YxmS3GHJ7zI7LZpGzd7hAludfGdAmPOK/TZgxECxYUZ9xphINa8ghnvHm4Ji+tXI
         vmm3ypw23fGahpMLiilRKm7Sco+SvpNAR1XVibyiCVOm7NS/nrEbA1LTCAXLpgLSiJ
         8OPgg8iLjg11vKjgS70d7Ma/IEwcl9kg7oZQuw3WKTrD5c6am6hmR3w8ufAedh3kYe
         XXabkjRAbua7g==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id i5so1124855uaq.1;
        Wed, 22 Apr 2020 03:54:52 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ0gepQY6A1cigEwLM0luW2OXuwH/xYgbHJooo9YdYEPC/byT99
        fUb2wf/357qIyeQFKKcsl9vFV2GOozZDt3xdMjQ=
X-Google-Smtp-Source: APiQypL30Nui5tPzkrGBdvSXz/n6jOoR3K76pfkfTXG9nIPiej9yLCr1V7+RXT0AY8ax3rsoJqDfvRVZu7IF2lj0zKA=
X-Received: by 2002:a67:6542:: with SMTP id z63mr19799049vsb.179.1587552891425;
 Wed, 22 Apr 2020 03:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200417145017.3932443d@canb.auug.org.au> <995a958c-15a1-cb05-e276-065c7f6e57fd@infradead.org>
 <CAPDyKFqE7zfaKSbpBoBbrSCEnx+70dOrWs+=QG_x2G-Fpt6=ng@mail.gmail.com>
 <ce11a0b5-22a6-dd18-f858-5d30f43e1128@intel.com> <CAK7LNARCT3YQEnVE0NMCphSuqvjLoG2EXdpdcAZuoEOD_mFyEw@mail.gmail.com>
 <CAPDyKFqCnUzHQ9+FKH-w_VLRNQ_UvK4nmxw+hROwXkxucjzrUw@mail.gmail.com>
In-Reply-To: <CAPDyKFqCnUzHQ9+FKH-w_VLRNQ_UvK4nmxw+hROwXkxucjzrUw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Apr 2020 19:54:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpn++MWTdBCvFbiu3WgHbNVFhDSm+Ts1CmnbmYL_84GA@mail.gmail.com>
Message-ID: <CAK7LNASpn++MWTdBCvFbiu3WgHbNVFhDSm+Ts1CmnbmYL_84GA@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 17 (mmc/host/sdhci-of-at91.c)
To:     Ulf Hansson <ulf.hansson@linaro.org>
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

Hi Ulf,

On Wed, Apr 22, 2020 at 7:15 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 20 Apr 2020 at 14:28, Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
> >
> > On Mon, Apr 20, 2020 at 7:28 PM Adrian Hunter <adrian.hunter@intel.com>=
 wrote:
> > >
> > > On 20/04/20 12:12 pm, Ulf Hansson wrote:
> > > > + Masahiro Yamada, Adrian Hunter
> > > >
> > > > On Fri, 17 Apr 2020 at 16:48, Randy Dunlap <rdunlap@infradead.org> =
wrote:
> > > >>
> > > >> On 4/16/20 9:50 PM, Stephen Rothwell wrote:
> > > >>> Hi all,
> > > >>>
> > > >>> Changes since 20200416:
> > > >>>
> > > >>
> > > >> on i386:
> > > >>
> > > >>   CC      drivers/mmc/host/sdhci-of-at91.o
> > > >> In file included from ../include/linux/build_bug.h:5:0,
> > > >>                  from ../include/linux/bitfield.h:10,
> > > >>                  from ../drivers/mmc/host/sdhci-of-at91.c:9:
> > > >> ../drivers/mmc/host/sdhci-of-at91.c: In function =E2=80=98sdhci_at=
91_set_clks_presets=E2=80=99:
> > > >> ../include/linux/compiler.h:394:38: error: call to =E2=80=98__comp=
iletime_assert_63=E2=80=99 declared with attribute error: FIELD_PREP: value=
 too large for the field
> > > >>   _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
> > > >>                                       ^
> > > >> ../include/linux/compiler.h:375:4: note: in definition of macro =
=E2=80=98__compiletime_assert=E2=80=99
> > > >>     prefix ## suffix();    \
> > > >>     ^~~~~~
> > > >> ../include/linux/compiler.h:394:2: note: in expansion of macro =E2=
=80=98_compiletime_assert=E2=80=99
> > > >>   _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
> > > >>   ^~~~~~~~~~~~~~~~~~~
> > > >> ../include/linux/build_bug.h:39:37: note: in expansion of macro =
=E2=80=98compiletime_assert=E2=80=99
> > > >>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), m=
sg)
> > > >>                                      ^~~~~~~~~~~~~~~~~~
> > > >> ../include/linux/bitfield.h:49:3: note: in expansion of macro =E2=
=80=98BUILD_BUG_ON_MSG=E2=80=99
> > > >>    BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
> > > >>    ^~~~~~~~~~~~~~~~
> > > >> ../include/linux/bitfield.h:94:3: note: in expansion of macro =E2=
=80=98__BF_FIELD_CHECK=E2=80=99
> > > >>    __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
> > > >>    ^~~~~~~~~~~~~~~~
> > > >> ../drivers/mmc/host/sdhci-of-at91.c:185:11: note: in expansion of =
macro =E2=80=98FIELD_PREP=E2=80=99
> > > >>   caps1 |=3D FIELD_PREP(SDHCI_CLOCK_MUL_MASK, clk_mul);
> > >
> > > My guess is the compiler has decided clk_mul is constant (probably (u=
nsigned
> > > int)-1) because there is no CONFIG_COMMON_CLK i.e. clk_get_rate() is =
0
> > >
> > > So maybe add to config MMC_SDHCI_OF_AT91
> > >
> > >         depends on COMMON_CLK
> > >
> > > >>            ^~~~~~~~~~
> >
> >
> >
> > I checked include/linux/clk.h
> >
> >
> > clk_get_rate() is guarded by CONFIG_HAVE_CLK.
> >
> > I think
> >
> >     depends on HAVE_CLK
>
> Do you have the possibility of sending a patch, asap. Otherwise I can
> help to do it!?


Sorry.

I can send a patch if it is preferred.

Do you need a separate patch, or
do you want to squash the fix-up
to keep the bisectability?


--=20
Best Regards
Masahiro Yamada
