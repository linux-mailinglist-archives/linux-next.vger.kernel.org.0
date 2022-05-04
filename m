Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5B8651AC93
	for <lists+linux-next@lfdr.de>; Wed,  4 May 2022 20:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376973AbiEDSVs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 May 2022 14:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376959AbiEDSVc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 May 2022 14:21:32 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B08E9137F
        for <linux-next@vger.kernel.org>; Wed,  4 May 2022 10:43:56 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id y76so3668598ybe.1
        for <linux-next@vger.kernel.org>; Wed, 04 May 2022 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=K1n9fpldTiBt4+7bTClyqmjUIHytSrQ70M4AzMF65Pc=;
        b=A/qVfvoBR7m65lufNi580qn7sweKa3qFysR8AOSrAEJ7mMjEh3aSQhMkP/nVDxJXr0
         5gYeioggSEAMajiBMNyNUIMObE+Fg6rfKZKEWaGabAKTGY8o+8NhuiiMs2T8QLjAc2In
         e/SVZSpDn9tBcic/nrjIhGmE17asrK1EKWDliqOPiWhTvV6EG6+WuNnKSPPnltbdXuDb
         R9c2sZFImzk/P4ozL7d+2l/Jd/Gq9VZ9U49tf1RJbOaxItbB5sXdaolvuA/lS2F7Lwpi
         zMSNJkt47gNFNvIA/N1p0FcOToKUisCexxbdduq8ngZxmKbSTYcv1VgxTZGdbvBVMdrf
         jEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=K1n9fpldTiBt4+7bTClyqmjUIHytSrQ70M4AzMF65Pc=;
        b=Q4eXnKz7NUop4y/BlMytupgkDSS41yfalsvWUP89sy12MPXmxDYB1TiPFPPeP8o54W
         WAzGZpoxsaqYuRpFaajBR3wpNGmepsKK3EGFPPh3LfQFE0s5/5kQNetNs8l9HkqUnvXN
         +rO1IDHkGxRQAaeBuxy9vepbOoZeApzyXJ7QKKhzual1FLxiiqT4DcV+IvUjk+hyAiur
         3viRg/nA1ve0IZ4PPzBFOE9SrhFyB7A4v+chJK5O+3wuZcJk3IIgfU3X1PhFlzyRE5u6
         cBvbJspA16CWl5u9I1WStw4n87XljZ4ovZ91p/23kMuLIH95ZB2qwziM5uhralAqNtgi
         4oIQ==
X-Gm-Message-State: AOAM532ZV8YZ0y9O85SScrTjPzRPgwXF++sZYbtVK0Z8THZL+gc3jx+9
        CxmL7pwlD/3rITxgVYKhJ3YuTh/dUeIUEwyuAeIMAw==
X-Google-Smtp-Source: ABdhPJzLe2h1An4Fs9MeIuSmoDbxLHlp73p6tTRs2p/M7zbc6blBeZDp8hE9uOb5Up99bp6rqfPv7sjz7KWrQFaTYFk=
X-Received: by 2002:a25:8045:0:b0:648:a9b3:96d0 with SMTP id
 a5-20020a258045000000b00648a9b396d0mr17625426ybn.88.1651686235567; Wed, 04
 May 2022 10:43:55 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 4 May 2022 23:13:43 +0530
Message-ID: <CA+G9fYvLE9Rjw3h6styZj9un8hVd7rPS-H5EOVY6bi03PP0BJA@mail.gmail.com>
Subject: [next] arm: include/linux/compiler_types.h:352:38: error: call to
 '__compiletime_assert_295' declared with attribute error: BUILD_BUG failed
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build regressions noticed On Linux next-20220405.

Regressions found on arm:

   - gcc-10-lkftconfig-kselftest
   - gcc-9-omap2plus_defconfig
   - clang-11-omap2plus_defconfig
   - gcc-10-lkftconfig-kasan
   - clang-12-omap2plus_defconfig
   - clang-nightly-omap2plus_defconfig
   - gcc-10-omap2plus_defconfig
   - clang-13-lkftconfig
   - gcc-10-lkftconfig-kunit
   - gcc-8-omap2plus_defconfig
   - gcc-10-lkftconfig-libgpiod
   - clang-13-omap2plus_defconfig
   - clang-14-lkftconfig
   - clang-14-omap2plus_defconfig
   - gcc-10-lkftconfig
   - gcc-11-omap2plus_defconfig
   - clang-nightly-lkftconfig
   - gcc-10-lkftconfig-debug-kmemleak
   - clang-12-lkftconfig
   - gcc-10-lkftconfig-perf
   - gcc-10-lkftconfig-debug
   - gcc-10-lkftconfig-rcutorture


Build error:
------------
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
In file included from <command-line>:
mm/shmem.c: In function 'shmem_add_to_page_cache':
include/linux/compiler_types.h:352:38: error: call to
'__compiletime_assert_295' declared with attribute error: BUILD_BUG
failed
  352 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                      ^
include/linux/compiler_types.h:333:4: note: in definition of macro
'__compiletime_assert'
  333 |    prefix ## suffix();    \
      |    ^~~~~~
include/linux/compiler_types.h:352:2: note: in expansion of macro
'_compiletime_assert'
  352 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro
'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
      |                     ^~~~~~~~~~~~~~~~
include/linux/vm_event_item.h:148:30: note: in expansion of macro 'BUILD_BUG'
  148 | #define THP_FILE_FALLBACK ({ BUILD_BUG(); 0; })
      |                              ^~~~~~~~~
mm/shmem.c:721:20: note: in expansion of macro 'THP_FILE_FALLBACK'
  721 |     count_vm_event(THP_FILE_FALLBACK);
      |                    ^~~~~~~~~~~~~~~~~
make[2]: *** [scripts/Makefile.build:288: mm/shmem.o] Error 1
make[2]: Target '__build' not remade because of errors.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Steps to reproduce:
---------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch arm --toolchain gcc-10
--kconfig https://builds.tuxbuild.com/28hlyiP2D23NEFj3GPtiLeUE2Qy/config

Build link:
https://builds.tuxbuild.com/28hlyiP2D23NEFj3GPtiLeUE2Qy/

--
Linaro LKFT
https://lkft.linaro.org
