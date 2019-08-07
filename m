Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5925184EFD
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 16:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbfHGOnu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 10:43:50 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16422 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbfHGOnu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 10:43:50 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x77Ehc96019415;
        Wed, 7 Aug 2019 23:43:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x77Ehc96019415
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565189019;
        bh=/JMuf66dpHQpVrx+iK6cRZpErJQAF9lLb6RxvsazUgA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YwsL5UZmFZC3ZmQtxhLoNnylQFyn8FmOcasacZpCoJxrJPW/dAY/qNEpAo3AC5nXy
         d0f0zX0roDfvicCJEg1FqEvitmYDY5K/hFcqB2nIXU0WcuZcB7z7zX4FJp8s/ZEc1x
         LiX8mnDpLKAa+dWUtfImodjktINSElddVCt6m0KPHnbUyJ9h3N3YvMhLTr3kDKt1zr
         itK3Dk6sdrK+IDZZ7MuKGQcyq6qT/S4mztdqHoRbM6zQWhflMzSRQO/N5nhg2RofU1
         3EbCi2qq2R6TJE1zK6mFanzUbh1E/WFZshZuYKVrBLq9yoQsglwRKd1zx1N1uq4Ljn
         pJrK+g21IhmBw==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id v18so35105981uad.12;
        Wed, 07 Aug 2019 07:43:39 -0700 (PDT)
X-Gm-Message-State: APjAAAVLzFm0yggh/EdGUHPLPEK+Ttlz8iHdQEom8b2vPvQUhh4hHgL1
        5I4pm8W2uZBDOJ0V1czm7nj2UQhjuxab1r30jpg=
X-Google-Smtp-Source: APXvYqxDqotVqYCy/FwyuhXBsoxhmVR3P/BOmsY+Y15m7Zcsx9D2cLdaYutFF/3Y6PkkMQQkVkMWbWP/8P9Wkt8hYc0=
X-Received: by 2002:a9f:2265:: with SMTP id 92mr6134889uad.121.1565189018195;
 Wed, 07 Aug 2019 07:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190807095022.0314e2fc@canb.auug.org.au> <CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com>
 <20190807114614.ubzlkulk7aidws3p@willie-the-truck>
In-Reply-To: <20190807114614.ubzlkulk7aidws3p@willie-the-truck>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 7 Aug 2019 23:43:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNASr8mbGDbWikr2P8Pc_6WEpMyXuK-xkgypYOzkWw_6LUw@mail.gmail.com>
Message-ID: <CAK7LNASr8mbGDbWikr2P8Pc_6WEpMyXuK-xkgypYOzkWw_6LUw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the arm64 tree
To:     Will Deacon <will@kernel.org>
Cc:     Peter Collingbourne <pcc@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi.

On Wed, Aug 7, 2019 at 8:46 PM Will Deacon <will@kernel.org> wrote:
>
> Hi Peter,
>
> On Tue, Aug 06, 2019 at 07:34:36PM -0700, Peter Collingbourne wrote:
> > On Tue, Aug 6, 2019 at 4:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > After merging the arm64 tree, today's linux-next build (powerpc
> > > ppc64_defconfig) was just spinning in make - it executing some scripts,
> > > but it was hard to catch just what.
> > >
> > > Apparently caused by commit
> > >
> > >   5cf896fb6be3 ("arm64: Add support for relocating the kernel with RELR relocations")
> > >
> > > I have not idea why, but reverting the above commit allows to build
> > > to finish.
> >
> > Okay, I can reproduce with:
>
> Likewise.
>
> > That leads me to ask what is special about $(NM) + powerpc? It turns
> > out to be this fragment of arch/powerpc/Makefile:
> >
> > ifdef CONFIG_PPC64
> > new_nm := $(shell if $(NM) --help 2>&1 | grep -- '--synthetic' >
> > /dev/null; then echo y; else echo n; fi)
> >
> > ifeq ($(new_nm),y)
> > NM              := $(NM) --synthetic
> > endif
> > endif
> >
> > We're setting NM to something else based on a config option, which I
> > presume sets up some sort of circular dependency that confuses
> > Kconfig. Removing this fragment of the makefile (or appending
> > --synthetic unconditionally) also makes the problem go away.

Exactly. This makes a circular dependency.
Kconfig determines the environment variable 'NM' has been changed,
and re-runs.



> Yes, I think you're right. The lack of something like KBUILD_NMFLAGS means
> that architectures are forced to override NM entirely if they want to pass
> any specific options. Making that conditional on a Kconfig option appears
> to send the entire thing recursive.

Adding KBUILD_NMFLAGS is probably the right thing to do.
(Is there somebody who wants to volunteer for this?)

But, for this particular case, I vote for
the entire removal of --synthetic.

This dates back to 2004, and the commit message
did not clearly explain why it was needed.

The PowerPC maintainers should re-evaluate
whether or not this flag is necessary.

ppc32 is working without --synthetic,
so probably ppc64 would be ...



>
> > So I guess we have a couple of possible quick fixes (assuming that the
> > Kconfig issue can't be solved somehow): either stop passing --synthetic on
> > powerpc and lose a couple of symbols in 64-bit kernels, or start passing
> > it unconditionally on powerpc (it doesn't seem to make a difference to the
> > nm output on a ppc64_defconfig kernel with CONFIG_PPC64=n). I'm cc'ing the
> > powerpc maintainers for their opinion on what to do. While this is being
> > resolved we should probably back out my patch from -next.
>
> Although Alpha, Itanic and PowerPC all override NM, only PowerPC does it
> conditionally so I agree with you that passing '--synthetic' unconditionally
> would resolve the problem and is certainly my preferred approach if mpe is
> ok with it.
>
> In the meantime, it seems a shame to revert your patch, so I'll bodge it
> as below and we can revert the bodge if PowerPC manages to remove the
> conditional NM override. Sound ok to you?
>
> Cheers,
>
> Will
>
> --->8
>
> diff --git a/init/Kconfig b/init/Kconfig
> index d96127ebc44e..a38027a06b79 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -31,7 +31,7 @@ config CC_HAS_ASM_GOTO
>         def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
>
>  config TOOLS_SUPPORT_RELR
> -       def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
> +       def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(CROSS_COMPILE)nm" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
>
>  config CC_HAS_WARN_MAYBE_UNINITIALIZED
>         def_bool $(cc-option,-Wmaybe-uninitialized)

Maybe,

def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "OBJCOPY=$(OBJCOPY)"
$(srctree)/scripts/tools-support-relr.sh)

will work.


Or more simply

def_bool $(success,$(srctree)/scripts/tools-support-relr.sh)



CC, LD, OBJCOPY, NM are environment variables,
so I think tools-support-relr.sh can directly use them.


However, this bypasses the detection of environment variable changes.
If a user passes NM= from the command line, Kconfig will no longer
notice the change of NM.



-- 
Best Regards
Masahiro Yamada
