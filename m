Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB0227EF74
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 18:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgI3Qk1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 12:40:27 -0400
Received: from verein.lst.de ([213.95.11.211]:45398 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgI3Qk1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Sep 2020 12:40:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id A2F4E6736F; Wed, 30 Sep 2020 18:40:23 +0200 (CEST)
Date:   Wed, 30 Sep 2020 18:40:23 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200930164023.GA8645@lst.de>
References: <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net> <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net> <20200928121002.GA3219@lst.de> <GWEDHQ.HNERRUK8XXOM2@crapouillou.net> <20200930090252.GA9357@lst.de> <DB4HHQ.1KMN8GNWYJLC1@crapouillou.net> <20200930161124.GA6859@lst.de> <IXCHHQ.XHZEBJ42HOEJ1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IXCHHQ.XHZEBJ42HOEJ1@crapouillou.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 30, 2020 at 06:39:18PM +0200, Paul Cercueil wrote:
>> dma_alloc_pages gives you cached memory, so you can't just use an
>> uncached protection for the userspace mmap here.  If you want uncached
>> memory you need to use dma_alloc_coherent paired with dma_mmap_coherent.
>> Or dma_alloc_wc for a slightly different flavor of uncached. (both
>> of the map to dma_alloc_attrs / dma_mmap_attrs eventually).
>
> I don't want uncached memory, I want non-coherent cached memory.

We don't have such a thing in the Linux API at all.
