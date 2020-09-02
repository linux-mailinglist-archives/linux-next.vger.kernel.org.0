Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B9E25A6AF
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 09:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIBH0N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 03:26:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:59688 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgIBH0N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Sep 2020 03:26:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id ECBC8AD52;
        Wed,  2 Sep 2020 07:26:12 +0000 (UTC)
Date:   Wed, 2 Sep 2020 09:26:11 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Ogness <john.ogness@linutronix.de>
Subject: Re: linux-next: Fixes tags need some work in the printk tree
Message-ID: <20200902072610.GA9496@alley>
References: <20200902072254.3054db47@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902072254.3054db47@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed 2020-09-02 07:22:54, Stephen Rothwell wrote:
> Hi all,
> 
> In commits
> 
>   e5e4c07d9233 ("docs: vmcoreinfo: add lockless printk ringbuffer vmcoreinfo")
>   0cfdacd74ad5 ("scripts/gdb: update for lockless printk ringbuffer")
> 
> Fixes tag
> 
>   Fixes: ("printk: use the lockless ringbuffer")

The problem is that this commit is not in mainline. It is living
only in printk/linux.git.

> 
> has these problem(s):
> 
>   - No SHA1 recognised

Could we use the SHA1 from the maintainer tree when it would not get rebased?

Or should we rather avoid Fixes: tag referencing commits that are not
in mainline?

I am sorry to bother you with this silly question. I do not see any
hint in Documentation/process/submitting-patches.rst.

Best Regards,
Petr
