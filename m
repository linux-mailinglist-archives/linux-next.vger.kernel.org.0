Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC722CCD70
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 04:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgLCDsd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 22:48:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8182 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgLCDsd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 22:48:33 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CmhcD1YJvz15WqW;
        Thu,  3 Dec 2020 11:47:24 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 3 Dec 2020
 11:47:49 +0800
Subject: Re: linux-next: manual merge of the block tree with the f2fs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>, Jaegeuk Kim <jaegeuk@kernel.org>
CC:     Chao Yu <chao@kernel.org>, Christoph Hellwig <hch@lst.de>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201203144348.70f139a9@canb.auug.org.au>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <047a6e22-2e8a-4c36-bcbc-3108606c58ff@huawei.com>
Date:   Thu, 3 Dec 2020 11:47:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201203144348.70f139a9@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020/12/3 11:43, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got conflicts in:
> 
>    fs/f2fs/checkpoint.c
>    fs/f2fs/f2fs.h
>    fs/f2fs/super.c
> 
> between commit:
> 
>    5c0602188dc7 ("f2fs: fix kbytes written stat for multi-device case")
> 
> from the f2fs tree and commits:
> 
>    8446fe9255be ("block: switch partition lookup to use struct block_device")
>    9499ffc75217 ("f2fs: remove a few bd_part checks")
> 
> from the block tree.
> 
> I fixed it up (I think, see below, fs/f2fs/f2fs.h and fs/f2fs/super.c
> used the versions from the f2fs tree) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

The fix looks good to me. :)

Thanks,

