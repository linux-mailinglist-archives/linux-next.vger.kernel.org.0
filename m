Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F7E45D567
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 08:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhKYHaj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 02:30:39 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:44837 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbhKYH2i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 02:28:38 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mj8Vx-1mBIfr28dJ-00fCq6; Thu, 25 Nov 2021 08:25:26 +0100
Received: by mail-wm1-f42.google.com with SMTP id p18so4678724wmq.5;
        Wed, 24 Nov 2021 23:25:26 -0800 (PST)
X-Gm-Message-State: AOAM530QiXbrOp0z0nvMhOS6QXnPigqBrxhdIMaNXNhNuvQJwshOFc2l
        yNJ0sG9A3dnOi55NHTbjVLJTKbI1g03V9rGsV+c=
X-Google-Smtp-Source: ABdhPJyy6ATv8tSD9TCRzguY89cRW48KZUM5hIv/qv6+Bes6O17s3r/PNVx7dDZUxKeck8kOsUP90+k3XKHwUJxujn0=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr4480662wmi.173.1637825126097;
 Wed, 24 Nov 2021 23:25:26 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <41206fc7-f8ce-98aa-3718-ba3e1431e320@landley.net> <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <7d5a5249-40ee-9a42-c6a0-a5defa3703c1@landley.net>
In-Reply-To: <7d5a5249-40ee-9a42-c6a0-a5defa3703c1@landley.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 25 Nov 2021 08:25:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0XGz=F0nPAW8T-VvfH5bPuGTNiPZ18N+Z6Sj_M_6TrPA@mail.gmail.com>
Message-ID: <CAK8P3a0XGz=F0nPAW8T-VvfH5bPuGTNiPZ18N+Z6Sj_M_6TrPA@mail.gmail.com>
Subject: Re: spinlock.c:306:9: error: implicit declaration of function '__raw_write_lock_nested'
To:     Rob Landley <rob@landley.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org,
        =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PV3UB1U451OsVkwm7gsFutWlYpQna78TOwDYqoGTBfGmnOmrhUK
 RKIqTED0/QIE8zWbbffyvZblhc0Wj8nlB5mi3FzE+RpPj5gxqiP8VHd7VsxCIHBjbD/REkp
 ZXzdzLJM/xLf8vKfXYw/KayabTkgQ0qEtc2fkST1iHVdQMnqfslm38bdjnTXEIHHeANhJek
 sORQv3QcLGad/9PH1GKfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lBeAplpGVPg=:R7AxkFhqoIjh/THHy0oFZN
 NZzEH6jh/djMrbqiNQpuvdONzGyFK/2p0KBqavu1UJghlvkkNQ6KPh0WuuJxzpbQZViLDVnBt
 yhMINBmSREPWLI3+4/xDV0aZfFO6NxdYUJ6MPu2rn8W7B6abrreOojuJrQkS5ZaWIvDv8vSwB
 Y7VKNtPDfdGPXjc92nY1yxO4PGh1Lj9DxhdwnJRFU1iYAc0RY454kyglLM8gZvXueO6HYlE9f
 Pi/f5t37H5h9riFrij1A1w9hR8aYPnVRWXIoVNLTf1pK/7qFpkJlpbPs4OYHSX8ANih0gmjDl
 KYCLY85QZYpB6pu0zZATHt4ZSGvADwViB9aSXu/Z5y3B6KuFgA1TIsW34GcVuwt9Xg+j+2DaQ
 G0KaxSiPcPW6RnKLZ3LaS+XoWRhjsZCkhwlae5LVi52stQrByxN2JQc9qhdfOKdu4EgfEJbvQ
 IWLyEihXK13CntZd2a/sztOJ9Tms2MFSFvrKP+/EatH22WYtYRyNUu2DpXcHBSoR3KwDkFwTd
 +ZCa4+doS7WstuTOQQdVMZ9B+T0E9Kwwz8N+idg+9WyWM4NP8lSHp4HwUETzWNSmIV7b6KK38
 3EZYJ0ce3FpE2qbtrlvhwCY2G+nfyohQWxYXGt/R2YxnrnNMpc3FlhIGSimbGd99d3acLe887
 pLwaUIoD5r7QhP3TTyDMjmwOHEdKGLtqoFJnS2UGz3qCCMdcgsKD1VO+YgitnxosmziKafqGT
 W5bKMoHALL4C2WXqEdRXKXSy/i/fqTzRWBTjUj68hnvZkaFB/wh7iEhzexD5QhDzOCPRQIBWX
 MpA9hT+S6fbldm+525x6vhNtkhe8Oce7UOCAc3TKzjllDM8FyQ=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 25, 2021 at 12:38 AM Rob Landley <rob@landley.net> wrote:
> On 11/24/21 1:49 AM, Arnd Bergmann wrote:
> > On Wed, Nov 24, 2021 at 8:31 AM Rob Landley <rob@landley.net> wrote:

> > Did you test clone3?
>
> Haven't got anything that's using it (musl-libc doesn't know about it yet) but
> it looked straightforward? (Unlike the #ifdef stack around the previous clone...)
>
> I can try building tools/testing/selftests/clone3 if you like, but for some
> reason the clone3 tests want -lcap which isn't in my cross compiler. (Because to
> test a clone system call, you need to manipulate capability bits. Of course.)
> Right, comment out the LDLIBS line in the makefile and the first 3 built, let's
> try those... Hmmm, it's saying the syscall isn't supported, because it's using
> syscall.h out of the cross compiler headers (not THIS kernel's #includes) which
> of course doesn't have it, and then clone3_selftests.h falls back to:
>
> #ifndef __NR_clone3
> #define __NR_clone3 -1
> #endif
>
> Right, stick a 435 in there and... it's still skipping it. Why is it still
> skipping it... because the RUNTIME syscall is returning ENOSYS. Ok, I have to go
> stick printk() calls into the kernel. (Do I have to #define those
> #YES_I_WANT_THIS_SYSCALL_WHY_WOULDNT_I macros? Hmmm...)

This specific syscall is protected by a macro so it doesn't get implicitly
enabled without architecture specific review for those architectures using
include/uapi/asm-generic/unistd.h.

> > This needs a custom wrapper on most architectures
> > to have sensible calling conventions.
>
> Define "sensible" in this context? It's a new 2 argument syscall? (Do you mean a
> libc wrapper?)
>
> > If sh doesn't need it, that should
> > be explained in the changelog text.
>
> I'm happy to try to fix stuff up, but I don't understand the objection. Does it
> do something other than what the old clone did, except without the need to pass
> more arguments than we necessarily have registers defined for? (Calls the same
> clone plumbing, which should call back into arch/sh/kernel/process_32.c already...?)
>
> The most recent clone3 arch addition was commit 59a4e0d5511b which also just
> pulled in the generic version. (Via #define NO_REALLY_I_WANT_THIS_SYSCALL rather
> than editing the tbl file? Looks like I've got some reading to do...)

The best reference I could find is:

https://lore.kernel.org/linux-api/20190604160944.4058-2-christian@brauner.io/

If fork() and clone() don't need special handling on arch/sh, then
clone3 shouldn't
need it either, unless the existing ones are also wrong. It looks like
some architectures
override these to avoid leaking register state from the kernel to the
child process.

       Arnd
