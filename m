Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 012CA14F720
	for <lists+linux-next@lfdr.de>; Sat,  1 Feb 2020 08:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgBAHyU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 1 Feb 2020 02:54:20 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:60447 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgBAHyU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 1 Feb 2020 02:54:20 -0500
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MaIGB-1j0s9f1OCr-00WDRn; Sat, 01 Feb 2020 08:54:18 +0100
Received: by mail-qk1-f182.google.com with SMTP id x1so9033590qkl.12;
        Fri, 31 Jan 2020 23:54:18 -0800 (PST)
X-Gm-Message-State: APjAAAUCkr2U/V42J2Uw4zDUgQYClOJ80jBHIySkWZsOkaqLIsrnkPlZ
        R1lTiLsQSh1iucH0wDKDc4vO5kH09MINDr2Ets0=
X-Google-Smtp-Source: APXvYqyNQnpxEBtv4vRLe1sVwoTOmRvI7Or42gQvFykFz8mdLXAwXfpEfrCQZJZ73WNx9A4iV5Bp5Af5CouWgkX9434=
X-Received: by 2002:a05:620a:218d:: with SMTP id g13mr14826914qka.286.1580543657085;
 Fri, 31 Jan 2020 23:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20200131141309.367c9d8b@canb.auug.org.au> <20200201003230.GA32350@fieldses.org>
In-Reply-To: <20200201003230.GA32350@fieldses.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 1 Feb 2020 08:54:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2sWmeATCC67g+dr0qbBschztNuj8ATewdSay6Na13ARg@mail.gmail.com>
Message-ID: <CAK8P3a2sWmeATCC67g+dr0qbBschztNuj8ATewdSay6Na13ARg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Roberto Bergantinos Corpas <rbergant@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:97sbIK9+56zG/Pl/3nTMcsLgxkzt6oinf5xBBeBY+HzhdFjjuds
 T10A21WB/wpUf/dee7ImGAUxbZU0n5dF7ojV770RRHEldaeSjKtnbi0bpqmr+XOkn2Mt+8w
 SJdyvA+DmFxkg82uGdq+o1QnD860OQyGlfxhe1hMjxeqjpaZQzIV3CT8az0IDJnj82IP4BR
 dLwFaiINd3Nda61nq88zA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+eeKMtLniI0=:Hd+kkX9vn+/f9dYOSwIIZY
 g8tkEdQM09OKSu12hduKGNkK6+Wbv3BV9UZFwrynpxosHQVtu4W89QF2CcSGp82ZIFKvZE6IM
 sqICGz9HGD7FDuQ7LrqM7uuVUbaOwTWdtS2zyKXsBSAmJ0IZSRNbnejpcaP9cpIG/UQN4afs+
 mx2oAFQhYhc1LCg88KuoWTiRYKutrqDFU0HFfNEeCOBiZl+J6scgUQhwwc/bcHKIvxTXY8zYu
 rNjldBBSPb17OHO6RxV61Da5UffgqTF197DG/KOUOOSil/ISwCVURMv8ZQ+mdJMDzmGGvXM76
 D9Cxk8/Ueijx3P4oDs7ad4f/B8Rx0pZ+wAm09cK/1AGyJ5a5A6n7FcwOovGWaLpBqn9TSNhf4
 k+W4V9m28EB0kpT/iauA3hpmkeXIZWW1lcuWYEhmRqgLGFHNoa+WQCs344DZ8BzNSgV61afOD
 677S3RkunFcY4FlWFobdq4jD9ya6I/rKx4QgNrtuOfwxIdkB2H/J/+mY1gi9mPzxCAic485xq
 J2TIiP+6PENVHa+LEQAf2D0E3vPlgA35gVT4TWUNRfvC+8OwP7bx5/Y0yqt/fnMlul2ku1jt1
 gdls5SXhRJI/y91pNdANsEoumH9do3dmSU8MN7asn/CD5Ezm11/axYTpBs4PcdeDU0pOXc0dj
 GrhH8awS3ObjXhyhTuNa8WCVF2wukbD0u9CXqaJxJmrNEvWsC1AQ7GTTuo5fq7Ccxq4+lTTXP
 scCoQaTfv58JJbu+YxNiPevVWPcRSfFQ1fnO1ynOJ738EFJQl8XtHy3lW/7BEDnhG1CdO3t/j
 lSa9Bz6kENLruAalNLqJt/EC8XBJQgAAdJuNNbaMJvbo/gjzX8=
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Feb 1, 2020 at 1:32 AM J. Bruce Fields <bfields@fieldses.org> wrote:
>
> On Fri, Jan 31, 2020 at 02:13:09PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the akpm-current tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > net/sunrpc/auth_gss/svcauth_gss.c: In function 'gss_proxy_save_rsc':
> > net/sunrpc/auth_gss/svcauth_gss.c:1251:19: error: storage size of 'boot' isn't known
> >  1251 |   struct timespec boot;
> >       |                   ^~~~
> > net/sunrpc/auth_gss/svcauth_gss.c:1273:3: error: implicit declaration of function 'getboottime'; did you mean 'getboottime64'? [-Werror=implicit-function-declaration]
> >  1273 |   getboottime(&boot);
> >       |   ^~~~~~~~~~~
> >       |   getboottime64
> > net/sunrpc/auth_gss/svcauth_gss.c:1251:19: warning: unused variable 'boot' [-Wunused-variable]
> >  1251 |   struct timespec boot;
> >       |                   ^~~~
> >
> > Caused by commit
> >
> >   a415f20a18c9 ("sunrpc: expiry_time should be seconds not timeval")

This commit uses the now-removed 'struct timespec' type and 'getboottime()'
function, so to fix the compilation error, the 64-bit replacements need to e
used as described in Documentation/core-api/timekeeping.rst

> > from the nfsd tree interacting with commits
> >
> >   de371b6c7b73 ("y2038: remove unused time32 interfaces")
> >   aa7ff200a719 ("y2038: hide timeval/timespec/itimerval/itimerspec types")
> >
> > from the akpm-current tree.
> >
> > I have reverted the nfsd commit for today.  A better solution is requested.
>
> Unfortunately that expiry time seems to be a signed 32-bit integer in
> both the kernel<->gss-proxy and the gss-proxy<->krb5 interfaces.
>
> I guess we'll have to come to an agreement with the krb5 developers.
>
> Simplest might be to agree that the thing's unsigned.  The expiry
> shouldn't ever need to be decades in the future, so unsigned mod 2^32
> arithmetic should work forever.

Can you be more specific which interface you are referring to?
My change to gss_import_v1_context() is now part of mainline
as of 294ec5b87a8a ("sunrpc: convert to time64_t for expiry"),
is anything else needed there?

       Arnd
