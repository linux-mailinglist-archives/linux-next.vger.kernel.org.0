Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAED859A6
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 07:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730811AbfHHFNi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 01:13:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35339 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728361AbfHHFNi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 01:13:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463xNY5DDzz9sN1;
        Thu,  8 Aug 2019 15:13:33 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Aug 7
In-Reply-To: <20190807183606.372ca1a4@canb.auug.org.au>
References: <20190807183606.372ca1a4@canb.auug.org.au>
Date:   Thu, 08 Aug 2019 15:13:33 +1000
Message-ID: <87mugktf2a.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Changes since 20190806:
>
> The arm64 tree introduced a patch that stopped the powerpc ppc64_defconfig
> build from completing so I reverted that commit.
>
> The mips tree gained a conflict against Linus' tree.
>
> The crypto tree still had its build failure for which I applied a patch.
>
> The drm-misc tree gained a conflict and a sematic conflct against the
> amdgpu tree.
>
> The integrity tree lost its build failure.
>
> The akpm-current tree gained a conflict against the arm64 tree and a
> build failure for which I reverted a commit.
>
> The akpm tree lost a patch that turned up elsewhere.
>
> Non-merge commits (relative to Linus' tree): 4586
>  4952 files changed, 265168 insertions(+), 120665 deletions(-)

This is still popping a few implicit fallthrough warnings, from various
configs:

    arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/include/asm/sysreg.h:808:2: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/mips/include/asm/octeon/cvmx-sli-defs.h:47:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/nds32/kernel/signal.c:315:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    arch/nds32/kernel/signal.c:362:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:3: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit declaration of function 'writeq' [-Werror=implicit-function-declaration]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/misc/lkdtm/bugs.c:279:8: error: implicit declaration of function 'native_read_cr4' [-Werror=implicit-function-declaration]
    drivers/misc/lkdtm/bugs.c:288:2: error: implicit declaration of function 'native_write_cr4' [-Werror=implicit-function-declaration]
    drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:551:41: warning: overflow in implicit constant conversion [-Woverflow]
    drivers/scsi/ncr53c8xx.c:3908:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/scsi/ncr53c8xx.c:3914:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/scsi/ncr53c8xx.c:3917:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/scsi/ncr53c8xx.c:6713:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/soc/qcom/socinfo.c:231:2: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/soc/qcom/socinfo.c:323:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/soc/qcom/socinfo.c:331:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/soc/qcom/socinfo.c:341:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/soc/qcom/socinfo.c:348:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/soc/qcom/socinfo.c:354:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/soc/qcom/socinfo.c:360:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/soc/qcom/socinfo.c:366:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
    include/linux/printk.h:309:2: warning: this statement may fall through [-Wimplicit-fallthrough=]
    include/math-emu/op-common.h:310:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
    include/math-emu/op-common.h:320:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
    include/math-emu/op-common.h:417:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
    include/math-emu/op-common.h:430:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
    include/math-emu/soft-fp.h:124:8: warning: this statement may fall through [-Wimplicit-fallthrough=]
    mm/hmm.c:745:9: error: implicit declaration of function 'pud_pfn' [-Werror=implicit-function-declaration]

cheers
