Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EAF303EB8
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 14:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391875AbhAZNav (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 08:30:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:59872 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404486AbhAZNa2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Jan 2021 08:30:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E6FA5AD6B;
        Tue, 26 Jan 2021 13:29:46 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 50C1C1E151D; Tue, 26 Jan 2021 14:29:46 +0100 (CET)
Date:   Tue, 26 Jan 2021 14:29:46 +0100
From:   Jan Kara <jack@suse.cz>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Paolo Valente <paolo.valente@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Jia Cheng Hu <jia.jiachenghu@gmail.com>,
        Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210126132946.GC10966@quack2.suse.cz>
References: <20210125204032.6b6a604b@canb.auug.org.au>
 <3F91181A-EDF2-4F01-9839-17B40D6EA07F@linaro.org>
 <fb60bac7-f572-d131-d761-f6ce10a05f69@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb60bac7-f572-d131-d761-f6ce10a05f69@kernel.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon 25-01-21 11:39:50, Jens Axboe wrote:
> On 1/25/21 11:35 AM, Paolo Valente wrote:
> > 
> > 
> >> Il giorno 25 gen 2021, alle ore 10:40, Stephen Rothwell <sfr@canb.auug.org.au> ha scritto:
> >>
> >> Hi all,
> >>
> >> In commit
> >>
> >>  d4fc3640ff36 ("block, bfq: set next_rq to waker_bfqq->next_rq in waker injection")
> >>
> >> Fixes tag
> >>
> >>  Fixes: c5089591c3ba ("block, bfq: detect wakers and unconditionally inject their I/O")
> >>
> >> has these problem(s):
> >>
> >>  - Target SHA1 does not exist
> >>
> >> Maybe you meant
> >>
> >> Fixes: 13a857a4c4e8 ("block, bfq: detect wakers and unconditionally inject their I/O")
> >>
> > 
> > Hi Jens,
> > how to proceed in such a case (with patches already applied by you)?
> > Shall I send you a v2 with only this change?
> 
> We just have to ignore it... But in the future, always double check that
> you are using the right shas, not some sha from an internal tree.

FWIW I have a commit hook in my git tree that just refuses a commit with
unknown Fixes tag SHA. Exactly to catch such mishaps in the patches I
merge...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
