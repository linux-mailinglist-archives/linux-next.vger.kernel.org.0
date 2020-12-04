Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114DA2CF34D
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 18:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbgLDRoL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 12:44:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:3153 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730782AbgLDRoL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2020 12:44:11 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fca75430001>; Fri, 04 Dec 2020 09:43:31 -0800
Received: from [10.26.72.142] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 4 Dec
 2020 17:43:23 +0000
Subject: Re: [PATCH] mm/memblock:use a more appropriate order calculation when
 free memblock pages
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Qian Cai <qcai@redhat.com>, <carver4lio@163.com>,
        <rppt@kernel.org>
CC:     <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>,
        Hailong Liu <liu.hailong6@zte.com.cn>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20201203152311.5272-1-carver4lio@163.com>
 <a5bc444ec40a2248009d0894fda61b822d030235.camel@redhat.com>
 <CGME20201204160751eucas1p13cc7aad8c68dd2a495c4bbf422c4228c@eucas1p1.samsung.com>
 <adc36428-05eb-f885-9394-080cc805818f@samsung.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3d709122-0364-5bca-9247-3f212096b389@nvidia.com>
Date:   Fri, 4 Dec 2020 17:43:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <adc36428-05eb-f885-9394-080cc805818f@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607103811; bh=IgGdlLuQS16IZLAWFCNIGBVZxQ+IIVFfpXGYwQb1klc=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=FVg+MJmjt2AMhdRUox9urOJdfPsfGxCByjMrp+4uu3Dimtf4Y4VONLwIJtOgWp7Ny
         bK4V2Q8gpRAfwbBi9TcvjLoUSankrGmH4PpXQxlIBJ7ACszcbLpwJxhsRdbdOXqfZE
         5C9WKJLEvQVyxvG8uPVfGT6CGVDwXYxCOAv+vguJr5f6Wi73F09U4RX+/0zXPtoi4x
         TVFHPY/TlJrJGPGLvq+hjKh2Uc8omWEWOCKmXjKOjsva1zwvtWT5FpJ8WB+E/o2Ucn
         cy++evZ3n6CYkMEkKcRAWztAv8u0fj5CWG9OHobpgsQq9ZS5wi30K0bmvtkWrGLoSM
         KXwn4ItI/GdaA==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 04/12/2020 16:07, Marek Szyprowski wrote:
> Hi All,
> 
> On 04.12.2020 14:42, Qian Cai wrote:
>> On Thu, 2020-12-03 at 23:23 +0800, carver4lio@163.com wrote:
>>> From: Hailong Liu <liu.hailong6@zte.com.cn>
>>>
>>> When system in the booting stage, pages span from [start, end] of a memblock
>>> are freed to buddy in a order as large as possible (less than MAX_ORDER) at
>>> first, then decrease gradually to a proper order(less than end) in a loop.
>>>
>>> However, *min(MAX_ORDER - 1UL, __ffs(start))* can not get the largest order
>>> in some cases.
>>> Instead, *__ffs(end - start)* may be more appropriate and meaningful.
>>>
>>> Signed-off-by: Hailong Liu <liu.hailong6@zte.com.cn>
>> Reverting this commit on the top of today's linux-next fixed boot crashes on
>> multiple NUMA systems.
> 
> I confirm. Reverting commit 4df001639c84 ("mm/memblock: use a more 
> appropriate order calculation when free memblock pages") on top of linux 
> next-20201204 fixed booting of my ARM32bit test systems.


FWIW, I also confirm that this is causing several 32-bit Tegra platforms
to crash on boot and reverting this fixes the problem.

Jon

-- 
nvpublic
