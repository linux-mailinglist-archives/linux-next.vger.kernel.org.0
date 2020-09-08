Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0DE260C52
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 09:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729257AbgIHHqI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 03:46:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:49198 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728786AbgIHHqD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 03:46:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D5FB8AE24;
        Tue,  8 Sep 2020 07:46:02 +0000 (UTC)
Date:   Tue, 8 Sep 2020 09:46:01 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the printk tree
Message-ID: <20200908074601.GA3864@alley>
References: <20200905121827.22fb4037@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200905121827.22fb4037@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat 2020-09-05 12:18:27, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   4c31ead75f41 ("printk: ringbuffer: support dataless records")
> 
> is missing a Signed-off-by from its committer.

Thanks for catching this. It should be fixed now.

It has been originally committed by Sergey. I rebased it to add the
missing SHA1[0] and suddenly became committer, see

I have just rebased it once again and added my newly required Signed-of-by.

[0] https://lore.kernel.org/lkml/20200903091436.GA5012@alley/

Best Regards,
Petr
