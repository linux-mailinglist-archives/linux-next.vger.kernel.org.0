Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF801C3558
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 11:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgEDJPZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 May 2020 05:15:25 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39595 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbgEDJPZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2020 05:15:25 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200504091523euoutp0298e15a0e4cb48a895c997c0caa9b8390~LyHrfX4Ec0689506895euoutp02U
        for <linux-next@vger.kernel.org>; Mon,  4 May 2020 09:15:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200504091523euoutp0298e15a0e4cb48a895c997c0caa9b8390~LyHrfX4Ec0689506895euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1588583723;
        bh=CtJ5D+XH+++f+BDG9gPxVNC4UIlkzWo+wffpj9ZE2bI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Q6MAxaimysWE37CnQaD7KTCvpfTvy+SD2Xd9Vk//X6EUMlswGejTp0Oy35MeOkTQz
         6PSWknJi/hzR1G7iRjzVSAic0ufwflAYgWmMGN+1EQNxBnZ7NY0r/sQqIEM82muQeV
         w/ZIlGrcE+JGj3nt3CagrRsNRFfX1cmxWFQ6j5pw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200504091523eucas1p10fee346c7a71491263197f9abb03e307~LyHrP45qd1298212982eucas1p1b;
        Mon,  4 May 2020 09:15:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 3E.F1.60698.B2DDFAE5; Mon,  4
        May 2020 10:15:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200504091523eucas1p1856860f6f7f9ddcd6b8bec87fdbc0447~LyHq9nAor1298612986eucas1p1J;
        Mon,  4 May 2020 09:15:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200504091523eusmtrp226626b15904afb416921dadd37541b70~LyHq9FStq2111921119eusmtrp2D;
        Mon,  4 May 2020 09:15:23 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-fc-5eafdd2b730b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C5.07.07950.B2DDFAE5; Mon,  4
        May 2020 10:15:23 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200504091522eusmtip1da9209630cfaf00707561ac100869ea6~LyHqr0WsY0557905579eusmtip1c;
        Mon,  4 May 2020 09:15:22 +0000 (GMT)
Subject: Re: linux-next: error when fetching the clk-samsung tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <1ab13824-6fcc-e2fa-c2d8-3595bc070f03@samsung.com>
Date:   Mon, 4 May 2020 11:15:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504084835.5814c682@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduzneV3tu+vjDJo2C1tc3jWHzeLgwjZG
        i617r7I7MHs03rjB5vF5k1wAUxSXTUpqTmZZapG+XQJXxvLN+5gKGlgqphw7xdbAOJ+5i5GT
        Q0LAROLcigb2LkYuDiGBFYwS77edYIJwvjBKHF7SDOV8ZpRo6ngB1/L/8TtmiMRyRomve2az
        Qjgfgfq/bGfsYuTgEBZwlPi6SATEFBHQljjwWwCkl1mgROLT6t2sIDabgKFE79E+RhCbV8BO
        YvPf42BxFgEViZ93jrKAtIoKxEpMvxYCUSIocXLmExYQm1PAXGL5yRnMECMNJI4smsMKYYtL
        3HoynwnClpfY/nYO2JkSAv/ZJGa03GeEuN9F4tal6VC/CEu8Or6FHcKWkfi/cz4TREMzo0TP
        7tvsEM4ERon7xxdAdVtL3Dn3iw3CdpTYsmgDK8ilEgJ8EjfeCkJs5pOYtA1kAUiYV6KjTQii
        WkXi96rpTBC2lET3k/8sExiVZiH5bRaSf2Yh+WcWkn8WMLKsYhRPLS3OTU8tNs5LLdcrTswt
        Ls1L10vOz93ECEwfp/8d/7qDcd+fpEOMAhyMSjy8Dz6vixNiTSwrrsw9xCjBwawkwrujZX2c
        EG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tSs1NTC1KLYLJMHJxSDYx5ET+sXp8I
        13xVd2LzQds5fmEO/l/VP1+5emrxv6NSXU4sup86dh68bG+j4Mm4aGO+UsQ1cyl+y8sWmpfz
        vn/nz+Nlc0v8rfrFba/u8RbR9NY3bZ9PnayPl5DoN53+xvaA7C4Wjm3ZKZnl4lGSAdl7wraI
        ibZbsPy6fEpFTK/3yCPxSdysRUosxRmJhlrMRcWJALiHLZ4bAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xu7rad9fHGcyZxGxxedccNouDC9sY
        LbbuvcruwOzReOMGm8fnTXIBTFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkam
        Svp2NimpOZllqUX6dgl6Gcs372MqaGCpmHLsFFsD43zmLkZODgkBE4n/j98B2VwcQgJLGSW+
        vDrG1MXIAZSQkpjfogRRIyzx51oXG0TNe0aJid2nmEFqhAUcJb4uEgExRQS0JQ78FgApZxYo
        kZg2YycrRHkXo8Ten+tYQRJsAoYSvUf7GEFsXgE7ic1/j4PFWQRUJH7eOcoCMkdUIFai5aIm
        RImgxMmZT1hAbE4Bc4nlJ2cwQ8zXk9hx/RcrhC0ucevJfCYIW15i+9s5zBMYhWYhaZ+FpGUW
        kpZZSFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIyUbcd+btnB2PUu+BCjAAejEg/v
        g8/r4oRYE8uKK3MPMUpwMCuJ8O5oWR8nxJuSWFmVWpQfX1Sak1p8iNEU6LeJzFKiyfnAKM4r
        iTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cBY6DNzol5w9eOgk14S
        QpN+a1qLs4goZq893dt1wiBzlpug1AaNdTFv/N41rIqNmmT9+0jGjIr7dqv+arY7OHtkv5Az
        Pf3oedsUhaPTK/n8wircOCf+50xelHH6BevcEpXDB112+b8+LfyRM+FNDG9zz+b+W3sEkyex
        1yo2ikybyWh056TrOgMlluKMREMt5qLiRADbpmjmqgIAAA==
X-CMS-MailID: 20200504091523eucas1p1856860f6f7f9ddcd6b8bec87fdbc0447
X-Msg-Generator: CA
X-RootMTR: 20200503224848eucas1p2446520ac65d79c4a59d5665bf915f7e6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200503224848eucas1p2446520ac65d79c4a59d5665bf915f7e6
References: <CGME20200503224848eucas1p2446520ac65d79c4a59d5665bf915f7e6@eucas1p2.samsung.com>
        <20200504084835.5814c682@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 04.05.2020 00:48, Stephen Rothwell wrote:
> Fetching the clk-samsung tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git#for-next)
> produces the following error:
> 
> fatal: couldn't find remote ref refs/heads/for-next
> 
> I am using the last version I fetched (which is empty relative to Linus'
> tree).

Apologies for an oversight on my side, it should be fixed now (there will 
be still no new patches comparing to Linus' tree).

--
Regards, 
Sylwester
