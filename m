Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4236C302727
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 16:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730365AbhAYPqS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 10:46:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:40604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730353AbhAYPp5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Jan 2021 10:45:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC37D22EBF;
        Mon, 25 Jan 2021 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611587503;
        bh=r5Uo07IQYlBEdLUN4JJ8iBXUHjeKUZXycoL6vpJfGJ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XFWbHp7KHXEFjyM6C90aTj6/8cIhEeua3UZRyetUsW/pffyrn4bL0U3jptBLjrHzB
         P1r0zm2u5P92v3WAPqZNmyb3eNmVPXUoXm+SCVDkaW7p7nr/rSy9rN918ITvCYdsyL
         8AtqBm4jGT+dyQf99Ki0fecuONmWBSkbCc81y/psVEBIcV7YMVCUejscCcVujcSk4D
         4dSxx5vidN/eVL1bSpIlV5cjr2rbDKUJnJPmlITGS1pN+0gYaHZ4I3Wlr/nyi5Ivpc
         mRmwp13Igu+okBVasvZKPeRXYXteRCPRwqkilfJAtopvbAw5h+7zp4046O0Rb+lFrd
         hrDQkhUxSLH1g==
Received: by mail-oi1-f172.google.com with SMTP id g69so14289420oib.12;
        Mon, 25 Jan 2021 07:11:43 -0800 (PST)
X-Gm-Message-State: AOAM5300vdMihRKPY3vcu8rwZgzTCQqFkJCLl3USDlFE5y+8LpqTMjYw
        WHWZcidolO6nu3Z0KoSZEDdAPX5WAfDEDFDGKWY=
X-Google-Smtp-Source: ABdhPJxdJ3BJcGsYMDL3f90oYHHi/YyWcPc/WE/CEaHqFC/PG55A6VPahWUH0/LFCBt9e0OYCoUW465Pd+6s+5408mw=
X-Received: by 2002:aca:e103:: with SMTP id y3mr396747oig.11.1611587502910;
 Mon, 25 Jan 2021 07:11:42 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
In-Reply-To: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 25 Jan 2021 16:11:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
Message-ID: <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
Subject: Re: LTP: madvise08.c:203: TFAIL: No sequence in dump after MADV_DODUMP.
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        LTP List <ltp@lists.linux.it>, lkft-triage@lists.linaro.org,
        chrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Christian Brauner <christian@brauner.io>,
        Kees Cook <keescook@chromium.org>,
        Peter Xu <peterx@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Vorel <pvorel@suse.cz>,
        Richard Palethorpe <rpalethorpe@suse.com>,
        Joerg.Vehlow@aox-tech.de, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 25, 2021 at 3:48 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> LTP syscalls madvise08 test case failed on all devices from
> Linux next 20210118 to till day.
> strace log attached to this email and link provided below.
>
> BAD: next-20210118
> GOOD: next-20210115
>
> This failure is easily reproducible on Linux next tag 20210118 above.
>
> tst_test.c:1250: TINFO: Timeout per run is 0h 15m 00s
> madvise08.c:73: TINFO: Temporary core pattern is
> '/scratch/ltp-2nftQzNI1K/HclFMH/dump-%p'
> madvise08.c:112: TINFO: Dump file should be dump-10109
> madvise08.c:196: TPASS: madvise(..., MADV_DONTDUMP)
> madvise08.c:112: TINFO: Dump file should be dump-10110
> madvise08.c:203: TFAIL: No sequence in dump after MADV_DODUMP.
>
> strace log,
> https://lkft.validation.linaro.org/scheduler/job/2184866#L1257

Ok, so in this part of the log,

[pid   485] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_DUMPED,
si_pid=487, si_uid=0, si_status=SIGABRT, si_utime=0, si_stime=0} ---
[pid   485] write(2, \"madvise08.c:117: \33[1;34mTINFO: \33\"...,
64madvise08.c:117: [1;34mTINFO: [0mDump file should be dump-487
) = 64
[pid   485] access(\"dump-487\", F_OK)    = 0
[pid   485] openat(AT_FDCWD, \"dump-487\", O_RDONLY) = 3
[pid   485] read(3,
\"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\4\0>\0\1\0\0\0\0\0\0\0\0\0\0\0\"...,
1024) = 1024
[pid   485] read(3,
\"\0\320\3\0\0\0\0\0\0\340\375\24\304\177\0\0\0\0\0\0\0\0\0\0\0\20\0\0\0\0\0\0\"...,
1024) = 292
[pid   485] read(3, \"\", 1024)           = 0
[pid   485] close(3)                    = 0
[pid   485] write(2, \"madvise08.c:208: \33[1;31mTFAIL: \33\"...,
74madvise08.c:208: [1;31mTFAIL: [0mNo sequence in dump after
MADV_DODUMP.

it seems that the data that was requested to be dumped with MADV_DODUMP is
indeed completely absent.

There was exactly one commit that got merged between next-20210115 and
next-20120118
related to core dumps: 8a3cc755b138 ("coredump: don't bother with
do_truncate()").
Adding Al Viro to Cc for that.

Naresh, could you try reverting that patch?

     Arnd
