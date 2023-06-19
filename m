Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7364073514A
	for <lists+linux-next@lfdr.de>; Mon, 19 Jun 2023 11:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjFSJ7T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jun 2023 05:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbjFSJ7B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jun 2023 05:59:01 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FF310D2
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2023 02:58:16 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-44098ef627eso776617137.2
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2023 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168679; x=1689760679;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8R91KWhLlqQa5IHia14Lh3n7AuWHKsntgLNCQnZMkrs=;
        b=bqfr4uUqt++wGVOymMWddJpZTYI14r998nlh5OVa1OsPKWeYUR4VWH47IEQdLLJ38c
         Zk2FIoKzS9WiVhdXDsCMTUKFn2kCmtBPOKsNDSo+tVt4ulMw4GN1gL8ye9n84iW3g7Za
         MsRUKp2dxyw1GnCL5uKoNw1WmiaAIqzUVb7v1APqwDrnrH9N/H2XklTKFljA6svrXFCs
         brtlbTo43o3TtT/pCkoZI7aKBKd4Y/SfHmLn0kVS9XF4A+Sju9+kyM+f+nV4Co+DlLxj
         9Vj4sqNR9Nxt3H9K9XySv17FMuPYP/DJ4SaBWMZFvddJSIKLHcmmkVU/pA0GA/fGvN4R
         KAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168679; x=1689760679;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8R91KWhLlqQa5IHia14Lh3n7AuWHKsntgLNCQnZMkrs=;
        b=eMGTTtOmkpIF2OhwHwCOLgTtWBzO9DTF2yLfoc/KKpdf3WJy4y7HIysxZFzm9vMhKN
         aVgm5Oru7a/I+dgmCFut4bW7+sAvNxf4m4Dxhey36xXyzcWYgc0iPrqYxlI1Qxlclchi
         YO1Xs/fD5T9BB1NmmL1yAWjo+k37LGd4nsaZ0aW3+D1qNAn10Nytk66DZWoHrPp9s00y
         3vAunp8mLjlCnMfg4hmAVHHjdLFYfZrRuDDHZxqYa5Hc3+Rw6J2UFheLv4Ixgg9myeQY
         sazTg3lg1ZyxbZK4q4ORydd4tjnQxspwizmBil9d7QG0EfkEI6EjQIioeNNejVSK8DIA
         eYmQ==
X-Gm-Message-State: AC+VfDxzP1tvaF6xoliR0nEJ81OO8OjXKpEF77Rlo3XNOnyeV3kWxZVx
        owatcu9Xr21PRWs6k/wf7B+mqFkxCADfvnkOPYvoYV8ovBVrA2/xL7T25A==
X-Google-Smtp-Source: ACHHUZ6N23tfSeeo8xT7kBvfb+4Ec+L/vIFV69z/mRaXynHxks655SSCUUfWh5dwe80IlKS4/U0UT7reGK8Q9Oae038=
X-Received: by 2002:a67:f657:0:b0:43d:c3d8:b09c with SMTP id
 u23-20020a67f657000000b0043dc3d8b09cmr2265900vso.13.1687168678757; Mon, 19
 Jun 2023 02:57:58 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 19 Jun 2023 15:27:47 +0530
Message-ID: <CA+G9fYvtPPhG6w8Ge2_YOdQ6F0nSNA1q-2JLej=6gsyoCT-0ag@mail.gmail.com>
Subject: next: arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared
 function  'arch_atomic_long_fetch_or'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        lkft-triage@lists.linaro.org
Cc:     Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Anup Patel <anup@brainfault.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
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

Following build regressions noticed on Linux next-20230619.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on riscv:

 - build/rv32-clang-16-lkftconfig
 - build/rv32-clang-16-tinyconfig
 - build/rv32-clang-nightly-defconfig
 - build/rv32-clang-16-allnoconfig
 - build/gcc-12-defconfig
 - build/gcc-11-lkftconfig
 - build/clang-16-lkftconfig
 - build/rv32-clang-16-defconfig
 - build/gcc-8-defconfig
 - build/rv32-gcc-11-lkftconfig
 - build/clang-16-defconfig
 - build/rv32-clang-nightly-allnoconfig
 - build/rv32-clang-nightly-tinyconfig
 - build/clang-nightly-defconfig


arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared function
 'arch_atomic_long_fetch_or'; ISO C99 and later do not support implicit
    function declarations [-Wimplicit-function-declaration]
        return arch_atomic_long_fetch_or(val, (atomic_long_t *)ptr);
               ^
arch/riscv/kvm/aia_imsic.c:237:9: note: did you mean 'raw_atomic_long_fetch_or'?
include/linux/atomic/atomic-long.h:1087:1: note:
'raw_atomic_long_fetch_or' declared here
raw_atomic_long_fetch_or(long i, atomic_long_t *v)
^
1 error generated.

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17634187/suite/build/test/clang-16-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17634187/suite/build/test/clang-16-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17634187/suite/build/test/clang-16-defconfig/details/

Steps to reproduce:
# To install tuxmake to your home directory at ~/.local/bin:
# pip3 install -U --user tuxmake
#
# Or install a deb/rpm depending on the running distribution
# See https://tuxmake.org/install-deb/ or
# https://tuxmake.org/install-rpm/
#
# See https://docs.tuxmake.org/ for complete documentation.

tuxmake --runtime podman --target-arch riscv --toolchain clang-16
--kconfig defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
