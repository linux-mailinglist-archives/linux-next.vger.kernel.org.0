Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B9218126F
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 08:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgCKH42 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 03:56:28 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2549 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726310AbgCKH41 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 03:56:27 -0400
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.106])
        by Forcepoint Email with ESMTP id BAC71261D951A4DBCAE3;
        Wed, 11 Mar 2020 07:56:26 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml703-cah.china.huawei.com (10.201.108.44) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 07:56:26 +0000
Received: from [127.0.0.1] (10.210.172.48) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Wed, 11 Mar
 2020 07:56:25 +0000
Subject: Re: linux-next: Tree for Mar 10 (mtd/spi-nor/)
To:     <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
CC:     <rdunlap@infradead.org>, <sfr@canb.auug.org.au>,
        <linux-next@vger.kernel.org>, <joe@perches.com>,
        <broonie@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200310201923.24e34363@canb.auug.org.au>
 <43df5279-7d91-020d-1632-9b3528f4feee@infradead.org>
 <f9d33b09-fe9f-2c26-96dc-b2eaa53c614b@huawei.com>
 <1993805.xNpbgTSjYd@localhost.localdomain>
From:   John Garry <john.garry@huawei.com>
Message-ID: <b547776c-2749-8b78-e35f-c6ed42be9759@huawei.com>
Date:   Wed, 11 Mar 2020 07:56:23 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1993805.xNpbgTSjYd@localhost.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.172.48]
X-ClientProxiedBy: lhreml707-chm.china.huawei.com (10.201.108.56) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/03/2020 07:12, Tudor.Ambarus@microchip.com wrote:
> On Tuesday, March 10, 2020 7:14:13 PM EET John Garry wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
>> content is safe
>>
>> +
>>
>> On 10/03/2020 14:37, Randy Dunlap wrote:
>>> On 3/10/20 2:19 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20200306:
>>>>
>>>> Removed tree: nfc-next (abanboned)
>>>>
>>>                                 doned
>>>
>>> on i386:
>>>
>>> WARNING: unmet direct dependencies detected for MTD_SPI_NOR
>>
>> Uh, so kbuild honors a "select" of a config option which has unmet
>> dependencies:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Docu
>> mentation/kbuild/kconfig-language.rst?h=v5.6-rc5#n143
>>
>> So this looks introduced by:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/d
>> rivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e8
> 
> Hi, John,
> 
> Is there any need to select the MTD_SPI_NOR in SPI_HISI_SFC_V3XX? Can't we
> just drop the select?

Yes, I think that we can just drop it. That effectively reverts Joe's 
change. The reason I added the select wasn't for building, but just for 
practicality - MTD_SPI_NOR enables the driver of the devices attached.


In response to Randy:


 >>> So this looks introduced by:
 >>>
 >>> 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e823
 >>>
 >>>>     Depends on [m]: MTD [=m] && SPI_MASTER [=y] >    Selected by [y]:
 >>>>     - SPI_HISI_SFC_V3XX [=y] && SPI [=y] && SPI_MASTER [=y] && 
(ARM64 && ACPI [=y] || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
 >>
 >> Would it be acceptable to move the Kconfig entry for this:
 >>
 >> config SPI_HISI_SFC_V3XX
 >> 	tristate "HiSilicon SPI-NOR Flash Controller for Hi16XX chipsets"
 >> 	depends on (ARM64 && ACPI) || COMPILE_TEST
 >> 	depends on HAS_IOMEM
 >> 	select MTD_SPI_NOR
 >>
 >> into drivers/mtd/spi-nor/Kconfig, say after this one:
 >>
 >> config SPI_HISI_SFC
 >> 	tristate "Hisilicon FMC SPI-NOR Flash Controller(SFC)"
 >> 	depends on ARCH_HISI || COMPILE_TEST
 >> 	depends on HAS_IOMEM
 >>
 >> and drop the "select MTD_SPI_NOR" because when it's in 
drivers/mtd/spi-nor/Kconfig,
 >> it will depend on MTD_SPI_NOR.
 >>
 >
 > These changes to 2 Kconfig files does fix the kconfig warning and 
build errors.
 > I don't know if it's acceptable, or if the source file also wants to be
 > relocated.  (I almost said "needs to be relocated," but it builds 
fine without
 > that change.)

As above, I think that we can drop the select for now. I'll do some 
building test for that - even though it should be same as pre-e14572c52546

Thanks
