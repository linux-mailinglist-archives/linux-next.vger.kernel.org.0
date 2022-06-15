Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEB954C9D9
	for <lists+linux-next@lfdr.de>; Wed, 15 Jun 2022 15:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238185AbiFONcF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jun 2022 09:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbiFONcF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jun 2022 09:32:05 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 91D78340D0;
        Wed, 15 Jun 2022 06:32:03 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4144C139F;
        Wed, 15 Jun 2022 06:32:03 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.38.208])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DE3A3F40C;
        Wed, 15 Jun 2022 06:32:00 -0700 (PDT)
Date:   Wed, 15 Jun 2022 14:31:51 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        regressions@lists.linux.dev,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Tejun Heo <tj@kernel.org>, Hao Luo <haoluo@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [next] arm64: db410c: Internal error: Oops: 96000004 - pc :
 sysfs_kf_seq_show
Message-ID: <YqnfRyJkhPCVBmDz@FVFF77S0Q05N>
References: <CA+G9fYtE0FmFgocYChrJrJc1Pcw+fc5yt8nHwTW7JPcZT=qH+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtE0FmFgocYChrJrJc1Pcw+fc5yt8nHwTW7JPcZT=qH+w@mail.gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 15, 2022 at 02:27:31AM +0530, Naresh Kamboju wrote:
> Following kernel crash reported while booting arm64 db410c board with
> Linux next-20220614 [1] kfence enabled on this kernel.
> 
> CONFIG_KFENCE=y

Was that just defconfig + CONFIG_KFENCE?

Does this not happen *without* KFENCE?

FWIW, I tried your Image in a KVM VM on a ThunderX2 host, and I cannot
reproduce the issue, so it looks like this is board-specific (e.g. due to
specific drivers).

Looking at the backtrace, nothing seems to finger kfence specifically.

Can you bisect this? It looks like there are ~1700 commits between mainline and
next-20220614, which is ~10 steps if mainline is working.

Mark.

> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Boot log:
> ---------
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
> [    0.000000] Linux version 5.19.0-rc2-next-20220614
> (tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 11.3.0-3) 11.3.0, GNU
> ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT @1655189659
> [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
> [    0.000000] efi: UEFI not found.
> [    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please
> fix your bootloader!
> <trim>
> [    0.000000] kfence: initialized - using 2097152 bytes for 255
> objects at 0x(____ptrval____)-0x(____ptrval____)
> <trim>
> [   11.317288] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [   11.317361] Mem abort info:
> [   11.317906] Unable to handle kernel paging request at virtual
> address 0000000029f63007
> [   11.328825] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000009
> [   11.334704]   ESR = 0x0000000096000004
> [   11.343115] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [   11.357163] Mem abort info:
> [   11.357217]   ESR = 0x0000000096000004
> [   11.359935] Mem abort info:
> [   11.369085] Mem abort info:
> [   11.369138]   ESR = 0x0000000096000004
> [   11.373564]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   11.374530]   SET = 0, FnV = 0
> [   11.382591]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   11.382864]   SET = 0, FnV = 0
> [   11.400484]   ESR = 0x0000000096000004
> [   11.411713]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   11.411776]   SET = 0, FnV = 0
> [   11.422177]   EA = 0, S1PTW = 0
> [   11.422234]   FSC = 0x04: level 0 translation fault
> [   11.422724]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   11.424129] Data abort info:
> [   11.428397]   EA = 0, S1PTW = 0
> [   11.428416]   FSC = 0x04: level 0 translation fault
> [   11.428427] Data abort info:
> [   11.428434]   ISV = 0, ISS = 0x00000004
> [   11.428442]   CM = 0, WnR = 0
> [   11.428451] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000854b8000
> [   11.428464] [0000000029f63007] pgd=0000000000000000, p4d=0000000000000000
> [   11.428494] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [   11.428503] Modules linked in: venus_enc venus_dec
> videobuf2_dma_contig crct10dif_ce adv7511(+) cec qcom_wcnss_pil
> snd_soc_msm8916_analog qcom_pon qcom_spmi_temp_alarm rtc_pm8xxx
> qcom_spmi_vadc snd_soc_lpass_apq8016 qcom_vadc_common
> snd_soc_msm8916_digital snd_soc_lpass_cpu snd_soc_apq8016_sbc
> snd_soc_lpass_platform qcom_q6v5_mss snd_soc_qcom_common qcom_pil_info
> msm qcom_camss qcom_q6v5 gpu_sched qcom_sysmon drm_dp_aux_bus
> venus_core qcom_common videobuf2_dma_sg v4l2_mem2mem v4l2_fwnode
> qcom_glink_smem v4l2_async videobuf2_memops qmi_helpers videobuf2_v4l2
> mdt_loader qnoc_msm8916 drm_display_helper videobuf2_common
> i2c_qcom_cci qcom_rng qcom_stats icc_smd_rpm rfkill display_connector
> drm_kms_helper drm socinfo rmtfs_mem qrtr fuse
> [   11.428683] CPU: 3 PID: 312 Comm: systemd-udevd Tainted: G        W
>         5.19.0-rc2-next-20220614 #1
> [   11.428694] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [   11.428699] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   11.428709] pc : sysfs_kf_seq_show+0x3c/0x130
> [   11.428724] lr : kernfs_seq_show+0x38/0x44
> [   11.428735] sp : ffff80000b7ebbf0
> [   11.428739] x29: ffff80000b7ebbf0 x28: 0000000000000001 x27: 0000000000400cc0
> [   11.428753] x26: 000000007ffff000 x25: ffff000005581290 x24: ffff000005581280
> [   11.428767] x23: 0000000000000000 x22: ffff0000056dd520 x21: ffff000004413d00
> [   11.428780] x20: 0000000029f62fff x19: ffff000005581258 x18: 0000000000000000
> [   11.428793] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [   11.428806] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [   11.428819] x11: 0000000000000000 x10: 0000000000000000 x9 : ffff8000084b0ca8
> [   11.428832] x8 : 0000000000000000 x7 : 0000000000000200 x6 : 0000000000000000
> [   11.428845] x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff000004413d00
> [   11.428857] x2 : ffff8000084b2e64 x1 : 0000000000000001 x0 : ffff000002368a00
> [   11.428872] Call trace:
> [   11.428875]  sysfs_kf_seq_show+0x3c/0x130
> [   11.428884]  kernfs_seq_show+0x38/0x44
> [   11.428895]  seq_read_iter+0x1c4/0x4c0
> [   11.428905]  kernfs_fop_read_iter+0x14c/0x1d0
> [   11.428917]  new_sync_read+0xdc/0x160
> [   11.428927]  vfs_read+0x19c/0x1e4
> [   11.428937]  ksys_read+0x74/0x100
> [   11.428947]  __arm64_sys_read+0x28/0x3c
> [   11.428956]  invoke_syscall+0x50/0x120
> [   11.428968]  el0_svc_common.constprop.0+0x104/0x124
> [   11.428980]  do_el0_svc+0x3c/0xcc
> [   11.428990]  el0_svc+0x38/0xc0
> [   11.429003]  el0t_64_sync_handler+0xbc/0x140
> [   11.429013]  el0t_64_sync+0x18c/0x190
> [   11.429026] Code: f9400400 f9403016 f94016d4 b4000054 (f9400694)
> [   11.429034] ---[ end trace 0000000000000000 ]---
> [   11.430509]   EA = 0, S1PTW = 0
> [   11.436545]   SET = 0, FnV = 0
> [   11.443175] Unable to handle kernel paging request at virtual
> address 0000000029f63007
> [   11.445643]   EA = 0, S1PTW = 0
> [   11.452829] Mem abort info:
> [   11.455190]   FSC = 0x04: level 0 translation fault
> [   11.458711]   ISV = 0, ISS = 0x00000004
> [   11.458728]   CM = 0, WnR = 0
> [   11.458738] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008223b000
> [   11.458751] [0000000000000009] pgd=0000000000000000, p4d=0000000000000000
> [   11.458780] Internal error: Oops: 96000004 [#2] PREEMPT SMP
> [   11.458790] Modules linked in: pm8916_wdt(+) venus_enc venus_dec
> videobuf2_dma_contig crct10dif_ce adv7511(+) cec qcom_wcnss_pil
> snd_soc_msm8916_analog qcom_pon qcom_spmi_temp_alarm rtc_pm8xxx
> qcom_spmi_vadc snd_soc_lpass_apq8016 qcom_vadc_common
> snd_soc_msm8916_digital snd_soc_lpass_cpu snd_soc_apq8016_sbc
> snd_soc_lpass_platform qcom_q6v5_mss snd_soc_qcom_common qcom_pil_info
> msm qcom_camss qcom_q6v5 gpu_sched qcom_sysmon drm_dp_aux_bus
> venus_core qcom_common videobuf2_dma_sg v4l2_mem2mem v4l2_fwnode
> qcom_glink_smem v4l2_async videobuf2_memops qmi_helpers videobuf2_v4l2
> mdt_loader qnoc_msm8916 drm_display_helper videobuf2_common
> i2c_qcom_cci qcom_rng qcom_stats icc_smd_rpm rfkill display_connector
> drm_kms_helper drm socinfo rmtfs_mem qrtr fuse
> [   11.458973] CPU: 1 PID: 314 Comm: systemd-udevd Tainted: G      D W
>         5.19.0-rc2-next-20220614 #1
> [   11.458982] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [   11.458987] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   11.458996] pc : sysfs_kf_seq_show+0x3c/0x130
> [   11.459011] lr : kernfs_seq_show+0x38/0x44
> 
> 
> metadata:
>   git_ref: master
>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git_sha: 35d872b9ea5b3ad784d7479ea728dcb688df2db7
>   git_describe: next-20220614
>   kernel_version: 5.19.0-rc2
>   kernel-config: https://builds.tuxbuild.com/2AYbNeAYdcbtKeaEoYNvOAwsMQf/config
>   build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/563047963
>   artifact-location: https://builds.tuxbuild.com/2AYbNeAYdcbtKeaEoYNvOAwsMQf
>   System.map: https://builds.tuxbuild.com/2AYbNeAYdcbtKeaEoYNvOAwsMQf/System.map
>   vmlinux: https://builds.tuxbuild.com/2AYbNeAYdcbtKeaEoYNvOAwsMQf/vmlinux.xz
>   toolchain: gcc-11
> 
> 
> 
> [1]
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220614/testrun/10156029/suite/ltp-syscalls-tests/test/bpf_prog04/details/
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 
