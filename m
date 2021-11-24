Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4AE45B897
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 11:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhKXKrZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 05:47:25 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:60301 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhKXKrY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 05:47:24 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MQeI4-1n1QaZ1oyE-00Nftt; Wed, 24 Nov 2021 11:44:13 +0100
Received: by mail-wr1-f44.google.com with SMTP id r8so3343353wra.7;
        Wed, 24 Nov 2021 02:44:13 -0800 (PST)
X-Gm-Message-State: AOAM530VHEW/qLUHJ612faaJDB+f4Top7myvtPt6hy4lmPFcyyTo2eoG
        cWF2zO9iJy/tOdAreMlEFSmqKigiBw93k7Q/YQM=
X-Google-Smtp-Source: ABdhPJxfKmbt+vf7yW7iEZ+Pe1Z0V7tK3T1pBVG5pdSDlxjUaEAk6QQCj7BdeGupZ5+9VcvgxO0WFCpGajEcoNKFPl8=
X-Received: by 2002:adf:f088:: with SMTP id n8mr17540560wro.411.1637750652924;
 Wed, 24 Nov 2021 02:44:12 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com> <8767803d-57b9-698c-ca27-d47e7117758d@landley.net>
In-Reply-To: <8767803d-57b9-698c-ca27-d47e7117758d@landley.net>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 24 Nov 2021 11:43:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a08wiu4uGrCvh+1Ezm2q2ta=DJMoZ1MFhUgjaMYJ0Be6A@mail.gmail.com>
Message-ID: <CAK8P3a08wiu4uGrCvh+1Ezm2q2ta=DJMoZ1MFhUgjaMYJ0Be6A@mail.gmail.com>
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
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cd7TT7udPC5q/AA2Et3O+w8pDqXvjI/521RNNmptP9MB0W1/YRZ
 gWusxm9RhnhMBipi6uS8siCGiZs1c2YIHLRl8409NxraCCnBJYh6k1bQdzT9Ajo4OUNt9K0
 U5+4AJmTihhjPaGQQrpCPnacBUQwvgIFzaYCJKcjxj0LY/Y6p3JQ49cLyofppvEcYr9YOBC
 VCIG1Am0ttoqpn7SwIvEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ID+ibo8dEI=:4R2wsP3Dr/9hPbL11wSFcD
 7eDbi3MyV6Fjx0ZrlGLi3BuSDeQA0FHestmIobX1zhrvnE+qBAwh+k2qnQ7cWIrKLkfNswcRO
 xXHeIGTLfxCcJPz0XoxZi+v/b1U4VENDZEipwAOylCX35SwlfvpQEjshdbzrqKgYeaP2lOovo
 q2Q74h1tssT0aK8zz99kVMXXPklATYhXgtgnlxRaIT71umYOPxgRvMSQLqOP3ZIaK5erMQIdj
 rLXA7C+Nz5+IqNfmLB7+0yKVZpLLZQSMFG0TIOyy6Aq1FTWKaLRCZsq1ozoCcjArclpqUfgOw
 axfPGNSuIQulW5nvFGhR5LINe+xbbU5SM8qyBOG83ivlhtBYu8oCVx1IJZQAimhAPiuh6Ivnd
 Fd1jUCQ36p0ZTGtJUD5D0E2BHPdLZEZgP1Mg2bcXIjCbkGbJJoZAsVVO+cCQskdBEk59iyAbu
 9uyEgdwIWdc0BJB9y40EUWC+M2+bWMcQrbAHHoOe0QXRb517F5a4eLMyU9Mc5MKvZgT5QMmN/
 fU8tdFIqLoT4mCupPIUBsMCAytXma1YRw4BuapRrHpdEhCWPeQpB4uwcSzsdi0QwUvmD5mkqE
 tvoU+qth0DVIANpb62yvlpOpJejdBWL9N01GcKAZqFOPjJWq3rLEeRuGV9t01SsK6gkWhSyTh
 ZJV0CiOYMVDH1mDNwrtbMESZyLMtKZAPkANuhBATVgqNxADMpy84kBALQaRTnQzkUZyfYKxO0
 iZQkcTb0RkC9a2xoOOyOT5jaOrbBmZLM9l1zAdp7uT3iB6Ci/+2hSTC348fAdtG7f1ThPHpbB
 mzGO/f+RlMnW2+7piZVtfmNMg+dT908XMrIqo8L0AZ5OamwpRs=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 24, 2021 at 11:01 AM Rob Landley <rob@landley.net> wrote:
> On 11/23/21 7:19 AM, Arnd Bergmann wrote:
> >
> > These happen with any compiler version, someone needs to write the correct
> > entry code for clone3 and hook up futex_waitv().
>
> I did a naieve "add them both to the .tbl" patch and the result booted to a
> shell prompt, but that doesn't mean much. What arch-specific entry code does
> clone3 need here? The SYSCALL_DEFINE2(clone3) in kernel/fork.c seems reasonably
> straightforward? (Unlike the #ifdef stack around the previous clone...)

I forget the exact issue, but I can see that 4 out of the 13
architectures that set
__ARCH_WANT_SYS_CLONE3 provide a custom version: arc, m68k,
mips and parisc. Have a look at what those do to see if you need the same
changes.

> >> include/linux/sh_intc.h:100:63: warning: division 'sizeof (void *) / sizeof (void)' does not compute the number of array elements
> >
> > These are old bugs, they show up in any kernel version with gcc-8 or higher.
>
> I looked at trying to fix that but it seems to be a compiler bug. Gcc is warning
> about an ? : else case that's dead code eliminated. It's already GOT a test
> protecting it from being evaluated...

I wouldn't call it a bug in the compiler, as there is no definite
correct ordering
between dead-code-elimination and warning generation. IIRC I fixed a bunch
of these on other architectures, and those did turn out to be actual code issues
that would go unnoticed otherwise.

> >> fs/mpage.c:336:1: warning: the frame size of 1092 bytes is larger than
> >
> > I see these going back to gcc-6, it looks like this is caused by
> > CONFIG_PAGE_SIZE_64KB.
>
> In which case the stack size is going to be 64k as well?

No, the stack is still 4KB or 8KB, depending on CONFIG_4KSTACKS, it gets
allocated using

        stack = kmem_cache_alloc_node(thread_stack_cache, THREADINFO_GFP, node);

from a THREAD_SIZE-sized naturally-aligned kmem cache in this case.
Using 1KB of stack space is definitely a red flag that something is going
wrong. This could be a bug in kernel code, in the compiler, or in the
combination of the two.

        Arnd
