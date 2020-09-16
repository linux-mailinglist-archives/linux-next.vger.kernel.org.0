Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843B826BB51
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 06:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIPEWK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 16 Sep 2020 00:22:10 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3537 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726129AbgIPEWJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Sep 2020 00:22:09 -0400
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.54])
        by Forcepoint Email with ESMTP id 4D8CAF24A9F1BB8638AF;
        Wed, 16 Sep 2020 12:22:05 +0800 (CST)
Received: from dggemi709-chm.china.huawei.com (10.3.20.108) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 16 Sep 2020 12:22:05 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi709-chm.china.huawei.com (10.3.20.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 16 Sep 2020 12:22:04 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Wed, 16 Sep 2020 12:22:03 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>
CC:     Mike Kravetz <mike.kravetz@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: linux-next: manual merge of the akpm-current tree with the
 dma-mapping tree
Thread-Topic: linux-next: manual merge of the akpm-current tree with the
 dma-mapping tree
Thread-Index: AQHWi9+Ed37LOqh9MkmnmnqpGuk/mqlqqBsw
Date:   Wed, 16 Sep 2020 04:22:03 +0000
Message-ID: <a76cbfaaeeb14c4ca8b3f6a154fe0fa3@hisilicon.com>
References: <20200916141130.398aa2a8@canb.auug.org.au>
In-Reply-To: <20200916141130.398aa2a8@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Wednesday, September 16, 2020 4:12 PM
> To: Andrew Morton <akpm@linux-foundation.org>; Christoph Hellwig
> <hch@lst.de>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>; Linux Next Mailing List
> <linux-next@vger.kernel.org>; Linux Kernel Mailing List
> <linux-kernel@vger.kernel.org>
> Subject: linux-next: manual merge of the akpm-current tree with the
> dma-mapping tree
> 
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/Kconfig
> 
> between commit:
> 
>   b7176c261cdb ("dma-contiguous: provide the ability to reserve per-numa
> CMA")
> 
> from the dma-mapping tree and commit:
> 
>   c999bd436fe9 ("mm/cma: make number of CMA areas dynamic, remove
> CONFIG_CMA_AREAS")
> 
> from the akpm-current tree.

I guess this is because Mike's patch was written on top of dma-mapping's next branch.
Will it be better to go through Christoph's tree?
> 
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> --
> Cheers,
> Stephen Rothwell

Thanks
Barry
