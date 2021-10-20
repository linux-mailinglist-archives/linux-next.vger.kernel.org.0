Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5159A4346AA
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 10:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhJTIVO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 04:21:14 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:60591 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhJTIVK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 04:21:10 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20211020081854epoutp01ea8f2362b41453c4a3ad4eb49f5613d6~vr0z9hzdG2799127991epoutp01b
        for <linux-next@vger.kernel.org>; Wed, 20 Oct 2021 08:18:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20211020081854epoutp01ea8f2362b41453c4a3ad4eb49f5613d6~vr0z9hzdG2799127991epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634717935;
        bh=ZvUKVwRHZMIEDKONZiy+1G+0t81um4ePFAmUEycRz4Y=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=bPGGOFWrkkTEroeP1yH7MyQP9AfLO3+3DGyWm6bLilAvLQeQrX7MFLzasCCXeWcFT
         KC8clyeFZ8ETBTqTrF95P5TylMK0sCiJ6yaby+CP6snaPTGRz4LKQQaD7LYGiUf68p
         fawNFodWwQ+yz+yeL6tlcQFv1Ap16FFA/kyelsVA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20211020081854epcas2p111eca75d5a2c7fd4730f93be301a3031~vr0zg6Q0_0268002680epcas2p1l;
        Wed, 20 Oct 2021 08:18:54 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.99]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HZ3RG5kjbz4x9QJ; Wed, 20 Oct
        2021 08:18:50 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        DE.6E.09868.5E0DF616; Wed, 20 Oct 2021 17:18:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211020081845epcas2p2cab684fadc55a049f503759063921daa~vr0rRlxTK1328113281epcas2p22;
        Wed, 20 Oct 2021 08:18:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211020081845epsmtrp202890bcad9ba6d2b45974c18917027e6~vr0rQvC172466224662epsmtrp2K;
        Wed, 20 Oct 2021 08:18:45 +0000 (GMT)
X-AuditID: b6c32a45-9a3ff7000000268c-1e-616fd0e5dbe4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D8.55.08902.5E0DF616; Wed, 20 Oct 2021 17:18:45 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20211020081845epsmtip14513bca55ed83ac6dff0017b18c7f145~vr0rFXFwW1763717637epsmtip1i;
        Wed, 20 Oct 2021 08:18:45 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Marek Szyprowski'" <m.szyprowski@samsung.com>, <axboe@kernel.dk>
Cc:     <sfr@canb.auug.org.au>, <linux-block@vger.kernel.org>,
        <linux-next@vger.kernel.org>
In-Reply-To: <ce5dcc95-8609-b1d9-81a0-f8d6cd6a3e7b@samsung.com>
Subject: RE: Regression of next-20211019
Date:   Wed, 20 Oct 2021 17:18:45 +0900
Message-ID: <00fa01d7c58b$19edcd60$4dc96820$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGDf3rkGVbkpsxnnH3i66gj9d0BqgJzqNhsAYucbkmsZBuI8A==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdljTVPfphfxEg4cdNhar7/azWey9pW1x
        cGEbo8XaI3fZLbbuvcruwOrReOMGm8fls6UefVtWMXp83iQXwBKVbZORmpiSWqSQmpecn5KZ
        l26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDtFVJoSwxpxQoFJBYXKykb2dTlF9a
        kqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5daYmVoYGBkClSYkJ2xe9NJpoINbBUz5q1hbGBc
        ztrFyMkhIWAicWrZQbYuRi4OIYEdjBId9z4wQjifGCUOH+plhnC+MUq8ObuMBaZl37oVYLaQ
        wF5GiRO/5SGKXjBK3NhwiA0kwSagL/GyYxvYDhEBN4nNd2+A2cwCkRLT9l8Dq+EUsJc42XIE
        zBYW0JCYfXElmM0ioCrx824TM4jNK2Ap8eTXCxYIW1Di5MwnLBBz5CW2v53DDHGQgsTPp8ug
        djlJrFt3D6pGRGJ2ZxvYBxICP9klNl48xQTR4CJxedcCNghbWOLV8S3sELaUxOd3e9kgGroZ
        JVof/YdKrGaU6Gz0gbDtJX5N3wK0jQNog6bE+l36IKaEgLLEkVtQe/kkOg7/ZYcI80p0tAlB
        NKpLHNg+HRqGshLdcz6zTmBUmoXks1lIPpuF5INZCLsWMLKsYhRLLSjOTU8tNiowhEd2cn7u
        JkZwgtRy3cE4+e0HvUOMTByMhxglOJiVRHh3V+QnCvGmJFZWpRblxxeV5qQWH2I0BYb1RGYp
        0eR8YIrOK4k3NLE0MDEzMzQ3MjUwVxLntRTNThQSSE8sSc1OTS1ILYLpY+LglGpgirR69teo
        +1PBGutVcrFHL4YbOl8wb3+y2tt8pZpT3JmY8CPrwxUCkriW6348qLFBYPZEMWs+5QXvn657
        JLX8QYRRA78Hn8HXEg4tW70PvMfnz+UIvt2bxvJ1h6+Vn9L1+9u/XZBY1rndVLfzheORbVPY
        9V42zF2dPI8te993/a77LpFdfm6zy5s1I2qey5yoPODtdKrj51qjSpafplOObquYGDp3+98A
        g3VFPdO2z1YPFkluNmebYH66a5XqYfaa5X5qH4RZbk/M2C81xUPVpmV5wq1K82lCaRnvVXW8
        l29KWlE03f1A0P+d9UWd5bk9Ckwi8ulLdYtD3Urnfboley/tgu3mugLVfl+Z+WZKLMUZiYZa
        zEXFiQCkVa8fGQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSnO7TC/mJBtdWqVisvtvPZrH3lrbF
        wYVtjBZrj9xlt9i69yq7A6tH440bbB6Xz5Z69G1ZxejxeZNcAEsUl01Kak5mWWqRvl0CV8bu
        TSeZCjawVcyYt4axgXE5axcjJ4eEgInEvnUrWLoYuTiEBHYzSuza84AdIiEr8ezdDihbWOJ+
        yxFWiKJnjBJ7fv5jA0mwCehLvOzYBjZJRMBD4v3TZYwgNrNAtETr6WPMILaQwD5GiSMzIkBs
        TgF7iZMtR8B6hQU0JGZfXAlmswioSvy82wRWzytgKfHk1wsWCFtQ4uTMJywQM7Uleh+2Qs2X
        l9j+dg4zxHEKEj+fLoO6wUli3bp7UPUiErM725gnMArPQjJqFpJRs5CMmoWkZQEjyypGydSC
        4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOBo0dLcwbh91Qe9Q4xMHIyHGCU4mJVEeHdX5CcK
        8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwBRzhCH59NIX
        YutjD8VYpDk5PeTlnCFZKPx7SdT/7/8EX/2bNCP4yGnebOnN30x5+P19a7a4/3u1auHEszpR
        zo/FHk5Q/mds9G+usJPq2foclvPWhkuMD7H3B6t9df1wJtllmmU26y/N+GkvZX4uWa+RVMC7
        6mDRgZjTGZP7n/DcvP4jpaOz/uB1xp6VQXtz/1UzZV3hyznRHZLCw1I8y4TzuO3Nxu1d1dp3
        JX7sOfpHpEFF3feZqegnu3BO97e/V5lnN297v1P2+t2AiV9P7Vtqk75Nr+vJxuoMpzkPdzWd
        Mti/4x23vt7av4nO4T7h146tinxvsP945L3IeRdtju6tVT6x+fTkYqWECGOVp3eVWIozEg21
        mIuKEwGu76cuBQMAAA==
X-CMS-MailID: 20211020081845epcas2p2cab684fadc55a049f503759063921daa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596
References: <CGME20211020073900epcas2p402043934d4ca8f04113bc5ce50d2f596@epcas2p4.samsung.com>
        <00be01d7c585$8c5d3580$a517a080$@samsung.com>
        <ce5dcc95-8609-b1d9-81a0-f8d6cd6a3e7b@samsung.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Marek,

> > I found a NULL pointer dereference on next-20211019. It might be a
> > regression since next-20211015.
> > So, I did "git bisect" and found below commit. Are you already aware
> > of this?
> 
> I also found this issue in yesterday's linux-next. Then I found that is
> has been already fixed by this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-
> block.git/commit/?h=for-next&id=3039417eec780c6bbb119ae5598fdca2d4a957ec
> so I decided that there is no point in reporting it.
> 
> In today's linux-next it has been fixed by the commit
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-
> block.git/commit/?h=for-next&id=e70feb8b3e6886c525c88943b5f1508d02f5a683

Great. It works for me. I should use today's version.

Best Regards,
Chanho Park

