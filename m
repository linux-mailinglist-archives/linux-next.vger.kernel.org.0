Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A719C182998
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 08:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbgCLHQH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 03:16:07 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50288 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387898AbgCLHQH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2020 03:16:07 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02C7Fvgo010988;
        Thu, 12 Mar 2020 02:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583997357;
        bh=b5RMjrsaJ/tF3XIM+XteOW0uR+vWszSVGVq35yuwKQ8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fD/e3TA4IlqAWgkG0666RGs4VV6uBYE0XgSyHtXo18SZZ3rhSYphA0Q5dqU2Mu7Jm
         voNccUhTDwY56RMRwgiXP/le3wU9SM3hGfHsv5W+BeLnpl+5GvpzjYBxlXi7qIXErb
         FhoYc3dANkUVd7dWrIcKFvaWX6+Cp9jcGct3gPTg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02C7Fvil126816
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Mar 2020 02:15:57 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Mar 2020 02:15:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Mar 2020 02:15:57 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02C7Ftmg065648;
        Thu, 12 Mar 2020 02:15:56 -0500
Subject: Re: linux-next: manual merge of the slave-dma tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Vinod Koul <vkoul@kernel.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200312162614.1b6b2b0e@canb.auug.org.au>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <68408777-afd4-78c0-9e15-fa7ac050bb17@ti.com>
Date:   Thu, 12 Mar 2020 09:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200312162614.1b6b2b0e@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen, Vinod,

On 12/03/2020 7.26, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the slave-dma tree got a conflict in:
> 
>   drivers/dma/ti/k3-udma.c
> 
> between commit:
> 
>   16cd3c670183 ("dmaengine: ti: k3-udma: Workaround for RX teardown with stale data in peer")
> 
> from Linus' tree

In Linus' tree the drivers/dma/ti/k3-udma.c latest commit is:
8390318c04bb ("dmaengine: ti: k3-udma: Fix terminated transfer handling")

git log --oneline drivers/dma/ti/k3-udma.c shows:
8390318c04bb dmaengine: ti: k3-udma: Fix terminated transfer handling
c7450bb211f3 dmaengine: ti: k3-udma: Use the channel direction in pause/resume functions
6cf668a4ef82 dmaengine: ti: k3-udma: Use the TR counter helper for slave_sg and cyclic
a97934071fc3 dmaengine: ti: k3-udma: Move the TR counter calculation to helper function
16cd3c670183 dmaengine: ti: k3-udma: Workaround for RX teardown with stale data in peer
1c83767c9d41 dmaengine: ti: k3-udma: Use ktime/usleep_range based TX completion check
6c0157be02f0 dmaengine: ti: k3-udma: fix spelling mistake "limted" -> "limited"
d70241913413 dmaengine: ti: k3-udma: Add glue layer for non DMAengine users
25dcb5dd7b7c dmaengine: ti: New driver for K3 UDMA

> and commit:
> 
>   db8d9b4c9b30 ("dmaengine: ti: k3-udma: Implement custom dbg_summary_show for debugfs")

However slave-dma's next branch shows the following log for k3-udma.c:
db8d9b4c9b30 dmaengine: ti: k3-udma: Implement custom dbg_summary_show for debugfs
0ebcf1a274c5 dmaengine: ti: k3-udma: Implement support for atype (for virtualization)
6c0157be02f0 dmaengine: ti: k3-udma: fix spelling mistake "limted" -> "limited"
d70241913413 dmaengine: ti: k3-udma: Add glue layer for non DMAengine users
25dcb5dd7b7c dmaengine: ti: New driver for K3 UDMA

The 5.6-rc5 patches (1c83767c9d41...8390318c04bb) is not present in slave-dma/next which
causes the conflict.
 
> from the slave-dma tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I ended up with the exactly same resolution patch when merging dlave-dma/next
to Linus' tree.

Stephen, thank you!

Vinod, is there anything I can do?

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
