Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDA48CBC1
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 08:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfHNGOY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 02:14:24 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38099 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbfHNGOX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Aug 2019 02:14:23 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190814061422euoutp02c388b4903d7192ad7eb8c5a14907e588~6tWRBfMa93018130181euoutp02n
        for <linux-next@vger.kernel.org>; Wed, 14 Aug 2019 06:14:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190814061422euoutp02c388b4903d7192ad7eb8c5a14907e588~6tWRBfMa93018130181euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1565763262;
        bh=A9qn6/3oZyPgTnSv23DYT0U0eyRPsOJWWLBTj6TWiQM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=RmdSOviwAmmdIRWFzJh8tAxhjIJErg3XxhbdJ94Rz3MIotnDoJOU9MH7gD0WpvgT1
         1sdCgirrkGV0lfAGUL7wy7NbTC3LoXv6MKN3RlolX1S+3m7xkkOAhFHpsp+trR9cfc
         FV6zbof9WARCUh2gL59mN5YJYmTXi6Vpd/x32g2Q=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190814061421eucas1p1e7c13e50a9b36257d62a442c0fd97114~6tWQRUtXg2140121401eucas1p1Q;
        Wed, 14 Aug 2019 06:14:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 69.80.04309.DB6A35D5; Wed, 14
        Aug 2019 07:14:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190814061420eucas1p2dcce5e9b1c1aa3743d4c1ede2f01e737~6tWPDe0Pe2033720337eucas1p2E;
        Wed, 14 Aug 2019 06:14:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190814061420eusmtrp2ce4d3a3f765a573b4b941546bb11f6cb~6tWOz3EPp3251532515eusmtrp2V;
        Wed, 14 Aug 2019 06:14:20 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-10-5d53a6bd9311
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 5D.80.04166.CB6A35D5; Wed, 14
        Aug 2019 07:14:20 +0100 (BST)
Received: from [106.120.50.63] (unknown [106.120.50.63]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190814061419eusmtip22e85c745574f1bb7a680372a6e6bba54~6tWOd-FoX2191321913eusmtip2X;
        Wed, 14 Aug 2019 06:14:19 +0000 (GMT)
Subject: Re: linux-next: Tree for Aug 13
To:     Steven Rostedt <rostedt@goodmis.org>,
        Vasily Gorbik <gor@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Matthew Garrett <matthewgarrett@google.com>,
        James Morris <jmorris@namei.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <c17d1844-7e13-aba5-0fc9-98c4b247c147@samsung.com>
Date:   Wed, 14 Aug 2019 08:14:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813105645.4ffba70c@gandalf.local.home>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju27nsaM0+5+3FosvMKCMvKbEoxKBs5B/R+lFelx5U1Ck7ztL+
        LCvRZTkMLJeQZmQmXjAvqThvoWbmZiIMITBQNHUoaoqjNI8ny3/P87zP877fAx9DSKspdyZJ
        lcGqVcoUGW1PNvetm053vAmP8s2fPiI3G1YpeW1dhUg+2lZKy7vLc5F8dsZLbsybEMmbOsbE
        QWLFPYuFVjwwjosVZQ0ahf5VF1IUrMUplhsOhdI37S/EsylJmazaJzDWPnHBskmmm4g7ebXB
        WmQT6ZAdAzgAqhvaKB2yZ6T4LYKVsUEkkBUEj9a1pECWEdhyLcROZNo0QAiDSgRzg/V/iRXB
        8FT7VoRhnPAJmDJG8wFnHALdxR+3PQReRGBczaX5AY39QGfVbWMJDoSHNeuIz5LYE5YKZbzs
        giOhdb6AECyO8KlkkuSxHT4HP79VUjwm8GFosZYSAnaD8cmXIv4W4GYxFLW/oPmdgC/BXJdG
        KOAEs/2NYgEfhM3WHf99BN+Ha8QCKUAwmvMcCa7z0Ns/QvGLCHwS6tp8BPkiPK7PEQn7HcBi
        dRTe4ABFzc8IQZZAXq5UcB8HQ3/tv7Pd5q+EHskMu5oZdrUx7Gpj+H+3DJHvkBur4VITWO6M
        ir3tzSlTOY0qwTsuLbUBbX2hzxv9Kx9Q269bPQgzSLZPEtoYFiWllJlcVmoPAoaQOUv0I1uS
        JF6Zlc2q02LUmhSW60EHGFLmJrm7ZyJCihOUGWwyy6az6p2piLFz16KyiNcjJVRhgJLKztdf
        s9mI6fmgdtcqj3CZ/5eWTW1vSPnvJtHS0DH6fYzRz9fTe5F05WZwZ0zfwI+iaMPGfs3ZEnOF
        h3pBnajtQ5FHaYuZNdkUl6+3VnkN7e2cjY8YNOZFudcHR+efKl5TXLmR4ZLs7/80lrqaMPyE
        obPDZCSXqPTzItSc8g/JcY/KPgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xe7p7lgXHGuy8IGBxYdY3Vot16xcz
        WVzeNYfN4uDCNkaLVy+0LPZ1PGCy2Lr3KrsDu0fjjRtsHi37brF7LNhU6jFh0QFGj57vyR6f
        N8kFsEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXo
        Zby/8Z+l4DxzRcc6twbGX0xdjJwcEgImEs/Pn2DuYuTiEBJYyiix/tQ1RoiEjMTJaQ2sELaw
        xJ9rXWwgtpDAa0aJvibHLkYODmEBDYmn++JAwiIC3hIHpx0Bm8Ms8IFR4uinVWwQQ98zSpz+
        PhdsKJuAoUTXW4hBvAJ2Eq1rfzKCDGIRUJX41K8EEhYViJHYd2Y7O0SJoMTJmU9YQGxOAUuJ
        r3eXg93DLGAmMW/zQ2YIW15i+9s5ULa4xK0n85kmMArNQtI+C0nLLCQts5C0LGBkWcUoklpa
        nJueW2yoV5yYW1yal66XnJ+7iREYdduO/dy8g/HSxuBDjAIcjEo8vAFbgmKFWBPLiitzDzFK
        cDArifBOuAgU4k1JrKxKLcqPLyrNSS0+xGgK9NtEZinR5HxgQsgriTc0NTS3sDQ0NzY3NrNQ
        EuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cDI1FCzeZLluUWdM8okrtziPh2xb5lHNu+HM0W1
        O7MfGvEd3T7xZani3L+7v11wuP1LpuIxM/cLo5oz36ZnFxX57bnxnFU2a+eEFY2z6vJ/plUW
        zvN/eFenc2bZ0voAl2D9iaaG+UlR3ff145Zt6DMzLZzQ3HNOWKshfMOGI0cXLwlXvObEor5f
        iaU4I9FQi7moOBEAcBJSrtACAAA=
X-CMS-MailID: 20190814061420eucas1p2dcce5e9b1c1aa3743d4c1ede2f01e737
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190813145654epcas2p2981ea6b19b84470dc37825469cba91de
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190813145654epcas2p2981ea6b19b84470dc37825469cba91de
References: <20190813191924.7c5310dd@canb.auug.org.au>
        <your-ad-here.call-01565700115-ext-9407@work.hours>
        <CGME20190813145654epcas2p2981ea6b19b84470dc37825469cba91de@epcas2p2.samsung.com>
        <20190813105645.4ffba70c@gandalf.local.home>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Steven,

On 2019-08-13 16:56, Steven Rostedt wrote:
> This looks related to what Marek posted.
>
>    https://lore.kernel.org/linux-security-module/3028ed35-3b6d-459f-f3c8-103c5636fe95@samsung.com/
>
> Care to apply the change he suggested to see if it fixes the issue for
> you. If it does, Marek, can you make an official patch?

Sure: https://lkml.org/lkml/2019/8/14/75

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

