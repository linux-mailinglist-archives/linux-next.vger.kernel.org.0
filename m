Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2B6C180DE7
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 03:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbgCKCU4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 22:20:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58670 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbgCKCU4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 22:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=As1+POUoIPHOMCen+D9GFw1eWTMvv4YWaMUIwymo7Lk=; b=MP7VS+oIfxrHOSS0CLGhz7zMyR
        rQbVB5ZgZ7/O/AclQd/xmxUqUq9IQvzEW4Sv7ycz6wMP6yVHEyueDbOcnt02th0D/5cXdkJjifvRS
        EFBMhwbLtNJPo/Wh0sdbFZ1gKS5r9eTgOqfDnfMD2G92lJ6eIXg/Zb45EeDwS3YOw3f0h9EAa7z9s
        OyKd+XmWwquTmkY2Mh9hZTCcBGb4L1KfH6Al8UZkxd/VpADA3a635fvh2lx8s36r7Yk2duBt280Rj
        oQeoW1hmrU5hUk5kokwWI6xr6CFPXE4K0zMbIfsOjpDW3xWv1EBsoMeW4rPHd09l5eDbE5rl1sBwG
        ciB8VwdQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jBqzJ-0000X2-AI; Wed, 11 Mar 2020 02:20:49 +0000
Subject: Re: linux-next: Tree for Mar 10 (mtd/spi-nor/)
From:   Randy Dunlap <rdunlap@infradead.org>
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
 <aa3b19cd-e043-e5ea-5d77-38b53bda2e60@infradead.org>
Message-ID: <befa858c-cac9-521b-93ea-eb5722738998@infradead.org>
Date:   Tue, 10 Mar 2020 19:20:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aa3b19cd-e043-e5ea-5d77-38b53bda2e60@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/10/20 1:36 PM, Randy Dunlap wrote:
> On 3/10/20 10:14 AM, John Garry wrote:
>> +
>>
>> On 10/03/2020 14:37, Randy Dunlap wrote:
>>> On 3/10/20 2:19 AM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20200306:
>>>>
>>>> Removed tree: nfc-next (abanboned)
>>>
>>>                                doned
>>>
>>>
>>> on i386:
>>>
>>> WARNING: unmet direct dependencies detected for MTD_SPI_NOR
>>
>> Uh, so kbuild honors a "select" of a config option which has unmet dependencies:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild/kconfig-language.rst?h=v5.6-rc5#n143
> 
> Yes.
> 
>> So this looks introduced by:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/spi/Kconfig?h=next-20200310&id=e14572c52546c16e159c4c1814984843a119e823
>>
>>>    Depends on [m]: MTD [=m] && SPI_MASTER [=y] >    Selected by [y]:
>>>    - SPI_HISI_SFC_V3XX [=y] && SPI [=y] && SPI_MASTER [=y] && (ARM64 && ACPI [=y] || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
> 
> Would it be acceptable to move the Kconfig entry for this:
> 
> config SPI_HISI_SFC_V3XX
> 	tristate "HiSilicon SPI-NOR Flash Controller for Hi16XX chipsets"
> 	depends on (ARM64 && ACPI) || COMPILE_TEST
> 	depends on HAS_IOMEM
> 	select MTD_SPI_NOR
> 
> into drivers/mtd/spi-nor/Kconfig, say after this one:
> 
> config SPI_HISI_SFC
> 	tristate "Hisilicon FMC SPI-NOR Flash Controller(SFC)"
> 	depends on ARCH_HISI || COMPILE_TEST
> 	depends on HAS_IOMEM
> 
> and drop the "select MTD_SPI_NOR" because when it's in drivers/mtd/spi-nor/Kconfig,
> it will depend on MTD_SPI_NOR.
> 

These changes to 2 Kconfig files does fix the kconfig warning and build errors.
I don't know if it's acceptable, or if the source file also wants to be
relocated.  (I almost said "needs to be relocated," but it builds fine without
that change.)

> 
>>> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/intel-spi.ko] undefined!
>>> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/mtk-quadspi.ko] undefined!
>>> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/hisi-sfc.ko] undefined!
>>> ERROR: "spi_nor_scan" [drivers/mtd/spi-nor/aspeed-smc.ko] undefined!


-- 
~Randy

