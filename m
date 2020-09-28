Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DDE27AD83
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 14:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgI1MKH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 08:10:07 -0400
Received: from verein.lst.de ([213.95.11.211]:35339 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbgI1MKH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 08:10:07 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5840C68AFE; Mon, 28 Sep 2020 14:10:03 +0200 (CEST)
Date:   Mon, 28 Sep 2020 14:10:02 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200928121002.GA3219@lst.de>
References: <20200928135405.73404219@canb.auug.org.au> <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net> <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 01:46:55PM +0200, Paul Cercueil wrote:
>> dma_mmap_attrs can only be used on allocations from dma_mmap_attrs with
>> the same attrs.  As there is no allocation using DMA_ATTR_NON_CONSISTENT
>> in the drm core, something looks very fishy here.
>
> Is that a fact? I don't see why you couldn't change the cache settings 
> after allocation. In practice it works just fine.

Accessing the same physical address using different caching attributes
is undefined behavior and fairly dangerous on most architectures, and
thus not supported by the DMA API.
