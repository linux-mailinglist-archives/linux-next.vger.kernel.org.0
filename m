Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1038C14510D
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2020 10:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbgAVJvX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jan 2020 04:51:23 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2291 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729285AbgAVJvW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Jan 2020 04:51:22 -0500
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id 77878927E199B807C7BC;
        Wed, 22 Jan 2020 09:51:19 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml702-cah.china.huawei.com (10.201.108.43) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 22 Jan 2020 09:51:20 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Jan
 2020 09:51:19 +0000
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>
References: <20200122151056.7d09abf0@canb.auug.org.au>
From:   John Garry <john.garry@huawei.com>
Message-ID: <52ff5728-8530-2be8-6dfa-739db5897a61@huawei.com>
Date:   Wed, 22 Jan 2020 09:51:18 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200122151056.7d09abf0@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/01/2020 04:10, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi-mkp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "irq_create_affinity_masks" [drivers/scsi/hisi_sas/hisi_sas_v2_hw.ko] undefined!
> ERROR: "__irq_set_affinity" [drivers/scsi/hisi_sas/hisi_sas_v2_hw.ko] undefined!
> 

That's sloppy of me - I never build tested for this driver as a module.

And so these symbols are not exported.

> Caused by commit
> 

Hi Martin,

>    3869a618eb88 ("scsi: hisi_sas: Use reply map for v2 hw")
> 

Could you please drop this patch from your branch/revert it? Sorry for 
the hassle.

I should have really talked with Thomas G about whether I should even 
reference the first symbol at all. I'll do that now.

> I have reverted that commit for today.
> 

Thanks,
John


