Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B20B2C88BD
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 16:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgK3P5x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 10:57:53 -0500
Received: from foss.arm.com ([217.140.110.172]:57044 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbgK3P5x (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 10:57:53 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0029AD6E;
        Mon, 30 Nov 2020 07:57:08 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A75A3F718;
        Mon, 30 Nov 2020 07:57:06 -0800 (PST)
Subject: Re: [next] arm64: mte.c:176:17: error: 'struct thread_struct' has no
 member named 'sctlr_tcf0'
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>, andreyknvl@google.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Collingbourne <pcc@google.com>
References: <CA+G9fYuTS-Kmwy4wfNrFMLnon0v5No3KQeu262c9L91wOrcxkA@mail.gmail.com>
From:   Steven Price <steven.price@arm.com>
Message-ID: <2fd63f1f-9552-760c-baf8-9ccf1df69de2@arm.com>
Date:   Mon, 30 Nov 2020 15:57:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYuTS-Kmwy4wfNrFMLnon0v5No3KQeu262c9L91wOrcxkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 30/11/2020 15:42, Naresh Kamboju wrote:
> Linux next tag 20201130 arm64 build failed due to below error,
>    - gcc-9, gcc-10 and clang-10 build FAIL
>    - gcc-8 build PASS.
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/2/tmp ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> arch/arm64/kernel/mte.c: In function 'set_sctlr_el1_tcf0':
> arch/arm64/kernel/mte.c:176:17: error: 'struct thread_struct' has no
> member named 'sctlr_tcf0'
>    176 |  current->thread.sctlr_tcf0 = tcf0;
>        |                 ^
> At top level:
> arch/arm64/kernel/mte.c:168:13: warning: 'set_sctlr_el1_tcf0' defined
> but not used [-Wunused-function]
>    168 | static void set_sctlr_el1_tcf0(u64 tcf0)
>        |             ^~~~~~~~~~~~~~~~~~
> make[3]: *** [scripts/Makefile.build:283: arch/arm64/kernel/mte.o] Error 1
> make[3]: Target '__build' not remade because of errors.

This looks like a bad conflict resolution of a patch in Andrew's set.

3394cb084a8d ("arm64: mte: add in-kernel MTE helpers") has reintroduced 
set_sctlr_el1_tcf0() which was removed in e710c29e0177 ("arm64: mte: 
make the per-task SCTLR_EL1 field usable elsewhere") (in arm64 tree). 
But this doesn't happen in the original patch 
arm64-mte-add-in-kernel-mte-helpers.patch in Andrew's set.

Steve

> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 
> steps to reproduce:
> 
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
> tuxmake --runtime docker --target-arch arm64 --toolchain gcc-9
> --kconfig defconfig --kconfig-add
> https://builds.tuxbuild.com/1l0FGU7GBRQu6kT79iDAwsHkQ6d/config
> 
> 

