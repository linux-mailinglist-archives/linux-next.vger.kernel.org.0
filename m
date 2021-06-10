Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373163A3766
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 00:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhFJWwY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 18:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhFJWwX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Jun 2021 18:52:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE81A613E7;
        Thu, 10 Jun 2021 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623365427;
        bh=VPZqJQrM3RlOzyEINLx/dD45UqFCvIgG2sHH9I+7DRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EKzIXqBEhgWG41vWCLck3PvwdryfUhHE/aFO/CCalFt4kinzivK4L1SOk83+nB6yF
         A5EE2/7qUIMJOmM5sxjJk3ur3CHi+mnJJ/HnAOBn66UDS0Dp8s5HIAc0qdsB7Pt6ny
         NUyZJx9x+7fpRttrD/eS+bd29NEsRPr2FhF9aoUc2SDA2Y/cHA7hUpBeQPlT4BPZED
         ssTeiRqdEriH35zNyLKAiRwOa4G+Y84GFZ76ujVsAr7naJJQqIidEsMhpzdltdqeWN
         8+9MIP2pyAn6FJBXzvHdsLQsnzwErWYJysxaYisZbLhUrIaOmEmTwuKUnOdwQ61Bck
         Or1L5fcPHNIFA==
Date:   Thu, 10 Jun 2021 15:50:26 -0700
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Dave Chinner <david@fromorbit.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dave Chinner <dchinner@redhat.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Allison Henderson <allison.henderson@oracle.com>,
        Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        noreply@ellerman.id.au
Subject: Re: [PATCH] xfs: Fix 64-bit division on 32-bit in
 xlog_state_switch_iclogs()
Message-ID: <20210610225026.GD2945738@locust>
References: <20210610110001.2805317-1-geert@linux-m68k.org>
 <20210610220155.GQ664593@dread.disaster.area>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610220155.GQ664593@dread.disaster.area>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 11, 2021 at 08:01:55AM +1000, Dave Chinner wrote:
> On Thu, Jun 10, 2021 at 01:00:01PM +0200, Geert Uytterhoeven wrote:
> > On 32-bit (e.g. m68k):
> > 
> >     ERROR: modpost: "__udivdi3" [fs/xfs/xfs.ko] undefined!
> > 
> > Fix this by using a uint32_t intermediate, like before.
> > 
> > Reported-by: noreply@ellerman.id.au
> > Fixes: 7660a5b48fbef958 ("xfs: log stripe roundoff is a property of the log")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Compile-tested only.
> > ---
> >  fs/xfs/xfs_log.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> <sigh>
> 
> 64 bit division on 32 bit platforms is still a problem in this day
> and age?
> 
> Reviewed-by: Dave Chinner <dchinner@redhat.com>
> 
> Maybe we should just put "requires 64 bit kernel" on XFS these days...

But then how will I recover my 100TB XFS using my TV?  It only has so
much framebuffer that I can abuse for swap memory...  >:O

Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D

> 
> -Dave.
> -- 
> Dave Chinner
> david@fromorbit.com
