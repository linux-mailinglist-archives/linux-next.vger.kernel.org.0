Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79A224B12B
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 10:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgHTIgm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 04:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgHTIgc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2020 04:36:32 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADBCC061383;
        Thu, 20 Aug 2020 01:36:31 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id p37so801790pgl.3;
        Thu, 20 Aug 2020 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gZ4M3MftSst4uUZ0HrdxF3GpwxKyO6szE0fu9Fon+jk=;
        b=NSxIIXF2R5FqN++sz+8KGtiN/oAzS6LFu/ImhF3Vt2Tu342Q/R2f/pbGODK4NPJb54
         8clwLAY/vwMv0YZen90N9Dsvhb0uC8L5ZkGj0faUirCTTa5+7RlA+7DymDlHY9Qsf3x+
         8Y3PbHEFkPydygeY9qkqQ1EH4Kn22tJh6ffkfn8uL0aLbtTEEzu7BtiGIGEomN+zDxab
         OeX15hAJvlZ5G3fefUtaZQHKe3hJxMvhH+Y/Y1QTdvRVpmytvZFizABB6yzSy8RFi4X4
         6EUTwTARrHiaKX2p3tL+Qh9TCuJaMUfLdn5V7j3H/L4us3pnP9AkCVDuQi57VI1UWaVB
         /58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gZ4M3MftSst4uUZ0HrdxF3GpwxKyO6szE0fu9Fon+jk=;
        b=m0ihY15/q5pb8EztSzop62uvCmi9b/XYo2o4txdIF6V9MdcBGE580hsEJYsCxcbrf+
         MwYXVnJl/rAeLupe/cJcGLnKpxp/HgNttWhrlS0U4furarldO6b2Iu204ssxvVfvP+vW
         IC55Mqi3I82vIzspaBRYe/lqfx022aR7VI1qtc73hi4hed4WNT6f6nsEYLJPYp5Ra3rz
         HLMwJuZsY1hPsvAYqiBXkBvnHF5/naWbdXUeHjihkEcLQFPf5s3js/m/9HCuUWqe6hBB
         KAZMWiHQV6wVwo7Q6iO+SuqRhhdovDI+oQ7P8U97ga1nAEzDChhIaWs53D6qT1HxO/aU
         t5Hg==
X-Gm-Message-State: AOAM5327OhRJmZt+C6uqsCAMU8761bJgPo1Xpt7tJv0Smd3iFUcsJPBd
        yVfkAdaCTEd5nVvsBRouIA0pa5TLrG+IEg==
X-Google-Smtp-Source: ABdhPJz08h2xeJDpnuh8RK7OfokMPRAN+hKHOHsWHGCgSbjI0xPyYuGSa4T6agV3KpWU0fXI8j6i/g==
X-Received: by 2002:aa7:9551:: with SMTP id w17mr1440645pfq.167.1597912590855;
        Thu, 20 Aug 2020 01:36:30 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
        by smtp.gmail.com with ESMTPSA id w14sm2067910pfj.220.2020.08.20.01.36.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Aug 2020 01:36:30 -0700 (PDT)
Date:   Thu, 20 Aug 2020 01:36:17 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the dma-mapping tree
Message-ID: <20200820083617.GA6124@Asurada>
References: <20200820155112.29459f41@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820155112.29459f41@canb.auug.org.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Aug 20, 2020 at 03:51:12PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the dma-mapping tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
> 
> [    1.829053][    T1] ------------[ cut here ]------------
> [    1.829629][    T1] kernel BUG at include/linux/iommu-helper.h:21!
> [    1.830182][    T1] Oops: Exception in kernel mode, sig: 5 [#1]
> [    1.830302][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [    1.830436][    T1] Modules linked in:
> [    1.830879][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc1 #2
> [    1.831042][    T1] NIP:  c0000000006f4944 LR: c0000000006f4924 CTR: c00000000004aa10
> [    1.831174][    T1] REGS: c00000007e3a31e0 TRAP: 0700   Not tainted  (5.9.0-rc1)
> [    1.831243][    T1] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44022422  XER: 20000000
> [    1.831574][    T1] CFAR: c0000000006b3084 IRQMASK: 1 
> [    1.831574][    T1] GPR00: c0000000006f4924 c00000007e3a3470 c000000001289000 0000000000000001 
> [    1.831574][    T1] GPR04: 0000000000000000 0000000000000003 0000000000000040 0000000000000000 
> [    1.831574][    T1] GPR08: 0000000000000001 0000000000000000 fffffffffffffffe c00c000000000000 
> [    1.831574][    T1] GPR12: 0000000024028420 c0000000014b0000 c00000007e9cd000 0000000000000001 
> [    1.831574][    T1] GPR16: 0000000000000000 0000000000000000 c00000007e9cd100 c00000007e9cd118 
> [    1.831574][    T1] GPR20: 00000000ffffffff 0000000000000000 0000000000000001 0000000000000000 
> [    1.831574][    T1] GPR24: 0000000000000000 ffffffffffffffff c00000007eb20000 0000000000000000 
> [    1.831574][    T1] GPR28: 0000000000000001 000000000000bfff 0000000000000000 0000000000000001 
> [    1.833145][    T1] NIP [c0000000006f4944] iommu_area_alloc+0xa4/0x170
> [    1.833271][    T1] LR [c0000000006f4924] iommu_area_alloc+0x84/0x170
> [    1.833494][    T1] Call Trace:
> [    1.833686][    T1] [c00000007e3a3470] [c0000000006f4924] iommu_area_alloc+0x84/0x170 (unreliable)
> [    1.833961][    T1] [c00000007e3a34e0] [c00000000004b034] iommu_range_alloc+0x1a4/0x410
> [    1.834116][    T1] [c00000007e3a35a0] [c00000000004b650] iommu_alloc+0x60/0x130
> [    1.834248][    T1] [c00000007e3a35f0] [c00000000004c6c8] iommu_map_page+0xd8/0x210
> [    1.834381][    T1] [c00000007e3a3680] [c00000000004aa70] dma_iommu_map_page+0x60/0x80
> [    1.834502][    T1] [c00000007e3a36a0] [c0000000001cce30] dma_map_page_attrs+0x190/0x260
> [    1.834628][    T1] [c00000007e3a3750] [c00000000086195c] ibmvscsi_probe+0x12c/0xa2c
> [    1.834768][    T1] [c00000007e3a3830] [c0000000000e049c] vio_bus_probe+0x9c/0x460
> [    1.834880][    T1] [c00000007e3a38d0] [c0000000007f2cbc] really_probe+0x12c/0x4e0
> [    1.834993][    T1] [c00000007e3a3970] [c0000000007f3308] driver_probe_device+0x88/0x120
> [    1.835108][    T1] [c00000007e3a39a0] [c0000000007f36ec] device_driver_attach+0xcc/0xe0
> [    1.835220][    T1] [c00000007e3a39e0] [c0000000007f3780] __driver_attach+0x80/0x140
> [    1.835321][    T1] [c00000007e3a3a20] [c0000000007ef9a8] bus_for_each_dev+0xa8/0x130
> [    1.835429][    T1] [c00000007e3a3a80] [c0000000007f2394] driver_attach+0x34/0x50
> [    1.835534][    T1] [c00000007e3a3aa0] [c0000000007f1878] bus_add_driver+0x1e8/0x2b0
> [    1.835647][    T1] [c00000007e3a3b30] [c0000000007f47f8] driver_register+0x98/0x1a0
> [    1.835782][    T1] [c00000007e3a3ba0] [c0000000000df4bc] __vio_register_driver+0x4c/0x60
> [    1.835938][    T1] [c00000007e3a3bc0] [c000000000f8d924] ibmvscsi_module_init+0xa4/0xdc
> [    1.836056][    T1] [c00000007e3a3c00] [c000000000012430] do_one_initcall+0x60/0x2b0
> [    1.836175][    T1] [c00000007e3a3cd0] [c000000000f44740] kernel_init_freeable+0x2e0/0x378
> [    1.836287][    T1] [c00000007e3a3db0] [c000000000012a24] kernel_init+0x2c/0x158
> [    1.836509][    T1] [c00000007e3a3e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
> [    1.836717][    T1] Instruction dump:
> [    1.836904][    T1] 2da90000 f8010010 f821ff91 4bfbe669 60000000 7c3d1840 7c7f1b78 40810074 
> [    1.837082][    T1] 60000000 60000000 60000000 40920010 <0fe00000> 60000000 60000000 408efff4 
> [    1.838497][    T1] ---[ end trace e9dbc52052087399 ]---
> 
> The BUG is
> 
>   BUG_ON(!is_power_of_2(boundary_size));
> 
> in iommu_is_span_boundary()

Took a quick look -- the boundary_size is seemingly passed from
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/powerpc/kernel/iommu.c#n240

	boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
			1 << tbl->it_page_shift);

Looks like an overflow happens due to (ULONG_MAX + 1). Should
we fix here instead (or also)?

Thanks
Nic
