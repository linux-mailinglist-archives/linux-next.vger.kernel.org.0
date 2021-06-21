Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076F53AF815
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 23:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbhFUVyt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 17:54:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232230AbhFUVyO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Jun 2021 17:54:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F1B4611BD;
        Mon, 21 Jun 2021 21:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624312320;
        bh=ds7UMwrOUNRvkNN7isE4QPwQ9nMNx6ibI6CSTClrAo4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eTgk1e1JPpBNmU3pXlISS52zzuFJyrsKZ2z7FTRJTYyIcttBDmY0zxsODWCUkTZig
         /VgHyE7t+Bdb+VG5ajnWBuLAv92xtMZlAYnkp4cqUCiPPRrYksRXt2OBLhpfVFdAxY
         WzzgWtOPzMoJKrzcmRCvgqu21mmKHHm+bSeJBHXkNSQNFnQpRE9fKsMpD/6o/XHxTO
         O+2FIHSG3fZm7M4FE5lxnRcYi3KrstrsI9be0YcN67+ohrtu+WJTwAnqh8XMQFX2Lv
         I/VgxU+UM7DhCCglcRfak7uBCnLD2abHtqipdx4LeMzQj1GI+0sjp5KZJ8Ic6nIWE1
         NRdQTGm6D23jA==
Date:   Mon, 21 Jun 2021 14:51:59 -0700
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Allison Henderson <allison.henderson@oracle.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the xfs tree
Message-ID: <20210621215159.GE3619569@locust>
References: <20210621082656.59cae0d8@canb.auug.org.au>
 <20210621171208.GD3619569@locust>
 <20210622072719.1d312bf0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622072719.1d312bf0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 22, 2021 at 07:27:19AM +1000, Stephen Rothwell wrote:
> Hi Darrick,
> 
> On Mon, 21 Jun 2021 10:12:08 -0700 "Darrick J. Wong" <djwong@kernel.org> wrote:
> >
> > On Mon, Jun 21, 2021 at 08:26:56AM +1000, Stephen Rothwell wrote:
> > > 
> > > Commits
> > > 
> > >   742140d2a486 ("xfs: xfs_log_force_lsn isn't passed a LSN")
> > >   e30fbb337045 ("xfs: Fix CIL throttle hang when CIL space used going backwards")
> > >   feb616896031 ("xfs: journal IO cache flush reductions")
> > >   6a5c6f5ef0a4 ("xfs: remove need_start_rec parameter from xlog_write()")
> > >   d7693a7f4ef9 ("xfs: CIL checkpoint flushes caches unconditionally")
> > >   e45cc747a6fd ("xfs: async blkdev cache flush")
> > >   9b845604a4d5 ("xfs: remove xfs_blkdev_issue_flush")
> > >   25f25648e57c ("xfs: separate CIL commit record IO")
> > >   a6a65fef5ef8 ("xfs: log stripe roundoff is a property of the log")
> > > 
> > > are missing a Signed-off-by from their committers.  
> > 
> > <sigh> Ok, I'll rebase the branch again to fix the paperwork errors.
> > 
> > For future reference, if I want to continue accepting pull requests from
> > other XFS developers, what are the applicable standards for adding the
> > tree maintainer's (aka my) S-o-B tags?  I can't add my own S-o-Bs after
> > the fact without rewriting the branch history and changing the commit
> > ids (which would lose the signed tag), so I guess that means the person
> > sending the pull request has to add my S-o-B for me?  Which also doesn't
> > make sense?
> 
> If you want to take a pull request, then use "git pull" (or "git fetch"
> followed by "git merge") which will create a merge commit committed by
> you.  The above commits were applied to your tree by you as patches (or
> rebased) and so need your sign off.  The commits in a branch that you
> just merge into your tree only need the SOBs for their author(s) and
> committer.

I was about to point out all the complaints about when I actually /did/
merge Dave's branch, but I realized that those complaints were actually
because he wasn't consistently signing patches with the same email
address.

Um... do you know if there's a commit hook or something that all of us
can add to spot-check all this stuff?  I would really like to spend my
worry beans on about algorithms and code design, not worrying about how
many signature rules can be bent before LT starts refusing pull requests.

> If you then rebase your tree (with merge commits in it), you need to
> use "git rebase -r" to preserve the merge commits.  alternatively, you
> can rebase the commits you applied as patches and then redo the
> pulls/merges manually.  You generally should not rebase other's work.
> 
> Of course, you should not really rebase a published tree at all (unless
> vitally necessary) - see Documentation/maintainer/rebasing-and-merging.rst

Heh.  That ship has sailed, unfortunately.  If we /really/ care about
maintainers adding their own SoB tags to non-merge commits then I /have/
to rebase.

--D

> 
> -- 
> Cheers,
> Stephen Rothwell


