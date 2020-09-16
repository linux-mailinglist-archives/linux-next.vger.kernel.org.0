Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9F026BB8C
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 06:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgIPEfb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Sep 2020 00:35:31 -0400
Received: from verein.lst.de ([213.95.11.211]:50622 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgIPEf3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 16 Sep 2020 00:35:29 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9D75768BFE; Wed, 16 Sep 2020 06:35:25 +0200 (CEST)
Date:   Wed, 16 Sep 2020 06:35:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 dma-mapping tree
Message-ID: <20200916043524.GA6412@lst.de>
References: <20200916141130.398aa2a8@canb.auug.org.au> <a76cbfaaeeb14c4ca8b3f6a154fe0fa3@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a76cbfaaeeb14c4ca8b3f6a154fe0fa3@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 16, 2020 at 04:22:03AM +0000, Song Bao Hua (Barry Song) wrote:
> >   c999bd436fe9 ("mm/cma: make number of CMA areas dynamic, remove
> > CONFIG_CMA_AREAS")
> > 
> > from the akpm-current tree.
> 
> I guess this is because Mike's patch was written on top of dma-mapping's next branch.

It wasn't.

> Will it be better to go through Christoph's tree?

I don't think this merge is much of a problem, we'll just need to tell
Linus about it.
