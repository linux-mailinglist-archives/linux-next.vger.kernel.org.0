Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B641B2F0D8C
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 08:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbhAKHzC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Jan 2021 02:55:02 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:11005 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbhAKHzC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Jan 2021 02:55:02 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DDmD11mBDzj63t;
        Mon, 11 Jan 2021 15:53:21 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 11 Jan
 2021 15:54:19 +0800
Subject: Re: linux-next: build warning after merge of the f2fs tree
To:     Jonathan Corbet <corbet@lwn.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210107141158.312835d8@canb.auug.org.au>
 <3f921b3d-e8f2-e010-0f6b-76596e29e997@huawei.com>
 <20210111073354.6ec0bbb5@canb.auug.org.au> <20210110163534.24481e1e@lwn.net>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <5918c348-666a-ee41-3891-ddcf500c464b@huawei.com>
Date:   Mon, 11 Jan 2021 15:54:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210110163534.24481e1e@lwn.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jonathan,

On 2021/1/11 7:35, Jonathan Corbet wrote:
> On Mon, 11 Jan 2021 07:33:54 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> On Thu, 7 Jan 2021 19:28:19 +0800 Chao Yu <yuchao0@huawei.com> wrote:
>>>
>>> On 2021/1/7 11:11, Stephen Rothwell wrote:
>>>>
>>>> After merging the f2fs tree, today's linux-next build (htmldocs) produced
>>>> this warning:
>>>>
>>>> Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Inline emphasis start-string without end-string.
>>>
>>> IIUC, should I remove "/*" and "*/" for newly added entry in sysfs-fs-f2fs?
>>
>> Sorry, I don't know.  Cc'ing Jon. >
> Removing the comment markers would make the warning go away, but won't
> lead to a satisfactory rendering in HTML.  If you want that too, make the
> table look like the others immediately above it in the same file.

Copied, thanks for your reminder.

I've fixed it and resent the patch:

https://lore.kernel.org/linux-f2fs-devel/20210111075017.82370-1-yuchao0@huawei.com/T/#u

> 
> Thanks,
> 
> jon
> .
> 
