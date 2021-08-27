Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285BA3F928A
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 04:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbhH0Cv3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 22:51:29 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39501 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhH0Cv3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Aug 2021 22:51:29 -0400
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 17R2oH7a030715;
        Fri, 27 Aug 2021 11:50:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 17R2oH7a030715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630032618;
        bh=3ul5FdNxXDzBoCZ3stt7fV3y49FCqdWTBTBeH0mAs0U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HaFYJLjmaQHVSaQfeVTlgO8w3r/crCi3okE82ywbNgAYqU6wOiXCWz7fPB5RHOVGX
         ApzhUHJ1fPae/vfR9LXUgr62Br5X02CVKlvLEt5SAtytcCxwPZ1WSO5ONC8PmHCNbV
         3j6F60wIYtlMCeEzNpNHxNkeW++Xzjj0aHChbgJPGQU/DKiiMGM+lMDZt8DRLUJblB
         N6f/HysajgQhecxq0kBsp4XhEzAQqXfJX2AyeQP3Vp+n2PTvNboaW+E5ROdmdDPlCD
         Y4nNzBpxVY5W1++s/Upzu2QEaKurOLF9LUyAo/QbLp/OYOdc/GH8c/+bFsdOLAPW1s
         Cg4ARkBqKtDFw==
X-Nifty-SrcIP: [209.85.214.174]
Received: by mail-pl1-f174.google.com with SMTP id n12so3011987plk.10;
        Thu, 26 Aug 2021 19:50:18 -0700 (PDT)
X-Gm-Message-State: AOAM531CALwvdQtyukngryUYN5r81Vha3abrFGx76vo3jJ+Nv2duY+vG
        Q/TIpqBu9fCzEn0FMmu6wi1641vlWVhLM6inArQ=
X-Google-Smtp-Source: ABdhPJyWXAjLg1wSsMAMpNAb/xV7A58D2hn+JY/cFGWUWGHjm0NirHuYD4IuWNqJPcttkjgRP0r/nD0czld8RL7hNFM=
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr6522746plq.71.1630032617285; Thu, 26 Aug
 2021 19:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210826191330.40dc43e8@canb.auug.org.au> <CAK7LNASL2JNb4zT7UFr41dLO0oEuvc6yUg__qhc59q8aNqWxEg@mail.gmail.com>
 <20210827115052.00391d9a@canb.auug.org.au>
In-Reply-To: <20210827115052.00391d9a@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 27 Aug 2021 11:49:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0Gxap8oxDMqcO8b9t8B2+g98pRWenJEQCEYw+9Bn3qg@mail.gmail.com>
Message-ID: <CAK7LNAQ0Gxap8oxDMqcO8b9t8B2+g98pRWenJEQCEYw+9Bn3qg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 27, 2021 at 10:50 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> On Fri, 27 Aug 2021 09:52:18 +0900 Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Aug 26, 2021 at 6:13 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the kbuild tree, today's linux-next build (x86_64
> > > allnoconfig) failed like this:
> > >
> > > make[2]: *** No rule to make target 'scripts/mod/empty.o', needed by '__build'.
> > >
> > > Caused by commit
> > >
> > >   624a912f84bc ("kbuild: detect objtool changes correctly and remove .SECONDEXPANSION")
> > >
> > > (at least, reverting that commit fixes it)
> > >
> > > I use a separate object directory and, in this case, it is newly created.
> > >
> > > A build with V=1 and -s removed (and no -j) gives this around the
> > > failure:
> > >
> > > make -f /home/sfr/next/next/scripts/Makefile.build obj=scripts/mod
> > > make[2]: *** No rule to make target 'scripts/mod/empty.o', needed by '__build'.  Stop.
> > > make[1]: *** [/home/sfr/next/next/Makefile:1309: prepare0] Error 2
> > >
> > > I have reverted that commit for today.
> >
> >
> > Hmm, it is strange.
> >
> >
> > I re-applied that commit based on today's linux-next
> > (git cherry-pick  624a912f84bc)
> >
> > allnoconfig built successfully.
> >
> >
> > My build log is as follows.
> >
> > Can you tell the exact steps to reproduce the error?
> >
> >
> >
> > masahiro@grover:~/ref/linux-next$ git log -2 --oneline
> > 5046c6516ca2 (HEAD -> tmp) kbuild: detect objtool changes correctly
> > and remove .SECONDEXPANSION
> > 88fac11862d3 (tag: next-20210826, origin/master, origin/HEAD) Add
> > linux-next specific files for 20210826
> > masahiro@grover:~/ref/linux-next$ rm -rf /tmp/foo
> > masahiro@grover:~/ref/linux-next$ make O=/tmp/foo  allnoconfig all
>
> I did more or less the same:
>
> $ rm -rf ../x86_64_allnoconfig
> $ mkdir ../x86_64_allnoconfig
> $ make ARCH=x86_64 O=../x86_64_allnoconfig CROSS_COMPILE=x86_64-linux-gnu- allnoconfig
> $ make V=1 ARCH=x86_64 O=../x86_64_allnoconfig CROSS_COMPILE=x86_64-linux-gnu- -O
>
> I do cross builds hosted on a PowerPC LE host.
>
> --
> Cheers,
> Stephen Rothwell




Ah, OK.
Now I understood what was happening.

scripts/mod/ is built before objtool, so
the dependency is not met.

I was previously not able to reproduce it
because a stale objtool was remaining in my source tree.
'make clean' cannot clean up objtool.

I will fix it by tomorrow's linux-next.



-- 
Best Regards
Masahiro Yamada
