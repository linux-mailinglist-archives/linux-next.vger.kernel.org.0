Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08AFE3423EB
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 19:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCSSB4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 14:01:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:38428 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230145AbhCSSBa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Mar 2021 14:01:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1DE9FAC2E;
        Fri, 19 Mar 2021 18:01:29 +0000 (UTC)
Subject: Re: arm64: compiler_types.h:320:38: error: call to
 __compiletime_assert_417
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, glittao@gmail.com,
        Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <CA+G9fYu-t_JwoBVXKhiDUY-FRdX3F3LgbDw9bFeiuciwC70TaQ@mail.gmail.com>
From:   Vlastimil Babka <vbabka@suse.cz>
Message-ID: <53cc267d-aa0a-071a-f9f8-0b47ec4b2b9d@suse.cz>
Date:   Fri, 19 Mar 2021 19:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CA+G9fYu-t_JwoBVXKhiDUY-FRdX3F3LgbDw9bFeiuciwC70TaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/19/21 4:19 PM, Naresh Kamboju wrote:
> [This email landed to Spam for some reason, sending it again with modified
> subject]
> 
> While building arm64 kernel modules the following kernel warnings /
> errors noticed on linux next 20210318 tag the gcc version is 7.3.0.
> Build PASS with gcc-8, gcc-9 and gcc-10.
> 
>  In file included from <command-line>:0:0:
>  In function 'resiliency_test',
>      inlined from 'test_slub_init' at   lib/test_slub.c:120:2:
>    include/linux/compiler_types.h:320:38: error: call to
> '__compiletime_assert_417' declared with attribute error: BUILD_BUG_ON
> failed: KMALLOC_MIN_SIZE > 16 | KMALLOC_SHIFT_HIGH < 10
>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                        ^
>    include/linux/compiler_types.h:301:4: note: in definition of macro
> '__compiletime_assert'
>      prefix ## suffix();    \
>      ^~~~~~
>    include/linux/compiler_types.h:320:2: note: in expansion of macro
> '_compiletime_assert'
>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>    ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro
> 'compiletime_assert'
>   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                       ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:2: note: in expansion of macro
> 'BUILD_BUG_ON_MSG'
>    BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>    ^~~~~~~~~~~~~~~~
>    lib/test_slub.c:101:2: note: in expansion of macro 'BUILD_BUG_ON'
>    BUILD_BUG_ON(KMALLOC_MIN_SIZE > 16 | KMALLOC_SHIFT_HIGH < 10);
>    ^~~~~~~~~~~~
>  make[2]: *** [  scripts/Makefile.build:273: lib/test_slub.o] Error 1
>  make[1]: *** [  Makefile:1980: lib] Error 2
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=juno,label=docker-buster-lkft/984/consoleFull
> 
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=juno,label=docker-buster-lkft/984/consoleFull
> 

Andrew, please add this -fix
Thanks.

----8<----
From f97312224278839321a5ff9be2b8487553a97c63 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Fri, 19 Mar 2021 18:56:50 +0100
Subject: [PATCH] selftests: add a kselftest for SLUB debugging
 functionality-fix

Remove a BUILD_BUG_ON left over from original resiliency_test() that breaks
builds.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 lib/test_slub.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/test_slub.c b/lib/test_slub.c
index 0075d9b44251..b7ad6c0b07a6 100644
--- a/lib/test_slub.c
+++ b/lib/test_slub.c
@@ -97,9 +97,6 @@ static void __init test_clobber_redzone_free(void)
 
 static void __init resiliency_test(void)
 {
-
-	BUILD_BUG_ON(KMALLOC_MIN_SIZE > 16 || KMALLOC_SHIFT_HIGH < 10);
-
 	pr_err("SLUB resiliency testing\n");
 	pr_err("-----------------------\n");
 	pr_err("A. Corruption after allocation\n");
-- 
2.30.2

