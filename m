Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FE830435B
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 17:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391840AbhAZQF3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 11:05:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:51124 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404545AbhAZQCj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 11:02:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5F312AB92;
        Tue, 26 Jan 2021 16:01:56 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 243FF1F2A70; Tue, 26 Jan 2021 17:01:56 +0100 (CET)
Date:   Tue, 26 Jan 2021 17:01:56 +0100
From:   Jan Kara <jack@suse.cz>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Jan Kara <jack@suse.cz>, Paolo Valente <paolo.valente@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Jia Cheng Hu <jia.jiachenghu@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210126160156.GF10966@quack2.suse.cz>
References: <20210125204032.6b6a604b@canb.auug.org.au>
 <3F91181A-EDF2-4F01-9839-17B40D6EA07F@linaro.org>
 <fb60bac7-f572-d131-d761-f6ce10a05f69@kernel.dk>
 <20210126132946.GC10966@quack2.suse.cz>
 <a2d6399c-ba61-472b-1bf2-aa261d7dbbbe@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <a2d6399c-ba61-472b-1bf2-aa261d7dbbbe@kernel.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue 26-01-21 08:47:55, Jens Axboe wrote:
> On 1/26/21 6:29 AM, Jan Kara wrote:
> > On Mon 25-01-21 11:39:50, Jens Axboe wrote:
> >> On 1/25/21 11:35 AM, Paolo Valente wrote:
> >>>
> >>>
> >>>> Il giorno 25 gen 2021, alle ore 10:40, Stephen Rothwell <sfr@canb.auug.org.au> ha scritto:
> >>>>
> >>>> Hi all,
> >>>>
> >>>> In commit
> >>>>
> >>>>  d4fc3640ff36 ("block, bfq: set next_rq to waker_bfqq->next_rq in waker injection")
> >>>>
> >>>> Fixes tag
> >>>>
> >>>>  Fixes: c5089591c3ba ("block, bfq: detect wakers and unconditionally inject their I/O")
> >>>>
> >>>> has these problem(s):
> >>>>
> >>>>  - Target SHA1 does not exist
> >>>>
> >>>> Maybe you meant
> >>>>
> >>>> Fixes: 13a857a4c4e8 ("block, bfq: detect wakers and unconditionally inject their I/O")
> >>>>
> >>>
> >>> Hi Jens,
> >>> how to proceed in such a case (with patches already applied by you)?
> >>> Shall I send you a v2 with only this change?
> >>
> >> We just have to ignore it... But in the future, always double check that
> >> you are using the right shas, not some sha from an internal tree.
> > 
> > FWIW I have a commit hook in my git tree that just refuses a commit with
> > unknown Fixes tag SHA. Exactly to catch such mishaps in the patches I
> > merge...
> 
> That's not a bad idea, would help catch it upfront. Can you share the
> hook?

Sure, attached. Note that the hook just gets commit ID from the Fixes tag
and formats it with 12 commit ID digits and appropriate commit subject.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=commit-msg

#!/bin/sh
#
# Called by "git commit" with one argument, the name of the file
# that has the commit message.  The hook should exit with non-zero
# status after issuing an appropriate message if it wants to stop the
# commit.  The hook is allowed to edit the commit message file.

# Process all Fixes tags, check commit IDs and set appropriate commit titles.

for COMMIT in $(sed -n -e 's/^Fixes: \([0-9a-z]*\).*/\1/p' "$1"); do
	GOOD=$(git show -s --abbrev-commit --abbrev=12 --pretty=format:"%h (\"%s\")%n" $COMMIT -- 2>/dev/null)
	if [ -z "$GOOD" ]; then
		echo "Unknown commit: $COMMIT"
		exit 1
	fi
	echo "Setting fixes tag: $GOOD"
	sed -i -e "s/^Fixes: $COMMIT.*/Fixes: $GOOD/" "$1"
done

exit 0

--huq684BweRXVnRxX--
