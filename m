Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8BE64C2E53
	for <lists+linux-next@lfdr.de>; Thu, 24 Feb 2022 15:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbiBXOYA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Feb 2022 09:24:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235492AbiBXOX6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Feb 2022 09:23:58 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE471637EA
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 06:23:21 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2d6d0cb5da4so26681707b3.10
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 06:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=GVCRdf20z2if/WXkRWAWqNzxqWMrdd3fec2HBGui9Y4=;
        b=vpT0MGtjheNDD9UYyeQ9IF6ps2q6c5IYS7+YVX48yc4tWpxLckATwez9vl/fmKvKOu
         Un5tTk7mFMOKmEWwBimuEknvcP6F2sB3NkCGOVULWA773CqcI2y5x05UrJOEey09Y1Qe
         OJShbXk5oyDvWqTq2i9Ka5PCylSOR65FEwGo+hLe7OBJJig283XCAj/gVM7L7OOgVVkt
         XNRb/aPlYGIrf3l6nSI8wk/DbPGeeiUIuLdESZg34GXkZggbWQM6xlBatPy6Dy+uJnjp
         QWqq5zGiDQokTk0lCmwIrW6YT4xsP5OmXZCfFSVzLpNS4fCcMsnPPNCUwqQQerPw/0V7
         QxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=GVCRdf20z2if/WXkRWAWqNzxqWMrdd3fec2HBGui9Y4=;
        b=he7n+yBsEfYIC4GaguZFpu4Cr23wYen/PTOG3JrpgZt/rMXtPTcUSS9QzikghoiGQh
         WKTdmE94neTamQjqKE3+fYkQnzjpdq/zNemJNgClolqGL0zDe+Rw46zO3NpJOIli5SUd
         iqzOEL24lyULwreHj3XEoFmd5RrdsbtgFV9uVEt1Gr3KQE46EK0l4YV6mobDSQ6ubzv5
         ublJe/9Jd7OSeQiq/HGknqIPR9gAlEj/Ub9pXSsBH/TtqfjWAgxO2pSMj3ATxk0QTQyb
         CaUc++06YvXjlq5+hXfnmVTxILwlVc6yiAQy3eO2g1lHPywzh3Kr+IjmQNdNiEmlicns
         DJtg==
X-Gm-Message-State: AOAM531PNdfXthDoUq2Q4Ip9NsPrukA6fsFxi08rje1RufiQJ4b0Jw57
        zIHAaisVJ8BjrelvGVwpS6ebdhqDx0JOM2uWydEAP+kT6rbvNg==
X-Google-Smtp-Source: ABdhPJy/5/6AxH9eFRdpjQp6L9u+IiFuFnYk1TdAAYF24CLqBAoWxW4orYo4f65bn53WsTGYXwmnMlZI0suLijbIyQ4=
X-Received: by 2002:a81:7812:0:b0:2d0:8c2c:5159 with SMTP id
 t18-20020a817812000000b002d08c2c5159mr2626955ywc.120.1645712600221; Thu, 24
 Feb 2022 06:23:20 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 24 Feb 2022 19:53:09 +0530
Message-ID: <CA+G9fYuhipgPsHetpvBmD4GO7KGfhSRRAAgN2ZnoFUWiCKMy6Q@mail.gmail.com>
Subject: [next] riscv/kernel/vdso.c:123:27: error: 'next' undeclared
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Cc:     "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Tong Tiangen <tongtiangen@huawei.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
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

[Please ignore this email if it is already reported]

Linux next-20220223 arch riscv builds failed due to following errors.
Build configs:
  - riscv-gcc-9-defconfig
  - riscv-gcc-9-defconfig
  - riscv-gcc-10-defconfig
  - riscv-gcc-11-defconfig

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: d4a0ae62a277377de396850ed4b709b6bd9b7326
  git_describe: next-20220223
  arch: riscv
  toolchain: gcc-11

Build error:
-----------
In file included from arch/riscv/kernel/vdso.c:10:
arch/riscv/kernel/vdso.c: In function 'vdso_join_timens':
arch/riscv/kernel/vdso.c:123:27: error: 'next' undeclared (first use
in this function); did you mean 'net'?
  123 |         for_each_vma(vmi, next) {
      |                           ^~~~
include/linux/mm.h:685:49: note: in definition of macro 'for_each_vma'
  685 | #define for_each_vma(vmi, vma)          while ((vma =
vma_next(&(vmi))) != NULL)
      |                                                 ^~~
arch/riscv/kernel/vdso.c:123:27: note: each undeclared identifier is
reported only once for each function it appears in
  123 |         for_each_vma(vmi, next) {
      |                           ^~~~
include/linux/mm.h:685:49: note: in definition of macro 'for_each_vma'
  685 | #define for_each_vma(vmi, vma)          while ((vma =
vma_next(&(vmi))) != NULL)
      |                                                 ^~~
make[3]: *** [scripts/Makefile.build:288: arch/riscv/kernel/vdso.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:614: arch/riscv/kernel] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1971: arch/riscv] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/25XO99nwfQgKrWKz4yfBPYw0wyU/
