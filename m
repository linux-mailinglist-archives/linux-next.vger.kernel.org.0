Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6CC3AB654
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 16:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhFQOrk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 10:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbhFQOri (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 10:47:38 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE36BC06175F
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 07:45:26 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id g8so10389639ejx.1
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 07:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QbWq0G6XjbCduvI65yRZVLjLavdA7VxZZ+xXMBekQFk=;
        b=Xk1bAexllS8vp1gHoHrLty8VQJesbY1Sy2KuHy2fsrtfFMsIZpLy67Dsdd8veMj3qm
         dU1ejkYwLizmoiF2FZTp4dV4SBgY6G5EMdmB43rfK8qTgtIqyykeljt1LYIZCIVCx3cD
         06DdcJYKr7pnTVZwKKaZs+qmNPnHAv5qKgwRYGpHIvDmdZs42fcOrgPWfnhd2HDA8QnD
         oVqKRP78tGwbaQHbkk7iXslsTgdZssxCpshMBK5SgJgEVYDPpZBXMaC/Uklxz0fpWFvC
         Zhzg85B5/Kx8scFPImx0m0bDqlFzA6mv6giKr/HEdo4YC3hA6c/o+aoypecSGgaP0sfe
         CdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QbWq0G6XjbCduvI65yRZVLjLavdA7VxZZ+xXMBekQFk=;
        b=RNXRsx6c8oupX/VPmo5/723pPKE6C7xCLYBXWRzo1d5Ycej40dOeTPMO7a4SS15Z4J
         EFLNovkIHAXu2YkTDoq0aCeOfjCjrtjR5kG/+XAiFl4GJtClTMvvH+k47/cXf1yY2F4n
         BXzxfExyu+/hJpv1l9qa02O2gRzUEd9CwH8uxYSF/yLm+H0+btRbCQxiENtpoqxJ3tab
         pROcsxG924lDRZNlSwEu4zidxQ31IYpNA6rVfpwRKY0J32sbO2ETMHriT4zwmI1CxUtX
         NybcSOB8dAJnKghW+FBnjlyAXa1W/fC9TkPidOo1HAPXNQwmfK032Mhb1bHDFtDhCvXb
         nHgQ==
X-Gm-Message-State: AOAM5301/1UenNASTaFzuO8M4rxRK9UEmzQOd3VuDfsEu0321Y/4tMPJ
        Q9UpAZ1DxOWqhqWdylpsWTXoeRWedHKDOidxunC1FA==
X-Google-Smtp-Source: ABdhPJzMEmCI7Tke0VrCtGirOAfdE63ZxUPB49pKUc7efrdqjk0LOdFq6BFeO40+k5DnFq432ug3nCDFwy8nhR1mjx8=
X-Received: by 2002:a17:906:d0da:: with SMTP id bq26mr5761449ejb.287.1623941125231;
 Thu, 17 Jun 2021 07:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
 <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com> <YMtTdU2b9fI3dnFD@casper.infradead.org>
In-Reply-To: <YMtTdU2b9fI3dnFD@casper.infradead.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 17 Jun 2021 20:15:13 +0530
Message-ID: <CA+G9fYukjZU9_88KuhW5FpG-Y6EOH4ehXgdKm9pGO0v4y4wsmA@mail.gmail.com>
Subject: Re: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
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

Hi Matthew,

On Thu, 17 Jun 2021 at 19:22, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Jun 17, 2021 at 06:15:45PM +0530, Naresh Kamboju wrote:
> > On Thu, 17 Jun 2021 at 17:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
> > > mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
> >
> > The git bisect pointed out the first bad commit.
> >
> > The first bad commit:
> > commit 928cf6adc7d60c96eca760c05c1000cda061604e
> > Author: Stephen Boyd <swboyd@chromium.org>
> > Date:   Thu Jun 17 15:21:35 2021 +1000
> >     module: add printk formats to add module build ID to stacktraces
>
> Your git bisect probably went astray.  There's no way that commit
> caused that regression.

Sorry for pointing to incorrect bad commits coming from git bisect.

Any best way to run git bisect on  linux next tree ?

Here is the git bisect log from gitlab pipeline,
https://gitlab.com/Linaro/lkft/bisect/-/jobs/1354963448

- Naresh
