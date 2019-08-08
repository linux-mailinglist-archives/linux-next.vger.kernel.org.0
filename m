Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E82866DB
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 18:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731278AbfHHQUM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 12:20:12 -0400
Received: from gateway22.websitewelcome.com ([192.185.47.48]:45191 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729925AbfHHQUM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 12:20:12 -0400
X-Greylist: delayed 1544 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Aug 2019 12:20:11 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 1F3FF10A4
        for <linux-next@vger.kernel.org>; Thu,  8 Aug 2019 10:54:27 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id vkkFhE7BjiQervkkFhbKYo; Thu, 08 Aug 2019 10:54:27 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pj8C0rKSVTOTqd4oHkz2rQQO18GOmgV/gpPVALKLOPs=; b=ofRTJfZvfsQGXvNXxVwOooKtC2
        wi6Bql/J5dMGnZ9MNlR/zRAlHN97ZF06irg81d3UB8nsEDG+H9LznPDbr9ASiHaZuIFMcTo4a8YCz
        i81nEEW1XkvdHkq/EYy/vyfvP+n10AMNxnrQNqa64iO9OGv0AkK3yGxNfnOgtznRnX/GqLc/GDh+G
        RalidODjD3tkvw1Fks0V44Sxcqv5za8S+qpB3LHzbPPjKECU6Jk613F9PRcEJPLlir9NQrPMF5SIs
        uMoW42AwhICr52HF046el8iVMuxRRZAk8v8jNJuy/xw5OGXLfxYNXlcmYjp9SXjYAjGQ+365mGI32
        y//oQV/A==;
Received: from [187.192.11.120] (port=44130 helo=[192.168.43.131])
        by gator4166.hostgator.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hvkkE-0048UV-MP; Thu, 08 Aug 2019 10:54:26 -0500
Subject: Re: linux-next: Tree for Aug 7
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190807183606.372ca1a4@canb.auug.org.au>
 <87mugktf2a.fsf@concordia.ellerman.id.au>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <c993d973-a205-0a9f-bb75-f35e4d0f3a61@embeddedor.com>
Date:   Thu, 8 Aug 2019 10:54:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87mugktf2a.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hvkkE-0048UV-MP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [187.192.11.120]:44130
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Michael,

On 8/8/19 12:13 AM, Michael Ellerman wrote:
> 
> This is still popping a few implicit fallthrough warnings, from various
> configs:
> 
>     arch/arm64/include/asm/kvm_hyp.h:31:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/include/asm/sysreg.h:808:2: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:20:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:21:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:22:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:23:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:24:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:25:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:26:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:27:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:28:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:29:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:30:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:31:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:32:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:33:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/debug-sr.c:34:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:351:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:353:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:361:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:363:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:384:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:386:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:394:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/arm64/kvm/hyp/../../../../virt/kvm/arm/hyp/vgic-v3-sr.c:396:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/mips/include/asm/octeon/cvmx-sli-defs.h:47:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/nds32/kernel/signal.c:315:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     arch/nds32/kernel/signal.c:362:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:3: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit declaration of function 'writeq' [-Werror=implicit-function-declaration]
>     drivers/gpu/drm/sun4i/sun4i_tcon.c:318:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:993:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/misc/lkdtm/bugs.c:279:8: error: implicit declaration of function 'native_read_cr4' [-Werror=implicit-function-declaration]
>     drivers/misc/lkdtm/bugs.c:288:2: error: implicit declaration of function 'native_write_cr4' [-Werror=implicit-function-declaration]
>     drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:551:41: warning: overflow in implicit constant conversion [-Woverflow]
>     drivers/scsi/ncr53c8xx.c:3908:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/scsi/ncr53c8xx.c:3914:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/scsi/ncr53c8xx.c:3917:18: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/scsi/ncr53c8xx.c:6713:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/soc/qcom/socinfo.c:231:2: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/soc/qcom/socinfo.c:323:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/soc/qcom/socinfo.c:331:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/soc/qcom/socinfo.c:341:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/soc/qcom/socinfo.c:348:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/soc/qcom/socinfo.c:354:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/soc/qcom/socinfo.c:360:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/soc/qcom/socinfo.c:366:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     include/linux/printk.h:309:2: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     include/math-emu/op-common.h:310:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     include/math-emu/op-common.h:320:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     include/math-emu/op-common.h:417:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     include/math-emu/op-common.h:430:11: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     include/math-emu/soft-fp.h:124:8: warning: this statement may fall through [-Wimplicit-fallthrough=]
>     mm/hmm.c:745:9: error: implicit declaration of function 'pud_pfn' [-Werror=implicit-function-declaration]
> 

There are already patches applied for the vast majority of these warnings. For some reason
they haven't been included in -next yet.

Thank you for the report.
--
Gustavo
