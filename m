Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C5434CCC3
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 11:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbhC2JIN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 05:08:13 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14946 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235976AbhC2JGe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 05:06:34 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F868W49QtzyN7t;
        Mon, 29 Mar 2021 17:04:27 +0800 (CST)
Received: from [127.0.0.1] (10.69.38.203) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Mar 2021
 17:06:21 +0800
Subject: Re: linux-next: build warnings after merge of the arm-perf tree
To:     Will Deacon <will@kernel.org>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210326195240.7b937560@canb.auug.org.au>
 <c39fe821-3eee-9f2a-3539-6a1f2f415414@hisilicon.com>
 <20210329084751.GA2965@willie-the-truck>
From:   "liuqi (BA)" <liuqi115@huawei.com>
Message-ID: <57d692c4-8469-c3d0-4e8a-3f01953ac5e4@huawei.com>
Date:   Mon, 29 Mar 2021 17:06:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210329084751.GA2965@willie-the-truck>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.38.203]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2021/3/29 16:47, Will Deacon wrote:
> On Fri, Mar 26, 2021 at 05:07:41PM +0800, Shaokun Zhang wrote:
>> Apologies for the mistake.
>>
>> Will, shall I send a new version v5 to fix this issue or other?
> 
> Please send additional patches on top now that these are queued.
> 
> Thanks,
> 
> Will
> 
> .
> 
We'll send a new patch to fix these warnings today, apologies for the 
mistake again.

Thanks,
Qi

