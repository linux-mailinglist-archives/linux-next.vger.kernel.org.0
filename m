Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 452A1180491
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 18:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgCJROQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 13:14:16 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2543 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726504AbgCJROQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 13:14:16 -0400
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id 52588B476245A54C551D;
        Tue, 10 Mar 2020 17:14:14 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml702-cah.china.huawei.com (10.201.108.43) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Mar 2020 17:14:13 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 10 Mar
 2020 17:14:13 +0000
Subject: Re: linux-next: Tree for Mar 10 (mtd/spi-nor/)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     <linux-mtd@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>
References: <20200310201923.24e34363@canb.auug.org.au>
 <43df5279-7d91-020d-1632-9b3528f4feee@infradead.org>
From:   John Garry <john.garry@huawei.com>
Message-ID: <f9d33b09-fe9f-2c26-96dc-b2eaa53c614b@huawei.com>
Date:   Tue, 10 Mar 2020 17:14:13 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <43df5279-7d91-020d-1632-9b3528f4feee@infradead.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+

On 10/03/2020 14:37, Randy Dunlap wrote:
> On 3/10/20 2:19 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200306:
>>
>> Removed tree: nfc-next (abanboned)
> 
>                                doned
> 
> 
> on i386:
> 
> WARNING: unmet direct dependencies detected for MTD_SPI_NOR

Uh, so kbuild honors a "select" of a config option which has unmet 
dependencies:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild/kconfig-language.rst?h=v5.6-rc5#n143

So this looks introduced by:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e823

>    Depends on [m]: MTD [=m] && SPI_MASTER [=y] >    Selected by [y]:
>    - SPI_HISI_SFC_V3XX [=y] && SPI [=y] && SPI_MASTER [=y] && (ARM64 && ACPI [=y] || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
> 
> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/intel-spi.ko] undefined!
> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/mtk-quadspi.ko] undefined!
> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/hisi-sfc.ko] undefined!
> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/aspeed-smc.ko] undefined!
> 
> 
> Full randconfig file is attached.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

