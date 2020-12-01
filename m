Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACBF2CA02B
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 11:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgLAKnc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 05:43:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:41928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgLAKnc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 05:43:32 -0500
Received: from localhost (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 535A720809;
        Tue,  1 Dec 2020 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606819371;
        bh=Zz2nhRfdKwkp/9D1FoCKHCB7GyTWLmDJ7RBVZaYIkpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O+1ofRARdpI/DXvQBQvKDREzQxITarBbaFCahcKVQYzr9NvFLJyr/pdMl6o8BYM68
         HvwI4SMPaOT406eQLC01vsJyThKDXgUgbNNfgX9xrdV0SRGKBStZfuRm6BClsf6ZpD
         vnChpTsG/cAjVfLHHYuMN0+s47hmnJky2NWrnyqQ=
Date:   Tue, 1 Dec 2020 16:12:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     kishon@ti.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: ralink: phy-mt7621-pci: add include search path
 in Makefile
Message-ID: <20201201104246.GA8403@vkoul-mobl>
References: <20201201101612.28458-1-sergio.paracuellos@gmail.com>
 <20201201101612.28458-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201101612.28458-2-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 01-12-20, 11:16, Sergio Paracuellos wrote:
> This driver includes the following two files directly:
> - mt7621.h
> - ralink_regs.h
> 
> Compilation for its related platform properly works because
> its real path is included in 'arch/mips/ralink/Platform' as
> cflags.
> 
> This driver depends on RALINK but also is enabled for COMPILE_TEST
> where nothing about its platform is known and this directly
> included files are not found at all breaking compilation.
> 
> Fix this problem adding include search path for ralink in
> ralink phy directory Makefile.
> 
> Fixes: d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")

Pls add reported-by sfr..

> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/phy/ralink/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/ralink/Makefile b/drivers/phy/ralink/Makefile
> index cda2a4a7ca5e..c8f9adba0d82 100644
> --- a/drivers/phy/ralink/Makefile
> +++ b/drivers/phy/ralink/Makefile
> @@ -1,3 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +ccflags-y	+= -I$(srctree)/arch/mips/include/asm/mach-ralink

Can we include <asm/mips/...> instead of using this?

> +
>  obj-$(CONFIG_PHY_MT7621_PCI)	+= phy-mt7621-pci.o
>  obj-$(CONFIG_PHY_RALINK_USB)	+= phy-ralink-usb.o
> -- 
> 2.25.1

-- 
~Vinod
