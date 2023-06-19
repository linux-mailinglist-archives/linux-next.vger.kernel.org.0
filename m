Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE05734F6E
	for <lists+linux-next@lfdr.de>; Mon, 19 Jun 2023 11:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjFSJQc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jun 2023 05:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbjFSJQa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jun 2023 05:16:30 -0400
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AE5137
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2023 02:16:25 -0700 (PDT)
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-460eb67244eso929307e0c.1
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2023 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687166185; x=1689758185;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jpyu9+vUxnLoEwJKh4R9bRZU6gQu+Nc3NINbivt7AnY=;
        b=YRpT193ywlG8pkN22LtvJ38LsMh94m1cIfP/+wJn7vAWCjNejMJ7qLhIdcqEcyMTos
         iSSO1/ebR5xchpTcOd+Ni6oD7TRDhcg1Fv5u+xfN9qC/34vrKRQu6tLBBZc1FgogYaQM
         gWliN5UNCxgHi6jEy79ZngcDH5A8d4Fk67byMPuS5Q6PLVyvqoFkoI29XguiBtBf8BQt
         /CBIALugQqjouNjrX2AY9tXMPCgmHS6xYu+cqAxjEhgsOXeqptp3M26F8EAFF8c9sHEX
         YHHdos00HCtBe6huz9yyWPNIEzTtvFursWTyaXzxMgQOvly6VtM64lgp7SHluDOD+6G2
         bN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166185; x=1689758185;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jpyu9+vUxnLoEwJKh4R9bRZU6gQu+Nc3NINbivt7AnY=;
        b=ll0OELVFc/h4TRI8iJmCN/4H6S+jSbXuIE7Qb8F1HgDnaqARfuB6WEZQq2qIzCXHXW
         IWCQsisYiIH00EvLjrmAA3gx+f/iIhLrzX6vfsPhaqm2Wl6KTdaT0a6Mt+T1rzrQ202i
         QdeK2YVHCuKq+xCO2HRxXiKWd2jU8D2EO7oBNcuvO60Z5X7Bs08zpjYMiZJLMzB6Rhx8
         5v3inY2i93vNEfSmGNgFb7hUER30E0OUJX8S5lMhUB03vNsGPMixvb9hz2OPnk/1LqNH
         SUkiUdKBSVmSjS9pvlgKIaI005XdSl+avjxv/cF/7Nz/mekOY1zZzNgwDTI2ERL6d8nn
         Sobg==
X-Gm-Message-State: AC+VfDzAedcSiGLtMjM+t2+4U1AQPfaepqlkoCSda+9VjeYOlp5GQpER
        cpm0vqQLmjKalZZBGRTG/8oyY39jiaQ5mAFp5nKt8w==
X-Google-Smtp-Source: ACHHUZ4prwk7uRDs24/5AJ2ByEVDUQzD436D3NF1yQPr176M3WlLyTAW5ovN/35k/xVtHnpMfVjAjs5EDH8oApP2MPY=
X-Received: by 2002:a1f:cc06:0:b0:471:cea:3d62 with SMTP id
 c6-20020a1fcc06000000b004710cea3d62mr1527615vkg.2.1687166184000; Mon, 19 Jun
 2023 02:16:24 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 19 Jun 2023 14:46:12 +0530
Message-ID: <CA+G9fYskONbUxqfDMC8H0yBODc86CSSsezzky46iG-=rHS=YHg@mail.gmail.com>
Subject: next: arch/powerpc/kernel/stacktrace.c:171:9: error: implicit
 declaration of function 'nmi_cpu_backtrace'
To:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
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


Regressions found on powerpc:

 - build/clang-nightly-maple_defconfig
 - build/gcc-8-maple_defconfig
 - build/gcc-12-maple_defconfig
 - build/clang-nightly-cell_defconfig
 - build/gcc-12-cell_defconfig
 - build/gcc-8-cell_defconfig
 - build/clang-16-cell_defconfig
 - build/clang-16-maple_defconfig

Build log:
arch/powerpc/kernel/stacktrace.c: In function 'handle_backtrace_ipi':
arch/powerpc/kernel/stacktrace.c:171:9: error: implicit declaration of
function 'nmi_cpu_backtrace' [-Werror=implicit-function-declaration]
  171 |         nmi_cpu_backtrace(regs);
      |         ^~~~~~~~~~~~~~~~~
arch/powerpc/kernel/stacktrace.c: In function 'arch_trigger_cpumask_backtrace':
arch/powerpc/kernel/stacktrace.c:226:9: error: implicit declaration of
function 'nmi_trigger_cpumask_backtrace'; did you mean
'arch_trigger_cpumask_backtrace'?
[-Werror=implicit-function-declaration]
  226 |         nmi_trigger_cpumask_backtrace(mask, exclude_self,
raise_backtrace_ipi);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         arch_trigger_cpumask_backtrace
cc1: all warnings being treated as errors


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17629288/suite/build/test/gcc-12-cell_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17629288/suite/build/test/gcc-12-cell_defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230619/testrun/17629288/suite/build/test/gcc-12-cell_defconfig/details/

Steps to reproduce:
# To install tuxmake to your home directory at ~/.local/bin:
# pip3 install -U --user tuxmake
#
# Or install a deb/rpm depending on the running distribution
# See https://tuxmake.org/install-deb/ or
# https://tuxmake.org/install-rpm/
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch powerpc --toolchain gcc-12
--kconfig cell_defconfig

--
Linaro LKFT
https://lkft.linaro.org
