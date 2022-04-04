Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47394F1276
	for <lists+linux-next@lfdr.de>; Mon,  4 Apr 2022 11:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354009AbiDDKAv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Apr 2022 06:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348790AbiDDKAu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Apr 2022 06:00:50 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866F1AE6B
        for <linux-next@vger.kernel.org>; Mon,  4 Apr 2022 02:58:54 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2eb680211d9so22427367b3.9
        for <linux-next@vger.kernel.org>; Mon, 04 Apr 2022 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BSO0kFh3YEWrUECL7RSnVqkqACtkuW55j7gZPsyRTko=;
        b=ax8AZ1pm4ofTW+s0FnLRVMNYlqHoNDED5O0kTeYCr19DQHGTWUrgy54PtSPmwsxEr0
         CugW/TfIWmE5ZrEaHDHmkXvKL/KlXAbkXRbaq1h6hvgSS4zIGu/ugQjHbhlRQcc+qXYK
         JiTr2Yr4m2w4C87NSpvzhpLhe+tX875Fhog4L0K398FAbtph3dAs1+29F7HViZ8llf4/
         SNoYtYW7EoQudSJ8Et6LSW6s+fVN19jj6y+TVk7j4+CNHNQ5iesSEG9igyq3uggL7Hhq
         yYglHofcVo2rkMaDar9g6lsNEgI1UEvgnviQKcb2hSn88aGKvntd9MJS6iGDXtpFuEc6
         F7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BSO0kFh3YEWrUECL7RSnVqkqACtkuW55j7gZPsyRTko=;
        b=sRbjYLvfE3KyNLRQjVHwpLKawW1jXcb6vIHgN+cg29MN6rWOUAF/4j8nLJ7VQj88fl
         lrG9Sed9s0tDHhBcV0PTuvN7dPzDhgzUEm1xdzQircit/vW38P0ia9kKxL8AJC0CRUOv
         ixuMUexNB5n8AFu5Omh3LvAwr5/JTMhcIx4nnkMJh0BKArtfX68NwtMy/be7uoU2TpEa
         ohIYIPC5uZJLgzY2RZk2lMmTV5mYg0v/ZNHGP4upGyINquPHa1ta7in714TJKnStq8RO
         84l/L5iOTEwm0rYGdwQBGSaB4p6xK9FsJNFkNmczVyHpyjkrnK8Abt51vrIOco6uc5/U
         n9QA==
X-Gm-Message-State: AOAM533tejs+lafzaUOP7fvpj+H2spcAIWBFEh8RFqX6DBl9zQynN+0M
        WeqYdeDhv/ThVvR4QkYy869eWzjSoU3+gwjYG7aGuVIW5HJLS9WX
X-Google-Smtp-Source: ABdhPJyFL3cKn7V7sre/I6PQA8Oqq4hzE7C9nhhnTPXZUCObFfK1+FNV4saECxlTNxJ/XzfZ+W6EaQDzGSl+ASXQgsw=
X-Received: by 2002:a0d:ffc3:0:b0:2eb:2327:3361 with SMTP id
 p186-20020a0dffc3000000b002eb23273361mr13812616ywf.36.1649066332945; Mon, 04
 Apr 2022 02:58:52 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 4 Apr 2022 15:28:41 +0530
Message-ID: <CA+G9fYu_ZHOeOPDiwzXGL6Re8aFYW3K+JSL2Dozw=VHwaUFxyQ@mail.gmail.com>
Subject: [next] riscv: Linux next-20220404 riscv defconfig builds failed.
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        lkft-triage@lists.linaro.org, regressions@lists.linux.dev
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Guo Ren <guoren@linux.alibaba.com>,
        Guo Ren <guoren@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next-20220404 riscv defconfig builds failed.

Regressions found on riscv:
   - riscv-riscv-clang-14-defconfig
   - riscv-riscv-gcc-10-defconfig
   - riscv-riscv-clang-13-defconfig
   - riscv-riscv-clang-12-defconfig
   - riscv-riscv-clang-11-defconfig
   - riscv-riscv-gcc-11-defconfig
   - riscv-riscv-gcc-8-defconfig
   - riscv-riscv-gcc-9-defconfig
   - riscv-riscv-clang-nightly-defconfig


arch/riscv/kernel/compat_signal.c:7:10: fatal error:
linux/tracehook.h: No such file or directory
  7 | #include <linux/tracehook.h>
    |          ^~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.build:289:
arch/riscv/kernel/compat_signal.o] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
    git_describe: next-20220404
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 696206280c5e5c028caf9fd259999cb72b1f6127
    kconfig: defconfig
    target_arch: riscv
    toolchain: gcc-11

steps to reproduce:
  # To install tuxmake on your system globally:
  # sudo pip3 install -U tuxmake
  #

  tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig


--
Linaro LKFT
https://lkft.linaro.org


[1]  https://builds.tuxbuild.com/27JdBBUbSHIhFJ9Wsq3Z6ssitb6/
