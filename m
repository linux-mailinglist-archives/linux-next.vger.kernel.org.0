Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A431D39D285
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 03:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhFGBSH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Jun 2021 21:18:07 -0400
Received: from mail110.syd.optusnet.com.au ([211.29.132.97]:37736 "EHLO
        mail110.syd.optusnet.com.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229894AbhFGBSH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Jun 2021 21:18:07 -0400
Received: from dread.disaster.area (pa49-179-138-183.pa.nsw.optusnet.com.au [49.179.138.183])
        by mail110.syd.optusnet.com.au (Postfix) with ESMTPS id 800B3109E49;
        Mon,  7 Jun 2021 11:16:00 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
        (envelope-from <david@fromorbit.com>)
        id 1lq3rz-009pM0-82; Mon, 07 Jun 2021 11:15:59 +1000
Date:   Mon, 7 Jun 2021 11:15:59 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Darrick J. Wong" <djwong@kernel.org>, linux-xfs@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the xfs tree
Message-ID: <20210607011559.GA664593@dread.disaster.area>
References: <20210607104819.2c032c75@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607104819.2c032c75@canb.auug.org.au>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=F8MpiZpN c=1 sm=1 tr=0
        a=MnllW2CieawZLw/OcHE/Ng==:117 a=MnllW2CieawZLw/OcHE/Ng==:17
        a=kj9zAlcOel0A:10 a=r6YtysWOX24A:10 a=7-415B0cAAAA:8
        a=NWAoBSUOnvqdeyLw_2IA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 07, 2021 at 10:48:19AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the xfs tree, today's linux-next build (powerpc_ppc64
> defconfig) produced this warning:
> 
> fs/xfs/libxfs/xfs_ialloc.c: In function 'xfs_difree_finobt':
> fs/xfs/libxfs/xfs_ialloc.c:2032:20: warning: unused variable 'agi' [-Wunused-variable]
>  2032 |  struct xfs_agi   *agi = agbp->b_addr;
>       |                    ^~~
> 
> Not sure how this came about, but somehow DEBUG has been turned off
> which exposes this.

I think I replaced all the agi->agi_seqno usages in that function
with pag->pag_agno and so now the agi structure is only accessed via
debug functions. The debug code should now pass perag structures
rather than raw AGI structures to check the free inode counts....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
