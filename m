Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43E25F1AF3
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 17:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfKFQQv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 11:16:51 -0500
Received: from foss.arm.com ([217.140.110.172]:42544 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728572AbfKFQQv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 11:16:51 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9286146A;
        Wed,  6 Nov 2019 08:16:50 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDE263F719;
        Wed,  6 Nov 2019 08:16:48 -0800 (PST)
Date:   Wed, 6 Nov 2019 16:16:43 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Mark Brown <broonie@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Linux-next-20191106 : arm64: Internal error: Oops: 96000007
Message-ID: <20191106161642.GA57080@lakrids.cambridge.arm.com>
References: <CA+G9fYvm_QEq+9e+dni1Y+bJswr9bU5=shJcC+wKjjOyiPsXXQ@mail.gmail.com>
 <bfced8c8-c64f-982e-8797-d48b5ec65291@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfced8c8-c64f-982e-8797-d48b5ec65291@arm.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 06, 2019 at 04:07:52PM +0000, Robin Murphy wrote:
> On 06/11/2019 15:56, Naresh Kamboju wrote:
> > arm64 devices Juno-r2, hikey (Hi6220) and dragonboard (APQ 8016 SBC)
> > boot failed while running linux next 20191106 kernel. But qemu_arm64
> > boot pass.
> > 
> > Crash log from dragonboard,
> > 
> > [   10.656527] Unable to handle kernel paging request at virtual
> > address ffff800011b3ef68
> > [   10.656580] Mem abort info:
> > [   10.656587]   ESR = 0x96000007
> > [   10.656594]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [   10.656600]   SET = 0, FnV = 0
> > [   10.656605]   EA = 0, S1PTW = 0
> > [   10.656610] Data abort info:
> > [   10.656616]   ISV = 0, ISS = 0x00000007
> > [   10.656621]   CM = 0, WnR = 0
> > [   10.656629] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000081980000
> > [   10.656635] [ffff800011b3ef68] pgd=00000000bfeff003,
> > pud=00000000bfefe003, pmd=00000000bfefa003, pte=0000000000000000
> > [   10.656887] Internal error: Oops: 96000007 [#1] PREEMPT SMP
> > [   10.656894] Modules linked in: adv7511(+) cec msm(+) mdt_loader
> > drm_kms_helper qcom_rng drm socinfo rmtfs_mem qrtr fuse
> > [   10.656928] CPU: 0 PID: 230 Comm: systemd-udevd Not tainted
> > 5.4.0-rc6-next-20191106 #1
> > [   10.656933] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > [   10.656939] pstate: a0000085 (NzCv daIf -PAN -UAO)
> > [   10.656953] pc : __of_match_node.part.5+0x48/0x88
> > [   10.656960] lr : of_match_node+0x40/0x70
> > [   10.656964] sp : ffff8000132534d0
> > [   10.656968] x29: ffff8000132534d0 x28: ffff8000101d6260
> > [   10.656977] x27: ffff80001241a7a0 x26: ffff80001241a7a0
> > [   10.656985] x25: ffff80001241a860 x24: ffff80001241a6e8
> > [   10.656993] x23: 0000000000000000 x22: ffff00003fd08010
> > [   10.657001] x21: 0000000000000000 x20: 0000000000000000
> > [   10.657008] x19: ffff800011b3ef68 x18: ffffffffffffffff
> > [   10.657016] x17: 0000000000000000 x16: 0000000000000000
> > [   10.657024] x15: ffff8000121ffa48 x14: 4e3a666f3d534149
> > [   10.657032] x13: 0000000000000040 x12: 0000000000000028
> > [   10.657039] x11: 0000000000000001 x10: 0101010101010101
> > [   10.657047] x9 : ffff800012532c50 x8 : 0000000000000050
> > [   10.657055] x7 : ffff800010df1164 x6 : 0000000000000000
> > [   10.657063] x5 : 00000000a4fd7f12 x4 : ffff00003bd7cd18
> > [   10.657070] x3 : 0000000000000000 x2 : 0000000000000001
> > [   10.657078] x1 : ffff00003fd08010 x0 : ffff800010df1178
> > [   10.657086] Call trace:
> > [   10.657094]  __of_match_node.part.5+0x48/0x88
> 
> FWIW this smells like a builtin driver had its of_device_id table marked
> __init, leaving drv->of_match_table as a dangling pointer to freed memory by
> this point.

Yuck, there are lots of potential instances in mainline:

[mark@lakrids:~/src/linux]% git grep of_device_id | grep __init  | wc -l
141

... so we probably need to clean that up.

Mark.
