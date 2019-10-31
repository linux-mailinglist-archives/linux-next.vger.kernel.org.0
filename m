Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12912EB4CD
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2019 17:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfJaQhe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 31 Oct 2019 12:37:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:58218 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727856AbfJaQhe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 31 Oct 2019 12:37:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B6345B12F;
        Thu, 31 Oct 2019 16:37:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 57FB91E482D; Thu, 31 Oct 2019 17:37:32 +0100 (CET)
Date:   Thu, 31 Oct 2019 17:37:32 +0100
From:   Jan Kara <jack@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jan Kara <jack@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jeff Mahoney <jeffm@suse.com>
Subject: Re: linux-next: Fixes tag needs some work in the ext3 tree
Message-ID: <20191031163732.GA13321@quack2.suse.cz>
References: <20191031072331.1830d07d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031072331.1830d07d@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu 31-10-19 07:23:31, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   08b866beeb61 ("reiserfs: fix extended attributes on the root directory")
> 
> Fixes tag
> 
>   Fixes: d0a5b995a30 ("vfs: Add IOP_XATTR inode operations flag")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks for the notice. I've fixed that up and added commit hook to auto-fix
Fixes tags. So it should not happen in the future.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
