Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0C227EFAA
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 18:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgI3QwQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 12:52:16 -0400
Received: from verein.lst.de ([213.95.11.211]:45437 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgI3QwP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 12:52:15 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C38086736F; Wed, 30 Sep 2020 18:52:12 +0200 (CEST)
Date:   Wed, 30 Sep 2020 18:52:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200930165212.GA8833@lst.de>
References: <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net> <20200928121002.GA3219@lst.de> <GWEDHQ.HNERRUK8XXOM2@crapouillou.net> <20200930090252.GA9357@lst.de> <DB4HHQ.1KMN8GNWYJLC1@crapouillou.net> <20200930161124.GA6859@lst.de> <IXCHHQ.XHZEBJ42HOEJ1@crapouillou.net> <20200930164023.GA8645@lst.de> <27DHHQ.SLESFBOY1GXP1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27DHHQ.SLESFBOY1GXP1@crapouillou.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 30, 2020 at 06:45:02PM +0200, Paul Cercueil wrote:
>> We don't have such a thing in the Linux API at all.
>
> dma_pgprot(dev, vma->vm_page_prot, DMA_ATTR_NON_CONSISTENT);
>
> That was giving me non-coherent cached memory, and now I don't have an 
> alternative.

Looking at Linux 5.9-rc dma_pgprot is defined as:

pgprot_t dma_pgprot(struct device *dev, pgprot_t prot, unsigned long attrs)
{
	if (force_dma_unencrypted(dev))
		prot = pgprot_decrypted(prot);
	if (dev_is_dma_coherent(dev) ||
	    (IS_ENABLED(CONFIG_DMA_NONCOHERENT_CACHE_SYNC) &&
             (attrs & DMA_ATTR_NON_CONSISTENT)))
		return prot;
#ifdef CONFIG_ARCH_HAS_DMA_WRITE_COMBINE
	if (attrs & DMA_ATTR_WRITE_COMBINE)
		return pgprot_writecombine(prot);
#endif
	return pgprot_dmacoherent(prot);
}

so it doesn't change vma->vm_page_prot at all.

The only place that uses _CACHE_CACHABLE_NONCOHERENT is the MIPS specific
kmap_noncoherent which ha sa single caller that doesn't leak anywhere
into driver code.
