Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CEB3A7D90
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 13:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhFOLwz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 07:52:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:60396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229979AbhFOLwy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 07:52:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A165613BF;
        Tue, 15 Jun 2021 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623757850;
        bh=q1+9+561eC7jmhlBQGchmKhaf063MtAVBSjBfa/pKvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UmCtA2/eef34H13ygfdC+6kV9vk8kNdh7SXa2j2d1Er5i1KNTi1XV2p7lq+6vvJla
         0sEhqYO2gme/hoNYL/Wdy+e5hugm8tRABjisZS7YLLe7EP7HxlQaYLQaS/3uR+3EvL
         wDsLz9ynF2E16oncM83gvzreSf6fHhcBWMJcvBqLR9ZgopIkQn5P7dJ6hWCKaadd6q
         drMR97ncGKnkcsxXZFpy41lEHSWWBpMH0Qox2m4qzGwv4vVADrU3aO/1aX96yL1Bc3
         ne1aFU1RQ8BMSewv5ol/rGDN2AX05so/aM2UlYUX7q4PUi3M43DZo7RBxpWjkh9Kj5
         K+Gh5Du/lvzGw==
Date:   Tue, 15 Jun 2021 12:50:45 +0100
From:   Will Deacon <will@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
Message-ID: <20210615115044.GC20598@willie-the-truck>
References: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Naresh,

On Tue, Jun 15, 2021 at 04:41:25PM +0530, Naresh Kamboju wrote:
> Following kernel crash reported while boot linux next 20210615 tag on qemu_arm64
> with allmodconfig build.
> 
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 5.13.0-rc6-next-20210615
> (tuxmake@ac7978cddede) (aarch64-linux-gnu-gcc (Debian 11.1.0-1)
> 11.1.0, GNU ld (GNU Binutils for Debian) 2.36.50.20210601) #1 SMP
> PREEMPT Tue Jun 15 10:20:51 UTC 2021
> [    0.000000] Machine model: linux,dummy-virt
> [    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options '')
> [    0.000000] printk: bootconsole [pl11] enabled
> [    0.000000] efi: UEFI not found.
> [    0.000000] NUMA: No NUMA configuration found
> [    0.000000] NUMA: Faking a node at [mem
> 0x0000000040000000-0x00000000bfffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0xbfc00d40-0xbfc03fff]
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] kernel BUG at arch/arm64/mm/physaddr.c:27!
> [    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G                T
> 5.13.0-rc6-next-20210615 #1 c150a8161d8ff395c5ae7ee0c3c8f22c3689fae4
> [    0.000000] Hardware name: linux,dummy-virt (DT)
> [    0.000000] pstate: 404000c5 (nZcv daIF +PAN -UAO -TCO BTYPE=--)
> [    0.000000] pc : __phys_addr_symbol+0x44/0xc0
> [    0.000000] lr : __phys_addr_symbol+0x44/0xc0
> [    0.000000] sp : ffff800014287b00
> [    0.000000] x29: ffff800014287b00 x28: fc49a9b89db36f0a x27: ffffffffffffffff
> [    0.000000] x26: 0000000000000280 x25: 0000000000000010 x24: ffff8000145a8000
> [    0.000000] x23: 0000000008000000 x22: 0000000000000010 x21: 0000000000000000
> [    0.000000] x20: ffff800010000000 x19: ffff00007fc00d40 x18: 0000000000000000
> [    0.000000] x17: 00000000003ee000 x16: 00000000bfc12000 x15: 0000001000000000
> [    0.000000] x14: 000000000000de8c x13: 0000001000000000 x12: 00000000f1f1f1f1
> [    0.000000] x11: dfff800000000000 x10: ffff700002850eea x9 : 0000000000000000
> [    0.000000] x8 : ffff00007fbe0d40 x7 : 0000000000000000 x6 : 000000000000003f
> [    0.000000] x5 : 0000000000000040 x4 : 0000000000000005 x3 : ffff8000142bb0c0
> [    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> [    0.000000] Call trace:
> [    0.000000]  __phys_addr_symbol+0x44/0xc0
> [    0.000000]  sparse_init_nid+0x98/0x6d0
> [    0.000000]  sparse_init+0x460/0x4d4
> [    0.000000]  bootmem_init+0x110/0x340
> [    0.000000]  setup_arch+0x1b8/0x2e0
> [    0.000000]  start_kernel+0x110/0x870
> [    0.000000]  __primary_switched+0xa8/0xb0
> [    0.000000] Code: 940ccf23 eb13029f 54000069 940cce60 (d4210000)
> [    0.000000] random: get_random_bytes called from
> oops_exit+0x54/0xc0 with crng_init=0
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Oops - BUG: Fatal exception
> [    0.000000] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal
> exception ]---
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Thanks for the report, although since this appears to be part of a broader
testing effort, here are some things that I think would make the reports
even more useful:

  1. An indication as to whether or not this is a regression (i.e. do you
     have a known good build, perhaps even a bisection?)

  2. Either a link to the vmlinux, or faddr2line run on the backtrace.
     Looking at the above, I can't tell what sparse_init_nid+0x98/0x6d0
     actually is.

  3. The exact QEMU command-line you are using, so I can try to reproduce
     this locally. I think the 0-day bot wraps the repro up in a shell
     script for you.

  4. Whether or not the issue is reproducible.

  5. Information about the toolchain you used to build the kernel (it
     happens to be present here because it's in the kernel log, but
     generally I think it would be handy to specify that in the report).

Please can you provide that information for this crash? It would really
help in debugging it.

Thanks!

Will
