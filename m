Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F275145F745
	for <lists+linux-next@lfdr.de>; Sat, 27 Nov 2021 00:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhKZX46 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Nov 2021 18:56:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbhKZXy6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Nov 2021 18:54:58 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A181C061574;
        Fri, 26 Nov 2021 15:51:45 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id o6-20020a17090a0a0600b001a64b9a11aeso8999329pjo.3;
        Fri, 26 Nov 2021 15:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GFpvS+bi1uk3g1Gyat/MvY/bTvPGds7VDTcr4Wgfqmo=;
        b=jF7enbC7CiJ/vIMAcwwYYIgi5ShZ//6pV4vhfWWm9UzXW0BSVrNUTUWUgPBjhpEnZ9
         lxAjBpl3vqLYMsDH+9f9+VpGvTyCfkYk/yh+Ne9t7wQKIxFIgswvhmqPYDv8UVuCSkya
         jV7J26vyIRBwIpWLcgIKy6Hl0/jCAduDRAdweaFGMMn5KpcpRYswACSHBlK2j74b3RKv
         mXwuGO3AMekvYyQR59ud785fk9uAK7m9Ew8GHdV7Hul9dlj85oDI48RDu/3NHzOU+OUU
         p0XQMeQvJZUB42DFual1ddgTP5uzoQe1wlsxJYkux1awpDuHfWxlYIcFV1yljtXKSVjJ
         hKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GFpvS+bi1uk3g1Gyat/MvY/bTvPGds7VDTcr4Wgfqmo=;
        b=o8vFot3v36PsIyZTtXgdZ2CxifoH7s7yVmA5GzTKNBInTpPhiuXB6mEJoLc8Zxfm2N
         MS71c+/bQb0luXfUP9Sf29tyBIihtfQSR4EJjBF2zumKTNBxQ/D4QpBuDyJn/uZ+WeLQ
         6QITZ/ZGgJJFaeSQ54FQ5O5tVhajdNmyF9B9lxFdElH4OTN9BLJh/rjmWPxIxkxJg5FZ
         7Hv3/UAAH+VCBpW7Gy7JCpdW1WiWiJnuOt2ujvXU33VJ2DnNvBpFoNsUjVm3YNDmTL+e
         XEIoJRJh+TVCtkCEqfhg5Vg+uQ7CXriqWsz0rN/C9JQvQr6YZAJDTSKc9S5jih/DElIj
         6npw==
X-Gm-Message-State: AOAM5333oMLIZYMa6hWCYV2o55AYw8cLgUWpKNviRgokdaoqMQk/pvna
        0+APbhS/vIGVzQOvXKXkozs=
X-Google-Smtp-Source: ABdhPJx/hGyPnA2YMqcLNFxTMdfi5LiHIA8Kwsl4OgBcNo+Zgi4sT1HdRD0MYylhNYD7dxqosSL3Og==
X-Received: by 2002:a17:90a:e005:: with SMTP id u5mr18897194pjy.17.1637970704323;
        Fri, 26 Nov 2021 15:51:44 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id mm22sm6397313pjb.28.2021.11.26.15.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 15:51:43 -0800 (PST)
Date:   Sat, 27 Nov 2021 08:51:41 +0900
From:   Stafford Horne <shorne@gmail.com>
To:     Rob Landley <rob@landley.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org,
        =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Subject: Re: spinlock.c:306:9: error: implicit declaration of function
 '__raw_write_lock_nested'
Message-ID: <YaFzDW+n0n7qQ7hm@antec>
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <41206fc7-f8ce-98aa-3718-ba3e1431e320@landley.net>
 <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <7d5a5249-40ee-9a42-c6a0-a5defa3703c1@landley.net>
 <CAK8P3a0XGz=F0nPAW8T-VvfH5bPuGTNiPZ18N+Z6Sj_M_6TrPA@mail.gmail.com>
 <eef6670c-1fb7-2d01-72ed-258d49227de1@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eef6670c-1fb7-2d01-72ed-258d49227de1@landley.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 25, 2021 at 06:10:54AM -0600, Rob Landley wrote:
> On 11/25/21 1:25 AM, Arnd Bergmann wrote:
...
> > 
> > The best reference I could find is:
> > 
> > https://lore.kernel.org/linux-api/20190604160944.4058-2-christian@brauner.io/
> 
> Does not say what the special handling is. Does not provide an example of said
> special handling. Implied that only three do NOT need special handling, two of
> which are x86 and arm, which seems... convenient.
> 
> Right, let's see what "grep -r clone arch/" says:
> 
> m68k/kernel/process.c is obviously overriding
> arc/include/syscalls.h has sys_clone_wrapper()
> nios2/kernel/process.c has nios2_clone()
> openrisc/kernel/entry.S has __sys_clone()
> sparc/kernel/process.c has sparce_clone()
> h8300/kernel/process.c has its own sys_clone()
> ia64/kernel/process.c has ia64_clone()
> user mode linux is just weird.
> 
> So the architectures that wrap clone are m68k, arc, nios2, openrisc, sparc,
> h8300, and ia64.

This got me reading/refreshing my memory, we have a wrapper for clone in
openrisc, but not clone3.  The wrapper ensures we save registers which get
clobbered by switch hence we need it for clone/fork.

It looks like clone3 missing this wrapper may be an issue.  Though, I have been
running the whole glibc test suite on this without seeing any issues.

I will patch this anyway.

> Implying that the ones that DON'T are alpha, arm64, hexagon, nds32, parisc,
> s390, csky, microblaze, powerpc, sh, x86, arm, mips, riscv, and xtensa.
> 
> Which would mean 2/3 of architectures don't wrap clone, and thus arch/sh not
> doing so isn't unusual.
> 
> > If fork() and clone() don't need special handling on arch/sh, then
> > clone3 shouldn't
> > need it either, unless the existing ones are also wrong. It looks like
> > some architectures
> > override these to avoid leaking register state from the kernel to the
> > child process.

I would agree with this.

-Stafford
