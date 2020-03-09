Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE3CE17ECAF
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 00:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgCIXgJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 19:36:09 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:51746 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbgCIXgJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Mar 2020 19:36:09 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200309233607epoutp0405c625a7ac25f25f750eb8b08d3b8329~6xvNnjl4T1193611936epoutp04g
        for <linux-next@vger.kernel.org>; Mon,  9 Mar 2020 23:36:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200309233607epoutp0405c625a7ac25f25f750eb8b08d3b8329~6xvNnjl4T1193611936epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583796967;
        bh=SBRQkWad05dqzHnOR2IAhxtJj3eNNpvFOW3EZIyo7+8=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=f30bqAJtuUovurzPlILWDG3jQjqCuKD0YgCXyWqIII/UNGsOVpLwQO3HFpL5P7pcN
         Q9sKZqDh1txWptglXKECv7voNbcOSC6/zzErWMFsrywOjXxsqlwfY/GRv9t8QgqD0T
         GK1R6X72xYqDDzP1Ue1RZLkrs8WGpApV5opZh1Pw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200309233607epcas1p36e73afbceb394c70dffbaf787f530a1f~6xvNBKfPb2658026580epcas1p3g;
        Mon,  9 Mar 2020 23:36:07 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.164]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 48bvjx4pfwzMqYkf; Mon,  9 Mar
        2020 23:36:05 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        AE.8B.51241.5E2D66E5; Tue, 10 Mar 2020 08:36:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200309233604epcas1p38fa6c3d9bdba591598402c6808334b1b~6xvK2IKHM1438514385epcas1p3L;
        Mon,  9 Mar 2020 23:36:04 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200309233604epsmtrp2bff4a8319f1732459e830a1c96b8c3e0~6xvK1Sti90692206922epsmtrp2g;
        Mon,  9 Mar 2020 23:36:04 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-57-5e66d2e5eaaf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        9B.71.06569.4E2D66E5; Tue, 10 Mar 2020 08:36:04 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200309233604epsmtip13d6ce217c3a2b1d88ed793ed014cf45a~6xvKmGLvz2347423474epsmtip19;
        Mon,  9 Mar 2020 23:36:04 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     =?iso-8859-1?Q?'Pali_Roh=E1r'?= <pali@kernel.org>,
        "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Greg Kroah-Hartman'" <gregkh@linuxfoundation.org>
Cc:     "'Al Viro'" <viro@ZenIV.linux.org.uk>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'Sungjong Seo'" <sj1557.seo@samsung.com>,
        "'Christoph Hellwig'" <hch@lst.de>
In-Reply-To: <20200309231739.2w45cleifsmwbfd6@pali>
Subject: RE: linux-next: build warning after merge of the vfs tree
Date:   Tue, 10 Mar 2020 08:36:04 +0900
Message-ID: <003501d5f66b$7fe3b260$7fab1720$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQLhnT+ZUEFtORUKwX4A79zpVs4A5gKBNZQWAseM+v6l/1Lw8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGJsWRmVeSWpSXmKPExsWy7bCmru7TS2lxBgeOqVs0L17PZrFy9VEm
        i8u75rBZHFzYxmixYM9pNoute6+yW2z5d4TV4vzf46wOHB6NN26weWxa1cnmsX/uGnaP3Tcb
        2Dz6tqxi9Pi8Sc5j05O3TAHsUTk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koK
        eYm5qbZKLj4Bum6ZOUBXKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIKDA0K9IoT
        c4tL89L1kvNzrQwNDIxMgSoTcjJ2b73OVNDKWTG74SxbA+ME9i5GTg4JAROJWXfWMHYxcnEI
        CexglLi44jkbhPOJUWJn7xk2kCohgW+MEitOO8J0TDzQwwpRtJdRYs6ST1DtLxklps46C9bB
        JqAr8e/PfrBRIgIzGSXmr9rKDJJgBhm1q1UOxOYUMJb4suct2CHCAk4Sd85PYgSxWQRUJZ43
        rgOL8wpYSrza3MMIYQtKnJz5hAVijp7EjalT2CBseYntb+cwQ5ynIPHz6TJWiLiIxOzONrC4
        CND8W/92gR0kIdDMLvFy+WVoCLhIfLrQAGULS7w6vgXKlpL4/G4vUAMHkF0t8XE/1PwORokX
        320hbGOJm+s3sELYihI7f89lhNjLJ/HuKyiIQFp5JTrahCBKVCX6Lh1mgrClJbraP7BPYFSa
        heSzWUg+m4Xks1lIvlnAyLKKUSy1oDg3PbXYsMAUObo3MYLTrJblDsZj53wOMQpwMCrx8Gbo
        psUJsSaWFVfmHmKU4GBWEuFt1EqOE+JNSaysSi3Kjy8qzUktPsRoCgz5icxSosn5wByQVxJv
        aGpkbGxsYWJmbmZqrCTO+zBSM05IID2xJDU7NbUgtQimj4mDU6qB8bDepp3Lf2l/LTxx4/wG
        HcYwkxbnH3IPntfUOhr+OnJ0RdpizUOXamwWCGzfvkwhUHDH0TsXK6YHtPP9fNSzzPu24cWm
        5Nl3H1fea5qt//JT4awV03P3+8z4drjdeFqV6lq2yh7t0DlfhY7ua8k4t+xRpuad4qdaSzVP
        pHLF3V6rEq09T+19+CQlluKMREMt5qLiRACj0fncyQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsWy7bCSnO6TS2lxBp2XlS2aF69ns1i5+iiT
        xeVdc9gsDi5sY7RYsOc0m8XWvVfZLbb8O8Jqcf7vcVYHDo/GGzfYPDat6mTz2D93DbvH7psN
        bB59W1YxenzeJOex6clbpgD2KC6blNSczLLUIn27BK6M3VuvMxW0clbMbjjL1sA4gb2LkZND
        QsBEYuKBHlYQW0hgN6PE6RXREHFpiWMnzjB3MXIA2cIShw8XQ5Q8Z5R41RgOYrMJ6Er8+7Of
        rYuRi0NEYDajRFfXW3YQh1ngB6PEnWfrGSE61jNK/LuuAmJzChhLfNnzFmyxsICTxJ3zk8Bq
        WARUJZ43rgOL8wpYSrza3MMIYQtKnJz5hAXEZhYwkLh/qIMVwpaX2P52DjPEoQoSP58ug4qL
        SMzubAOLiwDNv/VvF9sERuFZSEbNQjJqFpJRs5C0L2BkWcUomVpQnJueW2xYYJSXWq5XnJhb
        XJqXrpecn7uJERxrWlo7GE+ciD/EKMDBqMTDK6idFifEmlhWXJl7iFGCg1lJhLdRKzlOiDcl
        sbIqtSg/vqg0J7X4EKM0B4uSOK98/rFIIYH0xJLU7NTUgtQimCwTB6dUA2N0+OpnZzJ2HBVX
        YC64ePDmt9xPM3dK3dl/2XvTm+7b8XfmhG0uOPIzJawo0vHE7m9nJi8VypTm7Lsiu/CK8UWl
        N0uz0xKk/thobV5ZVZuZfGRtYMj7zQuS3y3d7/n947eIkkOTpdfsWabr9ebQXPN+h4CWeRNZ
        67eETJLYkVfirLhM1GDC7sXySizFGYmGWsxFxYkAoF7YXLECAAA=
X-CMS-MailID: 20200309233604epcas1p38fa6c3d9bdba591598402c6808334b1b
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200309231744epcas1p3c0c6f455449fbcbb67df2fdcbe7ba351
References: <20200310095918.3ea6432f@canb.auug.org.au>
        <CGME20200309231744epcas1p3c0c6f455449fbcbb67df2fdcbe7ba351@epcas1p3.samsung.com>
        <20200309231739.2w45cleifsmwbfd6@pali>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> On Tuesday 10 March 2020 09:59:18 Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the vfs tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >
> > warning: same module names found:
> >   fs/exfat/exfat.ko
> >   drivers/staging/exfat/exfat.ko
> >
> > Introduced by commit
> >
> >   b9d1e2e6265f ("exfat: add Kconfig and Makefile")
> >
> > and not fixed by commit
> >
> >   1a3c0509ce83 ("staging: exfat: make staging/exfat and fs/exfat
> > mutually exclusive")
> 
> Hello Stephen!
> 
> exfat.ko from fs/exfat subdirectory is a rewrite/cleanup of staging exfat
> driver. It means that fs/exfat replaces staging/exfat and so after
> fs/exfat is merged, the old staging/exfat code is not needed anymore.
> 
> Therefore I think that instead of hacking Kconfig/Makefile files to define
> mutually exclusivity, it is better to remove staging/exfat code.
> 
> Removal of old staging code should be easy and should fix this problem.
Agree.
Greg, You told me to let me know when fs/exfat gets accepted. Now it's time
to drop staging/exfat.

Thanks!
> 
> Any objections? Or other ideas?

