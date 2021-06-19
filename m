Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F9B3AD65A
	for <lists+linux-next@lfdr.de>; Sat, 19 Jun 2021 02:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbhFSAtZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 20:49:25 -0400
Received: from condef-06.nifty.com ([202.248.20.71]:61296 "EHLO
        condef-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbhFSAtZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Jun 2021 20:49:25 -0400
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-06.nifty.com with ESMTP id 15J0fp16018982;
        Sat, 19 Jun 2021 09:41:51 +0900
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 15J0fX4i023124;
        Sat, 19 Jun 2021 09:41:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 15J0fX4i023124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1624063294;
        bh=rgoVu9s2Lg12uiAiITbRcgtOyYtubRfPM7v3On3I0M0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=daAdGjs28g30IPWg7XdtQBylWOApwujBahnizJyGJakCPDjQPAd+6vGhq+YyQiYop
         rCdAm+OPAS5bHGWhvMAzagNgxgKOGUS9BSqtpUCczZ7CnDPErs4xK7npr8b4K4g3Mr
         Y5P/TeEHSwpbLiRcVM61GcNvfgHCgXj0sJJSd85+yQm793xtj91SHR3xKdQIQBCB7Y
         TgYXtL/b5Q9n8qmvXCR8vQsGje1iPfCENW92h16GCyGIj1arcAoucJO0h2S1BJVQ2H
         sNM5mNUHH5C+3PWTpkL7wrEARgvhayYye2qZ4gsecqkuIzPiQHCiCa348i/ypxDgO0
         +R9AUx/GKgFbw==
X-Nifty-SrcIP: [209.85.210.177]
Received: by mail-pf1-f177.google.com with SMTP id g192so1317832pfb.6;
        Fri, 18 Jun 2021 17:41:33 -0700 (PDT)
X-Gm-Message-State: AOAM532RrL6A+xhtVPb/CEjwGLdWQG1YKnXxV/8c3KbMaKSzJNxYLmDk
        XWi3TgER8gKu8Y8FG7LejTmZ9WfE5EuoxawfwEM=
X-Google-Smtp-Source: ABdhPJys4dgtJ91FHTIG4s3fzPBxyjCYxPLtFM7ZixFRuX74DyHqpTXy7cs5r/zTPeXzcPfXUvTKi9eb6GtjE5+ul4g=
X-Received: by 2002:a63:36c1:: with SMTP id d184mr12522722pga.47.1624063293183;
 Fri, 18 Jun 2021 17:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <YMtib5hKVyNknZt3@osiris> <20210617193139.856957-1-nathan@kernel.org>
 <YMxcdv/1taBevSjP@osiris>
In-Reply-To: <YMxcdv/1taBevSjP@osiris>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 19 Jun 2021 09:40:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNARuSmPCEy-ak0erPrPTgZdGVypBROFhtw+=3spoGoYsyw@mail.gmail.com>
Message-ID: <CAK7LNARuSmPCEy-ak0erPrPTgZdGVypBROFhtw+=3spoGoYsyw@mail.gmail.com>
Subject: Re: [PATCH] scripts/min-tool-version.sh: Raise minimum clang version
 to 13.0.0 for s390
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 18, 2021 at 5:42 PM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Thu, Jun 17, 2021 at 12:31:40PM -0700, Nathan Chancellor wrote:
> > clang versions prior to the current development version of 13.0.0 cannot
> > compile s390 after commit 3abbdfde5a65 ("s390/bitops: use register pair
> > instead of register asm") and the s390 maintainers do not intend to work
> > around this in the kernel. Codify this in scripts/min-tool-version.sh
> > similar to arm64 with GCC 5.1.0 so that there are no reports of broken
> > builds.
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >
> > This should probably go through the s390 tree with Masahiro's ack.

Acked-by: Masahiro Yamada <masahiroy@kernel.org>


> Thank's a lot!
>
> I'll add the below text to the commit message, and apply it internally
> first:
>
> [hca@linux.ibm.com: breaking compatibility with older clang compilers
>  is intended to finally make use of a feature which allows the
>  compiler to allocate even/odd register pairs. This is possible since
>  a very long time with gcc, but only since llvm-project commit
>  d058262b1471 ("[SystemZ] Support i128 inline asm operands.") with
>  clang. Using that feature allows to get rid of error prone register
>  asm statements, of which the above named kernel commit is only the
>  first of a larger not yet complete series]
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/YMxcdv/1taBevSjP%40osiris.



-- 
Best Regards
Masahiro Yamada
