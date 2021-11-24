Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60A545C52C
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 14:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352314AbhKXNzT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 24 Nov 2021 08:55:19 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:45040 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352453AbhKXNxQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 08:53:16 -0500
Received: by mail-ua1-f51.google.com with SMTP id p2so5164907uad.11;
        Wed, 24 Nov 2021 05:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Hf4rPGIgUhHt4w8e7uNMvl+iKhb8nrL9YmbQ22fq8VI=;
        b=He5un5yk33f9sIF2Rhys52JnuelDkFQIoQ6fzJnOxBpZW8VATsvbqkv4vy07YWvpFO
         Lb3+0fKkpCD/6bM4yWnKyxml529Qn8/RKTIJoIB/zsCPwUAhz8L9KSX12pIGArPABZHA
         UWGRCKmwuygWgXe2lJwIvWIZmMVKKDTomA63vSe6O4RHGyTeXkx9gSbueiicxb8p1AFO
         RwdpESkTvbVA3hxsYswpBSyvUEAdx0Ji4djseUttVRCnGY8lGuV0svTLkAhEe31JHjsU
         3jP8vnK+Vv6Yoy2jZxkkUFPYiTVM/m9rDJoNZNKLII/gA4xAP+C4zrlYBLElNrobw7/f
         N5kw==
X-Gm-Message-State: AOAM531jSq5zO1r94A1/gIFOUQuYrlroeXoqzNcMnRJo1PTrjsvg8DVI
        j/8VIN65YKKPeiBWee63CNIl1tZ4sQN/GA==
X-Google-Smtp-Source: ABdhPJy6UEAseLrM6Q1evvVHNRW62Jer850vtXNQSRqM4LWjRZGo93VHt3L081Wgr2Hi4wmQpdestA==
X-Received: by 2002:a9f:30cf:: with SMTP id k15mr10568219uab.21.1637761805306;
        Wed, 24 Nov 2021 05:50:05 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id d16sm7791179vko.29.2021.11.24.05.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 05:50:04 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id i6so5229072uae.6;
        Wed, 24 Nov 2021 05:50:04 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr24413982vsj.50.1637761804180;
 Wed, 24 Nov 2021 05:50:04 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 14:49:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViovyQ2xBeKaMRbAmYF5eMWKdYhQEPmnTyLJoF7a+xsg@mail.gmail.com>
Message-ID: <CAMuHMdViovyQ2xBeKaMRbAmYF5eMWKdYhQEPmnTyLJoF7a+xsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
To:     =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Simek <monstr@monstr.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Linux-Next <linux-next@vger.kernel.org>,
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
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 24, 2021 at 2:21 PM André Almeida <andrealmeid@collabora.com> wrote:
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: André Almeida <andrealmeid@collabora.com>

>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
