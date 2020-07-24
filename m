Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D488922BCDA
	for <lists+linux-next@lfdr.de>; Fri, 24 Jul 2020 06:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbgGXEVp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jul 2020 00:21:45 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:13053 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgGXEVo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2020 00:21:44 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200724042142epoutp03a00a667f42fb4cc5927ef19a367dca97~klXYjQPuw0798407984epoutp037
        for <linux-next@vger.kernel.org>; Fri, 24 Jul 2020 04:21:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200724042142epoutp03a00a667f42fb4cc5927ef19a367dca97~klXYjQPuw0798407984epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1595564502;
        bh=cbxuX6MX2c/S0DH0B2gBtVRFPUIMdtrTv1qjVxQcrKw=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=ZIWtd48EYqwuv9PVMQIfCtsUD3LBtixHIoXSxk9YUdYMiY8hOqMsXRsavnlgwuAFK
         cQp0As4GKve2FjMtFKVgKKvP6PJSmIb4yPW5GonMmqY+a6Gh7OlQKPzrAuM2rxwyho
         lhZDjY4PyP3Nxwjl3HnizCqxcQiGhOtU2UII0FjA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20200724042141epcas2p3a5ac7d417f876e51315f11a5b504be49~klXXMjYLP1658916589epcas2p3F;
        Fri, 24 Jul 2020 04:21:41 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.191]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4BCbcf4DfpzMqYkg; Fri, 24 Jul
        2020 04:21:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        7F.95.27441.1D16A1F5; Fri, 24 Jul 2020 13:21:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20200724042137epcas2p1e5b57020675f1954d8655925245c1022~klXTXcMgn2952829528epcas2p1_;
        Fri, 24 Jul 2020 04:21:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200724042137epsmtrp27c0c1ec7d71dc1313ab93e323859143d~klXTWnNd51063310633epsmtrp2t;
        Fri, 24 Jul 2020 04:21:37 +0000 (GMT)
X-AuditID: b6c32a47-fafff70000006b31-27-5f1a61d11d74
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1A.50.08382.0D16A1F5; Fri, 24 Jul 2020 13:21:36 +0900 (KST)
Received: from KORCO011456 (unknown [12.36.185.54]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200724042136epsmtip1d10c711190e58ce4e660c16d184f0cab~klXTKoNA-1507015070epsmtip1k;
        Fri, 24 Jul 2020 04:21:36 +0000 (GMT)
From:   "Kiwoong Kim" <kwmad.kim@samsung.com>
To:     "'Martin K. Petersen'" <martin.petersen@oracle.com>,
        "'Stephen Rothwell'" <sfr@canb.auug.org.au>
Cc:     "'James Bottomley'" <James.Bottomley@HansenPartnership.com>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>
In-Reply-To: <yq1mu3qe0wm.fsf@ca-mkp.ca.oracle.com>
Subject: RE: linux-next: build failure after merge of the scsi-mkp tree
Date:   Fri, 24 Jul 2020 13:21:36 +0900
Message-ID: <03d801d66171$ebc763c0$c3562b40$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQIOyx8zECdk5Fcwy7C/SA+aYBrkmAHF8/LBAiG9q+QCVRSbzahzZ0RQ
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmme7FRKl4g029ahYP5m1js9jYz2Fx
        edccNouDC9sYLZYf/8dksXXvVXYHNo/GGzfYPKZNOsXm8fHpLRaPvi2rGD0+b5ILYI3KsclI
        TUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBOkBJoSwxpxQo
        FJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BoWKBXnJhbXJqXrpecn2tlaGBgZApUmZCTsfDc
        MsaCNtaKHZNfMjYwTmTpYuTkkBAwkbjQeJ2xi5GLQ0hgB6PE5LXL2SCcT4wSf/88ZIFwvjFK
        zHm5kg2m5eSdicwQib2MEvsaX4PNEhJ4wSjx77s0iM0moC0x7eFuVhBbRCBNYlbXY7AdzCA1
        0/obmUESnALGEqcebwBrFhZwl+g7vBEsziKgKnFtRTNYM6+ApcSzTU0sELagxMmZT8BsZgEj
        iSWr5zNB2PIS29/OYYa4TkHi59NlrBBxEYnZnW1AcQ6gI9wkGraEg9wgIdDLIfGl9wQbSFxC
        wEViy7UUiFZhiVfHt7BD2FISn9/thXq4XmLf1AZWiN4eRomn+/4xQiSMJWY9a2eEmKMsceQW
        1Gl8Eh2H/7JDhHklOtqEIKqVJX5NmgzVKSkx8+Yd9gmMSrOQPDYLyWOzkDw2C8kzCxhZVjGK
        pRYU56anFhsVGCPH9iZGcOrUct/BOOPtB71DjEwcjIcYJTiYlUR4dRjF44V4UxIrq1KL8uOL
        SnNSiw8xmgLDeiKzlGhyPjB555XEG5oamZkZWJpamJoZWSiJ8xZbXYgTEkhPLEnNTk0tSC2C
        6WPi4JRqYOpOmcksJ67j+We1qaeMS/yu/7KCwmy8E7/7KKpfTvAyb9/v0fI5fSfXWuO4XW9K
        p01ycldUuX/e0/mehuYnpsXP/D8+Omn/5+rkzueVc163Nu078dr15fcXktn9B3/P7ertv8w7
        XSxOyfpm4m1bmVlym3gUpZ+J701STVxr7Sgy//4Mh9qfp6Iv/Pnj2SpSdTqvQjo6+JbpzcVJ
        9jKSXPdur11kW+GXvsQ9U0tW65vvq4sFT8X8Hq+L3hvfu0x+koXS5aRNqXpHpu68ycY/QWFT
        S8Icg6XVzVV5VTLTd17ON3nSzmDy0kDjHsPk1HOlOh4/bb9K8P9kuLOIW6E2PKhK//msvJMe
        d989zbIoUWIpzkg01GIuKk4EAPi2djgmBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSnO6FRKl4g85dNhYP5m1js9jYz2Fx
        edccNouDC9sYLZYf/8dksXXvVXYHNo/GGzfYPKZNOsXm8fHpLRaPvi2rGD0+b5ILYI3isklJ
        zcksSy3St0vgylh4bhljQRtrxY7JLxkbGCeydDFyckgImEicvDORuYuRi0NIYDejxOvrZ5gh
        EpISJ3Y+Z4SwhSXutxxhhSh6xiix58E7sG42AW2JaQ93s4LYIgJpEr8mz2MHKWIWeMEocXDf
        cjaIjluMEpPO32EDqeIUMJY49XgDWLewgLtE3+GNYOtYBFQlrq1oBpvEK2Ap8WxTEwuELShx
        cuYTMJsZ6NbGw91QtrzE9rdzoE5VkPj5dBkrRFxEYnZnG1CcA+giN4mGLeETGIVnIZk0C8mk
        WUgmzULSvYCRZRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnAUaWnuYNy+6oPeIUYm
        DsZDjBIczEoivDqM4vFCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeW8ULowTEkhPLEnNTk0tSC2C
        yTJxcEo1MHFW/pivvXnjtWcpn/dpFRwrPPRO3nHfvBu62gV7fXUehtz6NctqoVU0J6OgvEvu
        yQx13p8H6lOqNiwW68t95v72m4nq1uBZ3ZsTGFavm5ww7+2m1ZazPm0/eHOn1BIb7VdLxKek
        Lvqj3GIoqRbSdkf1+b+C4wEz9k34c30ve+5Bd6eN82sU725sXhgyt2kS16cv53bHuWz4vVMi
        XS7oT/TpmNaLZ72u3Lyw60vxyxssT65Ur3i/pypn82aH8u/XH5ztORprZf2aKUjaoGXirNmf
        w/9femewftaT4vUxNy50pccvd2IW8FTi3tmjHfFe93+v9maLLfve3FHkPH2rPYyxIGzy1d36
        tmtKM+b+6Xn7WImlOCPRUIu5qDgRANAaFnkRAwAA
X-CMS-MailID: 20200724042137epcas2p1e5b57020675f1954d8655925245c1022
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200723150336epcas2p37ebd74d381c5dd3369908b6ffb4d5f7e
References: <20200721163045.50c205a5@canb.auug.org.au>
        <20200723155452.6dccd510@canb.auug.org.au>
        <CGME20200723150336epcas2p37ebd74d381c5dd3369908b6ffb4d5f7e@epcas2p3.samsung.com>
        <yq1mu3qe0wm.fsf@ca-mkp.ca.oracle.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> >> ERROR: modpost: "exynos_ufs_dump_info" [drivers/scsi/ufs/ufs-exynos.ko]
> undefined!
> >> ERROR: modpost: "exynos_ufs_init_dbg" [drivers/scsi/ufs/ufs-exynos.ko]
> undefined!
> >> ERROR: modpost: "exynos_ufs_cmd_log_start" [drivers/scsi/ufs/ufs-
> exynos.ko] undefined!
> 
> *sigh* sorry about that. I did verify yesterday's exynos build fix with
> COMPILE_TEST but it looks like I didn't have the new driver debugging
> option enabled.
> 
> Kiwoong/Alim: Please fix!
> 
> --
> Martin K. Petersen	Oracle Linux Engineering
Hi, Martin.

Sorry for responding lately. I'll post a patch to fix soon. 


Thanks.
Kiwoong Kim

