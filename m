Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF5345A397
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 14:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhKWNXW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 08:23:22 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:48117 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234825AbhKWNXW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 08:23:22 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M58zc-1moPmr0U2G-001B4f; Tue, 23 Nov 2021 14:20:13 +0100
Received: by mail-wr1-f42.google.com with SMTP id b12so38929177wrh.4;
        Tue, 23 Nov 2021 05:20:13 -0800 (PST)
X-Gm-Message-State: AOAM531HmzQSFTWVqVgaWTzcaH0ukhr6FR3HGqHjJYKsC8Qi7WpQ/zUl
        C0syFIzcVigBfglFBq4dHyWRhWPABUKnhx9Lppo=
X-Google-Smtp-Source: ABdhPJwpT1iqgZ3/dEvpqaazlpfCJQIb+joipxiKMUpjkoh/lL7fOj6hF1e58ZtQ4eRqkzavbf1frnwH+VQGmHXqrGo=
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr7393084wrq.71.1637673612679;
 Tue, 23 Nov 2021 05:20:12 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
In-Reply-To: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 23 Nov 2021 14:19:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
Message-ID: <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
Subject: Re: spinlock.c:306:9: error: implicit declaration of function '__raw_write_lock_nested'
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:QFR7kDgsfDVE5/Y1R44YWOjmAmELgyRKIYn8qWLSlk62H3gjKF/
 sGvCLqNIgchzlvOg1pQC2GaRsKKBdwapxT7ozfAfZWaKwvpt+OfqoNrTRmDcQFpXB8elwsv
 cjvHGPhUnJdjSCI+NFtzDMd6Ytn8Py4wZLMdcvDd8WaukoO2ivObS//U+JMzwhq7Moa5Abl
 FSow+B0oIv9GgptWlV6ag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T3aMy9ahu+o=:QbmUyLL2o9tz0g05IFRDbj
 JJo1D8uHYqbAtA1/PLsn48FcGjyzFWe+GxCeRcyzC9st52G2JkPwUQgL6FiaY0CPYyUMAeZM5
 VedOWv+WbQ0glDwDKcWddcC3qMZuWGSDKmvSMUEMXjOaX//kRYJT0W7o7G8uSQUYCQH9c6WyK
 pcZEH+RJU9T/g/Kxd4ge722ZrlRLKqYmf4ccolf7914qjX97ZDkiG/h4Xphd3j9D8QMk8HO9H
 iDDHNQgSpuDIs8yObv2IRHY+B0sXTlYkNxkcSVmuimQhrcm5YBMwQPfG5MHzVWWcS280Z1O60
 p8cGXGcALT0AclhlHk05pYSWs3F8Q+j3Vpkx0oEiTfFcMWPcAtVhuZEri52/zj79WxQyPvEoZ
 eF70jmt0rtoK/qWILzVV4F3SB1n4Nm+RetmpQv8SA6rzIhg9WtBJovlk78AYj49VFNxlxV0Et
 uVLGrWQhQjrDH5sieLxvrckkzpAfSVgFV9ANi9+rO08ybW6uinblp6gkNlss8KUenY+UwSm0o
 vAxwtB8LcQ+MQFSFhybaZSwWrG3454G0Kig6JIRrcBotXDJw2JSXPGBwDAAFAZNOixS0AZ85o
 qK7pJEKAB7P+Spiqik6Qo5Jf2uupFxpbgy2cS/BXXlzSpSDuKY58WRzNr56K0Am+9dMq2oEPY
 ZURqkmoKb16m4UyhmnRUU5bh8Xnp0o5dykPKsTVQKxeYsvESsLFzxiHi9ajJaDI3K05E=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 23, 2021 at 12:38 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> While building Linux next 20211123 tag for sh with gcc-11
> following warnings / errors noticed.

Nothing in here looks like a recent regression from either the kernel
or gcc-11.

> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=sh
> CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
>   Generating include/generated/machtypes.h
> <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]

These happen with any compiler version, someone needs to write the correct
entry code for clone3 and hook up futex_waitv().

> include/linux/sh_intc.h:100:63: warning: division 'sizeof (void *) / sizeof (void)' does not compute the number of array elements

These are old bugs, they show up in any kernel version with gcc-8 or higher.

> fs/mpage.c:336:1: warning: the frame size of 1092 bytes is larger than

I see these going back to gcc-6, it looks like this is caused by
CONFIG_PAGE_SIZE_64KB.

     Arnd
