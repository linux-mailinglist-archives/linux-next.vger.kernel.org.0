Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C7275ECF7
	for <lists+linux-next@lfdr.de>; Mon, 24 Jul 2023 09:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjGXH7c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Jul 2023 03:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjGXH7b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jul 2023 03:59:31 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F8BB3
        for <linux-next@vger.kernel.org>; Mon, 24 Jul 2023 00:59:29 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 17B0F6607029;
        Mon, 24 Jul 2023 08:59:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1690185567;
        bh=XNx7ZxUvKIFFCRC9DGiswsqOpfOii+ffL2A8gPrVIaQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XZxP+7wRLLC+dZj9YWOJ9FqUkx/DFNjjkIsZPZMRkNWkF//XviZBhgaEjzEt7Q5xP
         BmmcqImwJ931tTMp2ke6nBE9cRYciYGFeHzmXXTT/DRfdwd2n+YUErXe72XpGbjzgH
         HGI+1cZxWEKabyd/3dQqJTlhCzyAyPaHDUS08fppqOXLo+R57inNmCo5gOLDE3kQBx
         sy/nPhoSXGPdr47b7hHUGYgXSErEjl+pTh8ven5yq2h3TCw7ei/q9zZZ1IwhZMja0m
         YeEIb0vz0BAJdQwy/rIXDNSjbZWOa6zWnTLxLyJmo2SAzLHKdtr/KO0Xwqhr2HUMZ/
         RwoCL/YxU22Nw==
Date:   Mon, 24 Jul 2023 09:59:24 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org,
        Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= 
        <thomas.hellstrom@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Donald Robson <donald.robson@imgtec.com>,
        Dave Airlie <airlied@redhat.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: armv5: boot failed with KUNIT tests- PC is at
 drm_gem_private_object_init
Message-ID: <20230724095924.5f4650e9@collabora.com>
In-Reply-To: <CA+G9fYuit5ByGxO4xeWqYKVS+eb0rr0ES1D1LpPwnRKz369PXA@mail.gmail.com>
References: <CA+G9fYuit5ByGxO4xeWqYKVS+eb0rr0ES1D1LpPwnRKz369PXA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Christian

On Fri, 21 Jul 2023 14:57:15 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> Following regressions found on Linux next-20230721 tag while booting qemu-armv5
> with Kunit tests enabled.
> 
> Regressions found on qemu-armv5:
> 
>  - boot/clang-nightly-multi_v5_defconfig-65236a87
>  - boot/gcc-12-multi_v5_defconfig-65236a87
>  - boot/clang-16-multi_v5_defconfig-65236a87
> 
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Logs:
> -----
> <6>ok 69 drm_rect
> <6>    KTAP version 1
> <6>    # Subtest: drm_exec
> <6>    1..6
> <6>    ok 1 sanitycheck
> <1>8<--- cut here ---
> <1>Unable to handle kernel NULL pointer dereference at virtual address
> 0000005c when read
> <1>[0000005c] *pgd=00000000
> <0>Internal error: Oops: 5 [#1] PREEMPT ARM
> <4>Modules linked in:
> <4>CPU: 0 PID: 1446 Comm: kunit_try_catch Tainted: G        W        N
> 6.5.0-rc2-next-20230721 #1
> <4>Hardware name: ARM-Versatile (Device Tree Support)
> <4>PC is at drm_gem_private_object_init+0x58/0x90
> <4>LR is at dma_resv_init+0x1c/0x30
> <4>pc : [<c059484c>]    lr : [<c0648b8c>]    psr: 60000113
> <4>sp : d0c5de40  ip : d0c5de98  fp : 00000000
> <4>r10: 00000000  r9 : c0370874  r8 : d0811d50
> <4>r7 : c1db06c0  r6 : d0c5df34  r5 : c1194b78  r4 : d0c5de98
> <4>r3 : 00000000  r2 : 00000078  r1 : 00000000  r0 : 00000000
> <4>Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> <4>Control: 00093177  Table: 00004000  DAC: 00000053
> <1>Register r0 information: NULL pointer
> <1>Register r1 information: NULL pointer
> <1>Register r2 information: non-paged memory
> <1>Register r3 information: NULL pointer
> <1>Register r4 information: 2-page vmalloc region starting at
> 0xd0c5c000 allocated at copy_process+0x174/0xdd0
> <1>Register r5 information: non-slab/vmalloc memory
> <1>Register r6 information: 2-page vmalloc region starting at
> 0xd0c5c000 allocated at copy_process+0x174/0xdd0
> <1>Register r7 information: slab kmalloc-32 start c1db06c0 pointer
> offset 0 size 32
> <1>Register r8 information: 2-page vmalloc region starting at
> 0xd0810000 allocated at copy_process+0x174/0xdd0
> <1>Register r9 information: non-slab/vmalloc memory
> <1>Register r10 information: NULL pointer
> <1>Register r11 information: NULL pointer
> <1>Register r12 information: 2-page vmalloc region starting at
> 0xd0c5c000 allocated at copy_process+0x174/0xdd0
> <0>Process kunit_try_catch (pid: 1446, stack limit = 0x919109bb)
> <0>Stack: (0xd0c5de40 to 0xd0c5e000)
> ...
> <0> drm_gem_private_object_init from test_lock+0x50/0x110

The addition of

	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
		drm_gem_gpuva_init(obj);

in drm_gem_private_object_init() causes a NULL deref in the
drm_exec::test_lock() path (dev->drv is NULL). I guess the following
dummy drm_driver declaration would fix that

static struct drm_driver drv;
static struct drm_device dev = {
	.driver = &drv;
};

but I suspect we'll hit new failures/crashes if we keep adding stuff to
drm_gem_private_object_init(), so I'm wondering if it wouldn't be
preferable to properly initialize/cleanup the drm_device in drm_exec's
tests.


> <0> test_lock from kunit_generic_run_threadfn_adapter+0x14/0x20
> <0> kunit_generic_run_threadfn_adapter from kthread+0xe8/0x118
> <0> kthread from ret_from_fork+0x14/0x2c
> <0>Exception stack(0xd0c5dfb0 to 0xd0c5dff8)
> <0>dfa0:                                     00000000 00000000 00000000 00000000
> <0>dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> <0>dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> <0>Code: e3500000 05846098 e5950018 e5951034 (e590005c)
> <4>---[ end trace 0000000000000000 ]---
> <3>    # test_lock: try timed out
> <4>------------[ cut here ]------------
> <4>WARNING: CPU: 0 PID: 1 at lib/refcount.c:25 kthread_stop+0xf8/0x12c
> <4>refcount_t: addition on 0; use-after-free.
> <4>Modules linked in:
> <4>CPU: 0 PID: 1 Comm: swapper Tainted: G      D W        N
> 6.5.0-rc2-next-20230721 #1
> <4>Hardware name: ARM-Versatile (Device Tree Support)
> <4> unwind_backtrace from show_stack+0x10/0x14
> <4> show_stack from dump_stack_lvl+0x2c/0x34
> <4> dump_stack_lvl from __warn+0xb8/0x198
> <4> __warn from warn_slowpath_fmt+0xb4/0x160
> <4> warn_slowpath_fmt from kthread_stop+0xf8/0x12c
> <4> kthread_stop from kunit_try_catch_run+0x110/0x160
> <4> kunit_try_catch_run from kunit_run_tests+0x2d4/0x794
> <4> kunit_run_tests from __kunit_test_suites_init+0xac/0x168
> <4> __kunit_test_suites_init from kunit_run_all_tests+0xa8/0x244
> <4> kunit_run_all_tests from kernel_init_freeable+0x98/0xf0
> <4> kernel_init_freeable from kernel_init+0x10/0x17c
> <4> kernel_init from ret_from_fork+0x14/0x2c
> <4>Exception stack(0xd0811fb0 to 0xd0811ff8)
> <4>1fa0:                                     00000000 00000000 00000000 00000000
> <4>1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> <4>1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> <4>---[ end trace 0000000000000000 ]---
> <1>8<--- cut here ---
> <1>Unable to handle kernel NULL pointer dereference at virtual address
> 00000000 when read
> <1>[00000000] *pgd=00000000
> <0>Internal error: Oops: 5 [#2] PREEMPT ARM
> <4>Modules linked in:
> <4>CPU: 0 PID: 1 Comm: swapper Tainted: G      D W        N
> 6.5.0-rc2-next-20230721 #1
> <4>Hardware name: ARM-Versatile (Device Tree Support)
> <4>PC is at kthread_stop+0x58/0x12c
> <4>LR is at __warn+0x12c/0x198
> <4>pc : [<c0040b8c>]    lr : [<c001fbbc>]    psr: 20000193
> <4>sp : d0811cc8  ip : 60000113  fp : 00000001
> <4>r10: d0811d5c  r9 : d0811d50  r8 : 00000001
> <4>r7 : 00000000  r6 : 00000000  r5 : c1d8c780  r4 : c1d8c910
> <4>r3 : 00000200  r2 : 00000000  r1 : 20000193  r0 : 20000113
> <4>Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
> <4>Control: 00093177  Table: 00004000  DAC: 00000053
> <1>Register r0 information: non-paged memory
> <1>Register r1 information: non-paged memory
> <1>Register r2 information: NULL pointer
> <1>Register r3 information: non-paged memory
> <1>Register r4 information: slab task_struct start c1d8c780 pointer
> offset 400 size 1664
> <1>Register r5 information: slab task_struct start c1d8c780 pointer
> offset 0 size 1664
> <1>Register r6 information: NULL pointer
> <1>Register r7 information: NULL pointer
> <1>Register r8 information: non-paged memory
> <1>Register r9 information: 2-page vmalloc region starting at
> 0xd0810000 allocated at copy_process+0x174/0xdd0
> <1>Register r10 information: 2-page vmalloc region starting at
> 0xd0810000 allocated at copy_process+0x174/0xdd0
> <1>Register r11 information: non-paged memory
> <1>Register r12 information: non-paged memory
> <0>Process swapper (pid: 1, stack limit = 0x541f52e4)
> <0>Stack: (0xd0811cc8 to 0xd0812000)
> 
> ...
> <0> kthread_stop from kunit_try_catch_run+0x110/0x160
> <0> kunit_try_catch_run from kunit_run_tests+0x2d4/0x794
> <0> kunit_run_tests from __kunit_test_suites_init+0xac/0x168
> <0> __kunit_test_suites_init from kunit_run_all_tests+0xa8/0x244
> <0> kunit_run_all_tests from kernel_init_freeable+0x98/0xf0
> <0> kernel_init_freeable from kernel_init+0x10/0x17c
> <0> kernel_init from ret_from_fork+0x14/0x2c
> <0>Exception stack(0xd0811fb0 to 0xd0811ff8)
> <0>1fa0:                                     00000000 00000000 00000000 00000000
> <0>1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> <0>1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> <0>Code: e5956418 e10f0000 e3801080 e121f001 (e5961000)
> <4>---[ end trace 0000000000000000 ]---
> <6>note: swapper[1] exited with irqs disabled
> <0>Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> <0>---[ end Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b ]---
> 
> 
> 
> Links,
> ------
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230721/testrun/18492909/suite/boot/test/clang-16-multi_v5_defconfig-65236a87/log
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230721/testrun/18492909/suite/boot/test/clang-16-multi_v5_defconfig-65236a87/history/
>  - vmlinux: https://storage.tuxsuite.com/public/linaro/lkft/builds/2Srmz9NGn2sjobuzFKo0j7pRPMt/vmlinux.xz
>  - System.map: https://storage.tuxsuite.com/public/linaro/lkft/builds/2Srmz9NGn2sjobuzFKo0j7pRPMt/System.map
> 
> 
> # To install tuxrun to your home directory at ~/.local/bin:
> # pip3 install -U --user tuxrun==0.45.0
> #
> # Or install a deb/rpm depending on the running distribution
> # See https://tuxmake.org/install-deb/ or
> # https://tuxmake.org/install-rpm/
> #
> # See https://tuxrun.org/ for complete documentation.
> #
> # Please follow the additional instructions if the tests are related to FVP:
> # https://tuxrun.org/run-fvp/
> #
> 
> tuxrun --runtime podman \
>   --device qemu-armv5 \
>   --kernel https://storage.tuxsuite.com/public/linaro/lkft/builds/2Srmz9NGn2sjobuzFKo0j7pRPMt/zImage
> \
>   --modules https://storage.tuxsuite.com/public/linaro/lkft/builds/2Srmz9NGn2sjobuzFKo0j7pRPMt/modules.tar.xz
> \
>   --parameters SKIPFILE=skipfile-lkft.yaml \
>   --image docker.io/linaro/tuxrun-dispatcher:v0.45.0 \
>   --tests kunit \
>   --timeouts boot=30
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

