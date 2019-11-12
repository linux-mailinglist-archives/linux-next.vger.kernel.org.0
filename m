Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A54EDF8D9C
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 12:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfKLLJX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 06:09:23 -0500
Received: from mx2.suse.de ([195.135.220.15]:43886 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725997AbfKLLJX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Nov 2019 06:09:23 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0AA80AC7B;
        Tue, 12 Nov 2019 11:09:22 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id D4B571E47E5; Tue, 12 Nov 2019 12:09:21 +0100 (CET)
Date:   Tue, 12 Nov 2019 12:09:21 +0100
From:   Jan Kara <jack@suse.cz>
To:     coverity-bot <keescook@chromium.org>
Cc:     Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: jbd_unlock_bh_journal_head(): Memory - corruptions
Message-ID: <20191112110921.GG1241@quack2.suse.cz>
References: <201911111735.5CD206D@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911111735.5CD206D@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

On Mon 11-11-19 17:35:18, coverity-bot wrote:
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191108 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> c290ea01abb7 ("fs: Remove ext3 filesystem driver")
> 
> Coverity reported the following:
> 
> *** CID 1487847:  Memory - corruptions  (ARRAY_VS_SINGLETON)
> /include/linux/jbd2.h: 351 in jbd_unlock_bh_journal_head()
> 345     {
> 346     	bit_spin_lock(BH_JournalHead, &bh->b_state);
> 347     }
> 348
> 349     static inline void jbd_unlock_bh_journal_head(struct buffer_head *bh)
> 350     {
> vvv     CID 1487847:  Memory - corruptions  (ARRAY_VS_SINGLETON)
> vvv     Passing "&bh->b_state" to function "bit_spin_unlock" which uses it as an array. This might corrupt or misinterpret adjacent memory locations.
> 351     	bit_spin_unlock(BH_JournalHead, &bh->b_state);
> 352     }

This is obviously false positive. I guess coverity needs to learn about
bit-spinlocks so that it doesn't generate false positive report about each
usage?

								Honza

> 353
> 354     #define J_ASSERT(assert)	BUG_ON(!(assert))
> 355
> 356     #define J_ASSERT_BH(bh, expr)	J_ASSERT(expr)
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487847 ("Memory - corruptions")
> Fixes: c290ea01abb7 ("fs: Remove ext3 filesystem driver")
> 
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
