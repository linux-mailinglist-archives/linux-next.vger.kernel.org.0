Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC15333650
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 08:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhCJHYW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 02:24:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:44880 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229643AbhCJHYW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Mar 2021 02:24:22 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2BDEBAC1F;
        Wed, 10 Mar 2021 07:24:21 +0000 (UTC)
Date:   Wed, 10 Mar 2021 08:24:17 +0100
From:   Oscar Salvador <osalvador@suse.de>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
        Michal Hocko <mhocko@kernel.org>, Zi Yan <ziy@nvidia.com>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v6 3/4] x86/vmemmap: Handle unpopulated sub-pmd ranges
Message-ID: <YEh0IXlWVsgbGK7c@localhost.localdomain>
References: <20210309214050.4674-1-osalvador@suse.de>
 <20210309214050.4674-4-osalvador@suse.de>
 <CA+G9fYuP9t7Giyjmh4-2UspD1hfEF5EQwZ69xKWAaBH99ykxtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuP9t7Giyjmh4-2UspD1hfEF5EQwZ69xKWAaBH99ykxtA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 10, 2021 at 11:37:53AM +0530, Naresh Kamboju wrote:
> Hi Oscar,

Hi Naresh,

> While building the linux next 20210310 tag for x86_64 architecture with clang-12
> and gcc-9 the following warnings / errors were noticed.
> 
> arch/x86/mm/init_64.c:1585:6: error: implicit declaration of function
> 'vmemmap_use_new_sub_pmd' [-Werror,-Wimplicit-function-declaration]
>                                         vmemmap_use_new_sub_pmd(addr, next);
>                                         ^
> arch/x86/mm/init_64.c:1591:4: error: implicit declaration of function
> 'vmemmap_use_sub_pmd' [-Werror,-Wimplicit-function-declaration]
>                         vmemmap_use_sub_pmd(addr, next);
>                         ^
> 2 errors generated.
> make[3]: *** [scripts/Makefile.build:271: arch/x86/mm/init_64.o] Error 1
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Yes, this was also reported by Zi Yan here [1].
Looking into your .config, seems to be the same issue as you have
CONFIG_SPARSE_VMEMMAP but !CONFIG_MEMORY_HOTPLUG.

This version fixes those compilation errors.

Thanks for reporting it anyway!

[1] https://lore.kernel.org/linux-mm/YEfoH8US4YVxak7r@localhost.localdomain/T/#ma566ff437ff4bf8fcc5f80f62cd0cc8761edd12d

> Steps to reproduce:
> -------------------
> # TuxMake is a command line tool and Python library that provides
> # portable and repeatable Linux kernel builds across a variety of
> # architectures, toolchains, kernel configurations, and make targets.
> #
> # TuxMake supports the concept of runtimes.
> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
> # that you install podman or docker on your system.
> #
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
> 
> 
> tuxmake --runtime podman --target-arch x86_64 --toolchain clang-12
> --kconfig defconfig --kconfig-add
> https://builds.tuxbuild.com/1pYCPt4WlgSfSdv1BULm6ABINeJ/config
> 
> 
> Build pipeline error link,
> https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1085496613#L428
> 
> -- 
> Linaro LKFT
> https://lkft.linaro.org



-- 
Oscar Salvador
SUSE L3
