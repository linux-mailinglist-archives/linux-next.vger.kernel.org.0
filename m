Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394DE2E199B
	for <lists+linux-next@lfdr.de>; Wed, 23 Dec 2020 09:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727712AbgLWIGV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Dec 2020 03:06:21 -0500
Received: from verein.lst.de ([213.95.11.211]:33702 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727314AbgLWIGV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Dec 2020 03:06:21 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id CDCE467373; Wed, 23 Dec 2020 09:05:37 +0100 (CET)
Date:   Wed, 23 Dec 2020 09:05:37 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Hannes Reinecke <hare@suse.de>
Cc:     Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@lst.de>,
        linux-block@vger.kernel.org, dm-devel@redhat.com,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alasdair G Kergon <agk@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: DM's filesystem lookup in dm_get_dev_t() [was: Re: linux-next:
 manual merge of the device-mapper tree with Linus' tree]
Message-ID: <20201223080537.GA4974@lst.de>
References: <20201222095056.7a5ac0a0@canb.auug.org.au> <20201222131528.GA29822@lst.de> <20201222145327.GC12885@redhat.com> <288d1c58-c0e2-9d6f-4816-48c66536fe8b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <288d1c58-c0e2-9d6f-4816-48c66536fe8b@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 22, 2020 at 06:24:09PM +0100, Hannes Reinecke wrote:
> Ok. The problem from my perspective is that device-mapper needs to
> a) ensure that the arbitrary string passed in with the table definition 
> refers to a valid block device
> and
> b) the block device can be opened with O_EXCL, so that device-mapper can 
> then use it.
>
> Originally (ie prior to commit 644bda6f3460) dm_get_device() just converted 
> the string to a 'dev_t' representation, and then the block device itself 
> was checked and opened in dm_get_table_device().
> 'lookup_bdev' was just being used to convert the path if the string was not 
> in the canonical major:minor format, as then it was assumed that it 
> referred to a block device node, and then lookup_bdev kinda makes sense.

Yes, 644bda6f3460 is the cause of all evil, as it uses an API in a place
where it should not be used.  It and the prep patch
(e6e20a7a5f3f49bfee518d5c6849107398d83912) which did the grave mistake
of making name_to_dev_t available outside of the early init code really
need to be reverted.

> However, lookup_bdev() now always recurses into the filesystem, causing 
> multipath to stall in an all-paths-down scenario.

lookup_bdev always did a file system lookup, and always only accepted
a valid name in the file system.

> Alternatively, if Mike says that only major:minor is the valid format for a 
> table definition we can kill that code completely. But clearly _I_ cannot 
> make the call here.

Before 644bda6f3460 the table definitions only accepted a valid name in
the file system.  Which is the proper interface.
