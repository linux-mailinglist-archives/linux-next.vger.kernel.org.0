Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB2327E474
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 11:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbgI3JC4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 05:02:56 -0400
Received: from verein.lst.de ([213.95.11.211]:43862 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgI3JC4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 05:02:56 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9EFDB67357; Wed, 30 Sep 2020 11:02:52 +0200 (CEST)
Date:   Wed, 30 Sep 2020 11:02:52 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200930090252.GA9357@lst.de>
References: <20200928135405.73404219@canb.auug.org.au> <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net> <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net> <20200928121002.GA3219@lst.de> <GWEDHQ.HNERRUK8XXOM2@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GWEDHQ.HNERRUK8XXOM2@crapouillou.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 03:31:28PM +0200, Paul Cercueil wrote:
> It's allocated with dma_alloc_wc, but then it's only accessed as 
> non-coherent.
>
> Anyway, for the time being I guess you could revert 37054fc81443. But I 
> have patches on top of it in drm-misc-next so it's going to be a mess.
>
> If we have time I can come up with a custom dumb_create() fonction, to make 
> sure that the GEM buffers are allocated with dma_alloc_noncoherent(). Is 
> there a dma_mmap_noncoherent() too?

Please use the lower-level dma_alloc_pages and then just insert the
pages directly using remap_pfn_range.  Although it might make sense
to eventually create a wrapper around remap_pfn_range for all the
vma sizing sanity checks.


>
> -Paul
>
---end quoted text---
