Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47A43A7E60
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 14:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhFOMt7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 08:49:59 -0400
Received: from foss.arm.com ([217.140.110.172]:34542 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229977AbhFOMt7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 08:49:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDF221063;
        Tue, 15 Jun 2021 05:47:54 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.9.115])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4D43F719;
        Tue, 15 Jun 2021 05:47:51 -0700 (PDT)
Date:   Tue, 15 Jun 2021 13:47:45 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>, lkft-triage@lists.linaro.org,
        regressions@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Miles Chen <miles.chen@mediatek.com>
Subject: Re: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
Message-ID: <20210615124745.GA47121@C02TD0UTHF1T.local>
References: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

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

From the looks of it, this is pgdat_to_phys, as introduced in next
commit:

  e1db6ef7336d817c ("mm/sparse: fix check_usemap_section_nr warnings")

It appears thta allmodconfig doesn't have CONFIG_NEED_MULTIPLE_NODES=y,
but does have CONFIG_NUMA=y, and so *does* use the dynamically-allocated
node_data array (since contig_page_data is only defined for !NUMA).

I don't think that commit is correct.

Thanks,
Mark.

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
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
