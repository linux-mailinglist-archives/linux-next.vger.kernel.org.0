Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FC07069CE
	for <lists+linux-next@lfdr.de>; Wed, 17 May 2023 15:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjEQN1J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 May 2023 09:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbjEQN1I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 May 2023 09:27:08 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C306C2
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 06:27:07 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4360e73d0d4so450404137.1
        for <linux-next@vger.kernel.org>; Wed, 17 May 2023 06:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684330026; x=1686922026;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wx5qxeQeKBEqdde9QKQUuKh6WnmMKonJWNMvVFtbusQ=;
        b=EUpPA5IwWSIxGRUOqWsOvLyTp4i1XI17/5VigHXAf74ZHi3QZcP8fdSXmbGXoCDCSQ
         2U3ZKH+rkrnMi+2vCvgqYy1BJYe2TrQDhY7OLiXicu4ah2gEXfUvkrLzUs8PdrBM91VX
         wd3N7IOps0uMr8Yz0592+ZUkhuy9b+LrSQXgEoxEv8qndehEQJBIRgUwI0JdozwA1lAS
         fbfqohkW5GK4FQCthQNJZEitw0n+dxoq16eBYCeoCaVa2zWRpbnU/gZK9ndYpavRH5i9
         yKz399TOMcvSk1hqbBqIa5P0IZWVv5Kwxrn4W2hUD2FFhuB7IpQGjQ7SQCZptOTW0HhP
         jVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684330026; x=1686922026;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wx5qxeQeKBEqdde9QKQUuKh6WnmMKonJWNMvVFtbusQ=;
        b=CnKLFOm7ypV8W6Fsd2D3X162mLtiMi9XCKxIh2kv1Xyq0BMJGf7kqBbgePiAWlOWNY
         tb8TgGxZTs5J67/o0be+3ABcudYiBNbFSNsHdpIig0i7XgUXzMdOCWgZqcWHwHAf1EZk
         YX+pV078X/QjHDtkUMuFmW2VADpaankRiOU9d/UUhnDMmMGcS/SjDRsYUOnHw1f9/3OA
         PvFbFNKUByeIHSq5D0w2v2IrXZLcbWiYPQ6ynZOi6Xbyz6CST0Tgz/m0knuO00Jlc8vk
         mMnkT1x2Yyu3mjerWOtZC4Dc7fXhVRDNuWE4vxR9eAaWBMmAD8LOAgbiN4Gy6Fx7qU17
         n1VA==
X-Gm-Message-State: AC+VfDxSav/h2YJrJQqd+r/nxBwxjamLgaHNNCs4CN/3DIoFP6gf88JE
        Ic8kG8HZDRyJtLyJaabKYY2uiJ1wL7SS54+nbpIEagS0F5SFJifHNQ4Vug==
X-Google-Smtp-Source: ACHHUZ5ZmiZ3a8jbMBeNoTr/UiZDSk/LTYNubVr/K+g1RAnZdAx3dZ8iDgO8Iv48WlmHLMqj2HPVuwZbWQHMSHDKFm0=
X-Received: by 2002:a67:e3bc:0:b0:42f:78d5:d987 with SMTP id
 j28-20020a67e3bc000000b0042f78d5d987mr15717719vsm.1.1684330025759; Wed, 17
 May 2023 06:27:05 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 17 May 2023 18:56:54 +0530
Message-ID: <CA+G9fYszL_ccRR+-YUXfm4tzv_bA=can-o-hYhQ+F1HyGY7Mtw@mail.gmail.com>
Subject: next: arm64: build/gcc-12-lkftconfig-64k_page_size - error: call to
 '__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON
 failed: (((16 - 3) * (4 - (2)) + 3)-16) > 10
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following arm64 builds failed on Linux next-20230517.

 - build/gcc-12-lkftconfig-64k_page_size
 - build/gcc-11-lkftconfig-64k_page_size

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
======
include/asm-generic/div64.h:46:27: warning: conversion from 'long
unsigned int' to 'uint32_t' {aka 'unsigned int'} changes value from
'4398046511104' to '0' [-Woverflow]
   46 |         uint32_t __base = (base);                               \
      |                           ^
include/linux/math.h:40:44: note: in expansion of macro 'do_div'
   40 |         ({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
      |                                            ^~~~~~
include/linux/math.h:43:9: note: in expansion of macro 'DIV_ROUND_DOWN_ULL'
   43 |         DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
      |         ^~~~~~~~~~~~~~~~~~
arch/arm64/kvm/mmu.c:95:22: note: in expansion of macro 'DIV_ROUND_UP_ULL'
   95 |                 n += DIV_ROUND_UP_ULL(range, PUD_SIZE);
      |                      ^~~~~~~~~~~~~~~~
In file included from <command-line>:
mm/huge_memory.c: In function 'hugepage_init':
include/linux/compiler_types.h:397:45: error: call to
'__compiletime_assert_494' declared with attribute error: BUILD_BUG_ON
failed: (((16 - 3) * (4 - (2)) + 3)-16) > 10
  397 |         _compiletime_assert(condition, msg,
__compiletime_assert_, __COUNTER__)
      |                                             ^
include/linux/compiler_types.h:378:25: note: in definition of macro
'__compiletime_assert'
  378 |                         prefix ## suffix();
         \
      |                         ^~~~~~
include/linux/compiler_types.h:397:9: note: in expansion of macro
'_compiletime_assert'
  397 |         _compiletime_assert(condition, msg,
__compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro
'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
      |         ^~~~~~~~~~~~~~~~
include/linux/bug.h:24:25: note: in expansion of macro 'BUILD_BUG_ON'
   24 |                         BUILD_BUG_ON(cond);             \
      |                         ^~~~~~~~~~~~
mm/huge_memory.c:470:9: note: in expansion of macro 'MAYBE_BUILD_BUG_ON'
  470 |         MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER > MAX_ORDER);
      |         ^~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:252: mm/huge_memory.o] Error 1


logs:
=====
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031010/suite/build/test/gcc-12-lkftconfig-64k_page_size/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031010/suite/build/test/gcc-12-lkftconfig-64k_page_size/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230517/testrun/17031010/suite/build/test/gcc-12-lkftconfig-64k_page_size/details/


Steps to reproduce:
====
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.
# tuxmake   \
 --runtime podman   \
 --target-arch arm64   \
 --toolchain gcc-12   \
 --kconfig defconfig   \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
  \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
  \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
  \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
  \
 --kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
  \
 --kconfig-add CONFIG_ARM64_MODULE_PLTS=y   \
 --kconfig-add CONFIG_SYN_COOKIES=y   \
 --kconfig-add CONFIG_SCHEDSTATS=y   \
 --kconfig-add CONFIG_ARM64_64K_PAGES=y

OR

tuxmake   \
 --runtime podman   \
 --target-arch arm64   \
 --toolchain gcc-12   \
 --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2PtylMMZpP2yGvgCnhE5SZngOYJ/config


--
Linaro LKFT
https://lkft.linaro.org
