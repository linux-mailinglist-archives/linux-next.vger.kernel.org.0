Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5E710448A
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 20:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfKTTsx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 14:48:53 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45451 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfKTTsx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2019 14:48:53 -0500
Received: by mail-oi1-f196.google.com with SMTP id 14so865989oir.12
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2019 11:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dsU7uehqL7wnWMosnxZD743IVZUrswQeWUXFNhR2dAA=;
        b=ruI8uTSHdjBoqHZ2jFzEh7W0jWZ2DMLFOLqWav6aSkbhdtZkS9s38+PTWD8ACMDMur
         Qgx3CVYnGVT9JwJTu/yEYBBjfU31F+UDKyGGNaed2Xi1xsxhLGDEA1/fYiemRsxVcZQD
         DNiz7L9xTOaVQBts8EwUnzYGQAsax0mgBWWF/7fpSEHvow8q5YEzonc4jKyCI7g8XXKX
         z/S81nXxfadZ6yvKvMSPvRLnk80wTuxP59PKbezy7K4BcZBKD6yY+0CG/EoHzCpqWhFs
         pIBzMALNOFqt5y42crsVXrLUUJgyBsMUImUxQaucbCs9+FPT5oyYy49hU5Gsn62c+Dec
         M6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dsU7uehqL7wnWMosnxZD743IVZUrswQeWUXFNhR2dAA=;
        b=X7ec7QPmbPdrPCVXJsFBlyc/b/9AWBAiWXQXQ00h4v/AHzGXyQu9iJWEMzNrCtKRYy
         kNVx0zJvS9O97ex9Wq7umy9K3bjQFB1l7X9enZarhZ/NofzdzsifSNoyk80tx68/+iE1
         eAJIAhGXK8GbU5Kt43/bnpQ5J9kjZLgKUrOzA+E1JftwXcKGjkX6MEnJv10jSVEUngo8
         uZJ0rfC1irgfW7c+ap6pvKMnIPrEgUwr8CrPwXpqROWujKpoeXsXW8UiF5mn9xLDI0EC
         T3qVaiQ/IRtq2C3+duuQUetsRGzkcvvxEgtZXS1X9wqCH16Qo99Z3x/ocmmo45KpRJs+
         PImw==
X-Gm-Message-State: APjAAAX+rxC3ef6Qf9I/Qrsbiel6OWpMHYGVM+Bt5xI+f7hoHDsRHANK
        T7Cl/yilZjMumS9XIiQGzxDv4xTPtk2sHgqtEzixYw==
X-Google-Smtp-Source: APXvYqx/g4BDi4Ep4xVGg1QmPYKz53hEOqfiaQgYctXmYAiZxgwMeeig4RXOI711HsPMUkELprAS61STvR/YqA628Cc=
X-Received: by 2002:aca:d80b:: with SMTP id p11mr4437774oig.83.1574279332230;
 Wed, 20 Nov 2019 11:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20191120203434.2a0727b3@canb.auug.org.au> <58708908-84a0-0a81-a836-ad97e33dbb62@infradead.org>
In-Reply-To: <58708908-84a0-0a81-a836-ad97e33dbb62@infradead.org>
From:   Marco Elver <elver@google.com>
Date:   Wed, 20 Nov 2019 20:48:41 +0100
Message-ID: <CANpmjNOHTyTRCeo3oxEPTY__TCjAQ8nMvcqDSZ6Otfs7vVESSA@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 20 (kcsan + objtool)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 20 Nov 2019 at 17:18, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/20/19 1:34 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20191119:
> >
>
> on x86_64:
>
> kernel/kcsan/core.o: warning: objtool: kcsan_found_watchpoint()+0xa: call to kcsan_is_enabled() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_read1()+0x13: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_write1()+0x10: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_read2()+0x13: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_write2()+0x10: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_read4()+0x13: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_write4()+0x10: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_read8()+0x13: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_write8()+0x10: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_read16()+0x13: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_write16()+0x10: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_read_range()+0x13: call to find_watchpoint() with UACCESS enabled
> kernel/kcsan/core.o: warning: objtool: __tsan_write_range()+0x10: call to find_watchpoint() with UACCESS enabled
>
> kernel/trace/trace_branch.o: warning: objtool: ftrace_likely_update()+0x361: call to __stack_chk_fail() with UACCESS enabled
>
>
> Full randconfig file is attached.

Thanks.

This is due to CONFIG_CC_OPTIMIZE_FOR_SIZE=y. It seems the compiler
decides to not even inline small static inline functions. I tried to
make this go away by adding __always_inline, but then we're also left
with atomic64_try_cmpxchg which never gets inlined.

The optimized build simply inlines the small static inline functions.
We certainly do not want to add more functions to the objtool
whitelist, especially those that are private to KCSAN.

We could fix it by either:

1. Adding __always_inline to every function used by the KCSAN runtime
outside user_access_save + also fix atomic64_try_cmpxchg
(atomic-instrumented.h).

2. Just not compile KCSAN with -Os, i.e. have the Makefile strip -Os
and replace it with -O2 for kcsan/core.c. #2 is the simpler option,
and would probably make KCSAN more effective even with -Os. Although
it might violate the assumption of whoever decided they want both
CC_OPTIMIZE_FOR_SIZE and KCSAN. It might also mean that future
compilers that have a new inlining algorithm will have the same
problem.

What do people think is better?

Thanks,
-- Marco

> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
