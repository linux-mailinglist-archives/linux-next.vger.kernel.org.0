Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8B12629F4
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 10:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgIIIRE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 04:17:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:48608 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbgIIIQ7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Sep 2020 04:16:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 40927AFA0;
        Wed,  9 Sep 2020 08:16:58 +0000 (UTC)
Date:   Wed, 9 Sep 2020 10:16:56 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the printk tree
Message-ID: <20200909081656.GD3864@alley>
References: <20200905121827.22fb4037@canb.auug.org.au>
 <20200908074601.GA3864@alley>
 <20200908095924.GA74028@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908095924.GA74028@jagdpanzerIV.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 2020-09-08 18:59:24, Sergey Senozhatsky wrote:
> On (20/09/08 09:46), Petr Mladek wrote:
> > On Sat 2020-09-05 12:18:27, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Commit
> > > 
> > >   4c31ead75f41 ("printk: ringbuffer: support dataless records")
> > > 
> > > is missing a Signed-off-by from its committer.
> > 
> > Thanks for catching this. It should be fixed now.
> > 
> > It has been originally committed by Sergey. I rebased it to add the
> > missing SHA1[0] and suddenly became committer, see
> 
> Oh.
> I missed it somehow that b4/git-am didn't add all the required fields.
> That wasn't the only patch that I applied. So, well.. Sorry and thanks
> for catching and fixing this up.

It was actually my mistake. I should have added my SOB when rebased
the commit.

Best Regards,
Petr
