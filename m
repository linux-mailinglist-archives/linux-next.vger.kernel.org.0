Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD5145A1A5
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 12:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbhKWLmB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 06:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236144AbhKWLmA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 06:42:00 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F267C061714
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 03:38:52 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id e3so90778098edu.4
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 03:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=k7G4wbjHzsKzXccXTCEbiJCCEpjCW1QL0hIAj1UZJ0k=;
        b=sFyTJnfESXSjl/1vk4O7utsPKg4g6/BoGHBmkPmI4u4Xq2N082NtFXM/TP2ENuTFDM
         rFCjaCZ/GKMockSfnLAf7LgyRp4kvApsbnVHGZDKIq7ZF8+BZ8EnnAyN1ikn1Gu4S9C6
         TqMZ/UtlRO9GuAFtP/sioemENjjoQ3U3L6ZrPPn7PgNM2vDmjfKHsyRuYGxpbpZJlRje
         Z3J6wZeCxOKntih4I0XwWvgXOapAduQPY8WFC3fam8RsAcFvk4hnpfg3BZWZ1AX86UYM
         5qQVRTPXwM4bRFCuU8qa6lEkIfXk+D8Y7zR8LDalDZ3S2lFKK/gqUYH5uUzCtG4r1B80
         NZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=k7G4wbjHzsKzXccXTCEbiJCCEpjCW1QL0hIAj1UZJ0k=;
        b=ML1O/l251/LcFJfICU0262V8Or1LNKUjeKYXMGPACLdNcTLH19OFGN10gaOdqbamFL
         2H5cmEeHJXCGmExBMX9FxHJ5BHDZED50hsP7PU9puDw7O1Web3yIlr5XsPg4ykeQTsw5
         ZH5b6D/Djq3EgD8jPUKf/EuLcBCIhrDO8w2q0voCShJBEGbVSOptkhc3znaNFkKxaqQ/
         mUuZoVUwiwfIRzhpXO3nEIjRNCPIAH79YQ1lky1rZrHrk/BlEkdhmpdmi+Xb4GifLpv6
         PrfNyaYvLbgIoPrOmLpNEhEiHCd+VpeOBtUeeiddgWchOhi+JUd+1v0DbC1ccEay1GI7
         w0iQ==
X-Gm-Message-State: AOAM530qHK1LU8iqOKQ7emSLtKyDK2uA7VgxkEpCCKPNIPF71XMaEJNm
        2FpKfQyuIccV+TG6cltpnVmb0n4+A0HMOZB56RnWj5nkhJywKQ==
X-Google-Smtp-Source: ABdhPJxYO+0qKUdkZFowci003RczNBtBqsX8ALyrTjhYPGiZRF1q0mIDJqf8mJbKEdrE4DiQJcMz/9zUG1XEqG2M3ts=
X-Received: by 2002:a17:906:4791:: with SMTP id cw17mr6693188ejc.493.1637667530137;
 Tue, 23 Nov 2021 03:38:50 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 23 Nov 2021 17:08:39 +0530
Message-ID: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
Subject: spinlock.c:306:9: error: implicit declaration of function '__raw_write_lock_nested'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While building Linux next 20211123 tag for sh with gcc-11
following warnings / errors noticed.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=sh
CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
'HOSTCC=sccache gcc'
  Generating include/generated/machtypes.h
<stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
<stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]
In file included from arch/sh/include/asm/hw_irq.h:6,
                 from include/linux/irq.h:594,
                 from include/asm-generic/hardirq.h:17,
                 from arch/sh/include/asm/hardirq.h:9,
                 from include/linux/hardirq.h:11,
                 from include/linux/interrupt.h:11,
                 from include/linux/serial_core.h:13,
                 from include/linux/serial_sci.h:6,
                 from arch/sh/kernel/cpu/sh4a/setup-shx3.c:10:
include/linux/sh_intc.h:100:63: warning: division 'sizeof (void *) /
sizeof (void)' does not compute the number of array elements
[-Wsizeof-pointer-div]
  100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 :
sizeof(a)/sizeof(*a)
      |                                                               ^
include/linux/sh_intc.h:107:9: note: in expansion of macro '_INTC_ARRAY'
  107 |         _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
      |         ^~~~~~~~~~~
include/linux/sh_intc.h:124:15: note: in expansion of macro 'INTC_HW_DESC'
  124 |         .hw = INTC_HW_DESC(vectors, groups, mask_regs,
         \
      |               ^~~~~~~~~~~~
arch/sh/kernel/cpu/sh4a/setup-shx3.c:309:8: note: in expansion of
macro 'DECLARE_INTC_DESC'
  309 | static DECLARE_INTC_DESC(intc_desc, "shx3", vectors, groups,
      |        ^~~~~~~~~~~~~~~~~
include/linux/sh_intc.h:100:63: warning: division 'sizeof (void *) /
sizeof (void)' does not compute the number of array elements
[-Wsizeof-pointer-div]
  100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 :
sizeof(a)/sizeof(*a)
      |                                                               ^
include/linux/sh_intc.h:107:34: note: in expansion of macro '_INTC_ARRAY'
  107 |         _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
      |                                  ^~~~~~~~~~~
include/linux/sh_intc.h:124:15: note: in expansion of macro 'INTC_HW_DESC'
  124 |         .hw = INTC_HW_DESC(vectors, groups, mask_regs,
         \
      |               ^~~~~~~~~~~~
arch/sh/kernel/cpu/sh4a/setup-shx3.c:309:8: note: in expansion of
macro 'DECLARE_INTC_DESC'
  309 | static DECLARE_INTC_DESC(intc_desc, "shx3", vectors, groups,
      |        ^~~~~~~~~~~~~~~~~
include/linux/sh_intc.h:100:63: warning: division 'sizeof (void *) /
sizeof (void)' does not compute the number of array elements
[-Wsizeof-pointer-div]
  100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 :
sizeof(a)/sizeof(*a)
      |                                                               ^
include/linux/sh_intc.h:107:34: note: in expansion of macro '_INTC_ARRAY'
  107 |         _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
      |                                  ^~~~~~~~~~~
include/linux/sh_intc.h:124:15: note: in expansion of macro 'INTC_HW_DESC'
  124 |         .hw = INTC_HW_DESC(vectors, groups, mask_regs,
         \
      |               ^~~~~~~~~~~~
arch/sh/kernel/cpu/sh4a/setup-shx3.c:322:8: note: in expansion of
macro 'DECLARE_INTC_DESC'
  322 | static DECLARE_INTC_DESC(intc_desc_irq, "shx3-irq", vectors_irq, groups,
      |        ^~~~~~~~~~~~~~~~~
include/linux/sh_intc.h:100:63: warning: division 'sizeof (void *) /
sizeof (void)' does not compute the number of array elements
[-Wsizeof-pointer-div]
  100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 :
sizeof(a)/sizeof(*a)
      |                                                               ^
include/linux/sh_intc.h:107:9: note: in expansion of macro '_INTC_ARRAY'
  107 |         _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
      |         ^~~~~~~~~~~
include/linux/sh_intc.h:124:15: note: in expansion of macro 'INTC_HW_DESC'
  124 |         .hw = INTC_HW_DESC(vectors, groups, mask_regs,
         \
      |               ^~~~~~~~~~~~
arch/sh/kernel/cpu/sh4a/setup-shx3.c:337:8: note: in expansion of
macro 'DECLARE_INTC_DESC'
  337 | static DECLARE_INTC_DESC(intc_desc_irl, "shx3-irl", vectors_irl, groups,
      |        ^~~~~~~~~~~~~~~~~
include/linux/sh_intc.h:100:63: warning: division 'sizeof (void *) /
sizeof (void)' does not compute the number of array elements
[-Wsizeof-pointer-div]
  100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 :
sizeof(a)/sizeof(*a)
      |                                                               ^
include/linux/sh_intc.h:107:34: note: in expansion of macro '_INTC_ARRAY'
  107 |         _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
      |                                  ^~~~~~~~~~~
include/linux/sh_intc.h:124:15: note: in expansion of macro 'INTC_HW_DESC'
  124 |         .hw = INTC_HW_DESC(vectors, groups, mask_regs,
         \
      |               ^~~~~~~~~~~~
arch/sh/kernel/cpu/sh4a/setup-shx3.c:337:8: note: in expansion of
macro 'DECLARE_INTC_DESC'
  337 | static DECLARE_INTC_DESC(intc_desc_irl, "shx3-irl", vectors_irl, groups,
      |        ^~~~~~~~~~~~~~~~~
kernel/locking/spinlock.c: In function '_raw_write_lock_nested':
kernel/locking/spinlock.c:306:9: error: implicit declaration of
function '__raw_write_lock_nested'; did you mean
'_raw_write_lock_nested'? [-Werror=implicit-function-declaration]
  306 |         __raw_write_lock_nested(lock, subclass);
      |         ^~~~~~~~~~~~~~~~~~~~~~~
      |         _raw_write_lock_nested
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:288: kernel/locking/spinlock.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:571: kernel/locking] Error 2
fs/ext4/readpage.c: In function 'ext4_mpage_readpages':
fs/ext4/readpage.c:413:1: warning: the frame size of 1140 bytes is
larger than 1024 bytes [-Wframe-larger-than=]
  413 | }
      | ^
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1989: kernel] Error 2
fs/mpage.c: In function '__mpage_writepage':
fs/mpage.c:672:1: warning: the frame size of 1156 bytes is larger than
1024 bytes [-Wframe-larger-than=]
  672 | }
      | ^
fs/mpage.c: In function 'do_mpage_readpage':
fs/mpage.c:336:1: warning: the frame size of 1092 bytes is larger than
1024 bytes [-Wframe-larger-than=]
  336 | }
      | ^
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2
make: Target '__all' not remade because of errors.


Build config:
https://builds.tuxbuild.com/21J9mb3wsbGi616UxQbxP3DSTGv/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git describe: next-20211123
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: aacdecce8147c20b01f865b4e214bb8dbe8c4af1
    git_short_log: aacdecce8147 (\"Add linux-next specific files for 20211123\")
    target_arch: sh
    toolchain: gcc-11

steps to reproduce:
tuxmake --runtime podman --target-arch sh --toolchain gcc-11 --kconfig
shx3_defconfig

https://builds.tuxbuild.com/21J9mb3wsbGi616UxQbxP3DSTGv/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
