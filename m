Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC31C9CBBE
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 10:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbfHZIiv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 04:38:51 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3975 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730393AbfHZIiu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 04:38:50 -0400
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.55])
        by Forcepoint Email with ESMTP id BB05F5E0D600CEDCAF88;
        Mon, 26 Aug 2019 16:38:48 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 26 Aug 2019 16:38:48 +0800
Received: from architecture4 (10.140.130.215) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 26 Aug 2019 16:38:48 +0800
Date:   Mon, 26 Aug 2019 16:38:01 +0800
From:   Gao Xiang <gaoxiang25@huawei.com>
To:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Gao Xiang <hsiangkao@aol.com>
Subject: Re: linux-next: build warning after merge of the staging tree
Message-ID: <20190826083733.GA129185@architecture4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190826063024.GA1217@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.140.130.215]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Greg,

On Mon, Aug 26, 2019 at 08:30:24AM +0200, Greg KH wrote:
> On Mon, Aug 26, 2019 at 04:24:32PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the staging tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > In file included from include/trace/events/erofs.h:8,
> >                  from <command-line>:
> > include/trace/events/erofs.h:28:37: warning: 'struct dentry' declared inside parameter list will not be visible outside of this definition or declaration
> >   TP_PROTO(struct inode *dir, struct dentry *dentry, unsigned int flags),
> >                                      ^~~~~~
> > include/linux/tracepoint.h:233:34: note: in definition of macro '__DECLARE_TRACE'
> >   static inline void trace_##name(proto)    \
> >                                   ^~~~~
> > include/linux/tracepoint.h:396:24: note: in expansion of macro 'PARAMS'
> >   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
> >                         ^~~~~~
> > include/linux/tracepoint.h:532:2: note: in expansion of macro 'DECLARE_TRACE'
> >   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
> >   ^~~~~~~~~~~~~
> > include/linux/tracepoint.h:532:22: note: in expansion of macro 'PARAMS'
> >   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
> >                       ^~~~~~
> > include/trace/events/erofs.h:26:1: note: in expansion of macro 'TRACE_EVENT'
> >  TRACE_EVENT(erofs_lookup,
> >  ^~~~~~~~~~~
> > include/trace/events/erofs.h:28:2: note: in expansion of macro 'TP_PROTO'
> >   TP_PROTO(struct inode *dir, struct dentry *dentry, unsigned int flags),
> >   ^~~~~~~~
> > 
> > and moany more like this ...
> > 
> > Introduced by commit
> > 
> >   47e4937a4a7c ("erofs: move erofs out of staging")
> > 
> > (or, at least, exposed by it).  It needs, at least, a "struct dentry;"
> > added to the file.
> 
> Odd, why has this never been seen before when the same files were in
> drivers/staging/ and why 0-day isn't reporting this?

I Think it is weird since it is never failed in staging and kbuild-all 0-day ci
(my tree and you tree)....

> 
> Gao, can you send me a patch for this?

Got it, I will look into that...

Thanks,
Gao Xiang

> 
> thanks,
> 
> greg k-h
