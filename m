Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4BEB3EEA4E
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 11:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbhHQJwX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 05:52:23 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3654 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235293AbhHQJwW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 05:52:22 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GpmW25HqVz6CCR8;
        Tue, 17 Aug 2021 17:50:54 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Tue, 17 Aug 2021 11:51:48 +0200
Received: from [10.202.227.179] (10.202.227.179) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 17 Aug 2021 10:51:47 +0100
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <20210817194710.1cb707ba@canb.auug.org.au>
From:   John Garry <john.garry@huawei.com>
Message-ID: <c27c2909-1701-b972-dd7c-98bdc53ab8f9@huawei.com>
Date:   Tue, 17 Aug 2021 10:51:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210817194710.1cb707ba@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.179]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 17/08/2021 10:47, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/byteorder/big_endian.h:5,
>                   from arch/powerpc/include/uapi/asm/byteorder.h:14,
>                   from include/asm-generic/bitops/le.h:7,
>                   from arch/powerpc/include/asm/bitops.h:265,
>                   from include/linux/bitops.h:33,
>                   from include/linux/kernel.h:12,
>                   from include/linux/list.h:9,
>                   from include/linux/module.h:12,
>                   from drivers/scsi/ibmvscsi/ibmvfc.c:10:
> drivers/scsi/ibmvscsi/ibmvfc.c: In function 'ibmvfc_queuecommand':
> drivers/scsi/ibmvscsi/ibmvfc.c:1959:39: error: 'struct scsi_cmnd' has no member named 'tag'
>   1959 |   vfc_cmd->task_tag = cpu_to_be64(cmnd->tag);
>        |                                       ^~
> include/uapi/linux/byteorder/big_endian.h:37:51: note: in definition of macro '__cpu_to_be64'
>     37 | #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
>        |                                                   ^
> drivers/scsi/ibmvscsi/ibmvfc.c:1959:23: note: in expansion of macro 'cpu_to_be64'
>   1959 |   vfc_cmd->task_tag = cpu_to_be64(cmnd->tag);
>        |                       ^~~~~~~~~~~
> 
> Caused by commit
> 
>    c7c43e3c7147 ("scsi: core: Remove scsi_cmnd.tag")
> 
> I have used the scsi-mkp tree from next-20210816 for today.
> 

sorry... I only built x86 and arm64 allmodconfig. Let me check this.

Thanks
