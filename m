Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6067D3AF81C
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 23:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbhFUV4k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 17:56:40 -0400
Received: from mail109.syd.optusnet.com.au ([211.29.132.80]:57062 "EHLO
        mail109.syd.optusnet.com.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231892AbhFUV4j (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Jun 2021 17:56:39 -0400
Received: from dread.disaster.area (pa49-179-138-183.pa.nsw.optusnet.com.au [49.179.138.183])
        by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id 7F0F769A25;
        Tue, 22 Jun 2021 07:54:21 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
        (envelope-from <david@fromorbit.com>)
        id 1lvRs4-00FT5X-0x; Tue, 22 Jun 2021 07:54:20 +1000
Date:   Tue, 22 Jun 2021 07:54:20 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     "Darrick J. Wong" <djwong@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-xfs@vger.kernel.org,
        Allison Henderson <allison.henderson@oracle.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the xfs tree
Message-ID: <20210621215420.GW664593@dread.disaster.area>
References: <20210621082656.59cae0d8@canb.auug.org.au>
 <20210621171208.GD3619569@locust>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621171208.GD3619569@locust>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=F8MpiZpN c=1 sm=1 tr=0
        a=MnllW2CieawZLw/OcHE/Ng==:117 a=MnllW2CieawZLw/OcHE/Ng==:17
        a=kj9zAlcOel0A:10 a=r6YtysWOX24A:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8
        a=7-415B0cAAAA:8 a=g2HnxoYCFMbJFGFYHRMA:9 a=CjuIK1q_8ugA:10
        a=DiKeHqHhRZ4A:10 a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 21, 2021 at 10:12:08AM -0700, Darrick J. Wong wrote:
> On Mon, Jun 21, 2021 at 08:26:56AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commits
> > 
> >   742140d2a486 ("xfs: xfs_log_force_lsn isn't passed a LSN")
> >   e30fbb337045 ("xfs: Fix CIL throttle hang when CIL space used going backwards")
> >   feb616896031 ("xfs: journal IO cache flush reductions")
> >   6a5c6f5ef0a4 ("xfs: remove need_start_rec parameter from xlog_write()")
> >   d7693a7f4ef9 ("xfs: CIL checkpoint flushes caches unconditionally")
> >   e45cc747a6fd ("xfs: async blkdev cache flush")
> >   9b845604a4d5 ("xfs: remove xfs_blkdev_issue_flush")
> >   25f25648e57c ("xfs: separate CIL commit record IO")
> >   a6a65fef5ef8 ("xfs: log stripe roundoff is a property of the log")
> > 
> > are missing a Signed-off-by from their committers.
> 
> <sigh> Ok, I'll rebase the branch again to fix the paperwork errors.
> 
> For future reference, if I want to continue accepting pull requests from
> other XFS developers, what are the applicable standards for adding the
> tree maintainer's (aka my) S-o-B tags?  I can't add my own S-o-Bs after
> the fact without rewriting the branch history and changing the commit
> ids (which would lose the signed tag), so I guess that means the person
> sending the pull request has to add my S-o-B for me?  Which also doesn't
> make sense?

None of those things. If there's a problem with a branch, you drop
the entire branch and ask the submitter to reformulate the branch
with a new tag and send a new pull request.

So I think the problem here is that you did, in fact, rewrite these
commits. e.g the commit I have in front of me:

https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/commit/?h=for-next&id=25f25648e57c793b4b18b010eac18a4e2f2b3050

Shows that it was committed at:

author		Dave Chinner <dchinner@redhat.com>	2021-06-18 08:21:48 -0700
committer	Darrick J. Wong <djwong@kernel.org>	2021-06-18 08:24:23 -0700

But in my original branch used for the pull request:

author		Dave Chinner <dchinner@redhat.com>	2021-06-03 14:57:24 +1000
committer	Dave Chinner <david@fromorbit.com>	2021-06-03 14:57:24 +1000

And that is what the script is complaining about.

AFAICT, based on the lack of a merge commit in the tree, is that you
rebased the commits out of the branch I originally asked you to pull
from. That resulted in them being rewritten in order into your tree
which meant you are now the committer, not me.

IOWs, if you do anything other than a direct merge of a signed tag,
you need to add your own SOB because you are creating new commits
rather than merging stable commit history from another branch.

I was going to ask you to revert the entire merge and then *maybe*
asking you to pull a smaller, tested branch with none of the
problems in it. That would have given you a clean merge and wouldn't
have lost the signed tag or the description text in the tag, but...

Hindsight says "talk about the plan first as it will save everyone a
lot of unnecessary work".

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
