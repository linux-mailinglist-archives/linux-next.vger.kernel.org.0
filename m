Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F355215171
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 06:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgGFEXr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 00:23:47 -0400
Received: from mga09.intel.com ([134.134.136.24]:14327 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgGFEXr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jul 2020 00:23:47 -0400
IronPort-SDR: M3husfosArJSR74Dpewz4iv2pwsK16SqKkxbC5loZzUVkzO+UC31RTauqHxe1mVKNtkM72+0ry
 IoovO5I7hxbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="148857222"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; 
   d="scan'208";a="148857222"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2020 21:23:46 -0700
IronPort-SDR: o3Ovk4M9ZsxPZotyGoamY580+UDgz97geWpfFlgeJARMB+rU7zaUe2orhkFljBq7nhq/NZWHCz
 QqwkIdOvr8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; 
   d="scan'208";a="426965058"
Received: from djiang5-mobl1.amr.corp.intel.com (HELO [10.209.117.178]) ([10.209.117.178])
  by orsmga004.jf.intel.com with ESMTP; 05 Jul 2020 21:23:46 -0700
Subject: Re: linux-next: manual merge of the dmaengine tree with the
 dmaengine-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200706135621.0113ebf9@canb.auug.org.au>
From:   Dave Jiang <dave.jiang@intel.com>
Message-ID: <d3af0beb-1548-7ad3-fb30-f768303b8701@intel.com>
Date:   Sun, 5 Jul 2020 21:23:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706135621.0113ebf9@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 7/5/2020 8:56 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the dmaengine tree got a conflict in:
> 
>    drivers/dma/idxd/sysfs.c
> 
> between commit:
> 
>    da32b28c95a7 ("dmaengine: idxd: cleanup workqueue config after disabling")
> 
> from the dmaengine-fixes tree and commit:
> 
>    f50b150e315e ("dmaengine: idxd: add work queue drain support")
> 
> from the dmaengine tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Hi Stephen. Thanks for the fixup. I think there are two more bits that are 
needed from f50b150e315e if you don't mind adding:

diff --cc drivers/dma/idxd/sysfs.c
index 2e2c5082f322,6f0711a822a1..000000000000
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@@ -313,14 -303,7 +303,12 @@@ static int idxd_config_bus_remove(struc
   		}

   		idxd_unregister_dma_device(idxd);
- 		spin_lock_irqsave(&idxd->dev_lock, flags);
   		rc = idxd_device_disable(idxd);
  +		for (i = 0; i < idxd->max_wqs; i++) {
  +			struct idxd_wq *wq = &idxd->wqs[i];
  +

 >			mutex_lock(&wq->wq_lock);

  +			idxd_wq_disable_cleanup(wq);

 >			mutex_unlock(&wq->wq_lock);

  +		}
- 		spin_unlock_irqrestore(&idxd->dev_lock, flags);
   		module_put(THIS_MODULE);
   		if (rc < 0)
   			dev_warn(dev, "Device disable failed\n");
