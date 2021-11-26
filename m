Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E13A45EB00
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 11:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353298AbhKZKHX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Nov 2021 05:07:23 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:42357 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376595AbhKZKFW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Nov 2021 05:05:22 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MysBI-1mdobC2PhK-00vzMs; Fri, 26 Nov 2021 11:02:08 +0100
Received: by mail-wr1-f54.google.com with SMTP id a9so17438886wrr.8;
        Fri, 26 Nov 2021 02:02:08 -0800 (PST)
X-Gm-Message-State: AOAM532cuVChVhdFiB5hZOgW8ljmsgYTSjcJJ0/g7ufvAyi8kJeyaVU4
        bvFcG375lOiKx5fi9smBVdeakcRHHxFK0QHhdzo=
X-Google-Smtp-Source: ABdhPJzFJM0amVDbfr0ThWQOxlaqw/CkOvAjZpzR6q6B6pDAhAVNA2MrC8usYZfdpHh3tsHDHDJxOWOtOTV3P4S0POI=
X-Received: by 2002:a5d:6886:: with SMTP id h6mr13181894wru.287.1637920927998;
 Fri, 26 Nov 2021 02:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20211126145201.5aefa68c@canb.auug.org.au>
In-Reply-To: <20211126145201.5aefa68c@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 26 Nov 2021 11:01:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a078LiivyzUiH+D--iRsQGTcQ_hy=-h7crynrbQ6ZYn6A@mail.gmail.com>
Message-ID: <CAK8P3a078LiivyzUiH+D--iRsQGTcQ_hy=-h7crynrbQ6ZYn6A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PY7vnkVlzsiUc0R/D0CCz5Pd+BN7Aqv7dGALwpy23fQLH4pZa0I
 /nbvBw04Ed+HL6KF6lnwi91bXmTyPzCvylMgZNsgL0L/Dy9S9qY9tqTFuG7e2ME8waVIamT
 JBhYwRsvplew9o0USl+7u2OZe51PYuIJvuxUxKbGvUCS3/dWFIo15i9b6jtgebJu1xv6xUW
 VcgXUrYSrb233EBNekn5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A6SMa8U3rlc=:+Y/mGX1AzmrUAFMl25+yhl
 3x1TeHOhFNx4K7HlWdfPdPbJxEarRPeuWRX2N3HVhxC9BRZzb2hH7tz2+W5JJogOXJ6u2JURl
 y7ewxKJEiHMYjGT+x0uF873QLAIeUT0EU4wrmqMkHPxO4PSkFsFOqFaOAzXaT8HMkDR/Qa566
 wcUtFwqCLBIKMRYtZDc5bdyHPmZF7gT9qaqhoLRjMs+mT3PpBsXi+vYNGDhJbvkzM2QGAQ+pY
 x4s7jsVIc+hcyc0bk/8K9r4Ghu9tJ6P2QyKTOqY9SkPkbf1ulXMpKatEGK1nk8pxqtks9/E+8
 R9MMqmnsH1/I9D6iLlc3gFtPXPS2XHGoiPPdaYlAX/OQ+nNramW0hUXCqH/9s7T0+kWe+HnjM
 2uSLy4Ts2R9DEBDU6IordYRABwIH2kg3qXuEAWkynWuf7zBETHtBffVHxGwdzWX/w0pWgfsQ0
 8gB+x9zrnJjZv0ciKGKTQPnUIVpXE0GEOp95ptdthbEX7bcpmFMoqiaL6neRnHxlgHM06rM2q
 uyhNK86DKlxZXBBG34qkgQRituh7FDCQgrhrA1IlyOJy1R7XoA4p7hVJzUc6wiq2rKAWVrpri
 5q2iRY0BKSLOH2PBDBa9uAhSBn+a1ePodUkACJM9B8iBSOhoWe4FZppk/9LbwHP3Lnj3DlUHD
 KfEuLSzSTMNlO2O0A7uq4/Pb4ouEPiob2FMvVvyoe8DVwx0ooy2pGYnuAjqaE7oTpvbRprbKM
 1hhmNVKGqCVE3fqzibkjpiOJos/E5JshaXVcuItoIHS2o2AxS7S9a4y40ZF/rUut2lbTgC1SF
 rEJuaJ/9uu6yMTlbgP+x3bPGZgv3smKj6sjyZD8WIgr8eiLGRA=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 26, 2021 at 4:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the tip tree, today's linux-next build (sparc defconfig)
> failed like this:
>
> In file included from arch/sparc/include/asm/futex_32.h:4:0,
>                  from arch/sparc/include/asm/futex.h:7,
>                  from kernel/futex/futex.h:12,
>                  from kernel/futex/core.c:41:
> kernel/futex/core.c: In function 'futex_cmpxchg_value_locked':
> include/asm-generic/futex.h:17:2: error: implicit declaration of function 'futex_atomic_cmpxchg_inatomic_local_generic'; did you mean 'futex_atomic_cmpxchg_inatomic_local'? [-Werror=implicit-function-declaration]
>   futex_atomic_cmpxchg_inatomic_local_generic(uval, uaddr, oldval, newval)
>   ^
> include/asm-generic/futex.h:17:2: note: in definition of macro 'futex_atomic_cmpxchg_inatomic'
>   futex_atomic_cmpxchg_inatomic_local_generic(uval, uaddr, oldval, newval)
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks a lot for the report, I sent a fix now:

https://lore.kernel.org/lkml/20211126095852.455492-1-arnd@kernel.org

        Arnd
