Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B9C2D27B3
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 10:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgLHJbd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 04:31:33 -0500
Received: from verein.lst.de ([213.95.11.211]:45481 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728874AbgLHJbW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 04:31:22 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9A3F86736F; Tue,  8 Dec 2020 10:30:39 +0100 (CET)
Date:   Tue, 8 Dec 2020 10:30:39 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bart Van Assche <bvanassche@acm.org>,
        Can Guo <cang@codeaurora.org>, Christoph Hellwig <hch@lst.de>,
        Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20201208093039.GA15180@lst.de>
References: <20201208202853.186ae136@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208202853.186ae136@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 08, 2020 at 08:28:53PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi-mkp tree, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> drivers/mtd/nand/raw/intel-nand-controller.c:17:10: fatal error: linux/mtd/nand_ecc.h: No such file or directory
>    17 | #include <linux/mtd/nand_ecc.h>

The error message doesn't match up with your proposed solution.
