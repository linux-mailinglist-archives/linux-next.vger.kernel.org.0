Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DEE3A7D03
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 13:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhFOLWK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 07:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhFOLWJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 07:22:09 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDA4C061574
        for <linux-next@vger.kernel.org>; Tue, 15 Jun 2021 04:20:03 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id g8so21960470ejx.1
        for <linux-next@vger.kernel.org>; Tue, 15 Jun 2021 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BEeCJM2cPKJxTO4MU9AOQWvAy0+MkYh0MYy81JYGv9Y=;
        b=qvu/cXi8LAEVvTXCOgV6EdujzUvor9gxWDJoh8e5/wgsdBPRFBJ9L2EK4uKNtfR3ty
         mVHuBDENDndaLxF2UZ8qTSVE1s+oOADiGbptv31TDjJiWDQ/Cn+TGkj53Afn1OA9neQn
         MNEm1P9hheTcmMkl/ybxp8hL0LG3TbehBOk2fCBL10FzmFYhkQxp/k/F3CEwaXjIRBpT
         NtR2B+HyMmjThVRgE+FNQM0rYt4esAmRHBwSekUacelfTowzOOtv45Z+FFjwtv2nrhCg
         awG7WAKI/rCCH4Zud+Qwe+JNVbOGolpSAz86lci7fAcnEdzylVI8H0jqUV3KDysasJQA
         LVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BEeCJM2cPKJxTO4MU9AOQWvAy0+MkYh0MYy81JYGv9Y=;
        b=IFRso3EWdGvF+i2isJsGaSRxVLDGilsYttrWxpAP9/ZJT7NJfzFykjSbmrTbYFlbI8
         TVzZitYxEPYjYCjTilkRBWey7cJmMMJfc8ArtPXFefFhQfxeaMuS1I70JrznMiN9UuCm
         lGdHZEem52e3L6dsVDWsQ30YQBSKuhb0f/p87O+4xketvST5vv+frTokqw0q/VnsVyMe
         dgUYWlr4ufrqQqiBW94FIy7kWoPdfYFwBQBhh7XhntWWr/bTd/jIopXmxyTyJuLSZfYG
         wsKl8wc9IY4rFlc1ug+V5zf9p7KHQMDSiEELJJVea/VLe9zRaJqDXUCPPvjaU5euQM6c
         TLog==
X-Gm-Message-State: AOAM531VldJuLz9fxBWS4G4klE93tQooO+4/q6R56dFwqrkLZPOqJfpo
        3sfF8WgcOWGTqJzAXC+4zxDDGLf72RpMFgNkWbAKjmPoZjDu1MDt
X-Google-Smtp-Source: ABdhPJzT57iI3YtjjS5AfKOAwwRgoVfgmuebs6puFU4WEFVvmHewgzsj8wKFUxJnNKvCZFnkwFAKaz6nqTh+C7t9qRs=
X-Received: by 2002:a17:906:480a:: with SMTP id w10mr3748711ejq.18.1623756001316;
 Tue, 15 Jun 2021 04:20:01 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 15 Jun 2021 16:49:50 +0530
Message-ID: <CA+G9fYurEcTfV7Z=co2Ki-TubF4d-Ext7ivZPaQT9SR5XazUtQ@mail.gmail.com>
Subject: [next] [arm64] Unable to handle kernel NULL pointer dereference at
 virtual address 0000000000000068
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>, lkft-triage@lists.linaro.org,
        regressions@lists.linux.dev
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following kernel crash reported while booting linux next 20210615 tag
on qemu_arm64.

Crash log:
-------------
[    0.767379] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000068
[    0.769815] Mem abort info:
[    0.770735]   ESR = 0x96000004
[    0.771598]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.773008]   SET = 0, FnV = 0
[    0.773865]   EA = 0, S1PTW = 0
[    0.774844]   FSC = 0x04: level 0 translation fault
[    0.776195] Data abort info:
[    0.776968]   ISV = 0, ISS = 0x00000004
[    0.778010]   CM = 0, WnR = 0
[    0.778961] [0000000000000068] user address but active_mm is swapper
[    0.780643] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.782189] Modules linked in:
[    0.783098] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
5.13.0-rc6-next-20210615 #1
[    0.785239] Hardware name: linux,dummy-virt (DT)
[    0.786626] pstate: 00000005 (nzcv daif -PAN -UAO -TCO BTYPE=--)
[    0.788352] pc : blk_finish_plug+0x88/0x270
[    0.789598] lr : blk_queue_write_cache+0x34/0x80
[    0.790997] sp : ffff800012aeb9d0
[    0.791981] x29: ffff800012aeb9d0 x28: ffff0000c088eeb0 x27: ffff800011a27110
[    0.794067] x26: ffff0000c18511a0 x25: ffff8000114ecaa8 x24: 0000000005a00000
[    0.796127] x23: ffff8000114ed3c8 x22: 0000000000000000 x21: ffff0000c088fa00
[    0.798208] x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000001
[    0.800239] x17: 7265727574636166 x16: 756e614d202e6b6e x15: ffff0000c0290488
[    0.802308] x14: ffffffffffffffff x13: ffff0000c088fa2c x12: ffff0000c088fa14
[    0.804341] x11: 0000000000000026 x10: 0000000000000401 x9 : ffff80001058247c
[    0.806408] x8 : ffff0000c088fa2c x7 : 0000000000000008 x6 : 0000000000000001
[    0.808429] x5 : ffff80001258a000 x4 : ffff80001258a260 x3 : 0000000000000068
[    0.810492] x2 : 0000000000000001 x1 : 0000000000000068 x0 : 0000000000020000
[    0.813153] Call trace:
[    0.813878]  blk_finish_plug+0x88/0x270
[    0.815064]  add_mtd_blktrans_dev+0x258/0x3f0
[    0.816316]  mtdblock_add_mtd+0x6c/0xb8
[    0.817428]  blktrans_notify_add+0x50/0x78
[    0.818666]  add_mtd_device+0x304/0x4d8
[    0.819790]  mtd_device_parse_register+0x1d8/0x2f0
[    0.821150]  physmap_flash_probe+0x4c8/0x7a8
[    0.822431]  platform_probe+0x70/0xe0
[    0.823494]  really_probe+0xf0/0x4d0
[    0.824539]  driver_probe_device+0x108/0x178
[    0.825760]  device_driver_attach+0x7c/0x88
[    0.827039]  __driver_attach+0xb8/0x190
[    0.828142]  bus_for_each_dev+0x78/0xd0
[    0.829254]  driver_attach+0x2c/0x38
[    0.830381]  bus_add_driver+0x14c/0x230
[    0.831502]  driver_register+0x6c/0x128
[    0.832604]  __platform_driver_register+0x30/0x40
[    0.833952]  physmap_init+0x24/0x30
[    0.835011]  do_one_initcall+0x50/0x2c8
[    0.836116]  kernel_init_freeable+0x25c/0x2e4
[    0.837366]  kernel_init+0x2c/0x138
[    0.838403]  ret_from_fork+0x10/0x18
[    0.839453] Code: c8037c22 35ffffa3 17fff238 f9800031 (c85f7c22)
[    0.841176] ---[ end trace 66ee8a40712bfd28 ]---
[    0.842563] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    0.844577] SMP: stopping secondary CPUs
[    0.845707] Kernel Offset: disabled
[    0.846731] CPU features: 0x10000071,00000846
[    0.847969] Memory Limit: none
[    0.848853] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

ref:
https://lkft.validation.linaro.org/scheduler/job/2901452#L556

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20210615
  kernel-config: https://builds.tuxbuild.com/1tyksDCCPiTvc0x6psxC3JvSWqJ/config

build link:
    https://builds.tuxbuild.com/1tyksDCCPiTvc0x6psxC3JvSWqJ/

Steps to reproduce:
--------------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch arm64 --toolchain gcc-9
--kconfig defconfig --kconfig-add
https://builds.tuxbuild.com/1tyksDCCPiTvc0x6psxC3JvSWqJ/config

--
Linaro LKFT
https://lkft.linaro.org
