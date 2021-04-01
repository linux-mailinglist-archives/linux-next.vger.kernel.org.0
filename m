Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9651235116C
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 11:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbhDAJFD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Apr 2021 05:05:03 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:11447 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233673AbhDAJEs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Apr 2021 05:04:48 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210401090446epoutp04fe1f21c66ae11a43244c33c8768bb0c1~xsJLlNa3-2537425374epoutp04g
        for <linux-next@vger.kernel.org>; Thu,  1 Apr 2021 09:04:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210401090446epoutp04fe1f21c66ae11a43244c33c8768bb0c1~xsJLlNa3-2537425374epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617267886;
        bh=dXfdF4GcVVrRNyo4zs3j4DHtiigWt6RkxAWVreablAU=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=qdDwUiSdeEtaxBxwwHdIGKopVYF/wJQmdMfrZZAqsShChq7/YlFIv523dsBuFEGkt
         X7n9Ttcq5w0+Z0rEglRZRmuOWcgZhT9n6ZWt5tJZf0FZIlMWteTRu3dA3nhsF3FGnC
         uK6CIOnRhz1Lu6/tux75NRiW9+V6Ahj1fs+epaiQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210401090445epcas1p28ca15b0476a9cfa78a58589ddfb01014~xsJLEGxwc1000910009epcas1p2c;
        Thu,  1 Apr 2021 09:04:45 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.162]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4F9y1S48ffz4x9Px; Thu,  1 Apr
        2021 09:04:44 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        59.F6.23820.CAC85606; Thu,  1 Apr 2021 18:04:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20210401090444epcas1p4860692f87fa0a3d63db13ffcb156b3a8~xsJJpXKSk3212832128epcas1p4W;
        Thu,  1 Apr 2021 09:04:44 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210401090444epsmtrp29438fd93ede72fbe3158e287fa57cbf3~xsJJopgFc1500815008epsmtrp2D;
        Thu,  1 Apr 2021 09:04:44 +0000 (GMT)
X-AuditID: b6c32a37-a59ff70000015d0c-af-60658cac1ab9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E0.97.08745.BAC85606; Thu,  1 Apr 2021 18:04:43 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210401090443epsmtip28cf53ae9460521da3fe2e8dce51d2a34~xsJJdPwj12413524135epsmtip2F;
        Thu,  1 Apr 2021 09:04:43 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     "'coverity-bot'" <keescook@chromium.org>
Cc:     "'Steve French'" <stfrench@microsoft.com>,
        "'Ronnie Sahlberg'" <lsahlber@redhat.com>,
        "'Sergey Senozhatsky'" <sergey.senozhatsky@gmail.com>,
        "'Hyunchul Lee'" <hyc.lee@gmail.com>,
        "'Gustavo A. R. Silva'" <gustavo@embeddedor.com>,
        <linux-next@vger.kernel.org>
In-Reply-To: <202103311458.59A15D3@keescook>
Subject: RE: Coverity: parse_veto_list(): Resource leaks
Date:   Thu, 1 Apr 2021 18:04:44 +0900
Message-ID: <004101d726d6$0eac03d0$2c040b70$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQNVEg4lyzpZX3lg8pHPEci2lyl+4AGQp3Idp5cCjzA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOJsWRmVeSWpSXmKPExsWy7bCmvu6antQEg5v9shZb96haXLv/nt3i
        THeuxcGFbYwWC67qW6z9/Jjd4tbE+WwO7B6zGy6yeKw7qOqxc9Zddo/WHX/ZPd7vu8rm8XmT
        XABbVI5NRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtAd
        SgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwCQ4MCveLE3OLSvHS95PxcK0MDAyNT
        oMqEnIwld/6zFBzkq5h45ChbA+M27i5GTg4JAROJjp9n2LsYuTiEBHYwSvScaGSBcD4xSkxY
        cwfK+cwo0bjyODtMS/PRyUwgtpDALqDEYwWIopeMEr1n29lAEmwCuhL//uwHs0UEdCQW/LjG
        BlLELNDLJPG++xAzSIITKPH5+kewImEBC4nbb3azdjFycLAIqEi86HcFCfMKWErsPXqDGcIW
        lDg58wkLiM0sIC+x/e0cZoiDFCR+Pl3GCrHLSuLO3c1MEDUiErM726Bq5nJI/PuVB2G7SLxa
        3cYKYQtLvDq+BeoxKYnP7/aygZwgIVAt8XE/VGsHo8SL77YQtrHEzfUbwK5kFtCUWL9LHyKs
        KLHz91xGiK18Eu++9rBCTOGV6GgTgihRlei7dJgJwpaW6Gr/wD6BUWkWkr9mIflrFpL7ZyEs
        W8DIsopRLLWgODc9tdiwwBg5qjcxglOolvkOxmlvP+gdYmTiYDzEKMHBrCTCK3wgMUGINyWx
        siq1KD++qDQntfgQoykwoCcyS4km5wOTeF5JvKGpkbGxsYWJmbmZqbGSOG+SwYN4IYH0xJLU
        7NTUgtQimD4mDk6pBqZ5N21M376em+l43OXytPpwaaXbz9fpVa212mIbaOB8tUh1/UHNR/2Z
        Oi2v95fEfjhkcGnq1UUhvrGLZpcu85Ofs3JbsVhyldTnK2eFr1SG3T03p/3Oe4HGPJnT3045
        n8+55L3MoiZPbJ/2Z8eaZS9KHfxC/iSmy3YuPv43vGPKvJbI1jdGVn8ci3JnlXOxGuU/iPf4
        +Ynn6CcNo7+aERExDxZlH4sQYRKedF3sS+UCzwWc977O1krtXBEvsjp/Z14kz5zvkg/Uku/8
        bPQUKL+fLr7V8X7CeQ+HVR1bMs46bPqn2Dy7dILDm3UbI/5012oYn22O3GJkvZv5zINKSdur
        Cwqyq40ll9/93F6kwqfEUpyRaKjFXFScCADT3pJuKgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJXnd1T2qCwc3v1hZb96haXLv/nt3i
        THeuxcGFbYwWC67qW6z9/Jjd4tbE+WwO7B6zGy6yeKw7qOqxc9Zddo/WHX/ZPd7vu8rm8XmT
        XABbFJdNSmpOZllqkb5dAlfGkjv/WQoO8lVMPHKUrYFxG3cXIyeHhICJRPPRyUxdjFwcQgI7
        GCUmLpjOBpGQljh24gxzFyMHkC0scfhwMUTNc0aJTZN3M4HUsAnoSvz7sx+sXkRAR2LBj2ts
        IEXMAv1MEg+u7WYFSQgJ1EocmPiLEcTmBCr6fP0jWIOwgIXE7TcgNRwcLAIqEi/6XUHCvAKW
        EnuP3mCGsAUlTs58wgJSwiygJ9G2EWwKs4C8xPa3c5ghzlSQ+Pl0GSvECVYSd+5uZoKoEZGY
        3dnGPIFReBaSSbMQJs1CMmkWko4FjCyrGCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGC
        Y0lLawfjnlUf9A4xMnEwHmKU4GBWEuEVPpCYIMSbklhZlVqUH19UmpNafIhRmoNFSZz3QtfJ
        eCGB9MSS1OzU1ILUIpgsEwenVAPTvIutjGoxE3ruHLMOMAw9cYm194ZvxU0Bu64HBx9WLYm6
        21/YoxNxylJVa+urfX//XOz9fOTDiUXTPykb+EZ9zb3ZUr4p0e/JzGDPLo0HkYbMl2IWvr34
        zv6U+ztdkb0vI0x+71BkTmXYciBysfPzex9nbH+f18JzdtX7Pl+J6rrz7o/dNk/OUt50SyxP
        /nJZsNDGv/N7v066yn5V+dVObmXX2UUMTFU/eg8e9nYLyXxiZ3rFovveRFFmgez64BclaZOd
        F9m6iLutvi76ISl6pazknd88bwUuX5p/oFB05YXg4xvXNpu8N8lw3idfGaXDu3jWu+wWbaPG
        5fKuH937nghf/NS7VM4qh8Mj9GiQEktxRqKhFnNRcSIAUvf+pRQDAAA=
X-CMS-MailID: 20210401090444epcas1p4860692f87fa0a3d63db13ffcb156b3a8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210331215819epcas1p1a0658989d4f52e373f2fcc86f37821fd
References: <CGME20210331215819epcas1p1a0658989d4f52e373f2fcc86f37821fd@epcas1p1.samsung.com>
        <202103311458.59A15D3@keescook>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> 
> Hello!
> 
> This is an experimental semi-automated report about issues detected by Coverity from a scan of next-
> 20210331 as part of the linux-next scan project:
> https://protect2.fireeye.com/v1/url?k=45f8a8ba-1a6391cf-45f923f5-0cc47a31ce4e-
> 387acbf311d3297d&q=1&e=9b3dba27-ad37-4109-9f36-
> 46182d5f39c4&u=https%3A%2F%2Fscan.coverity.com%2Fprojects%2Flinux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified lines of code (noted below)
> that were touched by commits:
> 
>   None
>     788b6f45c1d2 ("cifsd: add server-side procedures for SMB3")
> 
> Coverity reported the following:
> 
> *** CID 1503590:  Resource leaks  (RESOURCE_LEAK)
> /fs/cifsd/mgmt/share_config.c: 101 in parse_veto_list()
> 95     		p = kzalloc(sizeof(struct ksmbd_veto_pattern), GFP_KERNEL);
> 96     		if (!p)
> 97     			return -ENOMEM;
> 98
> 99     		sz = strlen(veto_list);
> 100     		if (!sz)
> vvv     CID 1503590:  Resource leaks  (RESOURCE_LEAK)
> vvv     Variable "p" going out of scope leaks the storage it points to.
> 101     			break;
> 102
> 103     		p->pattern = kstrdup(veto_list, GFP_KERNEL);
> 104     		if (!p->pattern) {
> 105     			ksmbd_free(p);
> 106     			return -ENOMEM;
> 
> If this is a false positive, please let us know so we can mark it as such, or teach the Coverity rules
> to be smarter. If not, please make sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1503590 ("Resource leaks")
> Fixes: 788b6f45c1d2 ("cifsd: add server-side procedures for SMB3")
Thanks for your report! We will fix and add tags to patch.
> 
> Thanks for your attention!
> 
> --
> Coverity-bot

