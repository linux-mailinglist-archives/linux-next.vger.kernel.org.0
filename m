Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9D128F1FB
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 14:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgJOMWt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 08:22:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:35552 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728009AbgJOMWt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 08:22:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1602764568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=O3E1pC9UGTTt4nprLSiUqABd2GQPiIsCgYSgfRuYliQ=;
        b=Ykf3d86Z3+f9jbCUC7X8f0cbnMTdZA65/bvHBAhZVj869a4ZulOk456qdgRS3OqXlSMU4/
        c6/z9DPUQcllBbXn4AVwCwcs7bPT9SKG3wIm7O39X4m3IDoGXjO/aGjszNcn4TsFeE7bvP
        +fB2bScxULYBI2EiImGUd/IV4zGsiUk=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id EC176B27B;
        Thu, 15 Oct 2020 12:22:47 +0000 (UTC)
Date:   Thu, 15 Oct 2020 14:22:46 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] printk: ringbuffer: Wrong data pointer when appending
 small string
Message-ID: <20201015122246.GD8871@alley>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
 <20201014140514.GB17231@alley>
 <20201014151311.GB13775@alley>
 <20201014175051.GC13775@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014175051.GC13775@alley>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 2020-10-14 19:50:54, Petr Mladek wrote:
> data_realloc() returns wrong data pointer when the block is wrapped and
> the size is not increased. It might happen when pr_cont() wants to
> add only few characters and there is already a space for them because
> of alignment.
> 
> It might cause writing outsite the buffer. It has been detected by LTP
> tests with KASAN enabled:
> 
> Link: https://lore.kernel.org/r/CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com
> Fixes: 4cfc7258f876a7feba673ac ("printk: ringbuffer: add finalization/extension support")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

The patch is committed into printk/linux.git, branch for-5.10-fixup.

I am going to send a pull request with it tomorrow unless something
happens in the meantime.

Best Regards,
Petr
