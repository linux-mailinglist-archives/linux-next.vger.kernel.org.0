Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2209D8720B
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 08:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfHIGP3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Aug 2019 02:15:29 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4205 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725920AbfHIGP3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Aug 2019 02:15:29 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2005844A2B8D8B8EE3F1;
        Fri,  9 Aug 2019 14:15:27 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 9 Aug 2019
 14:15:21 +0800
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>
References: <20190809140035.5b59c31e@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <da82c97d-0057-e925-6b38-f66e6c8656a2@huawei.com>
Date:   Fri, 9 Aug 2019 14:15:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190809140035.5b59c31e@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2019/8/9 12:00, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/lightnvm/pblk-read.c: In function 'pblk_submit_read_gc':
> drivers/lightnvm/pblk-read.c:421:18: warning: unused variable 'geo' [-Wunused-variable]
>   struct nvm_geo *geo = &dev->geo;
>                   ^~~
> 
> Introduced by commit
> 
>   ba6f7da99aaf ("lightnvm: remove set but not used variables 'data_len' and 'rq_len'")
> 
> Removing the above line will also remove the last use of the variable
> "dev" ...

Oh, my bad, thanks!

> 

