Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A013AB35F
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 14:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbhFQMR4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 08:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhFQMRz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 08:17:55 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2BEC061574
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 05:15:48 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id n20so3691069edv.8
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qja68kctcb7tECvcD3vKyKnzp3JkFSLhCUKx4V5p/io=;
        b=vacGRMy/kpEKBpEJGikZRYXVrAAkQ3UOW9ogN8REKVbe499gzllInYYjWKB7dyFEar
         ROMtah+mlXF8sVew9m5uWj4hs0CW7Qg64fQ0Bh0R6sZ3tFpiP3H/DD93IRGXlxiWEImB
         NBbbtSdfoyKOzNvHt+PNyAdXYRKm2FIgre2YK6Yrq1/Q3wWCtQITRvmIOYoQ5WMSejK9
         gmLIR194sNOsIG2O8fSX5X3YsViFTXtOTfbPlS2T1OZumRsN94VMRfiHaJ5eg8olv25M
         bnHqEwtskQX7no1N8OVsmeruikmjNJ0wAzRpsPYTd6z/zAKHemxBjFTBur1AeoyKGbvV
         K7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qja68kctcb7tECvcD3vKyKnzp3JkFSLhCUKx4V5p/io=;
        b=YlBfFcVlB4JLFmPFQ9lS+lK3nm1KU1L34eSCjeSJrwlf5beBkr54Z3SruQ85ml2WdP
         zRb1yZBJXkn31jkKbSl/Um89GU7Yqn2MsyPQnasX/07NZBaaPydXNsF0euRj/3W26pTw
         vkxznV4FSe+vszida6JwLVYXZVqjNrI+vhmvoyoydgVaAaVcbNFSuRwxiZkw3Whb3jSV
         5YqiwgqrSlW22cfIWuuNNipc2vhWGGOFW0gYSYJ7Q5/aqAOcix/SD1M/T44q6G1mxBUe
         jVXkZAfT3d2OFKNqXYCzJP+9tiNcinfNmNjlb2QKvS+ilfKjAtDphF5niWAgk4yKHO0r
         lqRA==
X-Gm-Message-State: AOAM532wZM/JXS64KaPfhjG9u6vbQXJ8UkL21SGqxKg5u4ecHe/uzRG/
        CtEE1C3ukAhkmgafGeE4m0YCjjscsYi1Rb7xtwC+4Q==
X-Google-Smtp-Source: ABdhPJxScap+bpjJHGCJGL/6faTbZ8og0NFlPnI724tvKuQtyYMLaheWpTBmohhNcXt0wfyEb0oyqWyzgYy7W7qibYU=
X-Received: by 2002:a05:6402:220d:: with SMTP id cq13mr6037900edb.52.1623932146500;
 Thu, 17 Jun 2021 05:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
 <20210615115044.GC20598@willie-the-truck>
In-Reply-To: <20210615115044.GC20598@willie-the-truck>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 17 Jun 2021 17:45:34 +0530
Message-ID: <CA+G9fYvCX5fd5dHdaGpQ7wpZNcea-=vtuhapW00D8AUkE5VUqA@mail.gmail.com>
Subject: Re: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
To:     Will Deacon <will@kernel.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Will,

On Tue, 15 Jun 2021 at 17:20, Will Deacon <will@kernel.org> wrote:
>
> Hi Naresh,
>
> On Tue, Jun 15, 2021 at 04:41:25PM +0530, Naresh Kamboju wrote:
> > Following kernel crash reported while boot linux next 20210615 tag on qemu_arm64
> > with allmodconfig build.

<trim>

> Thanks for the report, although since this appears to be part of a broader
> testing effort, here are some things that I think would make the reports
> even more useful:
>
>   1. An indication as to whether or not this is a regression (i.e. do you
>      have a known good build, perhaps even a bisection?)
>
>   2. Either a link to the vmlinux, or faddr2line run on the backtrace.
>      Looking at the above, I can't tell what sparse_init_nid+0x98/0x6d0
>      actually is.
>
>   3. The exact QEMU command-line you are using, so I can try to reproduce
>      this locally. I think the 0-day bot wraps the repro up in a shell
>      script for you.
>
>   4. Whether or not the issue is reproducible.
>
>   5. Information about the toolchain you used to build the kernel (it
>      happens to be present here because it's in the kernel log, but
>      generally I think it would be handy to specify that in the report).
>
> Please can you provide that information for this crash? It would really
> help in debugging it.

Sorry for the incomplete bug report.

Thanks for sharing these details.
Next time I will include the suggested data points in my email report.

- Naresh
