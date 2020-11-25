Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA1B2C3B30
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 09:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgKYIg4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 03:36:56 -0500
Received: from verein.lst.de ([213.95.11.211]:57877 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726361AbgKYIg4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Nov 2020 03:36:56 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id D831068BEB; Wed, 25 Nov 2020 09:36:52 +0100 (CET)
Date:   Wed, 25 Nov 2020 09:36:52 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Christoph Hellwig <hch@lst.de>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with the arm-soc tree
Message-ID: <20201125083652.GA31753@lst.de>
References: <20201125123351.16954b02@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125123351.16954b02@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 25, 2020 at 12:33:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rdma tree got a conflict in:
> 
>   include/linux/dma-mapping.h
> 
> between commit:
> 
>   16fee29b0735 ("dma-mapping: remove the dma_direct_set_offset export")
> 
> from the arm-soc tree and commit:
> 
>   172292be01db ("dma-mapping: remove dma_virt_ops")
> 
> from the rdma tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the trivial fixup looks obviously good.
