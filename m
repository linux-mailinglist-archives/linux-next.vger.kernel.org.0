Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF6B45C758
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 15:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354674AbhKXOc6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 24 Nov 2021 09:32:58 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:59847 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354115AbhKXOcv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 09:32:51 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MpUpW-1mHyAx34ma-00pvQs; Wed, 24 Nov 2021 15:29:39 +0100
Received: by mail-wm1-f41.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so2231897wme.4;
        Wed, 24 Nov 2021 06:29:39 -0800 (PST)
X-Gm-Message-State: AOAM530yNL3jrtHkduBFvkDR2sWhrUTZ0bzbMxhcZ9vE3yaHcMWjMBsX
        hJG8EBnWrPTwYFQS6TbjsY2S5Vgd/thrI7Gkn20=
X-Google-Smtp-Source: ABdhPJw9AuDVJPcPk5QwMaNIqLG+Gyph350xYhCGSeBIHw0tMZdjTjgs4734tAKvoxeRwyygv81r33HtARNOkWqIoYo=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr15657228wmb.1.1637764179209;
 Wed, 24 Nov 2021 06:29:39 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 24 Nov 2021 15:29:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Message-ID: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
To:     =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        David Miller <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>, linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Waiman Long <longman@redhat.com>,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Landley <rob@landley.net>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:kvvewp4q1FAJ0MpoEGLwlB/PLxdOuKA98DDx3lRTLAhAuq5r1SN
 dVZaqtNj0rA00O2+5JDEOGH8vjanLTQElNCCNl6U0Iqm8HgwM3c6UDI559OUKgPBVSABsMw
 iAIon5HwE76VX1rzX0antRkE4Q6+NGzFoQsReQkFpGViMvrKnm3yur2/LEgWNGL22CDn9bM
 OCbRa680oc4Mprhu2iDRQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bfkJl6olqZs=:nyRsJ+I2PqfghoWMv+L5WY
 rNENJgajXYgywGXastal3DkWfSXJk+X3WrfMzc/0bRFD3a9e3yPpcGSqmdF/9nh6YDBl6Goqy
 hWpLndeoJQRsgm/UKJfaT5PYJqHq/rNwJQ4cO+S/k448jtS0JMd/ViqN/t45r39mD60tL3G0w
 oRcQEcMIVoon+6F4A1ZBvk2XLry0Cd8LkQ+uI7N1aFd5PyLFgVHi1xJ0ZSRB1S1jJiPkEcgvL
 tpNVj/4JW002slhnQdwZ4I1/TSi8WJiB/tz9xBRnFwmM/3Y9o6V+gz4Ab3Hf8664ixHIwZBW8
 Jcptb9H07gG1eBkNbxtIbJ+fVa4nnam4eFzlRMwvs5+nubM9SoB69uoadpgcE7m8nuLU7ysAi
 a7A0dxWEMVKTbQLoneg4qq98OtTugcmxVZ6csevj32vQv4AtAKNVkY9g0M2NSxsX3ugDdtK0j
 nbeC4Y6YTZpL/ohmFHsF75dmRQYjWOygCO/s8uSF+TYhfFZX9oYLvrna3gpDzsjPLjiW3Cwmc
 mfTzqhggRL8F74hHyLoQVtfbAFpLTjghxxjdHOK7WnT8SgLJklipwIQpchtIFIUOfPZsUyCL3
 E4M4TBzGBB4Rp5dbDTwW8RblHi0G/wZo44egZsybEPss3BC1iB2wdV8OPUxM89t0fIy7Pv5UC
 7g2JaMrxohfx6xT9iTxzUh9LrrG12+77192oJL5xGuyOF/UiYfptrWJXBkTvVxuxU74xUqQsL
 wQNf6oC4eCK9+QVTko0likL3JxZuSvir3b+Itp/KoKko/mu6Tj8SA8C6jpb+DNf/YQHIuXRte
 CgfR662CM8Nv59n2Aze8QH5RY2uvk73/GxQjzH2ozp02IHJH8g=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 24, 2021 at 2:21 PM André Almeida <andrealmeid@collabora.com> wrote:
>
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: André Almeida <andrealmeid@collabora.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I double-checked that futex_waitv() doesn't need any architecture specific
hacks, and that the list above is complete.

Should I take this through the asm-generic tree, or would you send it
through the
tip tree?

        Arnd
