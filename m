Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED371AD503
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 06:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgDQEA5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 00:00:57 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2058 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725294AbgDQEA5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 00:00:57 -0400
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.56])
        by Forcepoint Email with ESMTP id 6240A28D598212C2D629;
        Fri, 17 Apr 2020 12:00:54 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 17 Apr 2020 12:00:53 +0800
Received: from [10.65.91.233] (10.65.91.233) by dggeme762-chm.china.huawei.com
 (10.3.19.108) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 17
 Apr 2020 12:00:53 +0800
Subject: Re: linux-next: build failure after merge of the crypto tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Zaibo Xu <xuzaibo@huawei.com>,
        Yang Shen <shenyang39@huawei.com>,
        Hui Tang <tanghui20@huawei.com>
References: <20200417134003.318184a6@canb.auug.org.au>
From:   Shukun Tan <tanshukun1@huawei.com>
Message-ID: <a9d25415-580a-e823-bcf9-15c2cd90c424@huawei.com>
Date:   Fri, 17 Apr 2020 12:00:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20200417134003.318184a6@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.65.91.233]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020/4/17 11:40, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crypto tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/crypto/hisilicon/qm.c: In function 'qm_soft_reset':
> drivers/crypto/hisilicon/qm.c:2915:7: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
>  2915 |   s = acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev),
>       |       ^~~~~~~~~~~~~~~~~~~~~
>       |       acpi_evaluate_object
> 
> Caused by commit
> 
>   6c6dd5802c2d ("crypto: hisilicon/qm - add controller reset interface")
> 
> I have reverted the following commits for today
> 
> f037fc5f93f4 crypto: hisilicon/qm - stop qp by judging sq and cq tail
> 141876c252a4 crypto: hisilicon/sec2 - add controller reset support for SEC2
> 1f5c9f34f0cc crypto: hisilicon/hpre - add controller reset support for HPRE
> 84c9b7802b02 crypto: hisilicon/zip - add controller reset support for zip
> 6c6dd5802c2d crypto: hisilicon/qm - add controller reset interface
> 

Hi Stephen,

The 'kbuild test robot' has reported this, I will fix it as soon as possible.

Best,
Shukun
