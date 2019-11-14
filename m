Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E05FD038
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 22:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNVUO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 14 Nov 2019 16:20:14 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:35773 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfKNVUO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 16:20:14 -0500
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M1q4e-1iTAfs3SuW-002K1s; Thu, 14 Nov 2019 22:20:13 +0100
Received: by mail-qk1-f170.google.com with SMTP id m4so6324033qke.9;
        Thu, 14 Nov 2019 13:20:12 -0800 (PST)
X-Gm-Message-State: APjAAAWwxsKGfS3CT4ns24EHmoUfd9bBB5FxFi5Bz+wJxN/mTgrLT2da
        WNIo58ldnFEoOxvpd+PvPy7bwPhT1F7wMp8FfeQ=
X-Google-Smtp-Source: APXvYqwvbGGKgaEN2tVT8M3pORFRK5eVYAq7cO7ucFJgWS2Va7T/mC1UOJ5BKzS9tiqZXRDKKHfpMIlCIiEZKkBvWEc=
X-Received: by 2002:a37:44d:: with SMTP id 74mr9203611qke.3.1573766411510;
 Thu, 14 Nov 2019 13:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20191114193132.5de921a7@canb.auug.org.au> <CA+G9fYtpOaYDoUEzQuYxmKJLFH2GDvK3ipWienn-zHDB+nOMbg@mail.gmail.com>
 <247236994.12271471.1573762264445.JavaMail.zimbra@redhat.com>
In-Reply-To: <247236994.12271471.1573762264445.JavaMail.zimbra@redhat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 14 Nov 2019 22:19:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3tS+WAHj9SP7MhLq27-RTt0ExXjqiRA1uizhKsMe9hdg@mail.gmail.com>
Message-ID: <CAK8P3a3tS+WAHj9SP7MhLq27-RTt0ExXjqiRA1uizhKsMe9hdg@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 14
To:     Jan Stancek <jstancek@redhat.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Brown <broonie@kernel.org>, lkft-triage@lists.linaro.org,
        LTP List <ltp@lists.linux.it>, chrubis <chrubis@suse.cz>,
        John Stultz <john.stultz@linaro.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:pGglLS6IsFHW3qdKj7tytpncx5wQ+jRcIFKsROLpU8CzrupltaC
 FseA1DVCwXIhEj8gWGYPmISLE0bcWf2OPW8TQhRcs3FSh4T6cutHZMoemGUm0MMIb79wbhM
 TOFoPLhmOAoT88H1XPmpkzf6qXXqOpaBW1Cwwemzf9Ppr4uouzvVtv9pW9gYkXr///9rnzW
 83MB+mG+muCHeIEKsjhPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+4riTW104g4=:vJ0AZAR0T8NUcfae4v8UBn
 MIi3s4nAs78ZScyQb/GIwoSBXMgia17BDCSQ7nq0oHUiBOJFwa1cPjI48GTMcGBO3hulN4uXc
 cNbR/tgxzevyPjNYiR5utsuwdphOgscKAkLTjeU3lAjQyfNOrBXk1pP9Dkzjeufe+IuikoGvB
 iDYSGZm1tBbozHcVi1P86rU5G4/oS/ZMdUVyYewNiSjhrRSJFpFKMz+NJQ/632G/1upnqD+A0
 G8TJTSd0GcAwjfy6FfYxZcxd5lncIQNzg1cc3vXU2Af+rmI2BlJYjv/n/KX+GzyOD9If/+8MB
 YRC1anUYuYU5H4Zbyqfi32pOBHrOYr2ZX7J/IeUU7FFSbFIZVB9Vk85Ocyh/an3l+w4VVVt/3
 n1Vx2aPzk+XGiTjiGR0RNP2gShMMZmEG340xRIQsud9/Ne7093oFFf34MtfnKkJzhEZA//dev
 qlWrlEeolE/ZfWwVU7soau7HuYFwgjXxz297KoyWYoJS3aqBp2zCvgGt21crR8rESaxKngvCC
 RIHk5nAu9DIDJFJG2Niv//+0kfTExw0b9CuM6bvCr4iwZf9ex5I5+IFtdffIbqys80YSwDT58
 KFIk6KU9lnHvwIQbY23lDnIPAq2+uMJOtLyMUz33VA9rmpH5W2FkqeX/i5Kxfu0Ck5mGuLtPA
 WyidLX3LDT4hJI6GBAEgahOipspjT19Z30qeAEdO+WJJk0ka59EMHnJI/Re2P4Oo8G0KbQu8I
 rxJw7K8AgmHVoBvzrJe5X6a24bU+loWH+24sGy7313RaKpCWy1w3Q4OleRXHcpjaphJ5GtgQg
 UbVbTan9v/q3boElk04d9zaFun+4f5Pr3VEaGFny7dZbjgQ9H7M9AYD2jEwoeLL2cnGT1UPwY
 Kg5vtMMTxR3ETjcW83yw==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 14, 2019 at 9:11 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>
>
> ----- Original Message -----
> > On Thu, 14 Nov 2019 at 14:01, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > > Changes since 20191113:
> > > The y2038 tree gained a build failure for which I applied a patch.
> > <trim>
> > > The akpm-current tree gained a conflict against the y2038 tree.
> > >
> > > Non-merge commits (relative to Linus' tree): 10388
> > >  9238 files changed, 397357 insertions(+), 174171 deletions(-)
> >
> > Results from Linaro’s test farm.
> > Regressions detected on x86_64, and i386.
> >
> > LTP syscalls settimeofday01/02 failed on x86_64 and i386 running
> > 5.4.0-rc7-next-20191114.
> >
> > Following  ltp-syscalls-tests failed.
> >     * settimeofday01
> >     * settimeofday02
> >     * stime01
> >     * stime02
>
> Looks like typo in
> adde74306a4b ("y2038: time: avoid timespec usage in settimeofday()")
>
> -               if (!timeval_valid(&user_tv))
> +               if (tv->tv_usec > USEC_PER_SEC)
>
> was likely meant as:
>
> -               if (!timeval_valid(&user_tv))
> +               if (new_ts.tv_nsec > USEC_PER_SEC)
>
> since tv is user pointer.
>

I have uploaded a fixed version, sorry for the breakage. The new version also
addresses the build failure that Stephen reported.

        Arnd
