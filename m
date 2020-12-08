Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320CB2D318A
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 18:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730851AbgLHR4I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 12:56:08 -0500
Received: from netrider.rowland.org ([192.131.102.5]:56057 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730740AbgLHR4H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 12:56:07 -0500
Received: (qmail 1305181 invoked by uid 1000); 8 Dec 2020 12:55:26 -0500
Date:   Tue, 8 Dec 2020 12:55:26 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Can Guo <cang@codeaurora.org>, Christoph Hellwig <hch@lst.de>,
        Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20201208175526.GH1298255@rowland.harvard.edu>
References: <20201208202853.186ae136@canb.auug.org.au>
 <20201208203859.686f83eb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208203859.686f83eb@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 08, 2020 at 08:38:59PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 8 Dec 2020 20:28:53 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> > 
> > After merging the scsi-mkp tree, today's linux-next build (sparc64
> > defconfig) failed like this:
> > 
> > drivers/mtd/nand/raw/intel-nand-controller.c:17:10: fatal error: linux/mtd/nand_ecc.h: No such file or directory
> >    17 | #include <linux/mtd/nand_ecc.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~
> 
> Clearly, it did not fail like that :-)
> 
> block/blk-core.c: In function 'blk_queue_enter':
> block/blk-core.c:443:18: error: 'struct request_queue' has no member named 'rpm_status'; did you mean 'stats'?
>     if ((pm && q->rpm_status != RPM_SUSPENDED) ||
>                   ^~~~~~~~~~
>                   stats
> 
> > Caused by commit
> > 
> >   81a395cdc176 ("scsi: block: Do not accept any requests while suspended")
> > 
> > # CONFIG_PM is not set
> > 
> > I have applied the following patch:
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 8 Dec 2020 20:12:33 +1100
> > Subject: [PATCH] scsi: block: fix for "scsi: block: Do not accept any requests while suspended"
> > 
> > Fixes: 81a395cdc176 ("scsi: block: Do not accept any requests while suspended")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  block/blk-core.c | 18 ++++++++++++++----
> >  1 file changed, 14 insertions(+), 4 deletions(-)
> > 
> > diff --git a/block/blk-core.c b/block/blk-core.c
> > index a71a5c9429d6..9c9aec1382be 100644
> > --- a/block/blk-core.c
> > +++ b/block/blk-core.c
> > @@ -421,6 +421,18 @@ void blk_cleanup_queue(struct request_queue *q)
> >  }
> >  EXPORT_SYMBOL(blk_cleanup_queue);
> >  
> > +#ifdef CONFIG_PM
> > +static bool rq_suspended(struct request_queue *q)
> > +{
> > +	return q->rpm_status == RPM_SUSPENDED;
> > +}
> > +#else
> > +static bool rq_suspended(struct request_queue *q)
> > +{
> > +	return false;
> > +}
> > +#endif
> > +
> >  /**
> >   * blk_queue_enter() - try to increase q->q_usage_counter
> >   * @q: request queue pointer
> > @@ -440,12 +452,10 @@ int blk_queue_enter(struct request_queue *q, blk_mq_req_flags_t flags)
> >  			 * responsible for ensuring that that counter is
> >  			 * globally visible before the queue is unfrozen.
> >  			 */
> > -			if ((pm && q->rpm_status != RPM_SUSPENDED) ||
> > -			    !blk_queue_pm_only(q)) {
> > +			if ((pm && !rq_suspended(q)) || !blk_queue_pm_only(q))
> >  				success = true;
> > -			} else {
> > +			else
> >  				percpu_ref_put(&q->q_usage_counter);
> > -			}
> >  		}
> >  		rcu_read_unlock();

Yes, that certainly is the proper fix.  It's all to easy to miss these 
issues that depend on your kernel configuration.

Bart, can you fold it into a new version of the patch?

Alan Stern
