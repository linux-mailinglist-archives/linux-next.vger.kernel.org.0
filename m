Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8AC25BE99
	for <lists+linux-next@lfdr.de>; Thu,  3 Sep 2020 11:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgICJsl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Sep 2020 05:48:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:60320 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbgICJsl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Sep 2020 05:48:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C720BAB9F;
        Thu,  3 Sep 2020 09:48:39 +0000 (UTC)
Date:   Thu, 3 Sep 2020 11:48:37 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Fixes tags need some work in the printk tree
Message-ID: <20200903091436.GA5012@alley>
References: <20200902072254.3054db47@canb.auug.org.au>
 <20200902072610.GA9496@alley>
 <20200903065547.0cc6f53b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903065547.0cc6f53b@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu 2020-09-03 06:55:47, Stephen Rothwell wrote:
> Hi Petr,
> 
> On Wed, 2 Sep 2020 09:26:11 +0200 Petr Mladek <pmladek@suse.com> wrote:
> > 
> > The problem is that this commit is not in mainline. It is living
> > only in printk/linux.git.
> > 
> > Could we use the SHA1 from the maintainer tree when it would not get rebased?
> > 
> > Or should we rather avoid Fixes: tag referencing commits that are not
> > in mainline?
> > 
> > I am sorry to bother you with this silly question. I do not see any
> > hint in Documentation/process/submitting-patches.rst.
> 
> Well, in theory, maintainers trees should not be rebased after they
> have been published (except in exceptional circumstances), so using
> SHA1s from them should be OK.  Especially if the fixing commit is in
> the same maintainers tree (which it should be, right).  It does mean
> that maintainers need to be a bit more careful if they do rebase their
> trees to update any Fixes tags (or other commit references) that are
> affected by the rebase.

Thanks a lot for info.

I have rebased the last 5 commits in the printk-rework branch and
added the missing SHAs there.

Best Regards,
Petr
