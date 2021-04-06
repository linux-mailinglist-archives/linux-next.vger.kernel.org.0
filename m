Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA01354DFD
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 09:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235239AbhDFHiO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 03:38:14 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3391 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235258AbhDFHiN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 03:38:13 -0400
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FDzny0cGwz5lGq;
        Tue,  6 Apr 2021 15:35:18 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.234) by dggeme758-chm.china.huawei.com
 (10.3.19.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Tue, 6 Apr
 2021 15:38:02 +0800
Subject: Re: linux-next: build warning after merge of the spi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210406164837.08685c77@canb.auug.org.au>
From:   Jay Fang <f.fangjian@huawei.com>
Message-ID: <15137565-7ada-69cc-7834-2bf6d691923e@huawei.com>
Date:   Tue, 6 Apr 2021 15:38:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210406164837.08685c77@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.188.234]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021/4/6 14:48, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/spi/spi-hisi-kunpeng.c: In function 'hisi_spi_transfer_one':
> drivers/spi/spi-hisi-kunpeng.c:361:9: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551600' to '4294967280' [-Woverflow]
>   361 |  writel(~IMR_MASK, hs->regs + HISI_SPI_IMR);
>       |         ^
> 
> Introduced by commit
> 
>   c770d8631e18 ("spi: Add HiSilicon SPI Controller Driver for Kunpeng SoCs")
> 
I will fix this warning ASAP.


Thanks,
Jay


