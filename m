Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B124B26A297
	for <lists+linux-next@lfdr.de>; Tue, 15 Sep 2020 11:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgIOJ5o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 05:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgIOJ5j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Sep 2020 05:57:39 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72A4C06174A
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 02:57:38 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id n2so3215152oij.1
        for <linux-next@vger.kernel.org>; Tue, 15 Sep 2020 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JzT2ZqDHda+Wc2x3+EDcqLa2oAGwHZvtm9Os6CPbsUs=;
        b=ASeidofSzke+RM1y8iK2KmSsFkMZALPbPlwBeDnavmNw8bKhCJLNLxuf/1Oxg/nLbq
         0b5LbPaUNX0HaRGvLSSBT8IN75LljCF8F8o0X2s8ZK9/VZZLMBAtc3T5tB+KzNLXPhcW
         WdyLEg3Wc0TsGkC3cYz6YGJdGkmZKKax8joVwYaLb00Hkvyx7aZ2+fzVQcXUMbtY7WTa
         dzXlWtYH4+NaqI7vQzEnVmzdc6DzmBBEkn6YKrGqzqGUMdBspJOwqsZE+7i2X0zRYjqB
         kMR8BuWktksLJWs5t6b1/qN5sSoH98E0KaBp38EAg5vPWjenM3oyPWLrRgTP0nEPcMap
         aDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JzT2ZqDHda+Wc2x3+EDcqLa2oAGwHZvtm9Os6CPbsUs=;
        b=CuqvsO4gKgpEsEc3RGFwvlRJKSW6I6xt20vjqmyBuRWYJkCwsvGW/AU+s7uVTX1eiA
         fb24jWBo4470Jf44RHS9Q2//UXnViddhZ2hLzj/n6DxFZJy/7XoRW9Zah9GPmpz8IWxN
         RQEPelYiSfC8KCR9M7WWEkvaAm8QFeq341EnRDGhsG3ukhhuBik++p+iOZA2xiYrL/T7
         J94KNzYdwRHBqywtI5gr2gqQQBskajdixj+d8DDa/A0SWo6hbez4TGbyuDE3ki7yhQDb
         4GAHB6rAiJq8GQZnfYqk+SjNICCOpLPsYF63NNa3CbmzR0hW7bwu2CWZ0WaUSiU8+p6H
         zr/g==
X-Gm-Message-State: AOAM533nHZc7ZcIHySG2gfzqFN8GSSK1Id0SR1AT9ypaPLFJdQcGhJfH
        BuJ+2Kh6xp8OPBnunmU519QrjfYlytaRXKmB8z9gdA==
X-Google-Smtp-Source: ABdhPJyXrCCx82T6eecFdecC4oPxfCAOtwrEAJ7AvCL6velpgv728nxCTqYV0n9rvw4frM/wg8z2NxaSjz5NIrh5PT0=
X-Received: by 2002:a05:6808:20c:: with SMTP id l12mr2813900oie.70.1600163857893;
 Tue, 15 Sep 2020 02:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200914170055.45a02b55@canb.auug.org.au> <CABVgOSko2FDCgEhCBD4Nm5ExEa9vLQrRiHMh+89nPYjqGjegFw@mail.gmail.com>
In-Reply-To: <CABVgOSko2FDCgEhCBD4Nm5ExEa9vLQrRiHMh+89nPYjqGjegFw@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Tue, 15 Sep 2020 11:57:26 +0200
Message-ID: <CANpmjNM0nRdzRfWocwxEoT2x-qM0NBNU5cfgrQ4k3fdjtxot4Q@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     David Gow <davidgow@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Patricia Alfonso <trishalfonso@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 15 Sep 2020 at 06:03, 'David Gow' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> [+kasan-dev, +kunit-dev]
>
> On Mon, Sep 14, 2020 at 3:01 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the akpm-current tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >
> > In file included from lib/test_kasan_module.c:16:
> > lib/../mm/kasan/kasan.h:232:6: warning: conflicting types for built-in function '__asan_register_globals'; expected 'void(void *, long int)' [-Wbuiltin-declaration-mismatch]
> >   232 | void __asan_register_globals(struct kasan_global *globals, size_t size);
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~
> > lib/../mm/kasan/kasan.h:233:6: warning: conflicting types for built-in function '__asan_unregister_globals'; expected 'void(void *, long int)' [-Wbuiltin-declaration-mismatch]
> >   233 | void __asan_unregister_globals(struct kasan_global *globals, size_t size);
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> > lib/../mm/kasan/kasan.h:235:6: warning: conflicting types for built-in function '__asan_alloca_poison'; expected 'void(void *, long int)' [-Wbuiltin-declaration-mismatch]
> >   235 | void __asan_alloca_poison(unsigned long addr, size_t size);
> >       |      ^~~~~~~~~~~~~~~~~~~~
> > lib/../mm/kasan/kasan.h:236:6: warning: conflicting types for built-in function '__asan_allocas_unpoison'; expected 'void(void *, long int)' [-Wbuiltin-declaration-mismatch]
> >   236 | void __asan_allocas_unpoison(const void *stack_top, const void *stack_bottom);
> >       |      ^~~~~~~~~~~~~~~~~~~~~~~
> > lib/../mm/kasan/kasan.h:238:6: warning: conflicting types for built-in function '__asan_load1'; expected 'void(void *)' [-Wbuiltin-declaration-mismatch]
> >   238 | void __asan_load1(unsigned long addr);
> >       |      ^~~~~~~~~~~~
> [...some more similar warnings truncated...]
>
> Whoops -- these are an issue with the patch: the test_kasan_module.c
> file should be built with -fno-builtin. I've out a new version of the
> series which fixes this:
> https://lore.kernel.org/linux-mm/20200915035828.570483-1-davidgow@google.com/T/#t
>
> Basically, the fix is just:
>
> diff --git a/lib/Makefile b/lib/Makefile
> index 8c94cad26db7..d4af75136c54 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_KASAN_KUNIT_TEST) += test_kasan.o
>  CFLAGS_test_kasan.o += -fno-builtin
>  CFLAGS_test_kasan.o += $(call cc-disable-warning, vla)
>  obj-$(CONFIG_TEST_KASAN_MODULE) += test_kasan_module.o
> +CFLAGS_test_kasan_module.o += -fno-builtin
>  obj-$(CONFIG_TEST_UBSAN) += test_ubsan.o
>  CFLAGS_test_ubsan.o += $(call cc-disable-warning, vla)
>  UBSAN_SANITIZE_test_ubsan.o := y

That's reasonable, given it's already done for test_kasan.o.

Although the warnings only occur because it's including
"../mm/kasan/kasan.h", which include declarations for the
instrumentation functions. AFAIK, those declarations only exist to
avoid missing-declaration warnings; in which case all of them could
just be moved above their definitions in generic.c (which would also
avoid some repetition for the ones defined with macros). But given the
various other KASAN patches in-flight, to avoid conflicts let's leave
this as-is, but it's something to improve in case we wanted to get rid
of the fno-builtin.

Thanks,
-- Marco
