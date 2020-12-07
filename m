Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8E02D101A
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 13:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgLGMJK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 07:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgLGMJJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 07:09:09 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA327C0613D2
        for <linux-next@vger.kernel.org>; Mon,  7 Dec 2020 04:08:23 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id h19so6903142qtq.13
        for <linux-next@vger.kernel.org>; Mon, 07 Dec 2020 04:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j6WcPj0IELZyPAeHgxTFV18eYU66eVdxYM8UMBwb+6k=;
        b=gTDKlWp7OTo9YtssNfNMMF7sGVDibkhfahzMZ4mew5/uNa2KrOl237g1QrZLr4W1Q5
         NIxdZCMvoct6LUzRbUO/E4v7qiNUqKotyVLZlhi3VaJhjdBW/kl8rI2g7ZPcoeuU9ZPZ
         FeXRnBeRF0+aad4UXo/jeJ+FTPTejR5Jy1Mj5m4emujQuAn50tUkXLgYPjEuR6JU4Az7
         bFFGNcuh9ccE6Zr2RyBsxIgs0q4ZDj4OrfkA4gwxeYqCYgyWs+/ZO4vGwU9Oqxq0XcXi
         c9M9ojSZk/ciTmR9Fidafkd0B3gz1yaQnBJM0nXSTVtL6D7x4lHEXQL3pzQ+KVsFZzKU
         Vnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j6WcPj0IELZyPAeHgxTFV18eYU66eVdxYM8UMBwb+6k=;
        b=hJvXRfcA0KOhfCjNUNfd3Janbbt2zm2Rj6DnwkEwVuosBd4DGXuQtAoS8WiiirhYmi
         mOq/zxCZrfO/q9VGbo/pEhPp8dwacDAdrlYazb6rG89fNx+PHrMxUbQBP/6zuq5u2/Mp
         zGP9iLEzGvGtWeIYzTEeKm5BOuQ1R5pmE15n1yVbE9iSGcPGnBB732CxfsCDQ+EByIqT
         R5+AJWM5gvPFLCObeRiVl5bwM4+seRhlgkiklLzvOdIaQDPHkjxfBK0SY5QwXFgNSY7N
         phP+RdR4Pzm5EWf5oq3JL9Hwzy0WrI9mY+DpAaxwyPNUK34Z1Gjo/3CTV0XfKVKnOrqq
         QkGw==
X-Gm-Message-State: AOAM533N2Hiz53Ge6FHcdP/E2q/DxVCCpNH7MxLhn65dV6OypK2r8+bC
        2LGg6MvGW8nAJiwR+YnbSgdFOWaRpzOnDYsMrtx3Kw==
X-Google-Smtp-Source: ABdhPJzLv9JfWtnmiT/twmir3juqV9lBsro3kbVQyEWJz6B9CuFQNaphSSsh/w0suT4ZQLlZHcpUMYtIGQM8bujTowI=
X-Received: by 2002:ac8:5386:: with SMTP id x6mr23435656qtp.43.1607342902842;
 Mon, 07 Dec 2020 04:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20201204210000.660293c6@canb.auug.org.au> <20201204211923.a88aa12dc06b61780282dd1b@linux-foundation.org>
In-Reply-To: <20201204211923.a88aa12dc06b61780282dd1b@linux-foundation.org>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 7 Dec 2020 13:08:11 +0100
Message-ID: <CACT4Y+bYVC=r+bPF7MziOZpJCYqrUj7CFt47Z5PSWjohZLYm+w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Kees Cook <keescook@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Dec 5, 2020 at 6:19 AM Andrew Morton <akpm@linux-foundation.org> wr=
ote:
>
> On Fri, 4 Dec 2020 21:00:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
>
> > Hi all,
> >
> > After merging the akpm tree, today's linux-next build (powerpc
> > allyesconfig) produced warnings like this:
> >
> > kernel/kcov.c:296:14: warning: conflicting types for built-in function =
'__sanitizer_cov_trace_switch'; expected 'void(long unsigned int,  void *)'=
 [-Wbuiltin-declaration-mismatch]
> >   296 | void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
> >       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Odd.  clang wants that signature, according to
> https://clang.llvm.org/docs/SanitizerCoverage.html.  But gcc seems to
> want a different signature.  Beats me - best I can do is to cc various
> likely culprits ;)
>
> Which gcc version?  Did you recently update gcc?
>
> > ld: warning: orphan section `.data..Lubsan_data177' from `arch/powerpc/=
oprofile/op_model_pa6t.o' being placed in section `.data..Lubsan_data177'
> >
> > (lots of these latter ones)
> >
> > I don't know what produced these, but it is in the akpm-current or
> > akpm trees.

I can reproduce this in x86_64 build as well but only if I enable
UBSAN as well. There were some recent UBSAN changes by Kees, so maybe
that's what affected the warning.
Though, the warning itself looks legit and unrelated to UBSAN. In
fact, if the compiler expects long and we accept u64, it may be broken
on 32-bit arches...

I have gcc version 10.2.0 (Debian 10.2.0-15)
On next-20201207
config is defconfig +
CONFIG_KCOV=3Dy
CONFIG_KCOV_ENABLE_COMPARISONS=3Dy
CONFIG_UBSAN=3Dy

$ make -j8 kernel/kcov.o
  CC      kernel/kcov.o
kernel/kcov.c:296:14: warning: conflicting types for built-in function
=E2=80=98__sanitizer_cov_trace_switch=E2=80=99; expected =E2=80=98void(long=
 unsigned int,
void *)=E2=80=99 [-Wbuiltin-declaration-mismatch]
  296 | void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
