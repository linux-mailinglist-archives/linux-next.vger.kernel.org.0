Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280AF3F13FE
	for <lists+linux-next@lfdr.de>; Thu, 19 Aug 2021 09:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhHSHEX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Aug 2021 03:04:23 -0400
Received: from verein.lst.de ([213.95.11.211]:36310 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231722AbhHSHEX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Aug 2021 03:04:23 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8624C67357; Thu, 19 Aug 2021 09:03:45 +0200 (CEST)
Date:   Thu, 19 Aug 2021 09:03:45 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Christoph Hellwig <hch@lst.de>,
        Claire Chang <tientzu@chromium.org>,
        Konrad Rzeszutek Wilk <konrad@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the swiotlb tree with the
 dma-mapping tree
Message-ID: <20210819070345.GB4521@lst.de>
References: <20210819111312.697fc48f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819111312.697fc48f@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 19, 2021 at 11:13:12AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the swiotlb tree got a conflict in:
> 
>   kernel/dma/direct.c
> 
> between commit:
> 
>   faf4ef823ac5 ("dma-direct: add support for dma_coherent_default_memory")
> 
> from the dma-mapping tree and commit:
> 
>   f4111e39a52a ("swiotlb: Add restricted DMA alloc/free support")
> 
> from the swiotlb tree.
> 
> I fixed it up (see below, though more may be needed) and can carry the

Thanks, the fix looks good.
