Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5D32151D1
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 06:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbgGFElv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 00:41:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:42526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbgGFElv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jul 2020 00:41:51 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5BDA20720;
        Mon,  6 Jul 2020 04:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594010510;
        bh=XFHh1XLSHxw6exKMmpoX1QibbtNX9sqkNgN86cPVUxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yw23tyuhbeV4s2nuIqfAkStmR0VifUO3SIxMfddxWaW3Pp7I0kxOqgqLNH3EhS50H
         zWrhFw1+gg/Wsn7LZ8XaUPNzuIq5Fsac2PgJJQXf/zq3mKiGmQQ0pvpOEaRo7Cz6LZ
         +e6ahY1AyY6mvOG9OtLRolC2i4mAqloNQauJDQNE=
Date:   Mon, 6 Jul 2020 10:11:46 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the dmaengine tree with the
 dmaengine-fixes tree
Message-ID: <20200706044146.GA633187@vkoul-mobl>
References: <20200706135621.0113ebf9@canb.auug.org.au>
 <d3af0beb-1548-7ad3-fb30-f768303b8701@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3af0beb-1548-7ad3-fb30-f768303b8701@intel.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 05-07-20, 21:23, Dave Jiang wrote:
> 
> 
> On 7/5/2020 8:56 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the dmaengine tree got a conflict in:
> > 
> >    drivers/dma/idxd/sysfs.c
> > 
> > between commit:
> > 
> >    da32b28c95a7 ("dmaengine: idxd: cleanup workqueue config after disabling")
> > 
> > from the dmaengine-fixes tree and commit:
> > 
> >    f50b150e315e ("dmaengine: idxd: add work queue drain support")
> > 
> > from the dmaengine tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> 
> Hi Stephen. Thanks for the fixup. I think there are two more bits that are
> needed from f50b150e315e if you don't mind adding:

I will merge the fixes into next so it should be resolved for tomorrow,
thanks

> 
> diff --cc drivers/dma/idxd/sysfs.c
> index 2e2c5082f322,6f0711a822a1..000000000000
> --- a/drivers/dma/idxd/sysfs.c
> +++ b/drivers/dma/idxd/sysfs.c
> @@@ -313,14 -303,7 +303,12 @@@ static int idxd_config_bus_remove(struc
>   		}
> 
>   		idxd_unregister_dma_device(idxd);
> - 		spin_lock_irqsave(&idxd->dev_lock, flags);
>   		rc = idxd_device_disable(idxd);
>  +		for (i = 0; i < idxd->max_wqs; i++) {
>  +			struct idxd_wq *wq = &idxd->wqs[i];
>  +
> 
> >			mutex_lock(&wq->wq_lock);
> 
>  +			idxd_wq_disable_cleanup(wq);
> 
> >			mutex_unlock(&wq->wq_lock);
> 
>  +		}
> - 		spin_unlock_irqrestore(&idxd->dev_lock, flags);
>   		module_put(THIS_MODULE);
>   		if (rc < 0)
>   			dev_warn(dev, "Device disable failed\n");

-- 
~Vinod
