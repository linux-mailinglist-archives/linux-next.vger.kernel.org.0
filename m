Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8113D20A0DD
	for <lists+linux-next@lfdr.de>; Thu, 25 Jun 2020 16:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405345AbgFYOaE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Jun 2020 10:30:04 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:12531 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405189AbgFYOaD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2020 10:30:03 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200625143001epoutp04b18feda82b96831ee4b6c52e46cd08f8~bz9Osa0NG0650306503epoutp044
        for <linux-next@vger.kernel.org>; Thu, 25 Jun 2020 14:30:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200625143001epoutp04b18feda82b96831ee4b6c52e46cd08f8~bz9Osa0NG0650306503epoutp044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1593095401;
        bh=yb0fLVyVEua0dJC2msoZg3DHd9CvKZ5Sy4F7xXski9Y=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=q7j/uHRHGeTQqfkM4GYfV7/Jpi3xdj99xhKXe3du+GhrfOk6U4v22gTk66ZaRijxv
         IbAPlPLEEWPyYBm+pmDfBBbS7aF0kxzPg7Cpt5CBNU6PgsCvt8pSmW6CnZg3jkSmnm
         Y+4dp0UnafL2Yq74ZGQuMUo1GTDXAZ8v+LaRSTj0=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20200625142959epcas5p40b86f8b9eb0575f8d739dd18b04943b6~bz9NdikQx3276332763epcas5p4S;
        Thu, 25 Jun 2020 14:29:59 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        87.3B.09475.7E4B4FE5; Thu, 25 Jun 2020 23:29:59 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20200625142959epcas5p4ade8c2acb42629c7bdac08f7c50e2fac~bz9M6AuXK1238912389epcas5p4k;
        Thu, 25 Jun 2020 14:29:59 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200625142959epsmtrp2692bc6759101c49323224c594e358a96~bz9M5ZEVR2752327523epsmtrp2E;
        Thu, 25 Jun 2020 14:29:59 +0000 (GMT)
X-AuditID: b6c32a4b-39fff70000002503-88-5ef4b4e7c25c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        BE.26.08303.7E4B4FE5; Thu, 25 Jun 2020 23:29:59 +0900 (KST)
Received: from alimakhtar02 (unknown [107.108.234.165]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200625142957epsmtip21e5b2f1faa7d2ba5ff8cae239c067fb6~bz9LQQ12F2817528175epsmtip27;
        Thu, 25 Jun 2020 14:29:57 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'James Bottomley'" <James.Bottomley@HansenPartnership.com>
Cc:     "'Linux Next Mailing List'" <linux-next@vger.kernel.org>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'Martin K. Petersen'" <martin.petersen@oracle.com>,
        "'Seungwon Jeon'" <essuuj@gmail.com>
In-Reply-To: <20200625134128.3147193f@canb.auug.org.au>
Subject: RE: linux-next: build warning after merge of the scsi tree
Date:   Thu, 25 Jun 2020 19:59:55 +0530
Message-ID: <021f01d64afd$1aabdb20$50039160$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQGb0mWQCFKEvR5YSDo+VyfiPWseaQJFro6sqUwnliA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7bCmuu7zLV/iDCa9NLBYfmEJk8XGfg6L
        y7vmsFkcXNjGaLH8+D8mi617r7I7sHk03rjB5rFz1l12j2mTTrF5fHx6i8Xj8ya5ANYoLpuU
        1JzMstQifbsErozlT+YwF5xmr3i9cD97A+MMti5GDg4JAROJ5pOpXYxcHEICuxklFq3YxALh
        fGKUOHrmFxuE85lRYuK6NtYuRk6wjon39jBDJHYxSixccJgVwnnDKPH6cwNYFZuArsSOxW1s
        ILaIQJ5E988XTCBFzAI3GSVWndsMluAUMJdo+n0I7BBhAWeJo80RIGEWAVWJi28mMoPYvAKW
        Ei9mPGaCsAUlTs58wgJiMwvIS2x/O4cZ4iIFiZ9Pl7FCxMUljv7sYYbYayWx7mgj2AsSAhM5
        JA4df80E0eAiceXbPKhmYYlXx7ewQ9hSEp/f7YUGTLZEzy5jiHCNxNJ5x1ggbHuJA1fmsICU
        MAtoSqzfpQ+xlk+i9/cTJohOXomONiGIalWJ5ndXoTqlJSZ2d0PD0EPi9Yx+5gmMirOQPDYL
        yWOzkDwzC2HZAkaWVYySqQXFuempxaYFxnmp5XrFibnFpXnpesn5uZsYwYlHy3sH46MHH/QO
        MTJxMB5ilOBgVhLhDXH7FCfEm5JYWZValB9fVJqTWnyIUZqDRUmcV+nHmTghgfTEktTs1NSC
        1CKYLBMHp1QD04rGavMrWlOWJ2i2WG+r3HrI9qZR+9vs9A8NE9b4XOJ/zFRnv7DouXLnu7fM
        8z8dNOpre5oedcygN1te9XhOvUG/cFWIEKeR/fZHsYZsJ39e8FGz2dJxxOLun9PzAjadmOea
        ouopk9OVrNix9Ud6+uRmlax3R4USNilYfJlfL/gx9Grk06dFt32d5/Tq87mUH1c6GfbOVbP4
        9ryPetwHQgpr/j2eV2asI9DO8cU0MC+Z9+SEH+s5Zr/9zZlREJB4/EpQsHtT2oIz3gr2007+
        sei9/Gv/e8sb0SHdURvdXXrqcicWCC9Llf03/Q+jvUuEWmTw9OCZB+d6npAK+njQhdu96mpg
        /OtktiPXLpoosRRnJBpqMRcVJwIALune/asDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsWy7bCSvO7zLV/iDF618lssv7CEyWJjP4fF
        5V1z2CwOLmxjtFh+/B+Txda9V9kd2Dwab9xg89g56y67x7RJp9g8Pj69xeLxeZNcAGsUl01K
        ak5mWWqRvl0CV8byJ3OYC06zV7xeuJ+9gXEGWxcjJ4eEgInExHt7mLsYuTiEBHYwSkw+sYkR
        IiEtcX3jBHYIW1hi5b/n7BBFrxglOj50s4Ak2AR0JXYsbgOaxMEhIpAnseKbPkgNs8BtRomu
        xTugpnYwSrzp/s0M0sApYC7R9PsQWIOwgLPE0eYIkDCLgKrExTcTwUp4BSwlXsx4zARhC0qc
        nPmEBaScWUBPom0j2G3MAvIS29/OYYa4TUHi59NlrBBxcYmjP3vA4iICVhLrjjayTWAUnoVk
        0iyESbOQTJqFpHsBI8sqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg+NHS2sG4Z9UH
        vUOMTByMhxglOJiVRHhD3D7FCfGmJFZWpRblxxeV5qQWH2KU5mBREuf9OmthnJBAemJJanZq
        akFqEUyWiYNTqoEpgXH6trOpKZJaucqpxsFufql/5hjeM7mwNuRjodOuOTKOxyZP7vxzKmq3
        RozfXLFliZ8ZPA8ftbyc9fLuyeI5q9k7Qpt+b/ovyXpdSe6A0sJdulNW7bx9rVYlI3XtfN5k
        HnZ/HsvWi8VJpyY1XmvXY9konsrGEWlXWrHrsEW2kZCav5vujy/iTL8NjleY971mFC9feC/+
        +KHFW+9p5O+UXKp91Sy4P4blm4f4vwO7Vi/IPBFzyiLR/8DVF+4r88TUNOLTJC89viERE5PX
        v9f5lfR052unNR9HnD0qIK3Qls+4ZVO5sO/av9NeSs3ifnnlgnSKxBWWYx5JMsULOtIUd/ru
        nTS95IfLYQcf+SwlluKMREMt5qLiRACIKf8SDgMAAA==
X-CMS-MailID: 20200625142959epcas5p4ade8c2acb42629c7bdac08f7c50e2fac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200625034139epcas5p126a29921cc3f751528786b00f4b2828b
References: <CGME20200625034139epcas5p126a29921cc3f751528786b00f4b2828b@epcas5p1.samsung.com>
        <20200625134128.3147193f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: 25 June 2020 09:11
> To: James Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel
Mailing
> List <linux-kernel@vger.kernel.org>; Alim Akhtar
<alim.akhtar@samsung.com>;
> Martin K. Petersen <martin.petersen@oracle.com>; Seungwon Jeon
> <essuuj@gmail.com>
> Subject: linux-next: build warning after merge of the scsi tree
> 
> Hi all,
> 
> After merging the scsi tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/scsi/ufs/ufs-
> exynos.o
> 
Sorry about that, will send a fix patch soon.

> Introduced by commit
> 
>   55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exynos
SoCs")
> 
> (not sure why I missed this earlier, sorry)
> 
> --
> Cheers,
> Stephen Rothwell

