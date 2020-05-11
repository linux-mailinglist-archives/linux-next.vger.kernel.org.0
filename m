Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403C81CDEB5
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 17:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgEKPRx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 11:17:53 -0400
Received: from verein.lst.de ([213.95.11.211]:36656 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgEKPRx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 May 2020 11:17:53 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id EB87768BFE; Mon, 11 May 2020 17:17:49 +0200 (CEST)
Date:   Mon, 11 May 2020 17:17:49 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bart Van Assche <bvanassche@acm.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20200511151749.GA29295@lst.de>
References: <20200511142756.1b7ef706@canb.auug.org.au> <74a0ddc6-8637-c821-7128-4431261b0c12@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74a0ddc6-8637-c821-7128-4431261b0c12@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 11, 2020 at 09:06:41AM -0600, Jens Axboe wrote:
> On 5/10/20 10:27 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the block tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/block/aoe/aoeblk.c: In function 'aoeblk_gdalloc':
> > drivers/block/aoe/aoeblk.c:410:21: error: 'struct backing_dev_info' has no member named 'name'
> >   410 |  q->backing_dev_info->name = "aoe";
> >       |                     ^~
> > 
> > Caused by commit
> > 
> >   1cd925d58385 ("bdi: remove the name field in struct backing_dev_info")
> 
> Gah, thanks Stephen. This series is looking less and less impressive,
> fallout for both 5.7 and 5.8, in terms of build testing (none).

And the sad part is that it has been sitting out there exposed to the
buildbot for weeks.  Sigh.
