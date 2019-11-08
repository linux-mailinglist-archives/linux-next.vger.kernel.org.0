Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB997F446F
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 11:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfKHKZV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 05:25:21 -0500
Received: from foss.arm.com ([217.140.110.172]:39970 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726180AbfKHKZV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 Nov 2019 05:25:21 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9593B31B;
        Fri,  8 Nov 2019 02:25:20 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9295D3F719;
        Fri,  8 Nov 2019 02:25:19 -0800 (PST)
Date:   Fri, 8 Nov 2019 10:25:17 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: linux-next: manual merge of the arm64 tree with the dma-mapping
 tree
Message-ID: <20191108102517.GO51202@arrakis.emea.arm.com>
References: <20191108081109.28867ba1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108081109.28867ba1@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 08, 2019 at 08:11:09AM +1100, Stephen Rothwell wrote:
> diff --cc include/linux/dma-direct.h
> index 6db863c3eb93,d03af3605460..000000000000
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@@ -3,11 -3,10 +3,13 @@@
>   #define _LINUX_DMA_DIRECT_H 1
>   
>   #include <linux/dma-mapping.h>
>  +#include <linux/memblock.h> /* for min_low_pfn */
>   #include <linux/mem_encrypt.h>
>   
> + extern unsigned int zone_dma_bits;
> + 
>  +static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr);
>  +
>   #ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
>   #include <asm/dma-direct.h>
>   #else

The resolution is fine. Thanks Stephen.

-- 
Catalin
