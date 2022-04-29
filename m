Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84638514DF8
	for <lists+linux-next@lfdr.de>; Fri, 29 Apr 2022 16:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377785AbiD2Oth (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Apr 2022 10:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377889AbiD2OtS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2022 10:49:18 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1F68231B
        for <linux-next@vger.kernel.org>; Fri, 29 Apr 2022 07:45:59 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id i38so14819788ybj.13
        for <linux-next@vger.kernel.org>; Fri, 29 Apr 2022 07:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=f0pLuqeZXYz1sWaSkPXGqX7Ka9Gz3+f93gXtOcRk6zE=;
        b=sg76t27J/gyCTdgIN57AbjYzistMTapWVkGILL67jpyduU/WbdWJXIc4VGLnSttIYn
         hNGApEWtHCSwnxDURtP54N2ZLF60H9UgJq02rR82FSv1GK177WNDXPhjQGkfWKZsALnL
         BmTKKyP0ssXeCKBfT55o9dekWFj17VSC7Z+fZvkO4rUIi/TQIE37u157A4RlwbL9o8BJ
         8RPwQ9k21QlkIiL3BQAC/2XeJfKe5extkSGRU8EvUGSWXP+Mmq/r3ovudUR5WaUoUrnG
         ulovb0ucLpqI44pMZrrDg9fhHVxXVA0NjBgZVUFZKNHAcZS/GzYvSiogD0SPCrTy2dLM
         TkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=f0pLuqeZXYz1sWaSkPXGqX7Ka9Gz3+f93gXtOcRk6zE=;
        b=h+CEaUSCbMsg6KplOF10FtM3/pCEJshnx3GPUgiXPatC/17Ffdp67a+0W+IHbERXZJ
         yyJ9AzmWC4CBpjt4hdXOKd3OwGaU4hh7ZOEoFn0+PDhKkOKUVxceRQ7ksOs59jCMy8mV
         h+r6ZobF0lPeted3lXkw4mGDUcZPx124fweSQgfW4OTTL0m7nlmVuPjl8KwxDmVhoUSx
         auAkQxM2HWBHV4gCD1o3AZBeP3DlUqTnHfXKR+NYYT9x5xGG90Yy9BAvDkPFbCs8iEnr
         oOksRQKcF2xhviA2o5C5tEVyv36E8Gj6SRZHyPweyeLEpT38tzsvvvNW/Zn0H8rK+X4q
         X/tQ==
X-Gm-Message-State: AOAM533rk4GyJsYzaPOUGY0qHVpUbcG9fU+6h+URu95g+7NAxzTMTqrR
        R/XtXqgp/gzUyyX+PRJO5xK22aJ7gTim1O9t+DBLpb/iBh2xYg==
X-Google-Smtp-Source: ABdhPJwebZPW8eNXr7R6EmFQmtAGmoO8i+DbeZ/yF9SoTg6ttJi1GAZwMgxz8AT0N8FkWFM0f6Rztj4uwwWpuIStN6k=
X-Received: by 2002:a25:20d4:0:b0:645:d55b:f0df with SMTP id
 g203-20020a2520d4000000b00645d55bf0dfmr32821553ybg.537.1651243558063; Fri, 29
 Apr 2022 07:45:58 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 29 Apr 2022 20:15:47 +0530
Message-ID: <CA+G9fYvSqtsOMEiL7_kffPKnnO-Snhe2cup6g3qRngiwRO+RfA@mail.gmail.com>
Subject: [next] powerpc: multiple definition of `____cacheline_aligned';
 sound/core/oss/pcm_oss.o:(.bss+0x40): first defined here
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        lkft-triage@lists.linaro.org
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        aul Mackerras <paulus@samba.org>,
        Matthew Wilcox <willy@infradead.org>,
        Baoquan He <bhe@redhat.com>, Christoph Hellwig <hch@lst.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following powerpc builds failed on Linux next-20220428 and next-20220429.

Regressions found on powerpc:
   - gcc-11-ppc64e_defconfig
   - gcc-10-ppc64e_defconfig
   - gcc-9-ppc64e_defconfig
   - gcc-8-ppc64e_defconfig
   - clang-14-ppc64e_defconfig
   - clang-nightly-ppc64e_defconfig
   - clang-13-ppc64e_defconfig


Build error:
-------------
Error: Section .bss not empty in prom_init.c
make[3]: *** [arch/powerpc/kernel/Makefile:191:
arch/powerpc/kernel/prom_init_check] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:595: arch/powerpc/kernel] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1996: arch/powerpc] Error 2
powerpc64le-linux-gnu-ld: sound/core/oss/pcm_plugin.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/oss/pcm_oss.o:(.bss+0x40): first defined here
make[4]: *** [scripts/Makefile.build:530: sound/core/oss/snd-pcm-oss.o] Error 1
make[4]: Target '__build' not remade because of errors.
make[3]: *** [scripts/Makefile.build:595: sound/core/oss] Error 2
powerpc64le-linux-gnu-ld: sound/core/seq/seq_clientmgr.o:(.bss+0x900):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_memory.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_queue.o:(.bss+0x140):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_fifo.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_timer.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_system.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_ports.o:(.bss+0x0):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
powerpc64le-linux-gnu-ld: sound/core/seq/seq_info.o:(.bss+0x40):
multiple definition of `____cacheline_aligned';
sound/core/seq/seq_lock.o:(.bss+0x0): first defined here
make[4]: *** [scripts/Makefile.build:530: sound/core/seq/snd-seq.o] Error 1
make[4]: Target '__build' not remade because of errors.


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


steps to reproduce:
-------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch powerpc --toolchain gcc-11
--kconfig ppc64e_defconfig

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/28Sn15hB2la1PweieGMLrUdbFMQ/
