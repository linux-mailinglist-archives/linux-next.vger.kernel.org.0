Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585C96AFED9
	for <lists+linux-next@lfdr.de>; Wed,  8 Mar 2023 07:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjCHGYP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Mar 2023 01:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCHGYO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Mar 2023 01:24:14 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6F18FBF1
        for <linux-next@vger.kernel.org>; Tue,  7 Mar 2023 22:24:12 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id s23so10558430uae.5
        for <linux-next@vger.kernel.org>; Tue, 07 Mar 2023 22:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678256651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7iEsdmzySCAHETYroYPIVFn331WafPxHl+LoZueYXCE=;
        b=s1pfimS8PsuNvnwnbXrIwD1a6+s8Q8xVAtoVmzs39BvDvmjChb3lvA8g9f4p6kzUQN
         PYa0TrMi6CF5P4CF+NSjR3mzqEMvjkCgg7gaetmDcTBCNAj1telj4/4UWhDB6wKa0CPV
         yFvvSyEFZU3QwGZoq3ukY9Y0lF07bG7GVf3YfSHY+w2c6XKb4pt+Figa0n6CQyLdycry
         Z7e2rUYcQh+Pt7FLIDF2/k2uJSV3/qhZxZh8Q4xX4cJ+TWlLcvW4sp8P7luwmxinj8c4
         LYGRsmaH6yVHlccV7wr+KozpXdxtZprNqhPkj4BicJgXz+8kutShpOtccavpZ4Fv7hzf
         GRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678256651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iEsdmzySCAHETYroYPIVFn331WafPxHl+LoZueYXCE=;
        b=3i/BQEuUEHAU0Zd6mVl1eCb4Za0MLvB4soHaqWzYABx7yPsTF16wer7yJYc31dRpoj
         z71jnMUUmmn9tgFmQ1P8vQarS3wWa2m7j9SdPqjgcQ3+LrLWxIDU9d+Jb4agaNJnQB5w
         AiyP74UXwromR7iEAXXYLiIoDdAuiclLvrODcXxEhfX1gyEQZ6CVjOhnK4+O8FGjMbxW
         4xjO7dEPmhbWIjTjSCSgJe7PjFkQ9Q+wBdUtOjT+xus5pHPDrdjfy9YX1gGWdv615XMJ
         l8At7enMb4SDccwusZWfk5OvdTMct/yTeXa/L7IQ+qJ5dNnLs2Cst0ropXEDVAXJo8ku
         UqYQ==
X-Gm-Message-State: AO0yUKVLeqz7iuoUuZgrxpcaqHj4FuEdhLfZc6MqNgbG/q3q2Nkew8Hp
        CULed6LM5Fo4/TmKc21Hd5G6PtMJirhR3PKniUsrSg==
X-Google-Smtp-Source: AK7set8A7ktAm+MaUEFVkop8QSnVHXif7b1sfffl7ZZNI3unrHh0vcS4Y4foM5hA5gVpoOaGfpTAB7xd6JrSDkGv7f0=
X-Received: by 2002:ab0:4a12:0:b0:68b:b624:7b86 with SMTP id
 q18-20020ab04a12000000b0068bb6247b86mr11470456uae.2.1678256651091; Tue, 07
 Mar 2023 22:24:11 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 8 Mar 2023 11:53:59 +0530
Message-ID: <CA+G9fYvi5VHtAidNJMvXuAyutC+ByA9UL9uNnUYqtgKn8mPUiQ@mail.gmail.com>
Subject: next: arm: multi_v5_defconfig : drivers/clk/mvebu/kirkwood.c:358:1:
 error: expected identifier or '('
To:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Results from Linaro=E2=80=99s test farm.
The arm multi_v5_defconfig builds failed on Linux next-20230308 with
gcc-12, gcc-8 and clang-16.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on arm:
  - arm-clang-16-multi_v5_defconfig
  - arm-gcc-8-multi_v5_defconfig
  - arm-clang-16-multi_v5_defconfig-65236a87
  - arm-gcc-10-lkftconfig-perf
  - arm-clang-nightly-multi_v5_defconfig
  - arm-clang-nightly-multi_v5_defconfig-65236a87
  - arm-gcc-12-multi_v5_defconfig
  - arm-gcc-12-multi_v5_defconfig-65236a87


drivers/clk/mvebu/kirkwood.c:358:1: error: expected identifier or '('
CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
^
include/linux/clk-provider.h:1367:21: note: expanded from macro 'CLK_OF_DEC=
LARE'
        static void __init name##_of_clk_init_declare(struct device_node *n=
p) \
                           ^
<scratch space>:134:1: note: expanded from here
98dx1135_clk_of_clk_init_declare
^
drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal con=
stant
include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_DEC=
LARE'
        OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
                                        ^
<scratch space>:135:3: note: expanded from here
98dx1135_clk_of_clk_init_declare
  ^
drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal con=
stant
include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_DEC=
LARE'
        OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
                                        ^
<scratch space>:135:3: note: expanded from here
98dx1135_clk_of_clk_init_declare
  ^
drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal con=
stant
include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_DEC=
LARE'
        OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
                                        ^
<scratch space>:135:3: note: expanded from here
98dx1135_clk_of_clk_init_declare
  ^
4 errors generated.
make[5]: *** [scripts/Makefile.build:252: drivers/clk/mvebu/kirkwood.o] Err=
or 1

Build details,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230308/te=
strun/15340690/suite/build/test/gcc-12-multi_v5_defconfig/history/
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230308/te=
strun/15340737/suite/build/test/clang-16-multi_v5_defconfig/history/

Build details:
-----------
  build_name: gcc-12-multi_v5_defconfig
  git_describe: next-20230308
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: fc31900c948610e7b5c2f15fb7795832c8325327
  git_short_log: fc31900c9486 ("Add linux-next specific files for 20230308"=
)
  config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2MiJgpcJnp=
b5pXUw3zA2ZxRByOb/config

Steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch arm --toolchain gcc-12
--kconfig multi_v5_defconfig

--
Linaro LKFT
https://lkft.linaro.org
