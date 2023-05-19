Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709F0709497
	for <lists+linux-next@lfdr.de>; Fri, 19 May 2023 12:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjESKQm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 May 2023 06:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjESKQl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 May 2023 06:16:41 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFE6134
        for <linux-next@vger.kernel.org>; Fri, 19 May 2023 03:16:40 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-456fbddd3e8so411644e0c.3
        for <linux-next@vger.kernel.org>; Fri, 19 May 2023 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684491399; x=1687083399;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6EiwrUrF4SSUt0Q7+CJ+0Cng8L06giBO4JipeTmDbM4=;
        b=BzJjHDZ0p3kCCtmYeR4Y99no05o/MBH8iAAHa421lYBped9U2fjZX4pWh2dmqbob8Z
         IRyz7gdfFpRHFCvnMiUCbdTrHErz1xMq5fwcp1Xm2Ei8EeneVaqvFB4dQx2eD/uYP6L4
         ztGema4DUjoRFrO8lKFBz/ATASsAYKLcRn5FHztp6kJFriiprPMuqe2nbPN5Qd5FK7gh
         EqHHg0XPtBtRXyVZ6Gj6nOpCNjVjlUmdNTfv4kC8xcGtlCMJKe0JOQBQr9e69EpnOFFk
         kQWX2cQFDlJwFpl/dNJ1+euHp6XH7IgaFueZQRYOpHQA6lcdK9ti7cRyQUx/pmAaayr/
         TIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491399; x=1687083399;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EiwrUrF4SSUt0Q7+CJ+0Cng8L06giBO4JipeTmDbM4=;
        b=Nl6tl8kYjR/Kn057o6MM+Mek34VsN1Q3+6ZihbDBzvzYeYZYp26R2n1PdC805Akxk+
         x7T9HpsgXSRFXDOZ/LZisrSbudWceEuHaR6WpWtq7giBaC8+V7GJA39wcsbR01w818kb
         Ldsw1ulQH37EgHy3ektBJeMpbXK8wPcDBVBZ1USjGrKPF56U5kPV3yS7t7hW/vqlGvxU
         27O+u54C3T4xaCRjAeGj6O5xNPBa8AsjNi/uf5z3onM8OCVcPF/6HgLSt2jE2+dLqTG6
         xEZxBEynd3BC1u1PTc1H1KaRfK6VkQHBTVYTlrVjGw4yrxmslMKBm6Qc7Isej6tK8UyG
         gBYw==
X-Gm-Message-State: AC+VfDx8ZEMRKdEKXite53aq4n9A8J1JaYA+kDWYaXZ+kbpcXynrP3dc
        v90TTSsHq/7FKz8etcx8bfuwyzWLUiNLMTWRFtWvAw==
X-Google-Smtp-Source: ACHHUZ7x4mBNByf3+rpGGd6sFR6V+BIlYdbvd5WOQ84S7rvSyIqyXvmZTc8VI0Z2B7UaHBIGhRN+w6w7IN/diFRUNtQ=
X-Received: by 2002:a1f:3d84:0:b0:456:f0d8:fe9c with SMTP id
 k126-20020a1f3d84000000b00456f0d8fe9cmr321888vka.3.1684491399387; Fri, 19 May
 2023 03:16:39 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 19 May 2023 15:46:28 +0530
Message-ID: <CA+G9fYud2YH1c9Hxekd-pi8VsD4HmA4v9g-mr-vRPqaRQd2F5w@mail.gmail.com>
Subject: next: WARNING: CPU: 0 PID: 63 at kernel/workqueue.c:1999 worker_enter_idle+0xb2/0xc0
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        clang-built-linux <llvm@lists.linux.dev>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next 6.4.0-rc2-next-20230519 fails intermittently on qemu-x86_64
with the following kernel warning. The occurrence is 3 times out of 100 times.
Noticed with gcc-12 and clang-17 built kernels.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
-----------
<4>[    2.460214] ------------[ cut here ]------------
<4>[    2.460602] WARNING: CPU: 0 PID: 63 at kernel/workqueue.c:1999
worker_enter_idle+0xb2/0xc0
<4>[    2.462163] Modules linked in:
<4>[    2.463401] CPU: 0 PID: 63 Comm: kworker/0:2 Not tainted
6.4.0-rc2-next-20230519 #1
<4>[    2.463771] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
BIOS 1.14.0-2 04/01/2014
<4>[    2.465127] Workqueue:  0x0 (events)
<4>[    2.465678] RIP: 0010:worker_enter_idle+0xb2/0xc0
<4>[    2.466095] Code: e0 93 04 00 48 03 35 7d 59 bc 01 e8 48 1e 0a
00 8b 43 3c 39 43 38 75 06 83 7b 24 00 75 0c 5b 5d c3 cc cc cc cc cc
0f 0b eb f4 <0f> 0b eb f0 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90
90 90 90
<4>[    2.467476] RSP: 0000:ffffa44a4042feb0 EFLAGS: 00000086
<4>[    2.468003] RAX: 0000000000000003 RBX: ffff8d71bbc2b000 RCX:
0000000050480000
<4>[    2.468470] RDX: 000000010000087f RSI: 0000000000000086 RDI:
0000000000000001
<4>[    2.468900] RBP: ffffa44a4042feb8 R08: 0000000000100000 R09:
0000000000000001
<4>[    2.469608] R10: ffff8d7140882d80 R11: 0000000000000000 R12:
ffff8d71bbc2b028
<4>[    2.470204] R13: ffff8d7140882d00 R14: ffff8d71bbc2b000 R15:
ffff8d71413df700
<4>[    2.470720] FS:  0000000000000000(0000)
GS:ffff8d71bbc00000(0000) knlGS:0000000000000000
<4>[    2.471248] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[    2.471648] CR2: ffff8d71bffff000 CR3: 0000000123e40000 CR4:
00000000000006f0
<4>[    2.472614] Call Trace:
<4>[    2.473152]  <TASK>
<4>[    2.474182]  worker_thread+0x71/0x430
<4>[    2.474992]  ? _raw_spin_unlock_irqrestore+0x28/0x50
<4>[    2.475263]  kthread+0x103/0x120
<4>[    2.475493]  ? __pfx_worker_thread+0x10/0x10
<4>[    2.476355]  ? __pfx_kthread+0x10/0x10
<4>[    2.476635]  ret_from_fork+0x2c/0x50
<4>[    2.477051]  </TASK>
<4>[    2.477785] ---[ end trace 0000000000000000 ]---
<6>[    2.748347] tsc: Refined TSC clocksource calibration: 2899.874 MHz
<6>[    2.749124] clocksource: tsc: mask: 0xffffffffffffffff
max_cycles: 0x29cccc5071e, max_idle_ns: 440795322437 ns
<6>[    2.751064] clocksource: Switched to clocksource tsc

log:
-----
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230519/testrun/17078554/suite/boot/test/clang-nightly-lkftconfig/log

 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230519/testrun/17078554/suite/boot/test/clang-nightly-lkftconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
