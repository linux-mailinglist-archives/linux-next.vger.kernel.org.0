Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EFE3411D8
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 02:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhCSBAf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 21:00:35 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:29065 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbhCSBAc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 21:00:32 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210319010030epoutp03f53fb0614f971681b6feea146a8cf349~tmJppD9NG1576115761epoutp03T
        for <linux-next@vger.kernel.org>; Fri, 19 Mar 2021 01:00:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210319010030epoutp03f53fb0614f971681b6feea146a8cf349~tmJppD9NG1576115761epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1616115630;
        bh=CYOQIAEhIVVR2MghilsKhgUNhpwCDKcLMC88GRYAxl0=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=Wapi75RHzN8hABocGfZ3CtBgnRFr8+BSYaWy6Mq3NGfOL+Anqs06xXjRmzn+x4iGt
         iui/MvgMOYsWSQmkBZpg1zZ0azWUl2UsKX7ySzMOwPzr86hJaKjtBqmV5i6/mnZvPK
         ugwC/tSCpko7cwy/P2ymbbFtXi4JHRgnZdiJnOSw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20210319010029epcas1p3847ac4c00e089a4f3de587d7103e5cd1~tmJpPEAjD3168831688epcas1p3y;
        Fri, 19 Mar 2021 01:00:29 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.159]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4F1lth0xmLz4x9QN; Fri, 19 Mar
        2021 01:00:28 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        B8.23.59147.BA7F3506; Fri, 19 Mar 2021 10:00:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20210319010027epcas1p412df39d99c93af46535bf465feeab257~tmJm99Xl_2671226712epcas1p4n;
        Fri, 19 Mar 2021 01:00:27 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210319010027epsmtrp27627cba2c163bea8fafca240b20afe1d~tmJm9IaJe2118921189epsmtrp2W;
        Fri, 19 Mar 2021 01:00:27 +0000 (GMT)
X-AuditID: b6c32a38-e3dff7000000e70b-ac-6053f7ab0759
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        D1.28.13470.BA7F3506; Fri, 19 Mar 2021 10:00:27 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210319010027epsmtip22f451ac522477b66b15285b230d55656~tmJmuVbn-0300003000epsmtip2O;
        Fri, 19 Mar 2021 01:00:27 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     "'Randy Dunlap'" <rdunlap@infradead.org>
Cc:     "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        <linux-cifs@vger.kernel.org>,
        <linux-cifsd-devel@lists.sourceforge.net>,
        "'Hyunchul Lee'" <hyc.lee@gmail.com>,
        "'Steve French'" <sfrench@samba.org>,
        "'Sergey Senozhatsky'" <sergey.senozhatsky@gmail.com>,
        "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>
In-Reply-To: <3497bc60-51be-04ba-50c8-4bc258df7f31@infradead.org>
Subject: RE: linux-next: Tree for Mar 18 (cifsd: Kconfig)
Date:   Fri, 19 Mar 2021 10:00:27 +0900
Message-ID: <000001d71c5b$401f8c50$c05ea4f0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG8rPctcGujkS60JpHvbojK+bUnWwHjjXS2AYdXkfSqpATnkA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRmVeSWpSXmKPExsWy7bCmvu6a78EJBk1zmCyu3X/PbvHi/y5m
        i5//vzNaXN41h83i4MI2Rou3d6azWKz9/JjdYuveq+wWHS+PMjtwejTeuMHmsXPWXXaPzSu0
        PHYv+MzkMXdXH6PH501yAWxROTYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5
        ibmptkouPgG6bpk5QEcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgoMDQr0ihNz
        i0vz0vWS83OtDA0MjEyBKhNyMq6fvshW0MJVMbXnJ3sD41v2LkZODgkBE4lz6x8ydzFycQgJ
        7GCUeP35MyOE84lRYkrPaiYI5xujxKSfX4AyHGAtu9a7QMT3Mkr8nnGIHcJ5ySgx4VgH2Fw2
        AV2Jf3/2s4HYIgI6Ejc3fwIbyyzwl0li1/7JYJM4BRwltnQwgdQIC1hKnL7/mwXEZhFQlXhz
        dxLYHF6g+NLG6ywQtqDEyZlPwGxmAXmJ7W/nMEP8oCDx8+kyVohdThIr5vyCqhGRmN3ZBvab
        hMBSDom216uhGlwkltzvZYSwhSVeHd8CDQwpic/v9rJBfFkt8XE/VHkHo8SL77YQtrHEzfUb
        WEFKmAU0Jdbv0ocIK0rs/D2XEWItn8S7rz2sEFN4JTrahCBKVCX6Lh1mgrClJbraP7BPYFSa
        heSxWUgem4XkgVkIyxYwsqxiFEstKM5NTy02LDBBjutNjOD0qmWxg3Hu2w96hxiZOBgPMUpw
        MCuJ8JrmBSQI8aYkVlalFuXHF5XmpBYfYjQFBvVEZinR5Hxggs8riTc0NTI2NrYwMTM3MzVW
        EudNMngQLySQnliSmp2aWpBaBNPHxMEp1cDEJenyTnJZnUveMf+SxzU7tn/2Ofd+Ydkdu+fy
        V2cv2XR1uoDjDdfTvTb3bhRd3Ts7e0uC9N8fP9S7hPhetLzZNc3bnEf61f07r54GTdBKVPJQ
        EHdakDJT2zJ5zbIXPya9+96xXvJD9f83H9kfTmL8s/TejuYXe0wupwj/a/mqMZ9114TX5TfO
        KjlPn3ZK5rm2471Th9Tf9Oy4ueqHwRSm/+xHotJjDO8JZpa/ib85bcJJyVf/qrdv3L5F8+pB
        7Zq5kj0HbeZ2czyf8ogziPuwR1Ywu4ighflKxq35Pz/o8CQviLe4pv7yx6ScGJ26mfMya9yP
        l2bZzvm0Ye1jqcQNOrGfm1f7nHbjqpl4SMcnrFeJpTgj0VCLuag4EQBbbAC2OAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJXnf19+AEgz/v+C2u3X/PbvHi/y5m
        i5//vzNaXN41h83i4MI2Rou3d6azWKz9/JjdYuveq+wWHS+PMjtwejTeuMHmsXPWXXaPzSu0
        PHYv+MzkMXdXH6PH501yAWxRXDYpqTmZZalF+nYJXBnXT19kK2jhqpja85O9gfEtexcjB4eE
        gInErvUuXYxcHEICuxkl1j6cBRTnBIpLSxw7cYYZokZY4vDhYpCwkMBzRomXb81AbDYBXYl/
        f/azgdgiAjoSNzd/YgSZwyzQyCwx5flXNoihexkl5mw4CLaMU8BRYksHE0iDsIClxOn7v1lA
        bBYBVYk3dyeB7eUFii9tvM4CYQtKnJz5BMxmFtCWeHrzKZQtL7H97RxmiDsVJH4+XcYKcYST
        xIo5v6BqRCRmd7YxT2AUnoVk1Cwko2YhGTULScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWl
        eel6yfm5mxjBcaaluYNx+6oPeocYmTgYDzFKcDArifCa5gUkCPGmJFZWpRblxxeV5qQWH2KU
        5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cBUGFV+bfOn66v6cq+w/wx++Ck6/aR0dKfk
        5lU9PKJ7xYTvXmLN3JfpXz1XN+SS3+OCz4c09TT5szbPjdV+uTl48dmeC8/8F740MOsX5lxT
        ou7+78CJE+Vn+K0l1T4d3Bta+KRGdkrl9MD8Zxcto0/k7tjoxOW7sdXA/Y6qUtM9n+usm9U3
        7HQ91mIhu4Kn2umkNO+NrqU7cnW3We+yigm9wGm1iFGBwyafWWtVl1avi7Wo2YY23x3vt7L+
        ywhsuGD6O/ypg7Bph++tRgF3U/VIpocvU0+7zGszEMpImdgWLsdwNpnTV1vqSQqrafeCKl/1
        su131dyYmESnP374ZDlTPuOUKWknOYJO3+ZiVGIpzkg01GIuKk4EAN/mW20iAwAA
X-CMS-MailID: 20210319010027epcas1p412df39d99c93af46535bf465feeab257
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210318185814epcas1p4f42e19113a2e993e0d6a9bf60ea0857d
References: <20210318210844.5e9adf1e@canb.auug.org.au>
        <CGME20210318185814epcas1p4f42e19113a2e993e0d6a9bf60ea0857d@epcas1p4.samsung.com>
        <3497bc60-51be-04ba-50c8-4bc258df7f31@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> On 3/18/21 3:08 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > News: there will be no linux-next release on Friday this week.
> >
> > Warning: Some of the branches in linux-next are still based on
> > v5.12-rc1, so please be careful if you are trying to bisect a bug.
> >
> > News: if your -next included tree is based on Linus' tree tag
> > v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
> > consider rebasing it onto v5.12-rc2. Also, please check any branches
> > merged into your branch.
> >
> > Changes since 20210317:
> >
Hi Randy,
> > The cifsd tree lost its build failure.
> 
> kconfig warning in cifsd:
> 
> WARNING: unmet direct dependencies detected for CRYPTO_ARC4
>   Depends on [n]: CRYPTO [=y] && CRYPTO_USER_API_ENABLE_OBSOLETE [=n]
>   Selected by [y]:
>   - SMB_SERVER [=y] && NETWORK_FILESYSTEMS [=y] && INET [=y]
> 
> 
> 
> Either
> 	select CRYPTO_ARC4 if CRYPTO_USER_API_ENABLE_OBSOLETE or add
> 	select CRYPTO_USER_API
> 	select CRYPTO_USER_API_ENABLE_OBSOLETE
> 
> The first choice is certainly more palatable if it is OK.
> 
> 
> thanks.
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
I will make the patch included your reported-by tag.
Thanks for your report and patch!

