Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9712A316185
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 09:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbhBJIzH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 03:55:07 -0500
Received: from condef-07.nifty.com ([202.248.20.72]:45047 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhBJIxB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 03:53:01 -0500
X-Greylist: delayed 502 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Feb 2021 03:53:00 EST
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-07.nifty.com with ESMTP id 11A8e1tC027745
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 17:40:01 +0900
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 11A8cOpL014811;
        Wed, 10 Feb 2021 17:38:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 11A8cOpL014811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612946305;
        bh=3DX8/02wQ6Cpgi5cMSc+g0gcdAe8jyFLRruNtzqSL8I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Fa0JrmPqdyIUA3NnzAbZE+CwnixA7nu/ms2u+YPZignsSyacJgm3b07m7/gYny+ff
         FSxg8rW3UdvfHuJAkUEZmkkMjGTT79Q3liiqvOcYRNDMZ1NKPydgZ17eUlkVGUL4RV
         rS2jIxJ7+c7MQ6jeVJM9Js2idV7v/WRqRs0/J6wefkecv11TtquPmmzRkkgC68E9uv
         1nmibWQju9+tgf70HFqLpN6NQEKLU208AJ0IMTaVzgP9uR9nJKSqR4HM/m5NdpUTmo
         BiMZWsbUTz8BoEGHBJPDrLjtcG9RZUVLmwkN+vm87PDDabGpTsDl24REm3SIQ+QomE
         dBRLmSFJd8cVA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id e9so746054pjj.0;
        Wed, 10 Feb 2021 00:38:24 -0800 (PST)
X-Gm-Message-State: AOAM533Z6oMinG/oEH/HFO0aeBir9bmENTZk8oepPvaJ6cSuXxMZr35S
        20Id83a8v8T4MHm4xmX8aTxwDO93fABc6Hz7gXY=
X-Google-Smtp-Source: ABdhPJy0W0dEpNV//idNYeiwVy2Ma7CnIC9BVDYPcuhy8IEKdENaRxxWUEGOfqjoAtApW/XluCBhRNPQq63xC/MaK7Q=
X-Received: by 2002:a17:90a:5403:: with SMTP id z3mr2176385pjh.198.1612946304251;
 Wed, 10 Feb 2021 00:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20210209210843.3af66662@canb.auug.org.au> <YCKnRPRTDyfGxnBC@gunter>
 <20210210085051.7fb951d1@canb.auug.org.au> <YCOUGGJtUJ+Nf0ZA@gunter>
In-Reply-To: <YCOUGGJtUJ+Nf0ZA@gunter>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Feb 2021 17:37:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQn8BX9H577Mfp8WMzzaZZ=oZdEti1Lx2XptZY8aHmzuQ@mail.gmail.com>
Message-ID: <CAK7LNAQn8BX9H577Mfp8WMzzaZZ=oZdEti1Lx2XptZY8aHmzuQ@mail.gmail.com>
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

On Wed, Feb 10, 2021 at 5:06 PM Jessica Yu <jeyu@kernel.org> wrote:
>
> +++ Stephen Rothwell [10/02/21 08:50 +1100]:
> >Hi Jessica,
> >
> >On Tue, 9 Feb 2021 16:16:20 +0100 Jessica Yu <jeyu@kernel.org> wrote:
> >>
> >> Hmm, these errors don't look like it's related to that particular commit. I was
> >
> >I found this commit by bisection and then tested by reverting it.
> >
> >Before this commit, CONFIG_TRIM_UNUSED_KSYMS would not be set in the
> >allyesconfig build because CONFIG_UNUSED_SYMBOLS was set.  After this
> >commit, CONFIG_TRIM_UNUSED_KSYMS will be set in the allyesconfig build.
>
> Ah, that makes sense then. I would get the error on powerpc whenever
> CONFIG_TRIM_UNUSED_KSYMS was enabled.
>
> >> able to reproduce these weird autoksym errors even without any modules-next
> >> patches applied, and on a clean v5.11-rc7 tree. To reproduce it,
> >> CONFIG_TRIM_UNUSED_KSYMS needs to be enabled. I guess that's why we run into
> >> these errors with allyesconfig. I used a gcc-7 ppc64le cross compiler and got
> >> the same compiler warnings. It seems to not compile on powerpc properly because
> >> it looks like some symbols have an extra dot "." prefix, for example in
> >> kthread.o:
> >>
> >>     168: 0000000000000318    24 NOTYPE  GLOBAL DEFAULT    6 kthread_create_worker
> >>     169: 0000000000001d90   104 FUNC    GLOBAL DEFAULT    1 .kthread_create_worker
> >>     170: 0000000000000330    24 NOTYPE  GLOBAL DEFAULT    6 kthread_create_worker_on_cpu
> >>     171: 0000000000001e00    88 FUNC    GLOBAL DEFAULT    1 .kthread_create_worker_on_cpu
> >>     172: 0000000000000348    24 NOTYPE  GLOBAL DEFAULT    6 kthread_queue_work
> >>     173: 0000000000001e60   228 FUNC    GLOBAL DEFAULT    1 .kthread_queue_work
> >>
> >> So I suppose this dot prefix is specific to powerpc. From the ppc64 elf abi docs:
> >>
> >>      Symbol names with a dot (.) prefix are reserved for holding entry point
> >>      addresses. The value of a symbol named ".FN", if it exists, is the entry point
> >>      of the function "FN".
> >>
> >> I guess the presence of the extra dot symbols is confusing
> >> scripts/gen_autoksyms.sh, so we get the dot symbols in autoksyms.h, which the
> >> preprocessor doesn't like. I am wondering how this was never caught until now
> >> and also now curious if this feature was ever functional on powerpc..
> >
> >Which feature?
>
> Sorry, by "feature" I meant CONFIG_TRIM_UNUSED_KSYMS. This config
> option was introduced around v4.7. If simply enabling it produces
> these compilation errors I was wondering if it ever built properly on
> powerpc.
>
> Thanks,
>
> Jessica


Thanks for the report.

I think the following will fix the issue,
but modpost needs fixing too.


diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index 16c0b2ddaa4c..996a7109167b 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -44,7 +44,7 @@ sed 's/ko$/mod/' $modlist |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 cat - "$ksym_wl" |
 sort -u |
-sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
+sed -e 's/^\.\{,1\}\(.*\)/#define __KSYM_\1 1/' >> "$output_file"

 # Special case for modversions (see modpost.c)
 if [ -n "$CONFIG_MODVERSIONS" ]; then
m




I will post two patches with some commit log
after some testing.
(one for gen_autoksyms.sh and the other for modpost).





-- 
Best Regards
Masahiro Yamada
