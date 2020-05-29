Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD4D1E805C
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 16:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgE2Ogf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 10:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbgE2Oge (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 10:36:34 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF25C03E969;
        Fri, 29 May 2020 07:36:34 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat Linux))
        id 1jeg7J-00HaRL-1s; Fri, 29 May 2020 14:36:13 +0000
Date:   Fri, 29 May 2020 15:36:13 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Gao Xiang <hsiangkao@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Gao Xiang <xiang@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chengguang Xu <cgxu519@mykernel.net>,
        Chao Yu <yuchao0@huawei.com>
Subject: Re: linux-next: manual merge of the vfs tree with the erofs tree
Message-ID: <20200529143613.GE23230@ZenIV.linux.org.uk>
References: <20200529114501.3e2ecc14@canb.auug.org.au>
 <20200529015111.GA23230@ZenIV.linux.org.uk>
 <20200529034007.GA12648@xiangao.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529034007.GA12648@xiangao.remote.csb>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 29, 2020 at 11:40:07AM +0800, Gao Xiang wrote:

> I'm fine with that, although I think it's mainly with vfs changes
> so could be better though with vfs tree. I will add this patch
> tomorrow anyway... Thanks for reminder!

FWIW, my reasoning here is
	* erofs tree exists and
	* the patch is erofs-specific, affects nothing outside and
has no dependencies with anything currently done in VFS or in other
filesystems and
	* it does have (trivial) conflicts with the stuff in
erofs tree

So putting it into erofs tree would seem to be an obvious approach -
minimizes the amount of cross-tree dependencies and headache for
everyone involved...

I'm dropping it from #work.misc and #for-next now.
