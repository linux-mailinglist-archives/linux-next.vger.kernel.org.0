Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04D827ACE0
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 13:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgI1LeT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 07:34:19 -0400
Received: from verein.lst.de ([213.95.11.211]:35259 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbgI1LeT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 07:34:19 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5178268AFE; Mon, 28 Sep 2020 13:34:16 +0200 (CEST)
Date:   Mon, 28 Sep 2020 13:34:15 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200928113415.GA555@lst.de>
References: <20200928135405.73404219@canb.auug.org.au> <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 12:15:56PM +0200, Paul Cercueil wrote:
> Hi Christoph,
>
> Le lun. 28 sept. 2020 à 8:04, Christoph Hellwig <hch@lst.de> a écrit :
>> On Mon, Sep 28, 2020 at 01:54:05PM +1000, Stephen Rothwell wrote:
>>>  Hi all,
>>>
>>>  After merging the drm tree, today's linux-next build (x86_64 
>>> allmodconfig)
>>>  failed like this:
>>
>> The driver needs to switch do dma_alloc_noncoherent + dma_sync_single*
>> like the other drivers converted in the dma tree.  Paul, let me know if
>> you have any questions.
>
> I don't dma_alloc* anything, DRM core does. I use the 
> DMA_ATTR_NON_CONSISTENT attr with dma_mmap_attrs(). Is there a replacement 
> for that?

dma_mmap_attrs can only be used on allocations from dma_mmap_attrs with
the same attrs.  As there is no allocation using DMA_ATTR_NON_CONSISTENT
in the drm core, something looks very fishy here.

Where does the allocation you try to mmap come from?  All the allocations
in drivers/gpu/drm/drm_gem_cma_helper.c seems to use dma_alloc_wc (aka
dma_allloc_attrs with the DMA_ATTR_WRITE_COMBINE flag).
