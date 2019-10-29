Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0132EE7E5D
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 03:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbfJ2CDO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 22:03:14 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5205 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728183AbfJ2CDO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 22:03:14 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 24B7BA7CF6813C2C1330;
        Tue, 29 Oct 2019 10:03:12 +0800 (CST)
Received: from [127.0.0.1] (10.177.219.49) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Tue, 29 Oct 2019
 10:03:06 +0800
Subject: Re: Coverity: super_1_load(): Memory - illegal accesses
To:     coverity-bot <keescook@chromium.org>
CC:     Song Liu <songliubraving@fb.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        <linux-next@vger.kernel.org>
References: <201910281602.99CA1D4@keescook>
From:   Yufen Yu <yuyufen@huawei.com>
Message-ID: <49376db7-82c0-7c88-fe11-4e91b7ed8ca4@huawei.com>
Date:   Tue, 29 Oct 2019 10:03:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <201910281602.99CA1D4@keescook>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.177.219.49]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2019/10/29 7:02, coverity-bot wrote:
> Hello!
>
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191025 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
>
> 6a5cb53aaa4e ("md: no longer compare spare disk superblock events in super_load")
>
> Coverity reported the following:
>
> *** CID 1487373:  Memory - illegal accesses  (NEGATIVE_RETURNS)
> /drivers/md/md.c: 1684 in super_1_load()
> 1678     	}
> 1679
> 1680     	if ((le32_to_cpu(sb->feature_map) & MD_FEATURE_RAID0_LAYOUT) &&
> 1681     	    sb->level != 0)
> 1682     		return -EINVAL;
> 1683
> vvv     CID 1487373:  Memory - illegal accesses  (NEGATIVE_RETURNS)
> vvv     Using variable "rdev->desc_nr" as an index to array "sb->dev_roles".
> 1684     	role = le16_to_cpu(sb->dev_roles[rdev->desc_nr]);
> 1685
> 1686     	if (!refdev) {
> 1687     		/*
> 1688     		 * Insist of good event counter while assembling, except for
> 1689     		 * spares (which don't need an event count)
>
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include:
>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487373 ("Memory - illegal accesses")
> Fixes: 6a5cb53aaa4e ("md: no longer compare spare disk superblock events in super_load")
>
>
> Thanks for your attention!
>

Thanks a lot for report!
I am sorry for forgetting to verify 'rdev->desc_nr' after moving it up.
I will send a patch to fix this.

Thanks,
Yufen



