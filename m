Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F603F59CC
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 10:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235335AbhHXIWx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 04:22:53 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:22269 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235345AbhHXIWx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Aug 2021 04:22:53 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210824082207epoutp049de77aeea7b37eab445fdd88369c9922~eMGVfhcyZ3236732367epoutp04t
        for <linux-next@vger.kernel.org>; Tue, 24 Aug 2021 08:22:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210824082207epoutp049de77aeea7b37eab445fdd88369c9922~eMGVfhcyZ3236732367epoutp04t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1629793327;
        bh=RpetPnNe6ruMqHIiFlH7YX3vW0cQubKSTCExYU7YqvA=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=G2f5EOBLaI6RANnJPHxVKEQDAbhkfXbY8fZylscyzCPgGS0cWrXkgHLEanVH6fjMX
         3FFu4kvwl0rny1ohP6IBiJZachico4TPbZUpL0GCQQK2NZ3Uoz5dkML48IulXoNCjA
         WIX7ADe4IXsW5o8+49Oah7ytIifXXjV4hl1h8DnI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210824082205epcas5p358d34c566f54ac390c48cc6ee4abdba0~eMGUY-AaJ3188331883epcas5p3g;
        Tue, 24 Aug 2021 08:22:05 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.174]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Gv2CF1xw8z4x9Q3; Tue, 24 Aug
        2021 08:22:01 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        91.15.09778.D1CA4216; Tue, 24 Aug 2021 17:21:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20210824064402epcas5p16799caa414fb72cf7ac9de5e3f6949f1~eKws1YtuS2563125631epcas5p1t;
        Tue, 24 Aug 2021 06:44:02 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210824064402epsmtrp16471c1fec0b077d31f7ab48eaf94d431~eKws0gOIc2116221162epsmtrp1k;
        Tue, 24 Aug 2021 06:44:02 +0000 (GMT)
X-AuditID: b6c32a4b-395ff70000002632-ca-6124ac1ddd97
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        D4.20.08750.23594216; Tue, 24 Aug 2021 15:44:02 +0900 (KST)
Received: from alimakhtar02 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210824064401epsmtip1142dd662ed09a016e00584a3dcce5e7c~eKwsDyfxk0596505965epsmtip1Z;
        Tue, 24 Aug 2021 06:44:01 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Martin K. Petersen'" <martin.petersen@oracle.com>
Cc:     "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>
In-Reply-To: <20210824163435.429d389a@canb.auug.org.au>
Subject: RE: linux-next: Fixes tag needs some work in the scsi-mkp tree
Date:   Tue, 24 Aug 2021 12:13:59 +0530
Message-ID: <002f01d798b3$6ca99520$45fcbf60$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEtVbmSR8zmpI0eFjlAL/XFkBZaCQFMK7rGrMxZf5A=
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgk+LIzCtJLcpLzFFi42LZdlhTS1d2jUqiwaEb6haXd81hszi4sI3R
        Yvnxf0wWW/deZXdg8Wi8cYPN4+PTWywenzfJBTBHZdtkpCampBYppOYl56dk5qXbKnkHxzvH
        m5oZGOoaWlqYKynkJeam2iq5+AToumXmAG1TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gq
        pRak5BSYFOgVJ+YWl+al6+WlllgZGhgYmQIVJmRnXP3QyFbQzl4xYeoOtgbGg6xdjBwcEgIm
        Eu82FHcxcnEICexmlPg5/ycjhPOJUWLmi0MsEM5nRomdr6YydTFygnU03N/CDJHYxShxaf50
        dpCEkMBLRok/s8NBbDYBXYkdi9vYQGwRgTSJ94/OgzUzC9RI3F+4G6yeU8BcYs+/RawgtrCA
        u8TnL1/BbBYBVYnWf1NZQGxeAUuJGd+PMUPYghInZz5hgZgjL7H97RxmiIMUJH4+XcYKsctK
        YtOsVqgacYmjP3vADpUQeMkO9NtpqAYXiUefD7ND2MISr45vgbKlJF72t7FDwiVbomeXMUS4
        RmLpvGMsELa9xIErc1hASpgFNCXW79KHCMtKTD21DupFPone30+gYcUrsWMejK0q0fzuKtQY
        aYmJ3d2sExiVZiH5bBaSz2Yh+WAWwrYFjCyrGCVTC4pz01OLTQuM81LL4dGdnJ+7iRGcFLW8
        dzA+evBB7xAjEwfjIUYJDmYlEd6/TMqJQrwpiZVVqUX58UWlOanFhxhNgcE9kVlKNDkfmJbz
        SuINTSwNTMzMzEwsjc0MlcR5dV/JJAoJpCeWpGanphakFsH0MXFwSjUwubYUTPR64LX0U/ue
        IscXtkYS+90bzk5dwNYZYfn7tG3lsq1StkKC0yYmxYiUKNjP/zqlsS3Y976nfGWY6nrBct/0
        N7qWKazOmfxszGw/Xiz4bTZxag7vAY29Z7t+x9xfMbGlWvKWWLGoQGoIK1/bgTaH/x294vPX
        TI0Vmx8z7UltTIv4hH1Tv8qkCs1U3vZ8yu7v7+a8eD7n98+FU2eyrrslUenP7LayjIHzws2q
        xgmSX0V4tKy6Vb5Fr164ik8pk0XlX8fG/7VdbX+yNb7c2WiVIyF9Qqpeoftv0YRGB+Uri5/o
        XrnT4XLQ8LJ0oMS58+fym5ba3XSRMJcVjJO+N9/tvZVM398iUz55o2VKLMUZiYZazEXFiQBB
        EIwHEwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnK7RVJVEg3vXuSwu75rDZnFwYRuj
        xfLj/5gstu69yu7A4tF44wabx8ent1g8Pm+SC2CO4rJJSc3JLEst0rdL4Mq4+qGRraCdvWLC
        1B1sDYwHWbsYOTkkBEwkGu5vYe5i5OIQEtjBKHH/6202iIS0xPWNE9ghbGGJlf+eg9lCAs8Z
        Jaa25oDYbAK6EjsWt4HViwikSXQ/+8ACYjML1Ehc3n8AamgHo8SkycvAijgFzCX2/FsEtllY
        wF3i85evYDaLgKpE67+pYM28ApYSM74fY4awBSVOznwCFOcAGqon0baREWK+vMT2t3OYIW5T
        kPj5dBkrxA1WEptmtULdIC5x9GcP8wRG4VlIJs1CmDQLyaRZSDoWMLKsYpRMLSjOTc8tNiww
        ykst1ytOzC0uzUvXS87P3cQIjgwtrR2Me1Z90DvEyMTBeIhRgoNZSYT3L5NyohBvSmJlVWpR
        fnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1MrIHqmW7nvmeKvLd6cHk+
        V31S/slvvlHNk2OPn0rsnDVx9jNvt95bx97Icd7rtr/ierZYyvjrTsWHUzeIBn7WOJzh0j9/
        9q0r83TT2aunprD2aT1lyNLv61J3LOM602IY/v9+RuesvDvGgnPcVs7uOaLT2LTf8MqTYNuZ
        p+UZu/17Q2Q1197sEHW3tZj7Vzcs88VuUW87tzDWXcmtk38WntvVJ+u4Kb+43z8/J2yh7ZXE
        z/lxr5MbnnQ8yfTqjVnwoE8g01TOVpOt7dWkznXfbbcvDWE/EGUQczV92p2/bxM3XJzR0m6u
        6510O5Av7IaV4UGf6Ps3t8lL7bBkdw6YJ/6lRr/1oX+eeZqwqBJLcUaioRZzUXEiAIFPLMb7
        AgAA
X-CMS-MailID: 20210824064402epcas5p16799caa414fb72cf7ac9de5e3f6949f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210824063445epcas5p4ed6e40889cf8d78edd7914284b26e852
References: <CGME20210824063445epcas5p4ed6e40889cf8d78edd7914284b26e852@epcas5p4.samsung.com>
        <20210824163435.429d389a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: 24 August 2021 12:05
> To: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-
> next@vger.kernel.org>
> Subject: linux-next: Fixes tag needs some work in the scsi-mkp tree
> 
> Hi all,
> 
> In commit
> 
>   2b7661aa3f28 ("scsi: ufs: ufs-exynos: Fix static checker warning")
> 
> Fixes tag
> 
>   Fixes: 55f4b1f73631: "scsi: ufs: ufs-exynos: Add UFS host support for
Exynos
> SoCs"
> 
Sorry about this.
Martin,
You want me to re-send the patch or you will take care?
 
> has these problem(s):
> 
>   - missing space between the SHA1 and the subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> --
> Cheers,
> Stephen Rothwell

