Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5125D31852A
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 07:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhBKGVP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 01:21:15 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:52374 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhBKGVO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Feb 2021 01:21:14 -0500
X-Greylist: delayed 78087 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Feb 2021 01:21:13 EST
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 11B6KGuG003048;
        Thu, 11 Feb 2021 15:20:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 11B6KGuG003048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613024417;
        bh=18Ac+joCd35mcZvtzwWkqtE7ib4nBE3U+pSc4292Spg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lTp9Xxong/96zw90ZdcFEqbTaJJIt7eh+0sOlzp/VODKqsUXDhuzPFycwYYjcCBCl
         i0vQiulFmnmPk2i4jVBoRnkpr1Jrjnd25GMduU01p/x2qRQkpb3hpwK55OWQF0ZCQC
         pGKLxK/8w8qxBufgmdi1cNMOu3M/UGoLB8EtUaeeGoShvcuEAt71n5lWNxbbeuQd9p
         dL8kPBSC/zFcRHwhVYFmkvIAWxFXwehbwX6bL9V5StEsCZpsSsuhHybYFMpbvmOlMi
         kHrnxByuZI/9CJgwUb5UI9b2on3hsawftBKBjhC+nUppWwcHijCiE46U63JUtJHThL
         mpNd8bumpMlGg==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id cv23so2830566pjb.5;
        Wed, 10 Feb 2021 22:20:16 -0800 (PST)
X-Gm-Message-State: AOAM530A7lGCNCbsNidFjP4TalrlHyAonf5u7Fpmso6T99u/Zcc98Ce8
        aEDOCF+f16YAWNfvSI4RK3fKjh2Q3bVxlxFZc2g=
X-Google-Smtp-Source: ABdhPJzNjm19cShZSpkhPKpuzRe8AurU1AlWGwv0P5ielYIXxMSCzEDIv08HIaNMcnUtkqmpBUqECAU9sDYT+9Glvk0=
X-Received: by 2002:a17:902:bb87:b029:e1:d1f:2736 with SMTP id
 m7-20020a170902bb87b02900e10d1f2736mr6332156pls.1.1613024415986; Wed, 10 Feb
 2021 22:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20210209210843.3af66662@canb.auug.org.au> <YCKnRPRTDyfGxnBC@gunter>
 <20210210085051.7fb951d1@canb.auug.org.au> <YCOUGGJtUJ+Nf0ZA@gunter> <CAK7LNAQn8BX9H577Mfp8WMzzaZZ=oZdEti1Lx2XptZY8aHmzuQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQn8BX9H577Mfp8WMzzaZZ=oZdEti1Lx2XptZY8aHmzuQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Feb 2021 15:19:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNARvuaULBJ_Y-n6x6d6uzmr2jaSG-TjmGxrFLJvR7+u9gg@mail.gmail.com>
Message-ID: <CAK7LNARvuaULBJ_Y-n6x6d6uzmr2jaSG-TjmGxrFLJvR7+u9gg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the modules tree
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 5:37 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Feb 10, 2021 at 5:06 PM Jessica Yu <jeyu@kernel.org> wrote:
> >
> > +++ Stephen Rothwell [10/02/21 08:50 +1100]:
> > >Hi Jessica,
> > >
> > >On Tue, 9 Feb 2021 16:16:20 +0100 Jessica Yu <jeyu@kernel.org> wrote:
> > >>
> > >> Hmm, these errors don't look like it's related to that particular commit. I was
> > >
> > >I found this commit by bisection and then tested by reverting it.
> > >
> > >Before this commit, CONFIG_TRIM_UNUSED_KSYMS would not be set in the
> > >allyesconfig build because CONFIG_UNUSED_SYMBOLS was set.  After this
> > >commit, CONFIG_TRIM_UNUSED_KSYMS will be set in the allyesconfig build.
> >
> > Ah, that makes sense then. I would get the error on powerpc whenever
> > CONFIG_TRIM_UNUSED_KSYMS was enabled.
> >
> > >> able to reproduce these weird autoksym errors even without any modules-next
> > >> patches applied, and on a clean v5.11-rc7 tree. To reproduce it,
> > >> CONFIG_TRIM_UNUSED_KSYMS needs to be enabled. I guess that's why we run into
> > >> these errors with allyesconfig. I used a gcc-7 ppc64le cross compiler and got
> > >> the same compiler warnings. It seems to not compile on powerpc properly because
> > >> it looks like some symbols have an extra dot "." prefix, for example in
> > >> kthread.o:
> > >>
> > >>     168: 0000000000000318    24 NOTYPE  GLOBAL DEFAULT    6 kthread_create_worker
> > >>     169: 0000000000001d90   104 FUNC    GLOBAL DEFAULT    1 .kthread_create_worker
> > >>     170: 0000000000000330    24 NOTYPE  GLOBAL DEFAULT    6 kthread_create_worker_on_cpu
> > >>     171: 0000000000001e00    88 FUNC    GLOBAL DEFAULT    1 .kthread_create_worker_on_cpu
> > >>     172: 0000000000000348    24 NOTYPE  GLOBAL DEFAULT    6 kthread_queue_work
> > >>     173: 0000000000001e60   228 FUNC    GLOBAL DEFAULT    1 .kthread_queue_work
> > >>
> > >> So I suppose this dot prefix is specific to powerpc. From the ppc64 elf abi docs:
> > >>
> > >>      Symbol names with a dot (.) prefix are reserved for holding entry point
> > >>      addresses. The value of a symbol named ".FN", if it exists, is the entry point
> > >>      of the function "FN".
> > >>
> > >> I guess the presence of the extra dot symbols is confusing
> > >> scripts/gen_autoksyms.sh, so we get the dot symbols in autoksyms.h, which the
> > >> preprocessor doesn't like. I am wondering how this was never caught until now
> > >> and also now curious if this feature was ever functional on powerpc..
> > >
> > >Which feature?
> >
> > Sorry, by "feature" I meant CONFIG_TRIM_UNUSED_KSYMS. This config
> > option was introduced around v4.7. If simply enabling it produces
> > these compilation errors I was wondering if it ever built properly on
> > powerpc.
> >
> > Thanks,
> >
> > Jessica
>
>
> Thanks for the report.
>
> I think the following will fix the issue,
> but modpost needs fixing too.
>
>
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index 16c0b2ddaa4c..996a7109167b 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -44,7 +44,7 @@ sed 's/ko$/mod/' $modlist |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>  cat - "$ksym_wl" |
>  sort -u |
> -sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
> +sed -e 's/^\.\{,1\}\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
>
>  # Special case for modversions (see modpost.c)
>  if [ -n "$CONFIG_MODVERSIONS" ]; then
> m



After some more tests, I noticed the code above was not correct.
I still saw a lot of modpost errors.

ERROR: modpost: "_mcount" [arch/powerpc/oprofile/oprofile.ko] undefined!
ERROR: modpost: "._mcount" [arch/powerpc/oprofile/oprofile.ko] undefined!


I just posted a patch, which fixes the error as far as I tested.
https://patchwork.kernel.org/project/linux-kbuild/patch/20210211061416.3747231-1-masahiroy@kernel.org/



-- 
Best Regards
Masahiro Yamada
