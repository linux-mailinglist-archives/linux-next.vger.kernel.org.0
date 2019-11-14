Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E996DFC1FD
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 09:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfKNI6P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 03:58:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:38094 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbfKNI6P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 03:58:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 52300B24C;
        Thu, 14 Nov 2019 08:58:13 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 8DECB1E4AD2; Thu, 14 Nov 2019 09:58:12 +0100 (CET)
Date:   Thu, 14 Nov 2019 09:58:12 +0100
From:   Jan Kara <jack@suse.cz>
To:     Kees Cook <keescook@chromium.org>
Cc:     Jan Kara <jack@suse.cz>,
        Matthew Bobrowski <mbobrowski@mbobrowski.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Ritesh Harjani <riteshh@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: ext4_iomap_alloc(): Integer handling issues
Message-ID: <20191114085812.GB28486@quack2.suse.cz>
References: <201911111735.1F45BB0B4@keescook>
 <20191112072239.GB15488@bobrowski>
 <20191112110004.GF1241@quack2.suse.cz>
 <201911121256.647DA73508@keescook>
 <20191112212846.GA29863@bobrowski>
 <201911121414.ECAA926@keescook>
 <20191113093754.GB6367@quack2.suse.cz>
 <201911131036.2E3F280B9@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911131036.2E3F280B9@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 13-11-19 10:38:43, Kees Cook wrote:
> On Wed, Nov 13, 2019 at 10:37:54AM +0100, Jan Kara wrote:
> > Well, I don't think we want to clutter various places in the code with
> > checks that inode->i_blkbits (which is what blkbits actually is) is what we
> > expect. inode->i_blkbits is initialized in fs/inode.c:inode_init_always()
> > from sb->s_blocksize_bits and never changed. sb->s_blocksize_bits gets set
> > through sb_set_blocksize().  Now it would make sense to assert in
> > sb_set_blocksize() that block size is in the range we expect it (currently
> > there's just a comment there). But then I suspect that Coverity won't be
> > able to carry over the limits as far as into ext4_iomap_alloc() code...
> > Kees?
> 
> Yeah, I'm not sure it's capabilities in this regard. It's still a bit of a
> black box. :) I just tend to lean toward adding asserts to code-document
> value range expectations. Perhaps add the check in sb_set_blocksize()
> just because it's a decent thing to test, and if Coverity doesn't notice,
> that's okay -- my goal is to improve the kernel which may not always
> reduce the static checker noise. :)

Now I've noticed that set_blocksize() called from sb_set_blocksize()
already has these checks. So there's nothing to add. Just Coverity is not
able to carry over those limits that far...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
