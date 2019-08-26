Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6906B9CDD5
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 13:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729599AbfHZLNt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 07:13:49 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3100 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727123AbfHZLNt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 07:13:49 -0400
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.56])
        by Forcepoint Email with ESMTP id 02C649544AA7AF56D607;
        Mon, 26 Aug 2019 19:13:47 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 26 Aug 2019 19:13:46 +0800
Received: from architecture4 (10.140.130.215) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 26 Aug 2019 19:13:46 +0800
Date:   Mon, 26 Aug 2019 19:13:02 +0800
From:   Gao Xiang <gaoxiang25@huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Gao Xiang <hsiangkao@aol.com>, Chao Yu <yuchao0@huawei.com>
Subject: Re: linux-next: build warning after merge of the staging tree
Message-ID: <20190826111302.GA106991@architecture4>
References: <20190826063024.GA1217@kroah.com>
 <20190826083733.GA129185@architecture4>
 <20190826085408.GB129185@architecture4>
 <20190826094341.GC129185@architecture4>
 <20190826095328.GA120601@architecture4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190826095328.GA120601@architecture4>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.140.130.215]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 26, 2019 at 05:53:28PM +0800, Gao Xiang wrote:

[]

> The attempt above compiles successfully as well... And I have tried
> the following commands (Just in case...) and the result turns out
> without any difference...
> 
>  $ make ARCH=x86_64 allmodconfig
>  $ make ARCH=x86_64 -j16
> 
> and I'm so confused now... Hope to get your hints...

I think I got the warning now... Sorry, I thought it is a compile error.
I am looking into that, sorry about that...

Thanks,
Gao Xiang

> 
> Thanks,
> Gao Xiang
> 
> > 
> > Out of curiosity, are there some merge conflicts raised? Or could you give
> > me some hints (code and .config) to reproduce that? since I don't find any
> > potential issue in include/trace/events/erofs.h and fs/erofs/*... I have no
> > idea what happened and how to do next... Thank you very much!
> > 
> > Thanks,
> > Gao Xiang
> > 
> > > 
> > > Thanks,
> > > Gao Xiang
> > > 
> > > > > > 
> > > > > > Introduced by commit
> > > > > > 
> > > > > >   47e4937a4a7c ("erofs: move erofs out of staging")
> > > > > > 
> > > > > > (or, at least, exposed by it).  It needs, at least, a "struct dentry;"
> > > > > > added to the file.
> > > > > 
> > > > > Odd, why has this never been seen before when the same files were in
> > > > > drivers/staging/ and why 0-day isn't reporting this?
> > > > 
> > > > I Think it is weird since it is never failed in staging and kbuild-all 0-day ci
> > > > (my tree and you tree)....
> > > > 
> > > > > 
> > > > > Gao, can you send me a patch for this?
> > > > 
> > > > Got it, I will look into that...
> > > > 
> > > > Thanks,
> > > > Gao Xiang
> > > > 
> > > > > 
> > > > > thanks,
> > > > > 
> > 
