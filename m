Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5357933EB42
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 09:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhCQISw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 04:18:52 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:48681 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCQISs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 04:18:48 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20210317081846epoutp037de05ac021f70bd12b9d52598319ae72~tE1vJVk242866728667epoutp033
        for <linux-next@vger.kernel.org>; Wed, 17 Mar 2021 08:18:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20210317081846epoutp037de05ac021f70bd12b9d52598319ae72~tE1vJVk242866728667epoutp033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1615969126;
        bh=PHNEyIXmBWyKEQx9IvXm0SCLGTdQ5DkDqePnERzAv34=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=eJeOZxpI5up5BQXRg3lxQCDk1YiH9PykX+l2e4oyREBRtWC7MFGhaqcU/055BLhlM
         LwNQ6N4dp3vE4epVBbIxSGC9V3MqvHN4RJp9ZIji/aWsvEua/mxQ/U/jKtOm3q5fGj
         vVVCu8IlwzblNLgvs+OMI2wLQuqGEduART+5YurU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20210317081846epcas1p3f61820b940b33c913897cc4412ed30ac~tE1u81Of80299702997epcas1p3E;
        Wed, 17 Mar 2021 08:18:46 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.161]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4F0jjJ4hcJz4x9Q1; Wed, 17 Mar
        2021 08:18:44 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        7E.4E.02418.26BB1506; Wed, 17 Mar 2021 17:18:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210317081841epcas1p14f10de56101c3850675d5bc2e6eebab0~tE1rGIQSE0757107571epcas1p1r;
        Wed, 17 Mar 2021 08:18:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210317081841epsmtrp23d178101c7b26a73c0d67ca5f7275df5~tE1rFXnxy2674426744epsmtrp2X;
        Wed, 17 Mar 2021 08:18:41 +0000 (GMT)
X-AuditID: b6c32a35-c23ff70000010972-97-6051bb629197
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        FA.67.13470.16BB1506; Wed, 17 Mar 2021 17:18:41 +0900 (KST)
Received: from namjaejeon01 (unknown [10.88.104.63]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20210317081841epsmtip159ab0b2f35f6157163a9e2c286ebba37~tE1q3FCKG1683616836epsmtip1g;
        Wed, 17 Mar 2021 08:18:41 +0000 (GMT)
From:   "Namjae Jeon" <namjae.jeon@samsung.com>
To:     "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Steve French'" <smfrench@gmail.com>
Cc:     "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'Linux Next Mailing List'" <linux-next@vger.kernel.org>
In-Reply-To: <20210317184655.4d369e9e@canb.auug.org.au>
Subject: RE: linux-next: build warning after merge of the cifsd tree
Date:   Wed, 17 Mar 2021 17:18:41 +0900
Message-ID: <012501d71b06$23f65960$6be30c20$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQD0cfsrGuLMy31vK4WpkBQ0SCD1eQHz/oTkrD2IBMA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDKsWRmVeSWpSXmKPExsWy7bCmvm7S7sAEg0ctAhaXd81hszi4sI3R
        Yuveq+wWb14cZnNg8Wi8cYPNY+esu+wenzfJBTBH5dhkpCampBYppOYl56dk5qXbKnkHxzvH
        m5oZGOoaWlqYKynkJeam2iq5+AToumXmAG1TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gq
        pRak5BQYGhToFSfmFpfmpesl5+daGRoYGJkCVSbkZFx81MFYcJ2l4vn86gbGR8xdjJwcEgIm
        EscWvWfvYuTiEBLYwSixa+U8ZgjnE6PEvFNbWEGqhAS+MUosuV8M0/H5xls2iKK9jBIbthxg
        gnBeMkpcOLqSDaSKTUBX4t+f/WC2iECExPmGvSwgNrNAjcT9hbvZQWxOAXOJyWuegt0hLOAi
        cbVvHdg2FgFViWMXNjOB2LwClhIfnu9hhrAFJU7OfAI1R15i+9s5UD8oSPx8uowVYpeVxJyf
        L5ggakQkZne2gb0jIfCRXWL9svtAzRxAjovEwvZIiF5hiVfHt7BD2FISn9/tZYMoqZb4uB9q
        fAejxIvvthC2scTN9RtYQUqYBTQl1u/ShwgrSuz8PZcRYiufxLuvPawQU3glOtqEIEpUJfou
        HWaCsKUluto/sE9gVJqF5K9ZSP6aheT+WQjLFjCyrGIUSy0ozk1PLTYsMESO6U2M4GSoZbqD
        ceLbD3qHGJk4GA8xSnAwK4nwmuYFJAjxpiRWVqUW5ccXleakFh9iNAWG9ERmKdHkfGA6ziuJ
        NzQ1MjY2tjAxMzczNVYS500yeBAvJJCeWJKanZpakFoE08fEwSnVwKSdNStjZuZju5R7O/5W
        3Ax/0ubA+X/Gp0vv5X7+3mnM7KMfsyCzzZ77mwdvT25kbMbsFYLfP059Om1n5Rll2cJXOvzL
        9cvTi1h2uBwtn8P7W/p4x7mqxGdsXAcYZOuuMkwJuLTQZEpFSvzd9aH7eyO457LH8itnzjnx
        w3FdpvDc1Hcf/v76sZznWMbkGxtS7Se/NwxaUuf1/uvcuZlyl1Oa861jclRtFq5Qv9IQHpF1
        WEPD9IXj6h5Jrnuemo3yFyfnyqRdM311Q2qpov+mgvtch66qrlTxLYuvfnOzukr3i4+s7THz
        Z/1vBTxjXp/0+Rnu9ULwXHZcWHTJhJmblZ+90aoSfG0rmfDzju6vFiWW4oxEQy3mouJEADUK
        +n4PBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnG7i7sAEg6OH9Swu75rDZnFwYRuj
        xda9V9kt3rw4zObA4tF44wabx85Zd9k9Pm+SC2CO4rJJSc3JLEst0rdL4Mq4+KiDseA6S8Xz
        +dUNjI+Yuxg5OSQETCQ+33jL1sXIxSEksJtR4tWV/SwQCWmJYyfOABVxANnCEocPF0PUPGeU
        WL10ORNIDZuArsS/P/vZQGwRgQiJtX0PWUFsZoEaicv7DzBDNHQwSrxZsIQRJMEpYC4xec1T
        sM3CAi4SV/vWgTWwCKhKHLuwGWwor4ClxIfne5ghbEGJkzOfsIAcwSygJ9G2kRFivrzE9rdz
        oB5QkPj5dBkrxA1WEnN+vmCCqBGRmN3ZxjyBUXgWkkmzECbNQjJpFpKOBYwsqxglUwuKc9Nz
        iw0LDPNSy/WKE3OLS/PS9ZLzczcxguNCS3MH4/ZVH/QOMTJxMB5ilOBgVhLhNc0LSBDiTUms
        rEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qBaZ5yh+BH5Zz1q78q
        va46lGx+uls/5uU3xtotrM+fuxnIiV37y7tcwtR3gnXD51mnW/J//LyzxzCY/8n1WysmcJrr
        vLLmaj0+9dIR3jfrbrdrG9nHOX3I3SrKV86eJ75Hq9ulY9HuqikLC8skrmrkKe57wXA1yFjj
        sLax+tL4wr/Gs7Mq2lYwzV6ZU3Lh0ueSq5dMyh6sbCv8/XPTlcOp6+4pcuoffR4TZ53PWGnY
        r7lAdjvPpK8K8nOWf+l882hzVcf+336Ln1ap696+y1SwLHlvzfZ3vCs7Tv/o2vfC6PYV6aZ1
        p22/Hgp69DZ5hpd00FddDm3brJ5z5vtYVDU7+hqPfTxbEhWzL2x5pD/vLyWW4oxEQy3mouJE
        AEtBmqT6AgAA
X-CMS-MailID: 20210317081841epcas1p14f10de56101c3850675d5bc2e6eebab0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210317074706epcas1p2c0898e1b2bf0e875dc6056c360a3236b
References: <CGME20210317074706epcas1p2c0898e1b2bf0e875dc6056c360a3236b@epcas1p2.samsung.com>
        <20210317184655.4d369e9e@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

> Hi all,
> 
> After merging the cifsd tree, today's linux-next build (htmldocs) produced this warning:
> 
> Documentation/filesystems/cifs/cifsd.rst:3: WARNING: Title overline too short.
> 
> =========================
> CIFSD - SMB3 Kernel Server
> =========================
> Documentation/filesystems/cifs/cifsd.rst: WARNING: document isn't included in any toctree
> 
> Introduced by commit
> 
>   597357deeecf ("cifsd: update cifsd.rst file")
I sent a pull request to Steve to fix this failure.

Thanks for your report!
> 
> --
> Cheers,
> Stephen Rothwell

