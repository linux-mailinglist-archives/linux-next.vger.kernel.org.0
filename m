Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FE4263A95
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 04:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730644AbgIJCfM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 22:35:12 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:24545 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730450AbgIJCdJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 22:33:09 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20200910023306epoutp034767795825ad01ada2688cd31e0740e1~zS2QpAZeL1667816678epoutp03K
        for <linux-next@vger.kernel.org>; Thu, 10 Sep 2020 02:33:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20200910023306epoutp034767795825ad01ada2688cd31e0740e1~zS2QpAZeL1667816678epoutp03K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1599705186;
        bh=teGCqHEFthsRoEpChIqH0QsySgv8omqE3KANwVAcCYg=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=rOYFMHv8skkfz3GKYer1VtbeMZwGgCpvdkZ9w9Zxu6Vt8wyY+n6VB/dAR2IghvhyS
         qEMkp0sMAGAvdjyNo99xvj462yMeZBCgHHWU7obatRYptvA1O6SiB35sT42Kja0ezK
         1SEtIBVY3RA1YsL42+rm6IH4EBXhGuzyS7u15alM=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20200910023305epcas5p3055a9045fa34a834221d5849dec7d0f2~zS2QN-O3Q1505215052epcas5p3Q;
        Thu, 10 Sep 2020 02:33:05 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        43.09.40333.160995F5; Thu, 10 Sep 2020 11:33:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20200910023304epcas5p33a0b919b4ac04564f198039bded0f11e~zS2O2yFnU3181931819epcas5p3D;
        Thu, 10 Sep 2020 02:33:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200910023304epsmtrp2db94ac8dfa57c83ce40e7c28007207c6~zS2O2J5hE2057720577epsmtrp2E;
        Thu, 10 Sep 2020 02:33:04 +0000 (GMT)
X-AuditID: b6c32a4a-9a7ff70000019d8d-23-5f599061bca8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        5F.FB.08303.060995F5; Thu, 10 Sep 2020 11:33:04 +0900 (KST)
Received: from alimakhtar02 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20200910023302epsmtip149e3e90d71931ca158338c7cfaaa84fa~zS2Ng6cQJ2321123211epsmtip1A;
        Thu, 10 Sep 2020 02:33:02 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Martin K. Petersen'" <martin.petersen@oracle.com>,
        "'Randy Dunlap'" <rdunlap@infradead.org>
Cc:     "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'linux-scsi'" <linux-scsi@vger.kernel.org>,
        "'Santosh Yaraganavi'" <santosh.sy@samsung.com>,
        "'Vinayak Holikatti'" <h.vinayak@samsung.com>,
        "'Seungwon Jeon'" <essuuj@gmail.com>
In-Reply-To: <yq1a6xy2wph.fsf@ca-mkp.ca.oracle.com>
Subject: RE: linux-next: Tree for Jul 20 (scsi/ufs/exynos)
Date:   Thu, 10 Sep 2020 08:03:01 +0530
Message-ID: <001501d6871a$b5b29f10$2117dd30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIWmKFrqc6cTichonS6aOkZQnVssAH33GmqAhZA118BQ2wKXgD2W6KbAfj42Oionvwl0A==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7bCmpm7ihMh4g5urNSyWX1jCZHF51xw2
        i4ML2xgtuq/vYLNYfvwfk8XbO9NZLLbuvcruwO7ReOMGm8fOWXfZPTav0PL4+PQWi8fnTXIB
        rFFcNimpOZllqUX6dglcGWd/LmMrmM9ZMWXjatYGxgvsXYycHBICJhL3nkxg62Lk4hAS2M0o
        saX1HjuE84lRoqvrJyOE85lR4vvDz6wwLXv/f2KGSOxilOjbeJYJwnnJKPH74FsmkCo2AV2J
        HYvb2EBsEYFkic2L94J1MAs8YpLo3PMHaBQHB6eAscStm3kgNcICVhJzzuwC28AioCoxc/98
        ZhCbV8BSonnLVhYIW1Di5MwnYDazgLzE9rdzmCEuUpD4+XQZK8SuMImNT1dB1YhLHP3ZA7ZX
        QmAmh8Tyk+egXnCRmP/nPwuELSzx6vgWaGhISXx+t5cN5DYJgWyJnl3GEOEaiaXzjkGV20sc
        uDKHBaSEWUBTYv0ufYhVfBK9v58wQXTySnS0CUFUq0o0v7sK1SktMbG7G+oAD4n27QtYJzAq
        zkLy2Cwkj81C8sAshGULGFlWMUqmFhTnpqcWmxYY5aWW6xUn5haX5qXrJefnbmIEJyEtrx2M
        Dx980DvEyMTBeIhRgoNZSYQ3KT8yXog3JbGyKrUoP76oNCe1+BCjNAeLkjiv0o8zcUIC6Ykl
        qdmpqQWpRTBZJg5OqQYmkykJ65Oeh3+6ZvssRH/emwMfPy1xy05paf760nHzHflmro1Z25Z9
        Vtu3J7is6UuWfdWU8Cr2v8aL0itfFc9R23U3O8ymqnPK54AkKyNn5mVSDzL6thwy3yrWlLif
        a965FW+4KhhUpedwGc5idr9ac1ZYd9/WdMXv8Vq6FbbZ/1/mJEyZsr2jZlk4w7K/Vs9DvhbM
        LpicKCHlnL5HWu27DjebjGv4U/fU+hsL9GfOM/11nU078M5W0Y+OOzbqeS/purLF4URd8w7b
        6KPKPz4G+dWdPl0ZzPDvlOUiufluOUy/Upo4Votxr9q3er3R/dA7Vy9+s/giIZqSlOGxvllc
        qcrJyCV6UbIb74tth1cqsRRnJBpqMRcVJwIAypUNkbEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42LZdlhJTjdhQmS8wbLVvBbLLyxhsri8aw6b
        xcGFbYwW3dd3sFksP/6PyeLtneksFlv3XmV3YPdovHGDzWPnrLvsHptXaHl8fHqLxePzJrkA
        1igum5TUnMyy1CJ9uwSujLM/l7EVzOesmLJxNWsD4wX2LkZODgkBE4m9/z8xg9hCAjsYJa7t
        M4KIS0tc3zgBqkZYYuW/50A2F1DNc0aJJ5tmMoIk2AR0JXYsbmMDsUUEkiV2P9/ODFLELPCM
        SWLXvnZWiI7jTBLbuvtZuhg5ODgFjCVu3cwDaRAWsJKYc2YXK4jNIqAqMXP/fLAreAUsJZq3
        bGWBsAUlTs58AtbKLKAn0bYRbC+zgLzE9rdzmCGOU5D4+XQZK8QNYRIbn65igagRlzj6s4d5
        AqPwLCSTZiFMmoVk0iwkHQsYWVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgRHkpbW
        DsY9qz7oHWJk4mA8xCjBwawkwpuUHxkvxJuSWFmVWpQfX1Sak1p8iFGag0VJnPfrrIVxQgLp
        iSWp2ampBalFMFkmDk6pBqbWB8/lLn0WsDzkzDHn0OKlr3gOzP+sr7p7xa8SifvFMyoL5UPi
        a84+UNlwx+Vbg7bC2n1vHpe94Zphu9Zsytz1TVM/7fNq2XzQMmLGm6KivFR2hgXbrZMzDhn1
        tn6P5qm077r6+KZMZvp274r3glbZvkcPBhwz38G+p9thcveW1D/VHtv/TfBcempzYsPn4PSi
        v51f840mHnd/8eux+MPVB961/klcs0Jimu7BA223z/gp+AVxzeniDfkZJKIQkDDH6Wrx/2Y9
        Zue6qnWu2UaMhxWuK5zcdWifyP7so9v5zutMT7IVCBe45rJyYruOAaMX5xqdwuC7s05mhjua
        t+65MMlTZ8vh7qh+4SnpvX1KLMUZiYZazEXFiQDBWXGuEwMAAA==
X-CMS-MailID: 20200910023304epcas5p33a0b919b4ac04564f198039bded0f11e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200720164116epcas5p2021c67d1778e737d7c695f6bdbc5b2d4
References: <20200720194225.17de9962@canb.auug.org.au>
        <CGME20200720164116epcas5p2021c67d1778e737d7c695f6bdbc5b2d4@epcas5p2.samsung.com>
        <e6112633-61c9-fa80-8479-fe90bb360868@infradead.org>
        <06a601d65f86$3d8aeee0$b8a0cca0$@samsung.com>
        <f72b8022-1ebd-c5a1-2fe2-a3e93854fd0e@infradead.org>
        <yq1a6xy2wph.fsf@ca-mkp.ca.oracle.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy and Martin,

> -----Original Message-----
> From: Martin K. Petersen <martin.petersen@oracle.com>
> Sent: 10 September 2020 07:58
> To: Randy Dunlap <rdunlap@infradead.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>; 'Stephen Rothwell'
> <sfr@canb.auug.org.au>; 'Linux Next Mailing List' <linux-
> next@vger.kernel.org>; 'Linux Kernel Mailing List' <linux-
> kernel@vger.kernel.org>; 'linux-scsi' <linux-scsi@vger.kernel.org>;
'Santosh
> Yaraganavi' <santosh.sy@samsung.com>; 'Vinayak Holikatti'
> <h.vinayak@samsung.com>; 'Seungwon Jeon' <essuuj@gmail.com>
> Subject: Re: linux-next: Tree for Jul 20 (scsi/ufs/exynos)
> 
> 
> Randy,
> 
> > I am still seeing this in linux-next of 20200909.
> > Was there a patch posted that I missed and is not applied anywhere yet?
> 
> This patch became a victim of dropping the Exynos changes in 5.9. I have
> added it back in.
> 
Sorry about not following on this after 5.9-rc1 was out.
As Martin pointed this was posted 
https://www.spinics.net/lists/linux-scsi/msg144970.html

I just send V2 of the same with Randy's Acked-by
Please take a look.

> --
> Martin K. Petersen	Oracle Linux Engineering

