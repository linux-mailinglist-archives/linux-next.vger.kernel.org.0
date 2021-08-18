Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1B23F02B5
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 13:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbhHRL3t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 07:29:49 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3659 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbhHRL3t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Aug 2021 07:29:49 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GqQcz6wVqz6BHQS;
        Wed, 18 Aug 2021 19:28:19 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 18 Aug 2021 13:29:12 +0200
Received: from [10.202.227.179] (10.202.227.179) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 18 Aug 2021 12:29:11 +0100
Subject: Re: [PATCH] scsi: ibmvfc: Stop using scsi_cmnd.tag
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     <tyreld@linux.ibm.com>, <mpe@ellerman.id.au>,
        <benh@kernel.crashing.org>, <paulus@samba.org>,
        <jejb@linux.ibm.com>, <linux-scsi@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <hare@suse.de>, <bvanassche@acm.org>, <hch@lst.de>,
        <linux-next@vger.kernel.org>, <sfr@canb.auug.org.au>
References: <1629207817-211936-1-git-send-email-john.garry@huawei.com>
 <yq14kbnmqoh.fsf@ca-mkp.ca.oracle.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <69c51e23-48b9-4672-e559-d2e257ade29f@huawei.com>
Date:   Wed, 18 Aug 2021 12:29:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <yq14kbnmqoh.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.179]
X-ClientProxiedBy: lhreml748-chm.china.huawei.com (10.201.108.198) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Martin,

> 
>> Use scsi_cmd_to_rq(scsi_cmnd)->tag in preference to scsi_cmnd.tag.
> 
> Applied to 5.15/scsi-staging and rebased for bisectability.
> 

Thanks, and sorry for the hassle. But I would still like the maintainers 
to have a look, as I was curious about current usage of scsi_cmnd.tag in 
that driver.

> Just to be picky it looks like there's another scsi_cmmd tag lurking in
> qla1280.c but it's sitting behind an #ifdef DEBUG_QLA1280.
> 

That driver does not even compile with DEBUG_QLA1280 set beforehand. 
I'll fix that up and send as separate patches in case you want to 
shuffle the tag patch in earlier, which is prob not worth the effort.

I've done a good few more x86 randconfigs and tried to audit the code 
for more references, so hopefully that's the last.

Thanks
