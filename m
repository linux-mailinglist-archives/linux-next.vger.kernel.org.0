Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232673423C8
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 18:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhCSRyz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 13:54:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:47318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230310AbhCSRya (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Mar 2021 13:54:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BD2961986;
        Fri, 19 Mar 2021 17:54:26 +0000 (UTC)
Date:   Fri, 19 Mar 2021 17:54:23 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, glittao@gmail.com,
        Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: arm64: compiler_types.h:320:38: error: call to
 __compiletime_assert_417
Message-ID: <20210319175423.GE6832@arm.com>
References: <CA+G9fYu-t_JwoBVXKhiDUY-FRdX3F3LgbDw9bFeiuciwC70TaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu-t_JwoBVXKhiDUY-FRdX3F3LgbDw9bFeiuciwC70TaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 19, 2021 at 08:49:07PM +0530, Naresh Kamboju wrote:
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

KMALLOC_MIN_SIZE is 128 on arm64, so commit 1a58eef5def9 ("selftests:
add a kselftest for SLUB debugging functionality") breaks the build. The
test was previously in mm/slub.c hidden behind macro that no-one
enabled.

-- 
Catalin
