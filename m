Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BA441EAF3
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 12:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352681AbhJAKce (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 06:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhJAKcd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 06:32:33 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5A8C061775
        for <linux-next@vger.kernel.org>; Fri,  1 Oct 2021 03:30:49 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id l8so33310766edw.2
        for <linux-next@vger.kernel.org>; Fri, 01 Oct 2021 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QEE5+eR1PTRsf7Cn1O7pyaGGfFF+vSbOIpx5p0aBTl0=;
        b=CqEmUk3io5LxKbnJnIofkJShoydE3T5j+Eo8LRewYlm/6BpATFlKewrzPHkKd6+JJy
         ivPXQ6VtD1CSEikPoNgq5bMThRKdbVo0o0zC9d737DLdx6KXDqZx+czpwNN3ybSeRLgI
         iWeIye89fSKYWIdF0d4d3aGh9Jy/MTg3GOWWsykMePgoGkCMQ89mBBT+f1pSMuw0d8oA
         DcZ3xzRW+EqSDHSHWSaG328KbfsRX4XvSJF1H/9Kf7NhXq0sykWUGsATko43FvqUSeC4
         v1+mZZd3mCwj8EAVpetgYHCPPeWHjpUxVZfvLC1muBQGDEhSvE3ad5qpBTdEQZEQFZFp
         3irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QEE5+eR1PTRsf7Cn1O7pyaGGfFF+vSbOIpx5p0aBTl0=;
        b=jhyVfjvQe4ewwnm6TpR8LJ74RG95Fa6wg1Wum1G/xDITCQwLV3s9+Q7aaVvab2tcLe
         DuuUsDfJFI/frvP1XC2BFO2HZHhhPxb+6G5jt0qouD/lkhfxmH84bk60Ruh7WcjO4skz
         hJtBS976XihiwIn7ZA+J6WTwXcd0M34nGrkLJeDypLLudsIGBadAk2kUmSCUvWmKF3Zn
         ADVDbTYCXOuTlyDUMCBSzPBHQj64mmpnXmFIAnrxGyL9ijbyeKVeYU7+KOt4MOs6Vc+9
         tnrghcU5K30QAKe6EJq25Beff5QMRbztH9jOsw3cHho1bYCIz8CLzpaoluC1qAK9A1XP
         5gGg==
X-Gm-Message-State: AOAM533LNkOHTnhtwCGKFNKv7bzw+JVVkFr/i+HTQTW3OFEc86XIWVpl
        wx7dMdRYK9DV4dDlvoytz56ajlIc0MqnOg+JA6rHKg==
X-Google-Smtp-Source: ABdhPJxOwe2DdMM4rV12tDoZFekSO5C3xyP/cXPE2zkP/P0J8YDu1zphyQs6RNWhfjff8e6CFoPBoxKq+N+rhnN4Nko=
X-Received: by 2002:a50:bf07:: with SMTP id f7mr13553425edk.288.1633084247906;
 Fri, 01 Oct 2021 03:30:47 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 1 Oct 2021 16:00:36 +0530
Message-ID: <CA+G9fYtsteSfwTQKV8o6VtBQDoz-+nwOf0s0X8BCkQHgAc6sdw@mail.gmail.com>
Subject: parisc/unwind: call callback with toplevel address
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
        James.Bottomley@hansenpartnership.com,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build errors noticed while building Linux next 20211001
with gcc-11 for parisc architecture.

arch/parisc/kernel/stacktrace.c: In function 'dump_trace':
arch/parisc/kernel/stacktrace.c:20:13: error: 'regs' undeclared (first
use in this function)
   20 |         if (regs)
      |             ^~~~
arch/parisc/kernel/stacktrace.c:20:13: note: each undeclared
identifier is reported only once for each function it appears in
arch/parisc/kernel/stacktrace.c:21:22: error: implicit declaration of
function 'fn' [-Werror=implicit-function-declaration]
   21 |                 if (!fn(cookie, regs->iaoq[0]))
      |                      ^~
arch/parisc/kernel/stacktrace.c:21:25: error: 'cookie' undeclared
(first use in this function)
   21 |                 if (!fn(cookie, regs->iaoq[0]))
      |                         ^~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:288:
arch/parisc/kernel/stacktrace.o] Error 1

Build config:
https://builds.tuxbuild.com/1ytbtyEg5SDSQgS2Oj9RsCM4ZmS/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

meta data:
-----------
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: a25006a77348ba06c7bc96520d331cd9dd370715
    git_short_log: a25006a77348 (\"Add linux-next specific files for 20211001\")
    kconfig:  defconfig
    kernel_version: 5.15.0-rc3
    target_arch: parisc
    toolchain: gcc-11

steps to reproduce:
https://builds.tuxbuild.com/1ytbtyEg5SDSQgS2Oj9RsCM4ZmS/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
