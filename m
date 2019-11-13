Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA1DFB0E1
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 13:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfKMMyg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Nov 2019 07:54:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:47034 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726105AbfKMMyg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Nov 2019 07:54:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B3F9BAF83;
        Wed, 13 Nov 2019 12:54:34 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 3F0FCDA7AF; Wed, 13 Nov 2019 13:54:38 +0100 (CET)
Date:   Wed, 13 Nov 2019 13:54:38 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Qu WenRuo <wqu@suse.com>
Cc:     coverity-bot <keescook@chromium.org>,
        David Sterba <DSterba@suse.com>,
        Anand Jain <anand.jain@oracle.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Coverity: read_one_block_group(): Concurrent data access
 violations
Message-ID: <20191113125437.GZ3001@suse.cz>
Reply-To: dsterba@suse.cz
References: <201911111736.E0A3E2DDDB@keescook>
 <8c607908-6c8e-efb0-0079-7fa74ec98bed@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c607908-6c8e-efb0-0079-7fa74ec98bed@suse.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 12, 2019 at 02:05:40AM +0000, Qu WenRuo wrote:
> On 2019/11/12 上午9:36, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 593669fa8fd7 ("btrfs: block-group: Refactor btrfs_read_block_groups()")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487834:  Concurrent data access violations  (MISSING_LOCK)
> > /fs/btrfs/block-group.c: 1721 in read_one_block_group()
> > 1715     		 *    truncate the old free space cache inode and
> > 1716     		 *    setup a new one.
> > 1717     		 * b) Setting 'dirty flag' makes sure that we flush
> > 1718     		 *    the new space cache info onto disk.
> > 1719     		 */
> > 1720     		if (btrfs_test_opt(info, SPACE_CACHE))
> > vvv     CID 1487834:  Concurrent data access violations  (MISSING_LOCK)
> > vvv     Accessing "cache->disk_cache_state" without holding lock "btrfs_block_group_cache.lock". Elsewhere, "btrfs_block_group_cache.disk_cache_state" is accessed with "btrfs_block_group_cache.lock" held 12 out of 13 times (6 of these accesses strongly imply that it is necessary).
> 
> It's a false alert, as read_one_block_group() is running in mount
> context, nobody else can access the fs yet.
> 
> Of course we can hold the lock as it's going to hit fast path and no
> performance change at all, but I'm not sure what's the proper way to do
> in btrfs.
> 
> David, any idea on this?

We'd have to add some annotation for the static checkers that would let
them know that the code section is running single threaded. It would be
still desirable to catch concurrency issues in the rest of the code so
eg. completely disabling checks for a certain structure would not be
good.

The mount or unmount functions are probably the best examples where the
instrumentation would be useful and also not intrusive. In open_ctree it
would be from the beginning of the function until the call to
btrfs_init_workqueues.
