Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72DFF114EAB
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2019 11:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfLFKEA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Dec 2019 05:04:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:57718 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726070AbfLFKEA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Dec 2019 05:04:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D75C0B203;
        Fri,  6 Dec 2019 10:03:58 +0000 (UTC)
Date:   Fri, 6 Dec 2019 11:03:57 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20191206100357.tgtdjcata6zrzc5l@pathway.suse.cz>
References: <20191206092503.303d6a57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206092503.303d6a57@canb.auug.org.au>
User-Agent: NeoMutt/20170912 (1.9.0)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri 2019-12-06 09:25:03, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the printk tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> kernel/trace/trace.c: In function 'register_tracer':
> kernel/trace/trace.c:1892:3: error: implicit declaration of function 'pr_warning'; did you mean 'pr_warn'? [-Werror=implicit-function-declaration]
>  1892 |   pr_warning("Can not register tracer %s due to lockdown\n",
>       |   ^~~~~~~~~~
>       |   pr_warn
> 
> Caused by commit
> 
>   55130ba7f010 ("printk: Drop pr_warning definition")
> 
> interacting with commit
> 
>   a356646a5685 ("tracing: Do not create directories if lockdown is in affect")
> 
> from Linus' tree.
> 
> I have applied the following merge fix patch for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 6 Dec 2019 09:21:57 +1100
> Subject: [PATCH] fix up for "printk: Drop pr_warning definition"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

I have pushed the patch into printk.git, for-5.5-pr_warning-removal.
And updated the for-next branch.

Thanks a lot for the fix and sorry for the incovenience.

Best Regards,
Petr
