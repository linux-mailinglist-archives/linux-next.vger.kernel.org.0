Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68D1F2CB2E2
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 03:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgLBCoA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 21:44:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:56640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726245AbgLBCoA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Dec 2020 21:44:00 -0500
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F3C8206A1;
        Wed,  2 Dec 2020 02:43:18 +0000 (UTC)
Date:   Tue, 1 Dec 2020 21:43:15 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jassi Brar <jaswinder.singh@linaro.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mailbox tree
Message-ID: <20201201214315.523923a0@oasis.local.home>
In-Reply-To: <20201202123939.4a9e7549@canb.auug.org.au>
References: <20201202123939.4a9e7549@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2 Dec 2020 12:39:39 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   983df5f2699f ("samples/ftrace: Mark my_tramp[12]? global")
> 
> Fixes tag
> 
>   Fixes: 9d907f1ae80b8 ("ftrace/samples: Add a sample module that implements modify_ftrace_direct()")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
> 
> Maybe you meant
> 
> Fixes: 9d907f1ae80b ("samples/ftrace: Fix asm function ELF annotations")
> 
> or
> 
> Fixes: ae0cc3b7e7f5 ("ftrace/samples: Add a sample module that implements modify_ftrace_direct()")
> 

Bah! Too late, it already made it into Linus's tree.

I goofed. I was looking at both commits to see which one to apply it
for, and ended up mixing the two.

It was meant for:

Fixes: ae0cc3b7e7f5 ("ftrace/samples: Add a sample module that implements modify_ftrace_direct()")

I'll have to add a script to my tests that makes sure the Fixes tag
matches the description.

-- Steve
