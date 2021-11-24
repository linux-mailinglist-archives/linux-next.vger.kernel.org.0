Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5335945B5E2
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 08:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbhKXHwd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 24 Nov 2021 02:52:33 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:60939 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhKXHwc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 02:52:32 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MG9c2-1mqrNN209U-00GcUM; Wed, 24 Nov 2021 08:49:21 +0100
Received: by mail-wr1-f49.google.com with SMTP id a9so2504952wrr.8;
        Tue, 23 Nov 2021 23:49:21 -0800 (PST)
X-Gm-Message-State: AOAM5327hTFj5lTUe6MOem9ame4CtlmaevHISgKvI1AgBcoipbkdJXjU
        BckXkDdgsUXuDk8txma8qXk3YDuHLhTLtM3p5dw=
X-Google-Smtp-Source: ABdhPJzndU3fqgHz+IlEBvZgja/JvZ0plmrmCtl+3g/SKy8I1LjmdgvW/1XQsq1r0fA5A/VYS5mqhRYmoMfd7HLtZJA=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr16371602wrd.369.1637740161045;
 Tue, 23 Nov 2021 23:49:21 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <41206fc7-f8ce-98aa-3718-ba3e1431e320@landley.net>
In-Reply-To: <41206fc7-f8ce-98aa-3718-ba3e1431e320@landley.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 24 Nov 2021 08:49:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
Message-ID: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
Subject: Re: spinlock.c:306:9: error: implicit declaration of function '__raw_write_lock_nested'
To:     Rob Landley <rob@landley.net>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
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
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org,
        =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:+hO82f4AyW48k9dnIB1FQwbpRc+xQ6uUOJIuPyeFIYm8ZJy+BjS
 SP/OTcDFI3GqfnuVQWQR24SsyT3D9D2ysC5K4DHlG6qh4Nwfxsq4qa/HlSE/MPGGvvD4ix1
 oByDn3p3QqcBaSv6O7MuO5AaZzgCGIXpBtxCo6L6zGl8HBDbGYEydVUu6pn1XPGHD/RLv7n
 BsONcwGNqZAmOsp0/df5Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:txDkkWbd/oQ=:77p4GEoF5Ppm4d5b9pNKbP
 HX3QdVkIdqywJaMg9o58Gjzk1LCYLLdC+CwrBtH4qRHrP3qGPkh3ooovaONZhA/pliepWk80P
 ifrmJ5Ij7bQ7FNYKq/Y1ShZetXTMgjiPOBsDedFBic1Q3VEn52Kl4Wys3bGZtAe7G8VJLATLM
 PgVoL0e67AEzk75cRNuieta+GcKSmKGXoavBzCn2GQ1DQ7ZDief4ymhcffU0xtzLG+KOjSxLe
 1P6QnZwjzDWzs5iz+aWgL7Yctz1W00LsoXFJqS17eJK7p72QUsexBgtpDLEvXbvR1JOZNRBwN
 o8svbHKmUQ9bH/+Xf1QHgx7AZt/hFcKxyXc+BuO2yVuDXyqwU8qAasYJFzts9j2g6DFm5svYW
 hCuyWti44ZW6Np7pGQ5mXj26UsVKDv59m421JHDBqqPWnpyRsR4va1HK+MeZ2Cnit+Bi2sSS7
 NEd81ZPy9wUVInc6LpZvVzbeAmgZz4opa7cRO1entjDg45r4Unf5JaVSkgZtEC30sHWB69Y34
 nioakcyPIeXVTcbFiRX3rC5i1rTVv+k60KXtgbud5NjXTw7bufy+AV0KEyad+CCjMO1TZls7a
 G0OYorV3A08p63xYI8NyZBVj9aq8Q3SeIxPugqdTMzK4YzyeTiuokxv+gG4pqLTHH0WSCOVy8
 vv7aIcqhg3P+9CCVlFVTvJRe/VAykCMCmET8u3SMyigW1AoB6iRZ6BE0bP9mOc+Kbf0xrpSeK
 318nIXpOzaKsbsthcqNAJnprd0qoh4OT4pkN7nRRddPa2JZmDI14L8gyhoLOVLMVZE1ysF7HB
 nFgYnQNcgjwu3pOxmbS0QRu6xfa3rhV6UJvQT7+zMQMRxpwz7E=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 24, 2021 at 8:31 AM Rob Landley <rob@landley.net> wrote:
> On 11/23/21 5:38 AM, Naresh Kamboju wrote:
>
> diff --git a/arch/sh/kernel/syscalls/syscall.tbl
> b/arch/sh/kernel/syscalls/syscall.tbl
> index 208f131659c5..65c3a94bff48 100644
> --- a/arch/sh/kernel/syscalls/syscall.tbl
> +++ b/arch/sh/kernel/syscalls/syscall.tbl
> @@ -437,7 +437,7 @@
>  432    common  fsmount                         sys_fsmount
>  433    common  fspick                          sys_fspick
>  434    common  pidfd_open                      sys_pidfd_open
> -# 435 reserved for clone3
> +435    common  clone3                          sys_clone3
>  436    common  close_range                     sys_close_range
>  437    common  openat2                         sys_openat2
>  438    common  pidfd_getfd                     sys_pidfd_getfd

Did you test clone3? This needs a custom wrapper on most architectures
to have sensible calling conventions. If sh doesn't need it, that should
be explained in the changelog text.

> @@ -451,3 +451,4 @@
>  446    common  landlock_restrict_self          sys_landlock_restrict_self
>  # 447 reserved for memfd_secret
>  448    common  process_mrelease                sys_process_mrelease
> +449    common  futex_waitv                     sys_futex_waitv

I don't know what's going on with this one, I don't actually see
a reason why it isn't already wired up on all architectures. If we add
this, it should probably be done for all architectures at once as a
bugfix, but it's possible that this is intentionally only used on
x86 and arm.

André, can you comment on this?

      Arnd
