Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EDF39189C
	for <lists+linux-next@lfdr.de>; Wed, 26 May 2021 15:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhEZNVP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 09:21:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:42258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232808AbhEZNVO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 May 2021 09:21:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 918D6613BA;
        Wed, 26 May 2021 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622035182;
        bh=xP410cnZ5V9a73/3sUVAAlRQIanKURM64iRGMucR75o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XHOgHqIpIiaEgkakLsJf5pWLX/9UbdSA0bS4+z5t8gIblHq5cqnIoAC6np3GjpAZz
         VEEK+IbX1gt08S5Hza0nc4qpOO1IK343VRPfdSEH4aw0dd0OI82sjRvliHM9/YkKh2
         EY+JkkCzVNq2JzH4OwH6jVkyn4sCBTGA/GVrdxEyqGaeBTLT0Ab1YnSe3SrAxrLTzd
         ADUkxOsfll1UwRp+xjA3MGC2ySsqpJTCeczBNPUGYD4m3IEDj14y8ZqyEmjQYMjZVQ
         wT5FyHU0fKOl7/OkcEB4c3N3fDsmCeG3JfdOfl/bmLrejD4d9dLw+CDF813H4qEFiq
         oxMmDktEGmd+A==
Date:   Wed, 26 May 2021 14:19:37 +0100
From:   Will Deacon <will@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [next] arm64: boot failed next-20210526
Message-ID: <20210526131936.GA19341@willie-the-truck>
References: <CA+G9fYtwXKK1U+SovWvuKttgqj59tNeJcRzHxWmfmyCRricmsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtwXKK1U+SovWvuKttgqj59tNeJcRzHxWmfmyCRricmsA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 26, 2021 at 06:12:34PM +0530, Naresh Kamboju wrote:
> While booting Linux next-20210526 tag on arm64 the following crash noticed.
> 
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 5.13.0-rc3-next-20210526
> (tuxmake@52aac593b9ff) (aarch64-linux-gnu-gcc (Debian 11.1.0-1)
> 11.1.0, GNU ld (GNU Binutils for Debian) 2.36.1) #1 SMP PREEMPT Wed
> May 26 08:29:48 UTC 2021
> [    0.000000] Machine model: linux,dummy-virt
> [    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options '')
> [    0.000000] printk: bootconsole [pl11] enabled
> [    0.000000] efi: UEFI not found.
> [    0.000000] NUMA: No NUMA configuration found
> [    0.000000] NUMA: Faking a node at [mem
> 0x0000000040000000-0x00000000bfffffff]
> [    0.000000] NUMA: NODE_DATA [mem 0xbfc00d40-0xbfc03fff]
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x00000000bfffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000]   Device   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bfffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff]
> [    0.000000] cma: Reserved 32 MiB at 0x00000000bb800000
> [    0.000000] kasan: KernelAddressSanitizer initialized
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.0 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] percpu: Embedded 500 pages/cpu s2009624 r8192 d30184 u2048000
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] kernel BUG at arch/arm64/kernel/traps.c:406!
> [    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G                T
> 5.13.0-rc3-next-20210526 #1 c8ad07b8a918e7b0a25b795f9cc1c902737164cf
> [    0.000000] Hardware name: linux,dummy-virt (DT)
> [    0.000000] pstate: 404000c5 (nZcv daIF +PAN -UAO -TCO BTYPE=--)
> [    0.000000] pc : do_undefinstr+0x88/0xc0
> [    0.000000] lr : do_undefinstr+0x88/0xc0
> [    0.000000] sp : ffff800014267be0
> [    0.000000] x29: ffff800014267be0 x28: ffff80001429b040 x27: 0000000000000000
> [    0.000000] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> [    0.000000] x23: 00000000604000c5 x22: ffff800010038528 x21: 0000000002000000
> [    0.000000] x20: 0000000000000005 x19: ffff800014267c50 x18: 0000000000000000
> [    0.000000] x17: 000c0400bb44ffff x16: 00000032b5503510 x15: 0000000000000000
> [    0.000000] x14: 00000000bfc12000 x13: 0000001000000000 x12: 00000000f1f1f1f1
> [    0.000000] x11: dfff800000000000 x10: ffff70000284cf44 x9 : ffff8000128bf2e0
> [    0.000000] x8 : ffff700002854905 x7 : 1ffff00002854904 x6 : ffff700002854904
> [    0.000000] x5 : dfff800000000000 x4 : ffff8000142a4820 x3 : ffff80001429b040
> [    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> [    0.000000] Call trace:
> [    0.000000]  do_undefinstr+0x88/0xc0
> [    0.000000]  el1_undef+0x30/0x80
> [    0.000000]  el1_sync_handler+0xc0/0x140
> [    0.000000]  el1_sync+0x7c/0x100
> [    0.000000]  __cpuinfo_store_cpu+0xe8/0x440
> [    0.000000]  cpuinfo_store_boot_cpu+0x54/0xb4
> [    0.000000]  smp_prepare_boot_cpu+0x68/0x1a4
> [    0.000000]  start_kernel+0x128/0x870
> [    0.000000]  __primary_switched+0x94/0x98
> [    0.000000] Code: aa1403e1 940dda91 b4000074 940dd94f (d4210000)
> [    0.000000] random: get_random_bytes called from
> oops_exit+0x54/0xc0 with crng_init=0
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Oops - BUG: Fatal exception
> [    0.000000] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal
> exception ]---

I'm guessing that's due to the newly introduced read of GMID_EL1, which does
indeed appear to be undefined on cpus without FEAT_MTE2.

Catalin -- I'll drop your patches for now.

Will
