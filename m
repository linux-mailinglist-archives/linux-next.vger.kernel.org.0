Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A5541E918
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 10:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352746AbhJAIaH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 04:30:07 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3905 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352731AbhJAI3w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 04:29:52 -0400
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4HLNTg3DfCz67Psy;
        Fri,  1 Oct 2021 16:25:27 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 1 Oct 2021 10:28:04 +0200
Received: from localhost (10.52.123.156) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 1 Oct 2021
 09:28:04 +0100
Date:   Fri, 1 Oct 2021 09:27:46 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Billy Tsai <billy_tsai@aspeedtech.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iio tree with the iio-fixes
 tree
Message-ID: <20211001092746.00006ef5@Huawei.com>
In-Reply-To: <20211001133841.2b46b779@canb.auug.org.au>
References: <20211001133841.2b46b779@canb.auug.org.au>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.123.156]
X-ClientProxiedBy: lhreml722-chm.china.huawei.com (10.201.108.73) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 1 Oct 2021 13:38:41 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the iio tree got a conflict in:
> 
>   drivers/iio/adc/aspeed_adc.c
> 
> between commit:
> 
>   eb795cd97365 ("iio: adc: aspeed: set driver data when adc probe.")
> 
> from the iio-fixes tree and commit:
> 
>   e96b152c6cc2 ("iio: adc: aspeed: Keep model data to driver data.")
> 
> from the iio tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks.

Looks good to me.

Jonathan

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/iio/adc/aspeed_adc.c
> index 34ec0c28b2df,9e2c85c3cbe9..000000000000
> --- a/drivers/iio/adc/aspeed_adc.c
> +++ b/drivers/iio/adc/aspeed_adc.c
> @@@ -183,7 -492,7 +492,8 @@@ static int aspeed_adc_probe(struct plat
>   
>   	data = iio_priv(indio_dev);
>   	data->dev = &pdev->dev;
>  +	platform_set_drvdata(pdev, indio_dev);
> + 	data->model_data = of_device_get_match_data(&pdev->dev);
>   
>   	data->base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(data->base))
