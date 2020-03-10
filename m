Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B73B180946
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 21:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgCJUhD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 16:37:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42350 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgCJUhD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 16:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=cEt03edld4dNyjhWQ3Ma6jD46zPXd8681h8y9DHX8+Y=; b=GC7pvPcxSOHsD1Xf89+jZCY0T7
        QaNbGK7YFpR6JkKn5nYbwAKQ5Fd0C6fQat5/s/30L9TsNBaiMk3D1c0zNCrjeJERglsUB9MHwclUN
        wvBR2sRvtRnkuYTKLWsjTXqc1tsn1uUV6p0g3G3LNiavi/u6xfK3DmFPrDZcnIR7jxU5nQf6oScTu
        X4hgdyiWGSPsRm+4YZLX2wzAr4YxlWLW+COWuGKaJqIp6r9bREKnRw3ocMf37fkXFvmCQf1X7PrqF
        sXnQfLM6e4MZIHDY+1JnClGloc1sv44ygF3J95HHg4VEQHb0l5vdlzlk9LlUbnJIOuryKjrFn4nNu
        z/usJQvg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jBlcV-00034o-Om; Tue, 10 Mar 2020 20:36:55 +0000
Subject: Re: linux-next: Tree for Mar 10 (mtd/spi-nor/)
To:     John Garry <john.garry@huawei.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     linux-mtd@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>
References: <20200310201923.24e34363@canb.auug.org.au>
 <43df5279-7d91-020d-1632-9b3528f4feee@infradead.org>
 <f9d33b09-fe9f-2c26-96dc-b2eaa53c614b@huawei.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aa3b19cd-e043-e5ea-5d77-38b53bda2e60@infradead.org>
Date:   Tue, 10 Mar 2020 13:36:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f9d33b09-fe9f-2c26-96dc-b2eaa53c614b@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/10/20 10:14 AM, John Garry wrote:
> +
> 
> On 10/03/2020 14:37, Randy Dunlap wrote:
>> On 3/10/20 2:19 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200306:
>>>
>>> Removed tree: nfc-next (abanboned)
>>
>>                                doned
>>
>>
>> on i386:
>>
>> WARNING: unmet direct dependencies detected for MTD_SPI_NOR
> 
> Uh, so kbuild honors a "select" of a config option which has unmet dependencies:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild/kconfig-language.rst?h=v5.6-rc5#n143

Yes.

> So this looks introduced by:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e823
> 
>>    Depends on [m]: MTD [=m] && SPI_MASTER [=y] >    Selected by [y]:
>>    - SPI_HISI_SFC_V3XX [=y] && SPI [=y] && SPI_MASTER [=y] && (ARM64 && ACPI [=y] || COMPILE_TEST [=y]) && HAS_IOMEM [=y]

Would it be acceptable to move the Kconfig entry for this:

config SPI_HISI_SFC_V3XX
	tristate "HiSilicon SPI-NOR Flash Controller for Hi16XX chipsets"
	depends on (ARM64 && ACPI) || COMPILE_TEST
	depends on HAS_IOMEM
	select MTD_SPI_NOR

into drivers/mtd/spi-nor/Kconfig, say after this one:

config SPI_HISI_SFC
	tristate "Hisilicon FMC SPI-NOR Flash Controller(SFC)"
	depends on ARCH_HISI || COMPILE_TEST
	depends on HAS_IOMEM

and drop the "select MTD_SPI_NOR" because when it's in drivers/mtd/spi-nor/Kconfig,
it will depend on MTD_SPI_NOR.


>> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/intel-spi.ko] undefined!
>> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/mtk-quadspi.ko] undefined!
>> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/hisi-sfc.ko] undefined!
>> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/aspeed-smc.ko] undefined!
>>
>>
>> Full randconfig file is attached.
>>


-- 
~Randy

