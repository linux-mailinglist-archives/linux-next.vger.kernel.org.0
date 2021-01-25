Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B286C3027EF
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 17:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730724AbhAYQdm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 11:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730749AbhAYQcn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 11:32:43 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC832C06178A
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 08:32:02 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id w1so18878887ejf.11
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 08:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2RzgFx4bVzCyoVBI8IRrWv56bXh+C2simTbpmFGdt1c=;
        b=eyunknpLzjfpE9Vh5qFqaREXOsPbYtFO6TDAKZYKCbFEv9x7t12KpcyXgVu9HeKU9f
         orT3yRZ2aXxMYJCWeWdFYNAks6JWCZG6u3G6oXvYIwZxGXPfpHuS6sN++w8HOYzpfZNe
         byE/VlgxRCzxHUxqW/A4mwOXw+YsJQAiY+e5kmmyeie+VaNc/WgdQMBrpNYI46kq/A5m
         hHjXSoWuD1VxXnBppunOqxQAEhfD6SXf/547Isyv41nTQGu/9dwp9CddYsasXVzQ0m/7
         3yNCOfxkrgG1QD/rbyz4plhF4xkyOAvJ+aPCUUITizFpRQpkLkSNd3s3wR3lTD66m2hw
         kwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2RzgFx4bVzCyoVBI8IRrWv56bXh+C2simTbpmFGdt1c=;
        b=c7MvLMk3WVN/Cr3JZRUKcsdkaBTc8poEEViXAx3HTGji7+KtxUgsc0b4n+CBOqgGD4
         TeuHPGGdQ2ytOHl+UG4B+nL/EIg0bRXRMV+jdnOgLOKMYvCtXelTo91KeUV0h7cOJB/e
         WCdilRmK0jvFxG7oRtb6p7A71uFLEjzBP0f6eopziDLa/GTtLn8V32BLuLSvQitMFeL7
         QOJngjqtDy/cR33uEnetB6G1PUC9Wmd2FYDOWhQriLpPS/Gd2lNoMc45ojh9dsBl8tzo
         WNMcVWflTFW26of9y8ETGVY3/nEYIRZRm4QNhibN7ounkX8J5cQXaAu0FmLO+8hOrngR
         tOkg==
X-Gm-Message-State: AOAM531aKAXD/Mzaarr7/VB3KaM+KBwyhOpKHcGweZ24MzuIpReYPCvl
        1O0M/q75CUVd2r9TZMyUCU8A2GyDCsgnQDOSfYn1Ig==
X-Google-Smtp-Source: ABdhPJxXnTkeYm/9NPRPkxEwReac7Klq6zD6SARzoK1mMYze5vLOxVFjBNqRFh2wWMUp3ZfTIRmy7aCjkwmLZ/CQgWk=
X-Received: by 2002:a17:907:104c:: with SMTP id oy12mr867060ejb.503.1611592321246;
 Mon, 25 Jan 2021 08:32:01 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYsvDWDogC+xgeG2V9MMofV5svTipDigDiUBje+2jSRK8g@mail.gmail.com>
 <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
In-Reply-To: <CAK8P3a2OeeW29ekbD70Ns4LTjGRJRT9P0wM-SAxUin1zAxP7TA@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 25 Jan 2021 22:01:48 +0530
Message-ID: <CA+G9fYv89bfbixjuudPWkBAucTYg7qhNxcV54RMEkRP5is-bnQ@mail.gmail.com>
Subject: Re: LTP: madvise08.c:203: TFAIL: No sequence in dump after MADV_DODUMP.
To:     Arnd Bergmann <arnd@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
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
        Joerg.Vehlow@aox-tech.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Arnd,

On Mon, 25 Jan 2021 at 20:41, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Jan 25, 2021 at 3:48 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > LTP syscalls madvise08 test case failed on all devices from
> > Linux next 20210118 to till day.
> > strace log attached to this email and link provided below.
> >
> > BAD: next-20210118
> > GOOD: next-20210115
> >
> > This failure is easily reproducible on Linux next tag 20210118 above.
> >
> > tst_test.c:1250: TINFO: Timeout per run is 0h 15m 00s
> > madvise08.c:73: TINFO: Temporary core pattern is
> > '/scratch/ltp-2nftQzNI1K/HclFMH/dump-%p'
> > madvise08.c:112: TINFO: Dump file should be dump-10109
> > madvise08.c:196: TPASS: madvise(..., MADV_DONTDUMP)
> > madvise08.c:112: TINFO: Dump file should be dump-10110
> > madvise08.c:203: TFAIL: No sequence in dump after MADV_DODUMP.
> >
> > strace log,
> > https://lkft.validation.linaro.org/scheduler/job/2184866#L1257
>
> Ok, so in this part of the log,
>
> [pid   485] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_DUMPED,
> si_pid=487, si_uid=0, si_status=SIGABRT, si_utime=0, si_stime=0} ---
> [pid   485] write(2, \"madvise08.c:117: \33[1;34mTINFO: \33\"...,
> 64madvise08.c:117: [1;34mTINFO: [0mDump file should be dump-487
> ) = 64
> [pid   485] access(\"dump-487\", F_OK)    = 0
> [pid   485] openat(AT_FDCWD, \"dump-487\", O_RDONLY) = 3
> [pid   485] read(3,
> \"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\4\0>\0\1\0\0\0\0\0\0\0\0\0\0\0\"...,
> 1024) = 1024
> [pid   485] read(3,
> \"\0\320\3\0\0\0\0\0\0\340\375\24\304\177\0\0\0\0\0\0\0\0\0\0\0\20\0\0\0\0\0\0\"...,
> 1024) = 292
> [pid   485] read(3, \"\", 1024)           = 0
> [pid   485] close(3)                    = 0
> [pid   485] write(2, \"madvise08.c:208: \33[1;31mTFAIL: \33\"...,
> 74madvise08.c:208: [1;31mTFAIL: [0mNo sequence in dump after
> MADV_DODUMP.
>
> it seems that the data that was requested to be dumped with MADV_DODUMP is
> indeed completely absent.
>
> There was exactly one commit that got merged between next-20210115 and
> next-20120118
> related to core dumps: 8a3cc755b138 ("coredump: don't bother with
> do_truncate()").
> Adding Al Viro to Cc for that.
>
> Naresh, could you try reverting that patch?

This suspecting commit reverted and tested and the test case PASS.

commit 8a3cc755b13808eba74846dfd1033fcbc21f9a65
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Sun Mar 8 09:16:37 2020 -0400

    coredump: don't bother with do_truncate()

    have dump_skip() just remember how much needs to be skipped,
    leave actual seeks/writing zeroes to the next dump_emit()
    or the end of coredump output, whichever comes first.
    And instead of playing with do_truncate() in the end, just
    write one NUL at the end of the last gap (if any).

    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

 fs/binfmt_elf.c          |  1 -
 fs/coredump.c            | 56 +++++++++++++++++++++++++++---------------------
 include/linux/binfmts.h  |  1 +
 include/linux/coredump.h |  1 -


Test case output link,
https://lkft.validation.linaro.org/scheduler/job/2184975#L1369
https://lkft.validation.linaro.org/scheduler/job/2184972#L1358

- Naresh
