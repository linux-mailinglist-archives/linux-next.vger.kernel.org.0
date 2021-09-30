Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730C441D76D
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 12:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349816AbhI3KQu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 06:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349814AbhI3KQu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 06:16:50 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B50C06176A;
        Thu, 30 Sep 2021 03:15:07 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id D77342DE; Thu, 30 Sep 2021 12:15:04 +0200 (CEST)
Date:   Thu, 30 Sep 2021 12:14:47 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     David Stevens <stevensd@chromium.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the iommu tree
Message-ID: <YVWOF20Sjwd8ILmt@8bytes.org>
References: <20210930083201.16636e24@canb.auug.org.au>
 <CAD=HUj5XF9eNj+1oZZq6CcHfe-ii+M3z97BNPkSY9qW2BHaJbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=HUj5XF9eNj+1oZZq6CcHfe-ii+M3z97BNPkSY9qW2BHaJbQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 30, 2021 at 09:36:32AM +0900, David Stevens wrote:
> On Thu, Sep 30, 2021 at 7:32 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > In commits
> >
> >   06e620345d54 ("iommu/dma: Fix arch_sync_dma for map")
> >   08ae5d4a1ae9 ("iommu/dma: Fix sync_sg with swiotlb")
> 
> It looks like the Fixes messages got rewritten along with the tags in
> the subject lines.

Yeah, I edited the commit message so that the subject lines match the
IOMMU tree format. Apparently I changed the fixes tags by accident too,
will fix this up.

Regards,

	Joerg
