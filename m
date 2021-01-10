Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4DD2F0A71
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 00:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbhAJXgR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 18:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbhAJXgR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Jan 2021 18:36:17 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D86BC061786;
        Sun, 10 Jan 2021 15:35:37 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5F6C337B;
        Sun, 10 Jan 2021 23:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5F6C337B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610321736; bh=hZrMjR9W5abuncY6YploYHeQ/mwBGMzjRxDIGuPozRU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f5H+HXUt6y11QVRkPAopn/5gbwztwaQ5kCRYRXnhh3fq7EAdiedNlgm8K7MHHi76K
         dlsWNovqmDRL6nUV5uzPn74sNPmmTECV6a90fKwNOkkylLdKQXx0q8m+8vnnBKdcTd
         O59p+NDdHhXqF+/tYK60IdiSc4P1+Pt65RANjdIUs/Sm53+cGlbSZMb+aQSDs4g+0z
         SgojpXWqFhTiizUaAWz0+nX6lWoYDNacZAsEXTRgPR5qxW994v0lSZkSkHNg/Ab7EJ
         L/gVs/+5M0OvCFqZ6V4/s8o+FWW2F2KRLCbRQO8jBuRNRoKW8Y9ypC8CGRDaBbUrvs
         WHx+MGxLfn03A==
Date:   Sun, 10 Jan 2021 16:35:34 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
        Chao Yu <chao@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Message-ID: <20210110163534.24481e1e@lwn.net>
In-Reply-To: <20210111073354.6ec0bbb5@canb.auug.org.au>
References: <20210107141158.312835d8@canb.auug.org.au>
        <3f921b3d-e8f2-e010-0f6b-76596e29e997@huawei.com>
        <20210111073354.6ec0bbb5@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 11 Jan 2021 07:33:54 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Thu, 7 Jan 2021 19:28:19 +0800 Chao Yu <yuchao0@huawei.com> wrote:
> >
> > On 2021/1/7 11:11, Stephen Rothwell wrote:  
> > > 
> > > After merging the f2fs tree, today's linux-next build (htmldocs) produced
> > > this warning:
> > > 
> > > Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Inline emphasis start-string without end-string.    
> > 
> > IIUC, should I remove "/*" and "*/" for newly added entry in sysfs-fs-f2fs?  
> 
> Sorry, I don't know.  Cc'ing Jon.

Removing the comment markers would make the warning go away, but won't
lead to a satisfactory rendering in HTML.  If you want that too, make the
table look like the others immediately above it in the same file.

Thanks,

jon
