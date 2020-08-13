Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80469243CCA
	for <lists+linux-next@lfdr.de>; Thu, 13 Aug 2020 17:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgHMPuV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Aug 2020 11:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgHMPuV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Aug 2020 11:50:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAC4C061757;
        Thu, 13 Aug 2020 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:References;
        bh=hcRGhxjeGGcGlL0jZtmM6ynKLp4oPbSQ7Fim3MB2HL4=; b=AJOZfHRNcKSNOPpzUH+9Y0lsem
        WVTwk3Q43JKKwOubbajp7NsJQfbX7H+m6a5MIkEGah3ohP5pAnx1ZiTWLtxBw7ucngZkZcVYC2DaG
        Kc/TuCS7s1srPKV/MiGXCYS+Bz1SgHa8cqayJsXbOIbDd7HoOnNPKAetH4m2NIsMy0AoTUV+fxTfN
        Dc7QB834JroqBZYOdhP5n0Mazpd88hcT5ITKnAn0ePWtGMabxZKh666skge4xMlX4yUhVHZq9Kf8R
        SYGhJx4aiDNoNPEwlST4Xlw1Ff+2BaeT25kCCRn8yzw0e6CkG61pps9ACFx7Mc10GEHLhW04+b3w2
        PVtT3gyA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k6FUX-0000kK-BX; Thu, 13 Aug 2020 15:50:09 +0000
Date:   Thu, 13 Aug 2020 16:50:09 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     John Garry <john.garry@huawei.com>
Cc:     linux-nvme <linux-nvme@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: nvme crash - Re: linux-next: Tree for Aug 13
Message-ID: <20200813155009.GA2303@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <454c65b1-872a-a48c-662d-690044662772@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 13, 2020 at 12:00:19PM +0100, John Garry wrote:
> On 13/08/2020 07:58, Stephen Rothwell wrote:
> > Hi all,
> 
> Hi guys,
> 
> I have experienced this this crash below on linux-next for the last few days
> on my arm64 system. Linus' master branch today also has it.

Adding Robin and the iommu list as this seems to be in the dma-iommu
code.

> root@ubuntu:/home/john# insmod nvme.ko
> [148.254564] nvme 0000:81:00.0: Adding to iommu group 21
> [148.260973] nvme nvme0: pci function 0000:81:00.0
> root@ubuntu:/home/john# [148.272996] Unable to handle kernel NULL pointer
> dereference at virtual address 0000000000000010
> [148.281784] Mem abort info:
> [148.284584] ESR = 0x96000004
> [148.287641] EC = 0x25: DABT (current EL), IL = 32 bits
> [148.292950] SET = 0, FnV = 0
> [148.295998] EA = 0, S1PTW = 0
> [148.299126] Data abort info:
> [148.302003] ISV = 0, ISS = 0x00000004
> [148.305832] CM = 0, WnR = 0
> [148.308794] user pgtable: 4k pages, 48-bit VAs, pgdp=00000a27bf3c9000
> [148.315229] [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
> [148.322016] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [148.327577] Modules linked in: nvme nvme_core
> [148.331927] CPU: 56 PID: 256 Comm: kworker/u195:0 Not tainted
> 5.8.0-next-20200812 #27
> [148.339744] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 UEFI RC0 -
> V1.16.01 03/15/2019
> [148.348260] Workqueue: nvme-reset-wq nvme_reset_work [nvme]
> [148.353822] pstate: 80c00009 (Nzcv daif +PAN +UAO BTYPE=--)
> [148.359390] pc : __sg_alloc_table_from_pages+0xec/0x238
> [148.364604] lr : __sg_alloc_table_from_pages+0xc8/0x238
> [148.369815] sp : ffff800013ccbad0
> [148.373116] x29: ffff800013ccbad0 x28: ffff0a27b3d380a8
> [148.378417] x27: 0000000000000000 x26: 0000000000002dc2
> [148.383718] x25: 0000000000000dc0 x24: 0000000000000000
> [148.389019] x23: 0000000000000000 x22: ffff800013ccbbe8
> [148.394320] x21: 0000000000000010 x20: 0000000000000000
> [148.399621] x19: 00000000fffff000 x18: ffffffffffffffff
> [148.404922] x17: 00000000000000c0 x16: fffffe289eaf6380
> [148.410223] x15: ffff800011b59948 x14: ffff002bc8fe98f8
> [148.415523] x13: ff00000000000000 x12: ffff8000114ca000
> [148.420824] x11: 0000000000000000 x10: ffffffffffffffff
> [148.426124] x9 : ffffffffffffffc0 x8 : ffff0a27b5f9b6a0
> [148.431425] x7 : 0000000000000000 x6 : 0000000000000001
> [148.436726] x5 : ffff0a27b5f9b680 x4 : 0000000000000000
> [148.442027] x3 : ffff0a27b5f9b680 x2 : 0000000000000000
> [148.447328] x1 : 0000000000000001 x0 : 0000000000000000
> [148.452629] Call trace:
> [148.455065]__sg_alloc_table_from_pages+0xec/0x238
> [148.459931]sg_alloc_table_from_pages+0x18/0x28
> [148.464541]iommu_dma_alloc+0x474/0x678
> [148.468455]dma_alloc_attrs+0xd8/0xf0
> [148.472193]nvme_alloc_queue+0x114/0x160 [nvme]
> [148.476798]nvme_reset_work+0xb34/0x14b4 [nvme]
> [148.481407]process_one_work+0x1e8/0x360
> [148.485405]worker_thread+0x44/0x478
> [148.489055]kthread+0x150/0x158
> [148.492273]ret_from_fork+0x10/0x34
> [148.495838] Code: f94002c3 6b01017f 540007c2 11000486 (f8645aa5)
> [148.501921] ---[ end trace 89bb2b72d59bf925 ]---
> 
> Anything to worry about? I guess not since we're in the merge window, but
> mentioning just in case ...
> 
> Thanks,
> john
> 
> > 
> > News: The merge window has opened, so please do not add any v5.10
> > related material to your linux-next included branches until after the
> > merge window closes again.
> > 
> > Changes since 20200812:
> > 
> > My fixes tree contains:
> > 
> >    73c7adb54169 ("device_cgroup: Fix RCU list debugging warning")
> > 
> > Linus' tree produces a WARNING in my qemu testing (see
> > https://lore.kernel.org/lkml/20200813164654.061dbbd3@canb.auug.org.au/).
> > 
> > Non-merge commits (relative to Linus' tree): 946
> >   1083 files changed, 28405 insertions(+), 9953 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> > I have created today's linux-next tree at
> > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> > are tracking the linux-next tree using git, you should not use "git pull"
> > to do so as that will try to merge the new linux-next release with the
> > old one.  You should use "git fetch" and checkout or reset to the new
> > master.
> > 
> > You can see which trees have been included by looking in the Next/Trees
> > file in the source.  There are also quilt-import.log and merge.log
> > files in the Next directory.  Between each merge, the tree was built
> > with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> > multi_v7_defconfig for arm and a native build of tools/perf. After
> > the final fixups (if any), I do an x86_64 modules_install followed by
> > builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> > ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> > and sparc64 defconfig and htmldocs. And finally, a simple boot test
> > of the powerpc pseries_le_defconfig kernel in qemu (with and without
> > kvm enabled).
> > 
> > Below is a summary of the state of the merge.
> > 
> > I am currently merging 327 trees (counting Linus' and 85 trees of bug
> > fix patches pending for the current merge release).
> > 
> > Stats about the size of the tree over time can be seen at
> > http://neuling.org/linux-next-size.html .
> > 
> > Status of my local build tests will be at
> > http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> > advice about cross compilers/configs that work, we are always open to add
> > more builds.
> > 
> > Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> > Gortmaker for triage and bug fixes.
> > 
> 
> 
> _______________________________________________
> Linux-nvme mailing list
> Linux-nvme@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-nvme
---end quoted text---
