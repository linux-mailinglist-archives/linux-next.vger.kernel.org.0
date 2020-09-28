Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798F527A730
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 08:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgI1GEa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 02:04:30 -0400
Received: from verein.lst.de ([213.95.11.211]:34284 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgI1GEa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 02:04:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2080867373; Mon, 28 Sep 2020 08:04:27 +0200 (CEST)
Date:   Mon, 28 Sep 2020 08:04:27 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christoph Hellwig <hch@lst.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200928060427.GA15041@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928135405.73404219@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 01:54:05PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:

The driver needs to switch do dma_alloc_noncoherent + dma_sync_single*
like the other drivers converted in the dma tree.  Paul, let me know if
you have any questions.
