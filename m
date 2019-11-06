Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06436F1C45
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 18:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732236AbfKFRTV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 12:19:21 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:38310 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729075AbfKFRTU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2019 12:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Q1snHVOjvov2W8i0pGQGf0sAPNpUIvqQUdMy3Qldyrk=; b=RipgNPFgEN6zp/8BlVS2Wwri6
        SELXtoB+F+T3Oh0b4EfQS3WElMFIR6wm27qGvGUr/xsGRDKdkVv0ljG3HGmGYlFbBkDdLrBfgkgJw
        qKOUNW1L14Pn8MNpvNq5KobiEtaTOn1gPbTidQUDUx8hkJdLje4Zc1rNZ7INM4z7tgNheMQBdNqSc
        1kbYvO+qq/uY159PmplUK77n/IAiqAreOllyv35uiHTDPbpssMUI9VFpbQi/upd67kQjt5Syxziyn
        GPskyN9mQbLFko7Aspjq2iabkp05eS4mlgRB+PIIzzbEDr4SgkbcEuz7DrkVpOnevGo/q53OB1zzW
        esbWcUgRg==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:52656)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iSOxW-0006QF-5B; Wed, 06 Nov 2019 17:19:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iSOxS-0004Cq-8b; Wed, 06 Nov 2019 17:19:02 +0000
Date:   Wed, 6 Nov 2019 17:19:02 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Mark Brown <broonie@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Linux-next-20191106 : arm64: Internal error: Oops: 96000007
Message-ID: <20191106171902.GT25745@shell.armlinux.org.uk>
References: <CA+G9fYvm_QEq+9e+dni1Y+bJswr9bU5=shJcC+wKjjOyiPsXXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvm_QEq+9e+dni1Y+bJswr9bU5=shJcC+wKjjOyiPsXXQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Could you please explain why you've sent this to me?

Thanks.

On Wed, Nov 06, 2019 at 09:26:29PM +0530, Naresh Kamboju wrote:
> arm64 devices Juno-r2, hikey (Hi6220) and dragonboard (APQ 8016 SBC)
> boot failed while running linux next 20191106 kernel. But qemu_arm64
> boot pass.
> 
> Crash log from dragonboard,
> 
> [   10.656527] Unable to handle kernel paging request at virtual
> address ffff800011b3ef68
> [   10.656580] Mem abort info:
> [   10.656587]   ESR = 0x96000007
> [   10.656594]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   10.656600]   SET = 0, FnV = 0
> [   10.656605]   EA = 0, S1PTW = 0
> [   10.656610] Data abort info:
> [   10.656616]   ISV = 0, ISS = 0x00000007
> [   10.656621]   CM = 0, WnR = 0
> [   10.656629] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000081980000
> [   10.656635] [ffff800011b3ef68] pgd=00000000bfeff003,
> pud=00000000bfefe003, pmd=00000000bfefa003, pte=0000000000000000
> [   10.656887] Internal error: Oops: 96000007 [#1] PREEMPT SMP
> [   10.656894] Modules linked in: adv7511(+) cec msm(+) mdt_loader
> drm_kms_helper qcom_rng drm socinfo rmtfs_mem qrtr fuse
> [   10.656928] CPU: 0 PID: 230 Comm: systemd-udevd Not tainted
> 5.4.0-rc6-next-20191106 #1
> [   10.656933] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [   10.656939] pstate: a0000085 (NzCv daIf -PAN -UAO)
> [   10.656953] pc : __of_match_node.part.5+0x48/0x88
> [   10.656960] lr : of_match_node+0x40/0x70
> [   10.656964] sp : ffff8000132534d0
> [   10.656968] x29: ffff8000132534d0 x28: ffff8000101d6260
> [   10.656977] x27: ffff80001241a7a0 x26: ffff80001241a7a0
> [   10.656985] x25: ffff80001241a860 x24: ffff80001241a6e8
> [   10.656993] x23: 0000000000000000 x22: ffff00003fd08010
> [   10.657001] x21: 0000000000000000 x20: 0000000000000000
> [   10.657008] x19: ffff800011b3ef68 x18: ffffffffffffffff
> [   10.657016] x17: 0000000000000000 x16: 0000000000000000
> [   10.657024] x15: ffff8000121ffa48 x14: 4e3a666f3d534149
> [   10.657032] x13: 0000000000000040 x12: 0000000000000028
> [   10.657039] x11: 0000000000000001 x10: 0101010101010101
> [   10.657047] x9 : ffff800012532c50 x8 : 0000000000000050
> [   10.657055] x7 : ffff800010df1164 x6 : 0000000000000000
> [   10.657063] x5 : 00000000a4fd7f12 x4 : ffff00003bd7cd18
> [   10.657070] x3 : 0000000000000000 x2 : 0000000000000001
> [   10.657078] x1 : ffff00003fd08010 x0 : ffff800010df1178
> [   10.657086] Call trace:
> [   10.657094]  __of_match_node.part.5+0x48/0x88
> [   10.657099]  of_match_node+0x40/0x70
> [   10.657106]  of_match_device+0x30/0x50
> [   10.657115]  platform_match+0x4c/0xe8
> [   10.657122]  __device_attach_driver+0x3c/0x120
> [   10.657128]  bus_for_each_drv+0x78/0xd8
> [   10.657135]  __device_attach+0xe8/0x170
> [   10.657141]  device_initial_probe+0x24/0x30
> [   10.657148]  bus_probe_device+0xa0/0xa8
> [   10.657154]  device_add+0x4fc/0x7a8
> [   10.657160]  of_device_add+0x50/0x68
> [   10.657167]  of_platform_device_create_pdata+0xf0/0x170
> [   10.657173]  of_platform_bus_create+0x174/0x550
> [   10.657180]  of_platform_populate+0x94/0x158
> [   10.657358]  msm_pdev_probe+0x74/0x358 [msm]
> [   10.657369]  platform_drv_probe+0x58/0xa8
> [   10.657377]  really_probe+0x290/0x488
> [   10.657384]  driver_probe_device+0x12c/0x148
> [   10.657391]  device_driver_attach+0x74/0x98
> [   10.657397]  __driver_attach+0xc4/0x178
> [   10.657403]  bus_for_each_dev+0x84/0xd8
> [   10.657409]  driver_attach+0x30/0x40
> [   10.657416]  bus_add_driver+0x170/0x258
> [   10.657423]  driver_register+0x64/0x118
> [   10.657430]  __platform_driver_register+0x54/0x60
> [   10.657582]  msm_drm_register+0x60/0x6c [msm]
> [   10.657592]  do_one_initcall+0x94/0x460
> [   10.657600]  do_init_module+0x60/0x204
> [   10.657606]  load_module+0x2078/0x2720
> [   10.657613]  __do_sys_finit_module+0x100/0x120
> [   10.657619]  __arm64_sys_finit_module+0x28/0x38
> [   10.657628]  el0_svc_common.constprop.2+0x7c/0x180
> [   10.657635]  el0_svc_handler+0x34/0xa0
> [   10.657643]  el0_sync_handler+0x124/0x1f8
> [   10.657649]  el0_sync+0x140/0x180
> [   10.657659] Code: 1a80d281 9a93d2b5 2a0103f4 91032273 (39400264)
> [   10.657667] ---[ end trace 8b4c2740f71524d1 ]---
> 
> Full test log,
> https://lkft.validation.linaro.org/scheduler/job/994051#L1396
> 
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: dcd34bd234181ec74f081c7d0025204afe6b213e
>   git describe: next-20191106
>   make_kernelversion: 5.4.0-rc6
>   kernel-config:
> http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/640/config
>   build-location:
> http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/640
> 
> 
> Best regards
> Naresh Kamoju
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
