Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9171B6CEC
	for <lists+linux-next@lfdr.de>; Fri, 24 Apr 2020 06:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgDXE5y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Apr 2020 00:57:54 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:47124 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgDXE5x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Apr 2020 00:57:53 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200424045750epoutp034ecf18cd3ce37659013f5100f517df9d~IqJ8vlxtA0646006460epoutp03P
        for <linux-next@vger.kernel.org>; Fri, 24 Apr 2020 04:57:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200424045750epoutp034ecf18cd3ce37659013f5100f517df9d~IqJ8vlxtA0646006460epoutp03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587704270;
        bh=AgT+mu/DbDkkraNd6kgFPOP710cAaa571GBMHlW3C9I=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=e7aSL4FW64sfdE438pT1pAjbiWb3esJRW0dITF/LGTppKxcMD2naDx68VIfUdrKVO
         vLX3YR4j3FCGXt8eAc5lgXK46UbFeSZCJlWB6Ik1wREFXZwFf8otsnJybV4N8rMdGy
         MPZZfSEtZoVMWLW0lC7Y+xoBsavxrRZSXiQBA+vs=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200424045749epcas1p222ea5c712e7d950fc414c1840bdbe444~IqJ8Lbj6y2408524085epcas1p27;
        Fri, 24 Apr 2020 04:57:49 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.165]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 497hkN2dpVzMqYkb; Fri, 24 Apr
        2020 04:57:48 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        D6.4C.04744.CC172AE5; Fri, 24 Apr 2020 13:57:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200424045748epcas1p153c5dc5b2ab9e8da1daf7b10a51da6dc~IqJ6rkln20626706267epcas1p1q;
        Fri, 24 Apr 2020 04:57:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200424045748epsmtrp1613e0000816a73e7d22947c2b291e0b6~IqJ6plV2E1101711017epsmtrp1g;
        Fri, 24 Apr 2020 04:57:48 +0000 (GMT)
X-AuditID: b6c32a38-26bff70000001288-ab-5ea271cc3b53
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        0E.5D.18461.BC172AE5; Fri, 24 Apr 2020 13:57:47 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20200424045747epsmtip26d4f3532ac08cabdca2d9e9a685b0a3f~IqJ6Zdh2n1363113631epsmtip2c;
        Fri, 24 Apr 2020 04:57:47 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     "'Stephen Rothwell'" <sfr@canb.auug.org.au>
Cc:     "'Namjae Jeon'" <linkinjeon@kernel.org>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>
In-Reply-To: <000001d619f4$9d7fee90$d87fcbb0$@samsung.com>
Subject: RE: linux-next: manual merge of the exfat tree with Linus' tree
Date:   Fri, 24 Apr 2020 13:57:47 +0900
Message-ID: <000101d619f4$e62c5cf0$b28516d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFjuEGWdDyIOjJKXJTh27xcMasqNgJJvlsfqVoq0HA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHeXa3u6s1uc1ZJ5NaF4w0plvbdFqTIgsjISvoQx+2rnpR6e6l
        e2ekUSrFfM8kynwtJUsW4RDfsoamQhmimFnmh0rQyMLKovfXbdfIb79zzv885/k/zyEweTke
        SmRZHQxnpVkKDxR3DkREq4aPNpnUBQsKQ+XFZsww3lOHG+42OpGhwzMh3SZOKpicxJPaXMV4
        0se2tSnYIXZrJkOnM5ySsabZ0rOsGUZqzwHzDrM+Rq1RaeIMsZTSSlsYI5WYnKLalcV6p1HK
        YzSb7U2l0DxPRSds5WzZDkaZaeMdRoqxp7N2jdoexdMWPtuaEZVms8Rr1OrNeq/yMJs5/ew1
        speLjxfO35DmowtYCQoggNTBt1I3XoICCTnZjaBn9hImBB8Q9I2VIiH4jKDp1xT61/Ki6alE
        KHgQDL0flArBHIL7Ezf9KpxUwe+fvbiPFWQ01JbOiX0ijLyOwDl9W+IrBJDxsOBy+TmYTILq
        789FPhaT4eBpHfffUEbGwfCfK7jAK2CoekbsY4xcB13zdYsulPBt9ppEGBYPVTNnRIJGAbXF
        Tr8hID9JoW/q92JDIoyMluACB8Pre+1SgUNhrsLpZcLLJ2Chd1FehODVF6PAWnja6pb4JBgZ
        Aa090UJ6Pdz6UY+EsUHw9lOZRDhFBkVOuSAJh7MPB0QCr4GSwvfSc4iqWWKsZomxmiUGav4P
        u4LELrSSsfOWDIbX2HVLf7sN+Vcx0tCN7owk9yOSQNRy2STXaJJL6GN8jqUfAYFRCpl7usEk
        l6XTObkMZzNz2SzD9yO9990rsdCQNJt3sa0Os0a/WavVGnQxsTF6LbVKduEJa5KTGbSDOcIw
        dob71yciAkLz0cGqjadmRaVbWhaqL+2bEP0Y3evKczakelpXVyzL26V9OOas9RTVOaqCH4/v
        bhdtYiarjTmD8+6Gd1uM212XOwLrc8wYF7Y9L0Snu9piIsZSCvpPugs7Fadnht6yCQ0jBeTO
        MP3jl7sT3jyzpA53fW8+H7R/w9dHeVMJD1TNZeG5lJjPpDWRGMfTfwErOAtuoAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSvO7pwkVxBpfPmFtMnLaU2eLyrjls
        FgcXtjFabN17ld2BxaPxxg02j02rOtk8Pm+SC2CO4rJJSc3JLEst0rdL4Mp4eO8VY0EvS0X7
        29XsDYxTmbsYOTkkBEwkHiy6ydrFyMUhJLCbUaLx6k+ohLTEsRNngGwOIFtY4vDhYoia54wS
        2w62sILUsAnoSvz7s58NxBYR0JeY3f2SBaSIWWA5o8T0l2vAEkIC3YwS63sNQWxOASuJj6tW
        gTULC3hIzPx1nwnEZhFQldi7/jLYYl4BS4kz/xewQdiCEidnPmEBsZkFtCV6H7YyQtjyEtvf
        zoE6VEHi59NlrBBHWElMf9LCBFEjIjG7s415AqPwLCSjZiEZNQvJqFlIWhYwsqxilEwtKM5N
        zy02LDDMSy3XK07MLS7NS9dLzs/dxAiODi3NHYzbV33QO8TIxMF4iFGCg1lJhHfDw3lxQrwp
        iZVVqUX58UWlOanFhxilOViUxHlvFC6MExJITyxJzU5NLUgtgskycXBKNTCtqj9cuN821UPo
        PUvBy86Q3YseG7Kreax+c+ncllKBM7csN3ac2nifr2nhjs1m7/f/uMj3lWWt5TJGqyKHby4t
        3XcU26d9/qLzl2tJp6LlFflKgf3VJvM8jrLm7wi2XvJW/MAdjlfFuzYtbOObuajFJ+bHg6YE
        YzdHrnnVUhJM8w9ZawscXnBRxsvq4Nv7LSfbSuIvJIpUdlqvsjyzkC+4R+yGxm6xXpndnEx2
        jXJtmp1rmzaxRk/ZkLvwt0v0hYcpAfyuTxmXnKkpPcfFJRNXnshp0fV1yS8tb7u5O5nrvmxr
        vbxfxq5tayRT65X1HXt63YqST80/9WRanN3WeRsqToX+VbTqX53p6CJ9p1aJpTgj0VCLuag4
        EQB/TEat/QIAAA==
X-CMS-MailID: 20200424045748epcas1p153c5dc5b2ab9e8da1daf7b10a51da6dc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200424045546epcas1p29c96627082a25905c9715790b5b2ea82
References: <CGME20200424045546epcas1p29c96627082a25905c9715790b5b2ea82@epcas1p2.samsung.com>
        <000001d619f4$9d7fee90$d87fcbb0$@samsung.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> Hi all,
Hi Stephen,
> 
> Today's linux-next merge of the exfat tree got conflicts in:
> 
>   fs/exfat/super.c
>   fs/exfat/misc.c
>   fs/exfat/exfat_fs.h
> 
> Various patches in the exfat tree have been added to Linus' tree overnight as different commits (an in
> some cases slightly different patches.
> Please rebase the exfat tree on top of commit
Fixed with rebase!
Thanks!
> 
>   81df1ad40644 ("exfat: truncate atimes to 2s granularity")
> 
> from Linus' tree (or do a backmerge of that commit).


