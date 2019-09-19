Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4FC9B7945
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 14:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389302AbfISMYk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 08:24:40 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:41114 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389275AbfISMYk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Sep 2019 08:24:40 -0400
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.57])
        by Forcepoint Email with ESMTP id 66228DBD6BA5B586BD93;
        Thu, 19 Sep 2019 20:24:38 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 19 Sep 2019 20:24:38 +0800
Received: from architecture4 (10.140.130.215) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 19 Sep 2019 20:24:37 +0800
Date:   Thu, 19 Sep 2019 20:23:28 +0800
From:   Gao Xiang <gaoxiang25@huawei.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        <linux-next@vger.kernel.org>, <linux-erofs@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Chao Yu <yuchao0@huawei.com>, Miao Xie <miaoxie@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: erofs -next tree inclusion request
Message-ID: <20190919122328.GA82662@architecture4>
References: <20190919120110.GA48697@architecture4>
 <20190919121739.GG3642@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190919121739.GG3642@sirena.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.140.130.215]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mark,

On Thu, Sep 19, 2019 at 01:17:39PM +0100, Mark Brown wrote:
> On Thu, Sep 19, 2019 at 08:01:10PM +0800, Gao Xiang wrote:
> 
> > Could you kindly help add the erofs -next tree to linux-next?
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev
> 
> > This can test all erofs patches with the latest linux-next tree
> > and make erofs better...
> 
> That seems like a good idea however since we're in the merge window and 
> the only things that should be being added to -next right now are fixes
> I'll hold off on doing this myself.  Stephen will be back on the 30th
> (just after merge window closes), I'm sure he'll be happy to add the
> tree but in case this gets lost in all the mail from the time he's been
> travelling you might want to remind him after that.
> 
> If you have a separate fixes branch I'd be happy to add that right now.

Thanks for the -fixes information and detailed reminder (I didn't notice
that, sorry...)

I will do a -fix only branch later for urgent and trivial fixes.

For -next, it's okay to wait for Stephen of course :) ...

Thanks,
Gao Xiang

