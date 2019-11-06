Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC5B3F10A2
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 08:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729716AbfKFHwe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 02:52:34 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:33338 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728291AbfKFHwe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 02:52:34 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id F13C31F8067F202400CE;
        Wed,  6 Nov 2019 15:52:32 +0800 (CST)
Received: from [127.0.0.1] (10.74.221.148) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 6 Nov 2019
 15:52:22 +0800
Subject: Re: linux-next: build warning after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20191106180531.11419dca@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        yuqi jin <jinyuqi@huawei.com>, "Michal Hocko" <mhocko@suse.com>
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <8de00532-f77d-1332-817e-7c546a775db8@hisilicon.com>
Date:   Wed, 6 Nov 2019 15:52:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20191106180531.11419dca@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.221.148]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2019/11/6 15:05, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> lib/cpumask.c: In function 'cpumask_local_spread':
> lib/cpumask.c:302:1: warning: the frame size of 5472 bytes is larger than 2048 bytes [-Wframe-larger-than=]
>   302 | }
>       | ^
> 
> Introduced by commit
> 
>   3d591f2836cf ("lib: optimize cpumask_local_spread()")
> 
> MAX_NUMNODES == (1 << NODES_SHIFT) and NODES_SHIFT == CONFIG_NODES_SHIFT== 10,
> so MAX_NUMNODES == 1024 and there is an int array and a bool array of that
> size declared here :-(

Thanks for the report and sorry for the warning, Michal has pointed this[1].
We are preparing the new solution and will post it soon.

[1] https://lkml.org/lkml/2019/11/5/66

Thanks,
Shaokun

> 

