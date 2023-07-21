Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB6475C305
	for <lists+linux-next@lfdr.de>; Fri, 21 Jul 2023 11:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjGUJ1b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jul 2023 05:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjGUJ1a (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jul 2023 05:27:30 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA20F2706
        for <linux-next@vger.kernel.org>; Fri, 21 Jul 2023 02:27:28 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-4814bea10e0so701916e0c.1
        for <linux-next@vger.kernel.org>; Fri, 21 Jul 2023 02:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689931647; x=1690536447;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ghblh4n0cVij1WzyjFywyTJy7apYRr8YBP/dktY4HQc=;
        b=di7KJEeMhMXu4kXexKMZDZfVsf/mp0f2M9SWMwOiTvhDizkBGM8lCDC4zEDws5bMSd
         XOvmolojnNVA+P4p9wtUN9PWygYpc9Wgi7eMfaCsfgcN9Ohy39Y87bfYwAYTV0vjn8z8
         sx+dRPUQj/GoFwjRKtDYhJunsUhJR0XDflwXTROGY4buKpDqGAyON9oSUZ77cCv4ZNJ8
         orE/lEj4WQA7SE5YSD07JKXhaCoGfNsEvhGm1pOKiDDcpZXH4kT9Qzt52c273n3NrR09
         R7UKlM2UCHnTEuXc4AJdzwmAuyku0iuJqAUqU0I7mRKIu2mmqq8F7NtSgE8HbZZtqqx6
         2U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689931647; x=1690536447;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ghblh4n0cVij1WzyjFywyTJy7apYRr8YBP/dktY4HQc=;
        b=ZaoPszgqyX9dMrRvQEIq0RK9znrUjpurB6jhBRB8Xalr3be3fYg55yMUnIKVANcXfg
         xWaa1GMrT4pYRX351b1ZJsGByUpmJcIJ8nBUShkMIxZ+1qf6RHBhcFQtr4NC3PiPkfWH
         86kLhbBKhSts8i604VRSbjZmXNhB2qblUEnQXBvGTbcdcErrG7ZYPPo+8n6/M8uvJvS6
         tiCz4jgzXpLG8hSBAYINJ5aNCPuSIgJ98vUNtXeh9YpPiCI85lTli1uKYCy2xZcWKkU+
         xpD2k5/S+HHJYfxpQGFD8YDw5t+XUMDXFR4GUIwDfszqKLYsI2bNNuTBxS+u96e0Z/Mz
         UABQ==
X-Gm-Message-State: ABy/qLadoBvxHX6/AaGFkN3lBjEBdge+qCVHRIY7odtWJFxd4K0CSaN2
        LkOLLx//g1TbOn1OWyfRW6PgiLmfHE2yDWgJQmmVktMkw0hoPL87IKI=
X-Google-Smtp-Source: APBJJlH3zaV9zmyjUWsi9WJLr1Lrb2QF1SNfW0gKeCUH7C1nG2oZpPbki8i/Fryc6VvsO5bo3IBmUNy8Na2CBl89xS4=
X-Received: by 2002:a05:6102:3655:b0:444:ca02:98fb with SMTP id
 s21-20020a056102365500b00444ca0298fbmr598652vsu.21.1689931647351; Fri, 21 Jul
 2023 02:27:27 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 21 Jul 2023 14:57:15 +0530
Message-ID: <CA+G9fYuit5ByGxO4xeWqYKVS+eb0rr0ES1D1LpPwnRKz369PXA@mail.gmail.com>
Subject: armv5: boot failed with KUNIT tests- PC is at drm_gem_private_object_init
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= 
        <thomas.hellstrom@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Donald Robson <donald.robson@imgtec.com>,
        Dave Airlie <airlied@redhat.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>
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

Following regressions found on Linux next-20230721 tag while booting qemu-armv5
with Kunit tests enabled.

Regressions found on qemu-armv5:

 - boot/clang-nightly-multi_v5_defconfig-65236a87
 - boot/gcc-12-multi_v5_defconfig-65236a87
 - boot/clang-16-multi_v5_defconfig-65236a87


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Logs:
-----
<6>ok 69 drm_rect
<6>    KTAP version 1
<6>    # Subtest: drm_exec
<6>    1..6
<6>    ok 1 sanitycheck
<1>8<--- cut here ---
<1>Unable to handle kernel NULL pointer dereference at virtual address
0000005c when read
<1>[0000005c] *pgd=00000000
<0>Internal error: Oops: 5 [#1] PREEMPT ARM
<4>Modules linked in:
<4>CPU: 0 PID: 1446 Comm: kunit_try_catch Tainted: G        W        N
6.5.0-rc2-next-20230721 #1
<4>Hardware name: ARM-Versatile (Device Tree Support)
<4>PC is at drm_gem_private_object_init+0x58/0x90
<4>LR is at dma_resv_init+0x1c/0x30
<4>pc : [<c059484c>]    lr : [<c0648b8c>]    psr: 60000113
<4>sp : d0c5de40  ip : d0c5de98  fp : 00000000
<4>r10: 00000000  r9 : c0370874  r8 : d0811d50
<4>r7 : c1db06c0  r6 : d0c5df34  r5 : c1194b78  r4 : d0c5de98
<4>r3 : 00000000  r2 : 00000078  r1 : 00000000  r0 : 00000000
<4>Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
<4>Control: 00093177  Table: 00004000  DAC: 00000053
<1>Register r0 information: NULL pointer
<1>Register r1 information: NULL pointer
<1>Register r2 information: non-paged memory
<1>Register r3 information: NULL pointer
<1>Register r4 information: 2-page vmalloc region starting at
0xd0c5c000 allocated at copy_process+0x174/0xdd0
<1>Register r5 information: non-slab/vmalloc memory
<1>Register r6 information: 2-page vmalloc region starting at
0xd0c5c000 allocated at copy_process+0x174/0xdd0
<1>Register r7 information: slab kmalloc-32 start c1db06c0 pointer
offset 0 size 32
<1>Register r8 information: 2-page vmalloc region starting at
0xd0810000 allocated at copy_process+0x174/0xdd0
<1>Register r9 information: non-slab/vmalloc memory
<1>Register r10 information: NULL pointer
<1>Register r11 information: NULL pointer
<1>Register r12 information: 2-page vmalloc region starting at
0xd0c5c000 allocated at copy_process+0x174/0xdd0
<0>Process kunit_try_catch (pid: 1446, stack limit = 0x919109bb)
<0>Stack: (0xd0c5de40 to 0xd0c5e000)
...
<0> drm_gem_private_object_init from test_lock+0x50/0x110
<0> test_lock from kunit_generic_run_threadfn_adapter+0x14/0x20
<0> kunit_generic_run_threadfn_adapter from kthread+0xe8/0x118
<0> kthread from ret_from_fork+0x14/0x2c
<0>Exception stack(0xd0c5dfb0 to 0xd0c5dff8)
<0>dfa0:                                     00000000 00000000 00000000 00000000
<0>dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
<0>dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
<0>Code: e3500000 05846098 e5950018 e5951034 (e590005c)
<4>---[ end trace 0000000000000000 ]---
<3>    # test_lock: try timed out
<4>------------[ cut here ]------------
<4>WARNING: CPU: 0 PID: 1 at lib/refcount.c:25 kthread_stop+0xf8/0x12c
<4>refcount_t: addition on 0; use-after-free.
<4>Modules linked in:
<4>CPU: 0 PID: 1 Comm: swapper Tainted: G      D W        N
6.5.0-rc2-next-20230721 #1
<4>Hardware name: ARM-Versatile (Device Tree Support)
<4> unwind_backtrace from show_stack+0x10/0x14
<4> show_stack from dump_stack_lvl+0x2c/0x34
<4> dump_stack_lvl from __warn+0xb8/0x198
<4> __warn from warn_slowpath_fmt+0xb4/0x160
<4> warn_slowpath_fmt from kthread_stop+0xf8/0x12c
<4> kthread_stop from kunit_try_catch_run+0x110/0x160
<4> kunit_try_catch_run from kunit_run_tests+0x2d4/0x794
<4> kunit_run_tests from __kunit_test_suites_init+0xac/0x168
<4> __kunit_test_suites_init from kunit_run_all_tests+0xa8/0x244
<4> kunit_run_all_tests from kernel_init_freeable+0x98/0xf0
<4> kernel_init_freeable from kernel_init+0x10/0x17c
<4> kernel_init from ret_from_fork+0x14/0x2c
<4>Exception stack(0xd0811fb0 to 0xd0811ff8)
<4>1fa0:                                     00000000 00000000 00000000 00000000
<4>1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
<4>1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
<4>---[ end trace 0000000000000000 ]---
<1>8<--- cut here ---
<1>Unable to handle kernel NULL pointer dereference at virtual address
00000000 when read
<1>[00000000] *pgd=00000000
<0>Internal error: Oops: 5 [#2] PREEMPT ARM
<4>Modules linked in:
<4>CPU: 0 PID: 1 Comm: swapper Tainted: G      D W        N
6.5.0-rc2-next-20230721 #1
<4>Hardware name: ARM-Versatile (Device Tree Support)
<4>PC is at kthread_stop+0x58/0x12c
<4>LR is at __warn+0x12c/0x198
<4>pc : [<c0040b8c>]    lr : [<c001fbbc>]    psr: 20000193
<4>sp : d0811cc8  ip : 60000113  fp : 00000001
<4>r10: d0811d5c  r9 : d0811d50  r8 : 00000001
<4>r7 : 00000000  r6 : 00000000  r5 : c1d8c780  r4 : c1d8c910
<4>r3 : 00000200  r2 : 00000000  r1 : 20000193  r0 : 20000113
<4>Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
<4>Control: 00093177  Table: 00004000  DAC: 00000053
<1>Register r0 information: non-paged memory
<1>Register r1 information: non-paged memory
<1>Register r2 information: NULL pointer
<1>Register r3 information: non-paged memory
<1>Register r4 information: slab task_struct start c1d8c780 pointer
offset 400 size 1664
<1>Register r5 information: slab task_struct start c1d8c780 pointer
offset 0 size 1664
<1>Register r6 information: NULL pointer
<1>Register r7 information: NULL pointer
<1>Register r8 information: non-paged memory
<1>Register r9 information: 2-page vmalloc region starting at
0xd0810000 allocated at copy_process+0x174/0xdd0
<1>Register r10 information: 2-page vmalloc region starting at
0xd0810000 allocated at copy_process+0x174/0xdd0
<1>Register r11 information: non-paged memory
<1>Register r12 information: non-paged memory
<0>Process swapper (pid: 1, stack limit = 0x541f52e4)
<0>Stack: (0xd0811cc8 to 0xd0812000)

...
<0> kthread_stop from kunit_try_catch_run+0x110/0x160
<0> kunit_try_catch_run from kunit_run_tests+0x2d4/0x794
<0> kunit_run_tests from __kunit_test_suites_init+0xac/0x168
<0> __kunit_test_suites_init from kunit_run_all_tests+0xa8/0x244
<0> kunit_run_all_tests from kernel_init_freeable+0x98/0xf0
<0> kernel_init_freeable from kernel_init+0x10/0x17c
<0> kernel_init from ret_from_fork+0x14/0x2c
<0>Exception stack(0xd0811fb0 to 0xd0811ff8)
<0>1fa0:                                     00000000 00000000 00000000 00000000
<0>1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
<0>1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
<0>Code: e5956418 e10f0000 e3801080 e121f001 (e5961000)
<4>---[ end trace 0000000000000000 ]---
<6>note: swapper[1] exited with irqs disabled
<0>Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
<0>---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b ]---



Links,
------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230721/testrun/18492909/suite/boot/test/clang-16-multi_v5_defconfig-65236a87/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230721/testrun/18492909/suite/boot/test/clang-16-multi_v5_defconfig-65236a87/history/
 - vmlinux: https://storage.tuxsuite.com/public/linaro/lkft/builds/2Srmz9NGn2sjobuzFKo0j7pRPMt/vmlinux.xz
 - System.map: https://storage.tuxsuite.com/public/linaro/lkft/builds/2Srmz9NGn2sjobuzFKo0j7pRPMt/System.map


# To install tuxrun to your home directory at ~/.local/bin:
# pip3 install -U --user tuxrun==0.45.0
#
# Or install a deb/rpm depending on the running distribution
# See https://tuxmake.org/install-deb/ or
# https://tuxmake.org/install-rpm/
#
# See https://tuxrun.org/ for complete documentation.
#
# Please follow the additional instructions if the tests are related to FVP:
# https://tuxrun.org/run-fvp/
#

tuxrun --runtime podman \
  --device qemu-armv5 \
  --kernel https://storage.tuxsuite.com/public/linaro/lkft/builds/2Srmz9NGn2sjobuzFKo0j7pRPMt/zImage
\
  --modules https://storage.tuxsuite.com/public/linaro/lkft/builds/2Srmz9NGn2sjobuzFKo0j7pRPMt/modules.tar.xz
\
  --parameters SKIPFILE=skipfile-lkft.yaml \
  --image docker.io/linaro/tuxrun-dispatcher:v0.45.0 \
  --tests kunit \
  --timeouts boot=30


--
Linaro LKFT
https://lkft.linaro.org
