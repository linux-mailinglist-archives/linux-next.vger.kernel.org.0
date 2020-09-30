Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD4327EE9C
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 18:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgI3QL1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 12:11:27 -0400
Received: from verein.lst.de ([213.95.11.211]:45307 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbgI3QL1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 12:11:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C9D8F6736F; Wed, 30 Sep 2020 18:11:24 +0200 (CEST)
Date:   Wed, 30 Sep 2020 18:11:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200930161124.GA6859@lst.de>
References: <20200928135405.73404219@canb.auug.org.au> <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net> <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net> <20200928121002.GA3219@lst.de> <GWEDHQ.HNERRUK8XXOM2@crapouillou.net> <20200930090252.GA9357@lst.de> <DB4HHQ.1KMN8GNWYJLC1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB4HHQ.1KMN8GNWYJLC1@crapouillou.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 30, 2020 at 03:33:13PM +0200, Paul Cercueil wrote:
> One thing missing for remap_pfn_range(), I have no alternative for this:
>
> vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, 
> DMA_ATTR_NON_CONSISTENT);
>
> So I have to do:
>
> vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> pgprot_val(vma->vm_page_prot) &= ~_CACHE_MASK;
> pgprot_val(vma->vm_page_prot) |= _CACHE_CACHABLE_NONCOHERENT;
>
> And that will only compile on MIPS, because these _CACHE_* macros are only 
> defined there.
>
> I would need something like a pgprot_noncoherent(), I think.

dma_alloc_pages gives you cached memory, so you can't just use an
uncached protection for the userspace mmap here.  If you want uncached
memory you need to use dma_alloc_coherent paired with dma_mmap_coherent.
Or dma_alloc_wc for a slightly different flavor of uncached. (both
of the map to dma_alloc_attrs / dma_mmap_attrs eventually).
