Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86C93EE83D
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 10:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238843AbhHQIQg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 04:16:36 -0400
Received: from gofer.mess.org ([88.97.38.141]:49007 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239038AbhHQIQf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 04:16:35 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2C389C642C; Tue, 17 Aug 2021 09:15:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1629188159; bh=erBnD+K0K80pbifrvfYwiDQ0FjqqEg7ucCDzao0adJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZN/tiEco5rKmiqZTE0Gs//+6tGuCqz5n+9R4dnPXT8GciDQ1pL8mUMSwYxXGG4sRF
         tGBPlvDm510JL+gk591hlJqzreVK1Cty3FdME0t4Myy0ZHrkQOpswzf5xBfTWXBuMf
         nefDgAbXeoKC3PC3jBVgo4vFeqXLH7gurPuXQMH2mN47Oxd3tlwAFkTEzdiepYMFvt
         /g+08p1+OBhjGtI+i7zeIWbd2MXxR69h1CG0Z9eNjeoTxVqI6cCeeM8XUqnns1hMeq
         uLiZW1BQBSbQUnvR6QUBuCXyGmY9XXz2BYK9Jpo1CpQdk7AOKOvTxREUkz4O3x+qwK
         HpcJxVqGcA6qw==
Date:   Tue, 17 Aug 2021 09:15:59 +0100
From:   Sean Young <sean@mess.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Richard Weinberger <richard.weinberger@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: linux-next: manual merge of the mtd tree with Linus' tree
Message-ID: <20210817081558.GA14856@gofer.mess.org>
References: <20210817144907.2e691d0d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817144907.2e691d0d@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 17, 2021 at 02:49:07PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the mtd tree got a conflict in:
> 
>   drivers/mtd/mtd_blkdevs.c
> 
> between commit:
> 
>   2b6d2833cd1d ("mtd: mtd_blkdevs: Initialize rq.limits.discard_granularity")
> 
> from Linus' tree and commit:
> 
>   c7c12c7ce6c1 ("mtd: blk_devs: make discard work on FTLs")
> 
> from the mtd tree.
> 
> I fixed it up (I (arbitrarily) used the former version)

The former is slightly better, and also already merged upstream. My commit
c7c12c7ce6c1 should be dropped from mtd/next, I think.

Thanks
Sean

> and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell


