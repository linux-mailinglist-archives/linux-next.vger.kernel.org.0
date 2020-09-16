Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C264F26CD96
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 23:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgIPVBw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 17:01:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:43068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726260AbgIPQaX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Sep 2020 12:30:23 -0400
Received: from kernel.org (unknown [87.71.73.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FB6220936;
        Wed, 16 Sep 2020 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600265083;
        bh=vjT9vG5+3yp/xt4ZdTXRH4nnYrq6Zz1hIgyXzWpV/CY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xjwbjybAHtj33ndRCCkAiu8k9aM3x5UONFAamN+w8FRYz0P2tMaxUZwELYD6J9x5T
         kcnj4gTXIX/DXUM1zLXMIgdffznpjlOJeUpN7Mxgl0rnNsNcorWqVivGLmv2nT3hRw
         tnXEoHNNMQ8EA1tly5syKlCO+GqulbWkZ5lHrDbg=
Date:   Wed, 16 Sep 2020 17:04:37 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [Firmware Bug]: Kernel image misaligned at boot, please fix your
 bootloader
Message-ID: <20200916140437.GL2142832@kernel.org>
References: <CA+G9fYtz4=fO++JsL4McMWecFnFGWzm7kJvKKmfHOspjvMU9yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtz4=fO++JsL4McMWecFnFGWzm7kJvKKmfHOspjvMU9yQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 16, 2020 at 05:50:34PM +0530, Naresh Kamboju wrote:
> arm64 boot failed on linux next 20200916.

There is a fix at 
https://lore.kernel.org/linux-mm/20200916085933.25220-1-song.bao.hua@hisilicon.com/

> [    0.000000] Linux version 5.9.0-rc5-next-20200916
> (TuxBuild@3aa8232c0e38) (aarch64-linux-gnu-gcc (Debian 9.3.0-8) 9.3.0,
> GNU ld (GNU Binutils for Debian) 2.34) #1 SMP PREEMPT Wed Sep 16
> 10:13:15 UTC 2020
> [    0.000000] Machine model: Freescale Layerscape 2088A RDB Board
> [    0.000000] earlycon: uart8250 at MMIO 0x00000000021c0600 (options '')
> [    0.000000] printk: bootconsole [uart8250] enabled
> [    0.000000] efi: UEFI not found.
> [    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please
> fix your bootloader!
> [    0.000000] Unable to handle kernel paging request at virtual
> address ffff0082ffffff70
> [    0.000000] Mem abort info:
> [    0.000000]   ESR = 0x96000044
> [    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.000000]   SET = 0, FnV = 0
> [    0.000000]   EA = 0, S1PTW = 0
> [    0.000000] Data abort info:
> [    0.000000]   ISV = 0, ISS = 0x00000044
> [    0.000000]   CM = 0, WnR = 1
> [    0.000000] swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000827f9000
> [    0.000000] [ffff0082ffffff70] pgd=0000000000000000, p4d=0000000000000000
> [    0.000000] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
> 5.9.0-rc5-next-20200916 #1
> [    0.000000] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
> [    0.000000] pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=--)
> [    0.000000] pc : __memset+0x148/0x188
> [    0.000000] lr : memblock_alloc_try_nid+0xc4/0xdc
> [    0.000000] sp : ffffc305b2393cd0
> [    0.000000] x29: ffffc305b2393cd0 x28: 000000008116237c
> [    0.000000] x27: 0000000080000000 x26: ffffc305b1b51000
> [    0.000000] x25: 0000008380000000 x24: ffffc305b18014f8
> [    0.000000] x23: ffffc305b27a0f30 x22: 0000000000000000
> [    0.000000] x21: 00000000ffffffff x20: ffff0082ffffff70
> [    0.000000] x19: 0000000000000090 x18: 0000000000000010
> [    0.000000] x17: 0000000000001400 x16: 0000000000001c00
> [    0.000000] x15: ffffc305b23a48c0 x14: ffffc305b23a48c0
> [    0.000000] x13: fffffdfffe600000 x12: ffffc305b2393e44
> [    0.000000] x11: 0000000000004aa8 x10: ffffc305b2393df4
> [    0.000000] x9 : 0000000000000000 x8 : ffff0082ffffff70
> [    0.000000] x7 : 0000000000000000 x6 : 000000000000003f
> [    0.000000] x5 : 0000000000000040 x4 : 0000000000000010
> [    0.000000] x3 : 0000000000000080 x2 : 0000000000000080
> [    0.000000] x1 : 0000000000000000 x0 : ffff0082ffffff70
> [    0.000000] Call trace:
> [    0.000000]  __memset+0x148/0x188
> [    0.000000]  cma_init_reserved_mem+0x9c/0x15c
> [    0.000000]  cma_declare_contiguous_nid+0x288/0x308
> [    0.000000]  dma_contiguous_reserve_area+0x50/0x80
> [    0.000000]  dma_contiguous_reserve+0xfc/0x114
> [    0.000000]  arm64_memblock_init+0x42c/0x464
> [    0.000000]  setup_arch+0x27c/0x64c
> [    0.000000]  start_kernel+0xa0/0x56c
> [    0.000000] Code: f101007f fa45a068 54fffc0b aa0303e2 (a9001d07)
> [    0.000000] random: get_random_bytes called from
> print_oops_end_marker+0x34/0x78 with crng_init=0
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill
> the idle task! ]---
> 
> 
> -- 
> Linaro LKFT
> https://lkft.linaro.org

-- 
Sincerely yours,
Mike.
