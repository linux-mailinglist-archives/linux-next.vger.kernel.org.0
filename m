Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311A7429873
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 22:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbhJKUzt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 16:55:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:59874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230299AbhJKUzs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Oct 2021 16:55:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B16760F11;
        Mon, 11 Oct 2021 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1633985628;
        bh=JRiHDPpa/b2nvZt745PcbTbloc06/449gj+RuRs0POc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bPTVvzI21lWBCgGle48sGEd0S5rAAibwG5MtRHmKKGXaH6bICiDEpbSnOr8Vq6Ciy
         hokKffgKnx2S2wI9Nl8Axk4kZNluLuBY6Zx6okLhjrnLL2ygVlVFvabyXyHulJpnZx
         onphqhZohxUZkdSzwJ1B0020oAX8kgf3sCmdQVdQ=
Date:   Mon, 11 Oct 2021 13:53:45 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: mm/kasan/init.c:282:20: error: redefinition of
 'kasan_populate_early_vm_area_shadow'
Message-Id: <20211011135345.9506437ee2504a81054dc06f@linux-foundation.org>
In-Reply-To: <CA+G9fYtD2EFu7-j1wPLCiu2yVpZb_wObXXXebKNSW5o4gh9vgA@mail.gmail.com>
References: <CA+G9fYv1Vbc-Y_czipb-z1bG=9axE4R1BztKGqWz-yy=+Wcsqw@mail.gmail.com>
        <CA+G9fYtD2EFu7-j1wPLCiu2yVpZb_wObXXXebKNSW5o4gh9vgA@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 11 Oct 2021 18:12:44 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> + Andrew Morton <akpm@linux-foundation.org>
> 
> On Mon, 11 Oct 2021 at 17:08, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Regression found on x86_64 gcc-11 built with KASAN enabled.
> > Following build warnings / errors reported on linux next 20211011.
> >
> > metadata:
> >     git_describe: next-20211011
> >     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> >     git_short_log: d3134eb5de85 (\"Add linux-next specific files for 20211011\")
> >     target_arch: x86_64
> >     toolchain: gcc-11
> >
> > build error :
> > --------------
> > mm/kasan/init.c:282:20: error: redefinition of
> > 'kasan_populate_early_vm_area_shadow'
> >   282 | void __init __weak kasan_populate_early_vm_area_shadow(void *start,
> >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from include/linux/mm.h:34,
> >                  from include/linux/memblock.h:13,
> >                  from mm/kasan/init.c:9:
> > include/linux/kasan.h:463:20: note: previous definition of
> > 'kasan_populate_early_vm_area_shadow' with type 'void(void *, long
> > unsigned int)'
> >   463 | static inline void kasan_populate_early_vm_area_shadow(void *start,
> >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > make[3]: *** [scripts/Makefile.build:288: mm/kasan/init.o] Error 1
> > make[3]: Target '__build' not remade because of errors.
> >
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > build link:
> > -----------
> > https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/build.log
> >
> > build config:
> > -------------
> > https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/config
> >
> > # To install tuxmake on your system globally
> > # sudo pip3 install -U tuxmake
> > tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-11
> > --kconfig defconfig --kconfig-add
> > https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/config

Presumably "kasan: arm64: fix pcpu_page_first_chunk crash with
KASAN_VMALLOC".  Let's cc Kefeng.

