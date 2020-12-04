Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9509D2CF194
	for <lists+linux-next@lfdr.de>; Fri,  4 Dec 2020 17:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730603AbgLDQIu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Dec 2020 11:08:50 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46963 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730447AbgLDQIt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Dec 2020 11:08:49 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201204160757euoutp01c85ed0525b94f11c91f7ea0dcd768fcf~Njy-NhgKX2372623726euoutp01j
        for <linux-next@vger.kernel.org>; Fri,  4 Dec 2020 16:07:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201204160757euoutp01c85ed0525b94f11c91f7ea0dcd768fcf~Njy-NhgKX2372623726euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1607098077;
        bh=eLywhzEGDczru3//t5TSCz8Ic7MsFZbZMi9uwx/nsa4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=TMNSTx2VfxxmaXd7OnsWUhvzlCtLXQkeX59drzCiqSx1FR4EzgQ2sDDnPJ+VXqnbT
         h9wJIC9yfGUMHvZlT5eVmj5AZUAdbxhhMpW2CBKCiFZ2f/np4GvecBTtTFuKTF6QAJ
         0lwvlQ3bz5rjwtwK9cdAQVkrzqHPSNNvhFT9b0jU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201204160752eucas1p18e2cb8b4e8ac200da29acbfc21211ff3~Njy6X8kIB3097330973eucas1p1U;
        Fri,  4 Dec 2020 16:07:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 1C.34.27958.8DE5ACF5; Fri,  4
        Dec 2020 16:07:52 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201204160751eucas1p13cc7aad8c68dd2a495c4bbf422c4228c~Njy6CGSJJ1941019410eucas1p1r;
        Fri,  4 Dec 2020 16:07:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201204160751eusmtrp2ea95d3855e710af042781e414b654ff1~Njy6BcKr90992509925eusmtrp2H;
        Fri,  4 Dec 2020 16:07:51 +0000 (GMT)
X-AuditID: cbfec7f2-efdff70000006d36-1e-5fca5ed8358a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B2.05.16282.7DE5ACF5; Fri,  4
        Dec 2020 16:07:51 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201204160751eusmtip2ed071fbbad4ec32c434cb53dcc55677f~Njy5di4x40287302873eusmtip2Q;
        Fri,  4 Dec 2020 16:07:51 +0000 (GMT)
Subject: Re: [PATCH] mm/memblock:use a more appropriate order calculation
 when free memblock pages
To:     Qian Cai <qcai@redhat.com>, carver4lio@163.com, rppt@kernel.org
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Hailong Liu <liu.hailong6@zte.com.cn>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <adc36428-05eb-f885-9394-080cc805818f@samsung.com>
Date:   Fri, 4 Dec 2020 17:07:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <a5bc444ec40a2248009d0894fda61b822d030235.camel@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7djPc7o34k7FGxx7xWMxZ/0aNouNM9az
        Wrx/t4Hd4vKuOWwW99b8Z7U4uLCN0WLRsklsFr+/N7NaHFm/ncli696r7A5cHotXTGH1aLxx
        g81j06pOIPFpErvHiRm/WTze77vK5tG3ZRWjx+dNch5r9v1gCeCM4rJJSc3JLEst0rdL4Mro
        erKeqaCVo2LH9N0sDYxH2boYOTkkBEwkdh25wN7FyMUhJLCCUeLSqYMsEM4XRomT81YzQjif
        GSXOPf7B1MXIAdZy/qcBRHw5o8SzB1eZIJyPjBJ/9x9lBJkrLJAiseHwM3YQW0TAWeLq0o9g
        RcwCk5kk7jw6BpZgEzCU6HrbBXYIr4CdxOUr55lAbBYBFYlHjXNYQWxRgSSJ9V0/oGoEJU7O
        fMICYnMKeEgsmQvxBLOAvMT2t3OYIWxxiVtP5oMtkxDo55Q40XqKHeJTF4n9T48zQdjCEq+O
        b4GKy0j83wnT0Mwo8fDcWnYIp4dR4nLTDEaIKmuJO+d+sYECgFlAU2L9Ln2IsKPEsY/3mCHh
        widx460gxBF8EpO2TYcK80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1C8tosJO/MQvLOLIS9CxhZ
        VjGKp5YW56anFhvmpZbrFSfmFpfmpesl5+duYgQms9P/jn/awTj31Ue9Q4xMHIyHGCU4mJVE
        eGNVT8YL8aYkVlalFuXHF5XmpBYfYpTmYFES5101e028kEB6YklqdmpqQWoRTJaJg1OqgclT
        vYl345nbPwwm+RzZVzfVYl/tG02bv+dn+Ezwln1W/XtLqtNByUMyh2/cCs6W3LLnU+HLzxGy
        MpFL5K7ZpKXMOco7sY8vZsKWxF/7yo8Kai65FXLHQL6pmN3z1mW1+3IfOvMe9F9TTJ7X37Jq
        X/CuB/wfGq57NtnUdTZ0xjbe2ftEadEqlgOf3qfvWJC+MvDbt7S4WWWf1/n0Z/vJl+wt+b97
        4u4/c5S7Iqe85/ObVfF02iK9Nb5Cy2MbVnwTmJQcUndti2XvPyfjXad9qg53PwtmVPn2s1ph
        w9N5nzaKvOz1ZC+cyVOb1xbCpGTKWbrgZbPexvlrSmM2zJDcJ1pQVHRfZydT5IddM1Zp/ylT
        YinOSDTUYi4qTgQAiKh0p9UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7rX407FG/zsMLOYs34Nm8XGGetZ
        Ld6/28BucXnXHDaLe2v+s1ocXNjGaLFo2SQ2i9/fm1ktjqzfzmSxde9Vdgcuj8UrprB6NN64
        weaxaVUnkPg0id3jxIzfLB7v911l8+jbsorR4/MmOY81+36wBHBG6dkU5ZeWpCpk5BeX2CpF
        G1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GV0PVnPVNDKUbFj+m6WBsajbF2M
        HBwSAiYS538adDFycggJLGWUmN2XDWJLCMhInJzWwAphC0v8udYFVM4FVPOeUWLRrg8sIL3C
        AikSL86EgtSICDhLXF36kQmkhllgMpPE48UdTBBDSyRmt51mA7HZBAwlut52gdm8AnYSl6+c
        B6thEVCReNQ4hxVkpqhAksTZ04IQJYISJ2c+YQGxOQU8JJbMPQrWyixgJjFv80NmCFteYvvb
        OVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kR
        GLXbjv3csoNx5auPeocYmTgYDzFKcDArifDGqp6MF+JNSaysSi3Kjy8qzUktPsRoCvTORGYp
        0eR8YNrIK4k3NDMwNTQxszQwtTQzVhLnNTmyJl5IID2xJDU7NbUgtQimj4mDU6qBqejhnUjX
        Sh/+vpTgTcs3LqrfZcreqrQoKoTFK07c6VFEsnHjeXGlYw9L+Sf2vy/cssHpHJdMnKKUvH/m
        ZIHaLRpmWuey4yc/uPJmqn95pk58u06wieicac8COJkTk41nn4/jmV7dWPTxoPpmo80t1XfP
        s+y4LuNx2CC6qXRhD8dei9bDHxZY/k9XOl86I7PARe/xabPmaQWpnxliH3gackWYVtfOMMj8
        zXVjrt7MR7fncgfyOH51qb74YPmh6fOrj9w6ctjhekrupJk1388dWnTHWrhgjt9mz6QznPOf
        tLhydzL7JD53vy2yenZK9rRVElr83gtYPSf6VciEmm3KK/rfs0tVnWPp/nlbI48psRRnJBpq
        MRcVJwIAXxkPS2MDAAA=
X-CMS-MailID: 20201204160751eucas1p13cc7aad8c68dd2a495c4bbf422c4228c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201204160751eucas1p13cc7aad8c68dd2a495c4bbf422c4228c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201204160751eucas1p13cc7aad8c68dd2a495c4bbf422c4228c
References: <20201203152311.5272-1-carver4lio@163.com>
        <a5bc444ec40a2248009d0894fda61b822d030235.camel@redhat.com>
        <CGME20201204160751eucas1p13cc7aad8c68dd2a495c4bbf422c4228c@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi All,

On 04.12.2020 14:42, Qian Cai wrote:
> On Thu, 2020-12-03 at 23:23 +0800, carver4lio@163.com wrote:
>> From: Hailong Liu <liu.hailong6@zte.com.cn>
>>
>> When system in the booting stage, pages span from [start, end] of a memblock
>> are freed to buddy in a order as large as possible (less than MAX_ORDER) at
>> first, then decrease gradually to a proper order(less than end) in a loop.
>>
>> However, *min(MAX_ORDER - 1UL, __ffs(start))* can not get the largest order
>> in some cases.
>> Instead, *__ffs(end - start)* may be more appropriate and meaningful.
>>
>> Signed-off-by: Hailong Liu <liu.hailong6@zte.com.cn>
> Reverting this commit on the top of today's linux-next fixed boot crashes on
> multiple NUMA systems.

I confirm. Reverting commit 4df001639c84 ("mm/memblock: use a more 
appropriate order calculation when free memblock pages") on top of linux 
next-20201204 fixed booting of my ARM32bit test systems.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

