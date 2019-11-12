Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00902F8D6B
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 12:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfKLLAG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 06:00:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:36532 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725887AbfKLLAG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Nov 2019 06:00:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B3172B139;
        Tue, 12 Nov 2019 11:00:04 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 23AD21E47E5; Tue, 12 Nov 2019 12:00:04 +0100 (CET)
Date:   Tue, 12 Nov 2019 12:00:04 +0100
From:   Jan Kara <jack@suse.cz>
To:     Matthew Bobrowski <mbobrowski@mbobrowski.org>
Cc:     coverity-bot <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
        Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <20191112110004.GF1241@quack2.suse.cz>
References: <201911111735.1F45BB0B4@keescook>
 <20191112072239.GB15488@bobrowski>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112072239.GB15488@bobrowski>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 12-11-19 18:22:41, Matthew Bobrowski wrote:
> On Mon, Nov 11, 2019 at 05:35:44PM -0800, coverity-bot wrote:
> > This is an experimental automated report about issues detected by Coverity
> > from a scan of next-20191108 as part of the linux-next weekly scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by recent commits:
> > 
> > 378f32bab371 ("ext4: introduce direct I/O write using iomap infrastructure")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > /fs/ext4/inode.c: 3388 in ext4_iomap_alloc()
> > 3382     	/*
> > 3383     	 * We use i_size instead of i_disksize here because delalloc writeback
> > 3384     	 * can complete at any point during the I/O and subsequently push the
> > 3385     	 * i_disksize out to i_size. This could be beyond where direct I/O is
> > 3386     	 * happening and thus expose allocated blocks to direct I/O reads.
> > 3387     	 */
> > vvv     CID 1487841:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
> > vvv     Potentially overflowing expression "1 << blkbits" with type "int" (32 bits, signed) is evaluated using 32-bit arithmetic, and then used in a context that expects an expression of type "loff_t" (64 bits, signed).
> > 3388     	else if ((map->m_lblk * (1 << blkbits)) >= i_size_read(inode))
> > 3389     		m_flags = EXT4_GET_BLOCKS_CREATE;
> > 3390     	else if (ext4_test_inode_flag(inode, EXT4_INODE_EXTENTS))
> > 3391     		m_flags = EXT4_GET_BLOCKS_IO_CREATE_EXT;
> 
> In the event of an overflow in this specific context, I don't think it
> would matter too much to be perfectly honest. If 'blkbits' were to
> actually ever push out the signed integer to a value that couldn't be
> represented by this data type, I would expect the resulting wrapping
> behaviour to _only_ affect how filesystem blocks are allocated. In
> that case, I/O workloads would behave alot differently, and at that
> point I would hope that our filesystem related testing infrastructure
> would pick this up before allowing anything to leak out into the
> wild...
> 
> Unless my trail of thought is wrong? Happy to be corrected here and
> educated on this.

Fully agreed. blkbits is never expected to be larger than 16 in this code.
So this is false positive.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
