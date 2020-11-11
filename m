Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915FF2AEAE8
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 09:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgKKIP5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 03:15:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:59806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgKKIP4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 03:15:56 -0500
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19001206C0;
        Wed, 11 Nov 2020 08:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605082555;
        bh=UzQMgNbDWdH+iflzwyqc7uHaBePKfGi70SFbqbJmW2w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jca7eigSHmIoTfxrDnx1Bgq0fjuzXqWQ8zKsotqqSOXD3E8rEHDggahnm39YmREp1
         Nkr+5IHLlH39uk5MCJ63UcEVvdQ1J59or0IYMCY7/PNtpZPDdVY8kZoogUMy+FzHjW
         rKx2N6mtGBGyT/88PoC1zcQ+GzwrVnq9flZp9rwY=
Received: by mail-ot1-f43.google.com with SMTP id n89so1384000otn.3;
        Wed, 11 Nov 2020 00:15:55 -0800 (PST)
X-Gm-Message-State: AOAM532QxwEPu1gCQfyrrDr0I6erTY0HeRKAGCI9a1XoqfKsLSgOrEJA
        ObXmGStWIquRG3KBhGvpLIjf8iF74JzjAfTDNng=
X-Google-Smtp-Source: ABdhPJxCUXI38tS4jVIP37BlRlacnWwJ/biMaD54a+TAav4mmFtCuzpfNxMaGHC7yZ/DbG2PyUq8YhXSgg/H3xWF4YE=
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr7412876otd.90.1605082554315;
 Wed, 11 Nov 2020 00:15:54 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtrOq66zz8ux=G+SDH7ZUJevv-L0W+xvtERHAJCuCmj_g@mail.gmail.com>
In-Reply-To: <CA+G9fYtrOq66zz8ux=G+SDH7ZUJevv-L0W+xvtERHAJCuCmj_g@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 11 Nov 2020 09:15:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXESZU2w98gX3uSc-uAw_w9KxSYTKUr6Ne6XHCPWsYT=jQ@mail.gmail.com>
Message-ID: <CAMj1kXESZU2w98gX3uSc-uAw_w9KxSYTKUr6Ne6XHCPWsYT=jQ@mail.gmail.com>
Subject: Re: arm: kasan: WARNING: CPU: 0 PID: 0 at arch/arm/kernel/insn.c:47 __arm_gen_branch
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 11 Nov 2020 at 07:13, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following kernel warning noticed on arm KASAN enabled config while booting.
>
> [    0.000000] Linux version 5.10.0-rc3-next-20201110
> (tuxmake@e15fe3b4fdc6) (arm-linux-gnueabihf-gcc (Debian 9.3.0-13)
> 9.3.0, GNU ld (GNU Binutils for Debian) 2.35.1) #2 SMP Tue Nov 10
> 07:49:47 UTC 2020
> [    0.000000] CPU: ARMv7 Processor [410fd034] revision 4 (ARMv7), cr=10c5383d
> <trim>
> [    0.000000] kasan: Truncating shadow for memory block at
> 0x40000000-0xffffffff to lowmem region at 0x70000000
> [    0.000000] kasan: Mapping kernel virtual memory block:
> c0000000-f0000000 at shadow: b7000000-bd000000
> [    0.000000] kasan: Mapping kernel virtual memory block:
> bf000000-c0000000 at shadow: b6e00000-b7000000
> [    0.000000] kasan: Kernel address sanitizer initialized
> <trim>
> [    0.000000] ftrace: allocating 57178 entries in 112 pages
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm/kernel/insn.c:47
> __arm_gen_branch+0x78/0x80
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
> 5.10.0-rc3-next-20201110 #2
> [    0.000000] Hardware name: Generic DT based system
> [    0.000000] Backtrace:
> [    0.000000] [<c199f710>] (dump_backtrace) from [<c199fb94>]
> (show_stack+0x20/0x24)
> [    0.000000]  r9:00000080 r8:c2e00000 r7:c3023060 r6:600000d3
> r5:00000000 r4:c3023060
> [    0.000000] [<c199fb74>] (show_stack) from [<c19a7ad0>]
> (dump_stack+0xe8/0x10c)
> [    0.000000] [<c19a79e8>] (dump_stack) from [<c0366518>] (__warn+0x140/0x164)
> [    0.000000]  r10:00000009 r9:00000000 r8:c2e0e000 r7:00000009
> r6:c031986c r5:0000002f
> [    0.000000]  r4:c1a0bbe0 r3:c2e06f50
> [    0.000000] [<c03663d8>] (__warn) from [<c19a13ac>]
> (warn_slowpath_fmt+0xc0/0x128)
> [    0.000000]  r9:c031986c r8:0000002f r7:c1a0bbe0 r6:00000000
> r5:c2e03ec0 r4:b75c07cc
> [    0.000000] [<c19a12f0>] (warn_slowpath_fmt) from [<c031986c>]
> (__arm_gen_branch+0x78/0x80)
> [    0.000000]  r10:0000d247 r9:c4019238 r8:c400c104 r7:c2e070a0
> r6:c400c108 r5:c0319250
> [    0.000000]  r4:00000000
> [    0.000000] [<c03197f4>] (__arm_gen_branch) from [<c0319720>]
> (ftrace_make_nop+0x30/0x48)
> [    0.000000]  r5:c0319250 r4:c2b00354
> [    0.000000] [<c03196f0>] (ftrace_make_nop) from [<c04ac104>]
> (ftrace_process_locs+0x470/0x5f0)
> [    0.000000]  r5:00001248 r4:c400c100
> [    0.000000] [<c04abc94>] (ftrace_process_locs) from [<c2b2d8f4>]
> (ftrace_init+0xa8/0x158)
> [    0.000000]  r10:10c5387d r9:c1a87768 r8:c2cb9f98 r7:c2c82230
> r6:00000001 r5:c2e070a0
> [    0.000000]  r4:c37f5c40
> [    0.000000] [<c2b2d84c>] (ftrace_init) from [<c2b010ec>]
> (start_kernel+0x174/0x3f8)
> [    0.000000]  r9:00000001 r8:c2e06f00 r7:00000000 r6:c2e06f00
> r5:c37c0000 r4:ffffffff
> [    0.000000] [<c2b00f78>] (start_kernel) from [<00000000>] (0x0)
> [    0.000000]  r9:410fd034 r8:48000000 r7:ffffffff r6:10c0387d
> r5:00000051 r4:c2b00334
> [    0.000000] random: get_random_bytes called from
> print_oops_end_marker+0x30/0xa0 with crng_init=0
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [ #
>    0.000000] ------------[ ftrace bug ]------------
> [    0.000000] ftrace failed to modify
> [    0.000000] [<c2b00354>] set_reset_devices+0x10/0x28
> [    0.000000]  actual:   0a:3d:04:eb
> [    0.000000] Initializing ftrace call sites
> [    0.000000] ftrace record flags: 0
> [    0.000000]  (0)
> [    0.000000]  expected tramp: c031925c
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:2065
> ftrace_bug+0x218/0x280
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W
> 5.10.0-rc3-next-20201110 #2
> [    0.000000] Hardware name: Generic DT based system
> [    0.000000] Backtrace:
> [    0.000000] [<c199f710>] (dump_backtrace) from [<c199fb94>]
> (show_stack+0x20/0x24)
> [    0.000000]  r9:00000080 r8:c2e00000 r7:c3023060 r6:600000d3
> r5:00000000 r4:c3023060
> [    0.000000] [<c199fb74>] (show_stack) from [<c19a7ad0>]
> (dump_stack+0xe8/0x10c)
> [    0.000000] [<c19a79e8>] (dump_stack) from [<c0366518>] (__warn+0x140/0x164)
> [    0.000000]  r10:00000009 r9:00000000 r8:c2e0e000 r7:00000009
> r6:c19a3790 r5:00000811
> [    0.000000]  r4:c1a863c0 r3:c2e06f50
> [    0.000000] [<c03663d8>] (__warn) from [<c19a13ac>]
> (warn_slowpath_fmt+0xc0/0x128)
> [    0.000000]  r9:c19a3790 r8:00000811 r7:c1a863c0 r6:00000000
> r5:c2e03ee0 r4:b75c07d0
> [    0.000000] [<c19a12f0>] (warn_slowpath_fmt) from [<c19a3790>]
> (ftrace_bug+0x218/0x280)
> [    0.000000]  r10:0000d247 r9:c4019238 r8:c400c104 r7:c37f5c40
> r6:c1a86960 r5:c401923c
> [    0.000000]  r4:c4019238
> [    0.000000] [<c19a3578>] (ftrace_bug) from [<c04abfc0>]
> (ftrace_process_locs+0x32c/0x5f0)
> [    0.000000]  r7:c2e070a0 r6:c400c108 r5:00001248 r4:c400c100
> [    0.000000] [<c04abc94>] (ftrace_process_locs) from [<c2b2d8f4>]
> (ftrace_init+0xa8/0x158)
> [    0.000000]  r10:10c5387d r9:c1a87768 r8:c2cb9f98 r7:c2c82230
> r6:00000001 r5:c2e070a0
> [    0.000000]  r4:c37f5c40
> [    0.000000] [<c2b2d84c>] (ftrace_init) from [<c2b010ec>]
> (start_kernel+0x174/0x3f8)
> [    0.000000]  r9:00000001 r8:c2e06f00 r7:00000000 r6:c2e06f00
> r5:c37c0000 r4:ffffffff
> [    0.000000] [<c2b00f78>] (start_kernel) from [<00000000>] (0x0)
> [    0.000000]  r9:410fd034 r8:48000000 r7:ffffffff r6:10c0387d
> r5:00000051 r4:c2b00334
> [    0.000000] ---[ end trace f68728a0d3053b52 ]---
> [    0.000000] ftrace: allocated 112 pages with 3 groups
>
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git describe: next-20201110
>   make_kernelversion: 5.10.0-rc3
>   build : https://builds.tuxbuild.com/1k5bYasxkHF7omMh7mjtxjRtkMe/
>
> The qemu boot command,
> -----------------------------------
> /usr/bin/qemu-system-aarch64 -cpu host,aarch64=off -machine
> virt-2.10,accel=kvm -nographic -net
> nic,model=virtio,macaddr=BA:DD:AD:CC:09:03 -net tap -m 2048 -monitor
> none -kernel kernel/zImage --append "console=ttyAMA0 root=/dev/vda rw"
> -hda rpb-console-image-lkft-am57xx-evm-20201022181203-3085.rootfs.ext4
> -m 4096 -smp 2 -nographic
>
> Full log:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201110/testrun/3420437/suite/linux-log-parser/test/check-kernel-warning-1927841/log
>

The kernel you are building is too big.

An ordinary multi_v7_defconfig+thumb2 has

(10240K kernel code, 2232K rwdata, 5344K rodata, 2048K init, 441K bss,
144040K reserved, 65536K cma-reserved, 3340512K highmem)

whereas your kernel has

(23552K kernel code, 9970K rwdata, 16736K rodata, 3072K init, 4849K
bss, 189072K reserved, 65536K cma-reserved, 2293756K highmem)

and so the kernel text section is too large to resolve relative branches.

Which config are you building?
