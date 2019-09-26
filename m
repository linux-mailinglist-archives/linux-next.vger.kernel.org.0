Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A89DBFA9D
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 22:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbfIZUfr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 16:35:47 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35588 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbfIZUfr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 16:35:47 -0400
Received: by mail-lf1-f65.google.com with SMTP id w6so214028lfl.2
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2019 13:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HerxThVT8ujE/Jr00Db0eehYsUrZnjs2sS0fus5u+5Y=;
        b=ea8zW5Q5pLPNlbbjEYHy5MA0Qt+9ppilVVkjIiA0KBMOa0uONSOd8J9Z2/yLcmZMpH
         Q/bZ02u0UKVHIRxfGCdwcoI3LUy+CxUEtCguH3PMzYRl/5ufSQO3CwqxokO5/y6jHAWU
         46Cj6qKsKCx2JexISICIbz5jXjn5QZlULVLBf5g4CE1j+IO/kpUwATJZ4qNkCqeAcpGH
         X1jaksbz0YohhVK/UTqDziXBXMiO2dyCRjFxmVKKvWiOnoTpoJHwMmVHJnlszehZye8Z
         CeJrOG7gI9CDuUhK4JJ4gZYCUcv9VkeLTdC+spzb52TkEMNJsO/YNB3wjPbkkVLnGyDw
         5unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HerxThVT8ujE/Jr00Db0eehYsUrZnjs2sS0fus5u+5Y=;
        b=JV/m3GSYbM4ZxSOxOdLiKNxTiPMEFX04d5I5HiD1Zh3MvHsal6/qAUSP+2o4CKF880
         ht4A3NB8phPzodo17+wKmIPDhRStN0ktkhLHaP0rNKrfh6xrnrA2OR5W7ZkWQxaiDpII
         jFFJmTpOGspAcP8kFIt6U8BrOe26HMykK2aJLgWxRltrevQUSBhNK3+o8lzyfyvlpqot
         rhL+nVyjid2GM317V8sGiOGSXNG1tr22LxMGLpV55OvLaLrpXz76f1IqOhLNARNy9Y+E
         +SUPPST3a1OoYYgDrt8AGm3XYPqle9/vtMzW/F1EPz+yVqTncqcbcpWAbqyUZ667ElZI
         By2A==
X-Gm-Message-State: APjAAAVQ17UWPTJl6MpvWdsNTDqeEhrujUiltRpHRhBwgkxnSw0yJNG2
        Vv16YBWgkKDlUe6LKxIVshrBZXOekIpsmkyW59sg8Q==
X-Google-Smtp-Source: APXvYqxXovBWlN+vNe0WzjIx277ysSM4BAoh51kVziOHnD4dxzIrO+9uo50emy7bGVsFc/jHSFW9KUHw0RZnI6/p41o=
X-Received: by 2002:a19:f247:: with SMTP id d7mr251060lfk.191.1569530143446;
 Thu, 26 Sep 2019 13:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu0hkS+NdwX38DNTygV1A7eebvjZvWvFUTfL=f3_4m=Dw@mail.gmail.com>
 <20190926173648.GA31477@kernel.org>
In-Reply-To: <20190926173648.GA31477@kernel.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 27 Sep 2019 02:05:32 +0530
Message-ID: <CA+G9fYt4fzmiFCsZXP+OC1joB=w5nkgn_MR++Yu61yWDWrh1yg@mail.gmail.com>
Subject: Re: perf build failed on linux -next on i386 build
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 26 Sep 2019 at 23:06, Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
> Em Thu, Sep 26, 2019 at 10:59:41PM +0530, Naresh Kamboju escreveu:
> > perf build failed on linux -next on i386 build
> >
> > build error:
> > perf-in.o: In function `libunwind__x86_reg_id':
> > tools/perf/util/libunwind/../../arch/x86/util/unwind-libunwind.c:109:
> > undefined reference to `pr_err'
> > tools/perf/util/libunwind/../../arch/x86/util/unwind-libunwind.c:109:
> > undefined reference to `pr_err'
>
> Can you try with the following patch?

Thanks for the patch.
After applying this below patch build completes.


>
>
> diff --git a/tools/perf/arch/x86/util/unwind-libunwind.c b/tools/perf/arch/x86/util/unwind-libunwind.c
> index 05920e3edf7a..47357973b55b 100644
> --- a/tools/perf/arch/x86/util/unwind-libunwind.c
> +++ b/tools/perf/arch/x86/util/unwind-libunwind.c
> @@ -1,11 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <errno.h>
> +#include "../../util/debug.h"
>  #ifndef REMOTE_UNWIND_LIBUNWIND
>  #include <libunwind.h>
>  #include "perf_regs.h"
>  #include "../../util/unwind.h"
> -#include "../../util/debug.h"
>  #endif
>
>  #ifdef HAVE_ARCH_X86_64_SUPPORT

- Naresh
