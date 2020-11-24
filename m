Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A842C20FF
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 10:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730944AbgKXJSI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 04:18:08 -0500
Received: from verein.lst.de ([213.95.11.211]:53534 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727222AbgKXJSI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Nov 2020 04:18:08 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7D49167373; Tue, 24 Nov 2020 10:18:04 +0100 (CET)
Date:   Tue, 24 Nov 2020 10:18:04 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
Message-ID: <20201124091804.GA11695@lst.de>
References: <20201124093115.0f358046@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124093115.0f358046@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 24, 2020 at 09:31:15AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm-soc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/soc/sunxi/sunxi_mbus.c: In function 'sunxi_mbus_notifier':
> drivers/soc/sunxi/sunxi_mbus.c:93:8: error: implicit declaration of function 'dma_direct_set_offset' [-Werror=implicit-function-declaration]
>    93 |  ret = dma_direct_set_offset(dev, PHYS_OFFSET, 0, SZ_4G);
>       |        ^~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a central place")
> 
> probably interacting with commit
> 
>   16fee29b0735 ("dma-mapping: remove the dma_direct_set_offset export")
> 
> which is also in the arm-soc tree ...

drivers/soc/sunxi/sunxi_mbus.c now needs an include of <linux/dma-map-ops.h>.
