Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2078975A
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 08:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfHLGyD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 02:54:03 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47962 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725887AbfHLGyD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 02:54:03 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 6464952390D7479D3B9A;
        Mon, 12 Aug 2019 14:54:01 +0800 (CST)
Received: from [127.0.0.1] (10.63.139.185) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 12 Aug 2019
 14:53:51 +0800
Subject: Re: linux-next: build failure after merge of the crypto tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
References: <20190812132122.22ea1bb5@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Shiju Jose <shiju.jose@huawei.com>,
        Kenneth Lee <liguozhu@hisilicon.com>,
        Hao Fang <fanghao11@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        John Garry <john.garry@huawei.com>
From:   Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <5D510CFD.70702@hisilicon.com>
Date:   Mon, 12 Aug 2019 14:53:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20190812132122.22ea1bb5@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.63.139.185]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2019/8/12 11:21, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/crypto/hisilicon/qm.c: Assembler messages:
> drivers/crypto/hisilicon/qm.c:334: Error: no such instruction: `ldp %rdx,%rcx,%bl'
> drivers/crypto/hisilicon/qm.c:335: Error: no such instruction: `stp %rdx,%rcx,%al'
> drivers/crypto/hisilicon/qm.c:336: Error: number of operands mismatch for `ds'
> 
> Caused by commit
> 
>   62c455ca853e ("crypto: hisilicon - add HiSilicon ZIP accelerator support")
> 
> I also got the following warnings:

Sorry for this. Will add dependency on ARM64 for CRYPTO_DEV_HISI_ZIP

> 
> WARNING: unmet direct dependencies detected for CRYPTO_DEV_HISI_QM
>   Depends on [n]: CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 && PCI [=y] && PCI_MSI [=y]
>   Selected by [m]:
>   - CRYPTO_DEV_HISI_ZIP [=m] && CRYPTO [=y] && CRYPTO_HW [=y]
> 
> WARNING: unmet direct dependencies detected for CRYPTO_HISI_SGL
>   Depends on [n]: CRYPTO [=y] && CRYPTO_HW [=y] && ARM64
>   Selected by [m]:
>   - CRYPTO_DEV_HISI_ZIP [=m] && CRYPTO [=y] && CRYPTO_HW [=y]
> 
> WARNING: unmet direct dependencies detected for CRYPTO_DEV_HISI_QM
>   Depends on [n]: CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 && PCI [=y] && PCI_MSI [=y]
>   Selected by [m]:
>   - CRYPTO_DEV_HISI_ZIP [=m] && CRYPTO [=y] && CRYPTO_HW [=y]
> 
> WARNING: unmet direct dependencies detected for CRYPTO_HISI_SGL
>   Depends on [n]: CRYPTO [=y] && CRYPTO_HW [=y] && ARM64
>   Selected by [m]:
>   - CRYPTO_DEV_HISI_ZIP [=m] && CRYPTO [=y] && CRYPTO_HW [=y]
> 
> WARNING: unmet direct dependencies detected for CRYPTO_DEV_HISI_QM
>   Depends on [n]: CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 && PCI [=y] && PCI_MSI [=y]
>   Selected by [m]:
>   - CRYPTO_DEV_HISI_ZIP [=m] && CRYPTO [=y] && CRYPTO_HW [=y]
> 
> WARNING: unmet direct dependencies detected for CRYPTO_HISI_SGL
>   Depends on [n]: CRYPTO [=y] && CRYPTO_HW [=y] && ARM64
>   Selected by [m]:
>   - CRYPTO_DEV_HISI_ZIP [=m] && CRYPTO [=y] && CRYPTO_HW [=y]
> drivers/crypto/hisilicon/sgl.c: In function 'hisi_acc_sg_buf_map_to_hw_sgl':
> drivers/crypto/hisilicon/sgl.c:181:14: warning: 'curr_sgl_dma' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   *hw_sgl_dma = curr_sgl_dma;
>   ~~~~~~~~~~~~^~~~~~~~~~~~~~

I will fix this.

> 
> This latter from commit
> 
>   dfed0098ab91 ("crypto: hisilicon - add hardware SGL support")
> 
> I have disabled CRYPTO_DEV_HISI_ZIP for now.  You should not select
> CONFIG options that have dependencies (without also depending on the
> same things and being very careful).
> 

