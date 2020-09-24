Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B16A276CD8
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 11:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgIXJJO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 05:09:14 -0400
Received: from 8bytes.org ([81.169.241.247]:46266 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbgIXJJO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 05:09:14 -0400
X-Greylist: delayed 320 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 05:09:14 EDT
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id CE06E295; Thu, 24 Sep 2020 11:03:50 +0200 (CEST)
Date:   Thu, 24 Sep 2020 11:03:49 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     linux-mtd@lists.infradead.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        masonccyang@mxic.com.tw, Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Suram Suram <suram@nxp.com>, Zhiqiang.Hou@nxp.com,
        Poonam Aggrwal <poonam.aggrwal@nxp.com>, robh@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Joerg Roedel <jroedel@suse.de>
Subject: Re: arm-smmu 5000000.iommu: Cannot accommodate DMA offset for IOMMU
 page tables
Message-ID: <20200924090349.GF27174@8bytes.org>
References: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvuq58q+GsWnzni0sKSHbubuQz-UaK3TASX26V_a7yBVw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Adding Will and Robin.

On Mon, Sep 21, 2020 at 06:50:40PM +0530, Naresh Kamboju wrote:
> arm64  Freescale Layerscape 2088A RDB Board boot failed with linux-next
> 5.9.0-rc5-next-20200921 kernel tag version. The kernel warning and then
> kernel panic happened.
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git commit: b10b8ad862118bf42c28a98b0f067619aadcfb23
>   git describe: next-20200921
>   make_kernelversion: 5.9.0-rc5
>   kernel-config:
> https://builds.tuxbuild.com/GxPuM0SSznSoSYYG8deYpQ/kernel.config
> 
> 
> crash log,
> 
> [    1.811830] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x48
> [    1.818202] nand: Micron MT29F16G08ABACAWP
> [    1.822314] nand: 2048 MiB, SLC, erase size: 512 KiB, page size:
> 4096, OOB size: 224
> [    1.830078] ------------[ cut here ]------------
> [    1.834703] Driver must set ecc.strength when using hardware ECC
> [    1.840739] WARNING: CPU: 1 PID: 1 at
> drivers/mtd/nand/raw/nand_base.c:5671 nand_scan_with_ids+0x110c/0x1498
> [    1.850568] Modules linked in:
> [    1.853621] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 5.9.0-rc5-next-20200921 #1
> [    1.861015] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
> [    1.867368] pstate: 40000005 (nZcv daif -PAN -UAO -TCO BTYPE=--)
> [    1.873373] pc : nand_scan_with_ids+0x110c/0x1498
> [    1.878073] lr : nand_scan_with_ids+0x110c/0x1498
> [    1.882774] sp : ffff80001005ba50
> [    1.886083] x29: ffff80001005ba50 x28: 0000000000000000
> [    1.891395] x27: ffff0082edf98638 x26: 0000000000000048
> [    1.896706] x25: 000000000000002c x24: ffff0082edf98578
> [    1.902018] x23: 0000000000000001 x22: ffff0082ee6b0000
> [    1.907329] x21: ffff0082edf98840 x20: 0000000000000000
> [    1.912640] x19: ffff0082edf98080 x18: 0000000000000010
> [    1.917951] x17: 0000000000000010 x16: 00000000833b5ff2
> [    1.923262] x15: ffff0082ee6b0480 x14: ffffffffffffffff
> [    1.928572] x13: ffff80009005b737 x12: ffff80001005b73f
> [    1.933883] x11: ffff80001005ba50 x10: ffff80001005ba50
> [    1.939194] x9 : ffffdc379157bfbc x8 : 657274732e636365
> [    1.944504] x7 : 2074657320747375 x6 : ffffdc37937ba000
> [    1.949815] x5 : ffffdc37937baa58 x4 : ffff80001005b840
> [    1.955125] x3 : 0000000000000000 x2 : ffff0082ee6b0000
> [    1.960436] x1 : 4732f0d38a403700 x0 : 0000000000000000
> [    1.965748] Call trace:
> [    1.968189]  nand_scan_with_ids+0x110c/0x1498
> [    1.972542]  fsl_ifc_nand_probe+0x474/0x6e0
> [    1.976723]  platform_drv_probe+0x5c/0xb0
> [    1.980729]  really_probe+0xf0/0x4d8
> [    1.984300]  driver_probe_device+0xfc/0x168
> [    1.988480]  device_driver_attach+0x7c/0x88
> [    1.992659]  __driver_attach+0xac/0x178
> [    1.996490]  bus_for_each_dev+0x78/0xc8
> [    2.000321]  driver_attach+0x2c/0x38
> [    2.003893]  bus_add_driver+0x14c/0x230
> [    2.007724]  driver_register+0x6c/0x128
> [    2.011555]  __platform_driver_register+0x50/0x60
> [    2.016258]  fsl_ifc_nand_driver_init+0x24/0x30
> [    2.020786]  do_one_initcall+0x4c/0x2d0
> [    2.024560] ata1: SATA link down (SStatus 0 SControl 300)
> [    2.024618]  kernel_init_freeable+0x214/0x280
> [    2.024624]  kernel_init+0x1c/0x120
> [    2.037849]  ret_from_fork+0x10/0x30
> [    2.041420] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 5.9.0-rc5-next-20200921 #1
> [    2.048815] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
> [    2.055166] Call trace:
> [    2.057606]  dump_backtrace+0x0/0x1e0
> [    2.061263]  show_stack+0x20/0x30
> [    2.064574]  dump_stack+0xf8/0x168
> [    2.067972]  __warn+0xfc/0x178
> [    2.071023]  report_bug+0xfc/0x170
> [    2.074419]  bug_handler+0x28/0x70
> [    2.077816]  call_break_hook+0x70/0x88
> [    2.080559] ata2: SATA link down (SStatus 0 SControl 300)
> [    2.081560]  brk_handler+0x24/0x68
> [    2.081566]  do_debug_exception+0xb8/0x130
> [    2.094442]  el1_sync_handler+0xd8/0x120
> [    2.098360]  el1_sync+0x80/0x100
> [    2.101583]  nand_scan_with_ids+0x110c/0x1498
> [    2.105935]  fsl_ifc_nand_probe+0x474/0x6e0
> [    2.110115]  platform_drv_probe+0x5c/0xb0
> [    2.114120]  really_probe+0xf0/0x4d8
> [    2.117691]  driver_probe_device+0xfc/0x168
> [    2.121871]  device_driver_attach+0x7c/0x88
> [    2.126050]  __driver_attach+0xac/0x178
> [    2.129882]  bus_for_each_dev+0x78/0xc8
> [    2.133714]  driver_attach+0x2c/0x38
> [    2.137284]  bus_add_driver+0x14c/0x230
> [    2.141116]  driver_register+0x6c/0x128
> [    2.144946]  __platform_driver_register+0x50/0x60
> [    2.149647]  fsl_ifc_nand_driver_init+0x24/0x30
> [    2.154173]  do_one_initcall+0x4c/0x2d0
> [    2.158004]  kernel_init_freeable+0x214/0x280
> [    2.162358]  kernel_init+0x1c/0x120
> [    2.165841]  ret_from_fork+0x10/0x30
> [    2.169415] ---[ end trace d051012f465b08eb ]---
> [    2.174073] fsl,ifc-nand: probe of 530000000.nand failed with error -22
> [    2.181882] spi-nor spi0.0: unrecognized JEDEC id bytes: 1c 38 78 e1 e3 c7
> [    2.189409] spi-nor spi1.0: unrecognized JEDEC id bytes: 00 00 00 00 00 00
> [    2.196301] spi-nor: probe of spi1.0 failed with error -2
> [    2.203202] libphy: Fixed MDIO Bus: probed
> [    2.208607] thunder_xcv, ver 1.0
> [    2.211860] thunder_bgx, ver 1.0
> [    2.215114] nicpf, ver 1.0
> [    2.218785] hclge is initializing
> [    2.222141] hns3: Hisilicon Ethernet Network Driver for Hip08
> Family - version
> [    2.229371] hns3: Copyright (c) 2017 Huawei Corporation.
> [    2.234716] e1000: Intel(R) PRO/1000 Network Driver
> [    2.239598] e1000: Copyright (c) 1999-2006 Intel Corporation.
> [    2.245370] e1000e: Intel(R) PRO/1000 Network Driver
> [    2.250338] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    2.256403] e1000e 0000:01:00.0: Adding to iommu group 0
> [    2.261733] arm-smmu 5000000.iommu: Cannot accommodate DMA offset
> for IOMMU page tables
> [    2.269752] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [    2.278544] Mem abort info:
> [    2.281334]   ESR = 0x96000004
> [    2.284389]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    2.289705]   SET = 0, FnV = 0
> [    2.292759]   EA = 0, S1PTW = 0
> [    2.295900] Data abort info:
> [    2.298781]   ISV = 0, ISS = 0x00000004
> [    2.302618]   CM = 0, WnR = 0
> [    2.305581] [0000000000000000] user address but active_mm is swapper
> [    2.311941] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    2.317512] Modules linked in:
> [    2.320566] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W
>   5.9.0-rc5-next-20200921 #1
> [    2.329352] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
> [    2.335705] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
> [    2.341715] pc : arm_smmu_flush_iotlb_all+0x28/0x90
> [    2.346590] lr : iommu_create_device_direct_mappings.isra.0+0x1f0/0x218
> [    2.353203] sp : ffff80001005b9b0
> [    2.356511] x29: ffff80001005b9b0 x28: 0000000000000000
> [    2.361822] x27: ffffdc3792e904e0 x26: ffff80001005ba48
> [    2.367134] x25: ffff0082ee6b0000 x24: ffff0082ed88e0a8
> [    2.372445] x23: 00000000fffffff4 x22: 0000000000001000
> [    2.377755] x21: ffff80001005ba48 x20: 0000000000000000
> [    2.383066] x19: ffff0082cceeeb58 x18: 0000000000000010
> [    2.388377] x17: 0000000000000000 x16: 00000000833b5ff2
> [    2.393688] x15: ffff0082ee6b0480 x14: 203a756d6d6f692e
> [    2.398999] x13: 3030303030303520 x12: 61646f6d6d6f6363
> [    2.404311] x11: 6120746f6e6e6143 x10: 6f66207465736666
> [    2.409622] x9 : ffffdc3791d31078 x8 : ffff0082ed8ffd00
> [    2.414933] x7 : 0000000000000000 x6 : 000000000000003f
> [    2.420244] x5 : 0000000000000040 x4 : ffff80001005b970
> [    2.425554] x3 : 0000000000000000 x2 : 0000000000000000
> [    2.430865] x1 : ffffdc37927dd2f0 x0 : ffff0082cceeeb58
> [    2.436176] Call trace:
> [    2.438618]  arm_smmu_flush_iotlb_all+0x28/0x90
> [    2.443144]  iommu_create_device_direct_mappings.isra.0+0x1f0/0x218
> [    2.449409]  iommu_probe_device+0x6c/0x120
> [    2.453501]  of_iommu_configure+0x134/0x218
> [    2.457683]  of_dma_configure_id+0x110/0x2e8
> [    2.461950]  pci_dma_configure+0x4c/0xd8
> [    2.465870]  really_probe+0xac/0x4d8
> [    2.469441]  driver_probe_device+0xfc/0x168
> [    2.473620]  device_driver_attach+0x7c/0x88
> [    2.477799]  __driver_attach+0xac/0x178
> [    2.481631]  bus_for_each_dev+0x78/0xc8
> [    2.485463]  driver_attach+0x2c/0x38
> [    2.489033]  bus_add_driver+0x14c/0x230
> [    2.492865]  driver_register+0x6c/0x128
> [    2.496696]  __pci_register_driver+0x4c/0x58
> [    2.500964]  e1000_init_module+0x44/0x50
> [    2.504882]  do_one_initcall+0x4c/0x2d0
> [    2.508714]  kernel_init_freeable+0x214/0x280
> [    2.513068]  kernel_init+0x1c/0x120
> [    2.516552]  ret_from_fork+0x10/0x30
> [    2.520124] Code: 910003fd a90153f3 aa0003f3 f85a8014 (f9400280)
> [    2.526224] ---[ end trace d051012f465b08ec ]---
> [    2.530848] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> [    2.538506] SMP: stopping secondary CPUs
> [    2.542431] Kernel Offset: 0x5c3781480000 from 0xffff800010000000
> [    2.548521] PHYS_OFFSET: 0xffffdb6ac0000000
> [    2.552700] CPU features: 0x0240022,21806008
> [    2.556965] Memory Limit: none
> 
> full test log,
> https://lavalab.nxp.com/scheduler/job/86650#L849
> 
> -- 
> Linaro LKFT
> https://lkft.linaro.org
