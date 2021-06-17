Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85243AB717
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 17:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhFQPQI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 11:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhFQPQH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 11:16:07 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FB0C061574;
        Thu, 17 Jun 2021 08:13:59 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id y15so5260653pfl.4;
        Thu, 17 Jun 2021 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et+CyRYlNQLzJmE+p5c3FQ588az+9ZokAOro78zfZtc=;
        b=J/E3yEtJOOgALeO46otYwEwwEz/iBln1i/4XiZX4LrJtMHdgj3R1GPiOmrbB8+Mf+n
         x8WzE0Olf/5q9PSPbt2cnDSZFTaXOAZMxQXnKYhNdpMtMFHAA9BH8OKkmAjeIFzL97Kd
         xM2RYOZd2GQUe/c4bpX6P5v3JVLk7+cTKGm4fXHchNdkiEFXhUIxqcsVSoOfRteOn8ID
         5DBhG3mQi3/LDxiYG+k0RsdjAC8foO4lgHvOzBlD33C2okDLgj4prRVWTTSDU3bpzPYH
         A7OcqHATbkgi01omaKWqpulUz/rAFI4WGFYVchb0u1vRh5tg6iEFqIcci+ixnguumDrX
         t5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=et+CyRYlNQLzJmE+p5c3FQ588az+9ZokAOro78zfZtc=;
        b=ImghLpS/sPP7mT4oBe6rbMG4w7WxHrNk3bvPxnZ7zLMk/1UTSrnEXg5SeQzP2mKc3Y
         ZlPHvZTiumfBQ/NPegAxQlvPGUSpRiQuEVbKwTJFnkAN6X4e+1FFSv/IUJPEf/R7hYUI
         gm5BkbRlhAeEDtRH/fEg+Ogczjti2evAeSQDMTq/x42SgL2Z/82UwNrE6+JiF0j3TKCm
         8/NAyxrUmhiTJqaQQQKmP4lJYMIkJq5apUg/EBEUi1/+EDprpyr/SzcVhWT47cITEpUH
         YE7y+K7FcztGL+BbOdZ8BML/OlDxGoQocCVr9o/sE/zOAdpI6Cz8RUuvpbzNqmYWH5gN
         7Ndg==
X-Gm-Message-State: AOAM532TihB0BgSuBEhTTjjQ3fC04KaKHL4DfK9tB6NZ0aRLWk68KOix
        lkDl2ycsGfo0+TAyk4TzW9rmSMZXubdOhkR1ZHw=
X-Google-Smtp-Source: ABdhPJxkL1cxbvSOqRssti1Y/oplyMRuQWgMrmrhWXK73IzjdJR1npyJAgpk4gb2Vk5tRDj89KBN3atMCvpOeE0v1Ww=
X-Received: by 2002:a62:e404:0:b029:2ee:f086:726f with SMTP id
 r4-20020a62e4040000b02902eef086726fmr476331pfh.7.1623942838684; Thu, 17 Jun
 2021 08:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
 <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com>
 <YMtTdU2b9fI3dnFD@casper.infradead.org> <CA+G9fYukjZU9_88KuhW5FpG-Y6EOH4ehXgdKm9pGO0v4y4wsmA@mail.gmail.com>
In-Reply-To: <CA+G9fYukjZU9_88KuhW5FpG-Y6EOH4ehXgdKm9pGO0v4y4wsmA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Jun 2021 18:13:42 +0300
Message-ID: <CAHp75Vc05a3fpB+-xUjpeo+yeUuF-i4YUgZqzraURDgGmWs06A@mail.gmail.com>
Subject: Re: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org,
        open list <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Stephen Boyd <swboyd@chromium.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Baoquan He <bhe@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Young <dyoung@redhat.com>, Ingo Molnar <mingo@redhat.com>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Sasha Levin <sashal@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vivek Goyal <vgoyal@redhat.com>, Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 17, 2021 at 5:54 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> On Thu, 17 Jun 2021 at 19:22, Matthew Wilcox <willy@infradead.org> wrote:
> > On Thu, Jun 17, 2021 at 06:15:45PM +0530, Naresh Kamboju wrote:
> > > On Thu, 17 Jun 2021 at 17:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
> > > > mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
> > >
> > > The git bisect pointed out the first bad commit.
> > >
> > > The first bad commit:
> > > commit 928cf6adc7d60c96eca760c05c1000cda061604e
> > > Author: Stephen Boyd <swboyd@chromium.org>
> > > Date:   Thu Jun 17 15:21:35 2021 +1000
> > >     module: add printk formats to add module build ID to stacktraces
> >
> > Your git bisect probably went astray.  There's no way that commit
> > caused that regression.
>
> Sorry for pointing to incorrect bad commits coming from git bisect.
>
> Any best way to run git bisect on  linux next tree ?

Linux Next is not anyhow different to any other repository that does
merges. It takes the origin/master (Linus') tree as the base.

-- 
With Best Regards,
Andy Shevchenko
