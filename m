Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A5C40DB9A
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 15:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240253AbhIPNqm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 09:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240327AbhIPNql (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 09:46:41 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA1BC061574
        for <linux-next@vger.kernel.org>; Thu, 16 Sep 2021 06:45:21 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id c21so16995325edj.0
        for <linux-next@vger.kernel.org>; Thu, 16 Sep 2021 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CuDRdf94nh8ahjQ5dmyXV/DzX/ticPqZna0IdhNsx6Q=;
        b=ADlDcoNU+Pq3zJPekjQB3ysBZYbLLJuUjJ0ggyxhUh3l23WhDHJe0OA+3RBtzvkLaL
         riKiVAfTySYt7i2AR2nqJB8DLrqNkOgNwLurMZigXK4t+R7mbfoODaIwPAdzybFwqtEi
         gXQ22RCFm0BiOMDooVh7HlhtBZFIMazSE0MKMd13qNUS/sNT9eY3iTLcMAjr7NfoIliB
         4f/2yr52oLIGism7T/kYSqcj939z5RDHf+++H/V4rCx1OW592Ruc66LP4q1F+Ee+DLTT
         VEtTfea+tQb0+IjeGPGFECmdRDfTDBReWeg2IoShmQZn6bQ3QghRejQq+VwEunRt/Yi7
         fzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CuDRdf94nh8ahjQ5dmyXV/DzX/ticPqZna0IdhNsx6Q=;
        b=jMdOKoqCv0Q7w+VMD71698ra0e8TBB4YzshTxylr4F65PG4zuk36+XkApaXup+CSil
         q5HTbm02daXgO06ECmepzqdkBVAaGI2CTYFKNuioeoWJ+Rp84GBXHQQFWLxhl/lwre6J
         YE35sN2A1HhSr449CqGEynimuJLeWmxVx5SxJL+v2zSgPij4RQTufNMJDhNrQ28FpACZ
         X607vhOFTDxojyl/wffrLgHaEB0pU8gOp4VAbojK+Z5PlXc3AZ27b0RML3IzqS9/yQAf
         QfvBQBapjLqihcBnpP5RjaevYiqZpZRocsshc/JoesjZPeX1yP7VdvO8HCwTluMAayD1
         tFOw==
X-Gm-Message-State: AOAM533aJAKZlSLIAJJbf70vitbgKDocgXtZ1mMvsu1G2CffLJU84+iW
        ZYrUhJHCUPEV+lui1N+aTw/c9m80XdPIw68Q26iFOw==
X-Google-Smtp-Source: ABdhPJyQ45IBx7Fabd36aGEldKbrPCgbXM1LoYtPS7imQxgxjPnIvGFFB6GTQUFW83uB9WNBMYIHCUSQlhUI0RZc9VE=
X-Received: by 2002:aa7:dcd0:: with SMTP id w16mr6605186edu.288.1631799916008;
 Thu, 16 Sep 2021 06:45:16 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 16 Sep 2021 19:15:04 +0530
Message-ID: <CA+G9fYu0dngeohP9M39Odj5-5ax97ZgA=KqV8_g2yYLdOGMQSg@mail.gmail.com>
Subject: clang: error: unsupported argument '-mimplicit-it=always' to option 'Wa,'
To:     open list <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        lkft-triage@lists.linaro.org, llvm@lists.linux.dev,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build warnings/ errors noticed while building linux next-20210916
with clang-10, clang-11 and clang-12  for arm architecture.
      - allnoconfig
      - tinyconfig

But builds PASS with clang-13.

clang: error: unsupported argument '-mimplicit-it=always' to option 'Wa,'
make[2]: *** [/builds/linux/scripts/Makefile.build:288:
scripts/mod/empty.o] Error 1
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1329: prepare0] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2
make: Target '__all' not remade because of errors.

Build config:
https://builds.tuxbuild.com/1yDgHTBClkDVAW6MLcYwAdsXznO/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
--------------
    git_describe: next-20210916
    git_ref: master
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 368847b165bbfbdcf0bd4c96b167893dcdb13aba
    git_short_log: 368847b165bb (\"Add linux-next specific files for 20210916\")
    kconfig: [
        allnoconfig
    ],
    kernel_version: 5.14.0
    target_arch: arm
    toolchain: clang-12

Steps to reproduce:
tuxmake --runtime podman --target-arch arm --toolchain clang-12
--kconfig allnoconfig

--
Linaro LKFT
https://lkft.linaro.org
