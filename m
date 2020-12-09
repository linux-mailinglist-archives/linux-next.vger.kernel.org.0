Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3900D2D3F87
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 11:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgLIKHR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 05:07:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728971AbgLIKHR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 05:07:17 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB8BC061793
        for <linux-next@vger.kernel.org>; Wed,  9 Dec 2020 02:06:35 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id q5so660774qkc.12
        for <linux-next@vger.kernel.org>; Wed, 09 Dec 2020 02:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+5z+13xz88XeLJl7OiuxcCFkjcYyny+A4YZW2csEjQM=;
        b=MjKkDaOW537I+/uuMPqInrP1I/DggVkNKmpO+t1e6A8j/iSjwSLUYsN04jYCiFpi6U
         YYcnAyjE0Ulu+KMvpw2Fm8Kkg6klKqXGDtIObVl2ZI53PIBwF8LZWYRD72DvyqsrSDCJ
         3iQ1E4HGE1JKCijwoeCIgyVmS4jF4esV3YCYZydKy0VL20MUuziI0jr3El29UtqXCT9K
         QSiczrOWplf4gJ9HMR6Wf1nc4tzW++ErrkQhvt1Lacmc3EQBOsGJReS4Ab9yX3ifuNm+
         CuFCw3f8gJ1qkOI8pdGVS2VeZZIQ4CeqvO7pAuUXRWwzmwFHsUP/2Y2oe8gKeN1/TlZY
         FSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+5z+13xz88XeLJl7OiuxcCFkjcYyny+A4YZW2csEjQM=;
        b=cvQ5sVtEwBe64qMInzSREAsX/WtpYM8eEaaYjsOf6EUzZKuHl0lp39stkCaLZGekzU
         L+10uZYhCmC3ULBSfUOoKAuN/X20vMT3cRAhKkMI8bDs6YXIdzTeWTfsvSTOSF1vpzpo
         jpPIUefsVTlxEVxNLnFLwBMbsxEPlryXyz3MxqihIrnufWxFt9merlxn0ZDzT9WVGokX
         ZrVCgxYZ32O3Hk55p9O66/v3Y4m7k6fTpz15VwdihQkGI1Y/JtlQkbXL+zNrifuk3jJ1
         AVpJmN6z1CQInC7ElncwhlVuifBmS49M6FtavzB72/uOnV87y4lr6ixiNw7HzS7bHJ3D
         jdQg==
X-Gm-Message-State: AOAM532xo98h1Sa7agH76CZoczYbWr4vbzBwFuM/GZtZufP7T2k5VfoH
        zFzAsx4R/92oFSyQWQE8IMI8Rm2Z8KsbbOJN+dRB9Q==
X-Google-Smtp-Source: ABdhPJwDtiXtssEsSHS7ho5SHRVT3wsN+Y9KHOW7grVgYWjsqi8MQhKLx/pVwz0yhAiCbCXJiaNYBhXUn1I3Mh63ZW8=
X-Received: by 2002:a37:56c6:: with SMTP id k189mr1948333qkb.501.1607508394588;
 Wed, 09 Dec 2020 02:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20201204210000.660293c6@canb.auug.org.au> <20201204211923.a88aa12dc06b61780282dd1b@linux-foundation.org>
 <CACT4Y+bYVC=r+bPF7MziOZpJCYqrUj7CFt47Z5PSWjohZLYm+w@mail.gmail.com>
 <CACT4Y+bPPSQ1OgZ1NmUckOO2=07RE3C=deW6BpF0cOR9wnJsoA@mail.gmail.com> <CANpmjNObNia7mFFJDz6ofG06QOTzad=iU=b_C=E97nV2hB-hng@mail.gmail.com>
In-Reply-To: <CANpmjNObNia7mFFJDz6ofG06QOTzad=iU=b_C=E97nV2hB-hng@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 9 Dec 2020 11:06:22 +0100
Message-ID: <CACT4Y+atOaQS==gJ0fDZhuh7A1d=wyd5eQ4on+hBbG5HtSQK4A@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Kees Cook <keescook@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 7, 2020 at 1:52 PM Marco Elver <elver@google.com> wrote:
>
> On Mon, 7 Dec 2020 at 13:38, 'Dmitry Vyukov' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
> > On Mon, Dec 7, 2020 at 1:08 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > > > Hi all,
> > > > >
> > > > > After merging the akpm tree, today's linux-next build (powerpc
> > > > > allyesconfig) produced warnings like this:
> > > > >
> > > > > kernel/kcov.c:296:14: warning: conflicting types for built-in function '__sanitizer_cov_trace_switch'; expected 'void(long unsigned int,  void *)' [-Wbuiltin-declaration-mismatch]
> > > > >   296 | void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
> > > > >       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > > Odd.  clang wants that signature, according to
> > > > https://clang.llvm.org/docs/SanitizerCoverage.html.  But gcc seems to
> > > > want a different signature.  Beats me - best I can do is to cc various
> > > > likely culprits ;)
> > > >
> > > > Which gcc version?  Did you recently update gcc?
> > > >
> > > > > ld: warning: orphan section `.data..Lubsan_data177' from `arch/powerpc/oprofile/op_model_pa6t.o' being placed in section `.data..Lubsan_data177'
> > > > >
> > > > > (lots of these latter ones)
> > > > >
> > > > > I don't know what produced these, but it is in the akpm-current or
> > > > > akpm trees.
> > >
> > > I can reproduce this in x86_64 build as well but only if I enable
> > > UBSAN as well. There were some recent UBSAN changes by Kees, so maybe
> > > that's what affected the warning.
> > > Though, the warning itself looks legit and unrelated to UBSAN. In
> > > fact, if the compiler expects long and we accept u64, it may be broken
> > > on 32-bit arches...
> >
> > No, I think it works, the argument should be uint64.
> >
> > I think both gcc and clang signatures are correct and both want
> > uint64_t. The question is just how uint64_t is defined :) The old
> > printf joke that one can't write portable format specifier for
> > uint64_t.
> >
> > What I know so far:
> > clang 11 does not produce this warning even with obviously wrong
> > signatures (e.g. short).
> > I wasn't able to trigger it with gcc on 32-bits at all. KCOV is not
> > supported on i386 and on arm I got no warnings even with obviously
> > wrong signatures (e.g. short).
> > Using "(unsigned long val, void *cases)" fixes the warning on x86_64.
> >
> > I am still puzzled why gcc considers this as a builtin because we
> > don't enable -fsanitizer-coverage on this file. I am also puzzled how
> > UBSAN affects things.
>
> It might be some check-for-builtins check gone wrong if it enables any
> one of the sanitizers. That would be confirmed if it works with
>
> UBSAN_SANITIZE_kcov.o := n

Yes, it "fixes" the warning.
Initially I thought it's not a good solution because we want to detect
UBSAN bugs in KCOV. But on second thought, if UBSAN detects a bug in
KCOV, it may lead to infinite recursion. We already disable all other
sanitizers on KCOV for this reason, so it's reasonable to disable
UBSAN as well. And as a side effect it "resolves" the warning as well.
I mailed:
https://lore.kernel.org/lkml/20201209100152.2492072-1-dvyukov@google.com/T/#u

Thanks

> > We could change the signature to long, but it feels wrong/dangerous
> > because the variable should really be 64-bits (long is broken on
> > 32-bits).
> > Or we could introduce a typedef that is long on 64-bits and 'long
> > long' on 32-bits.
