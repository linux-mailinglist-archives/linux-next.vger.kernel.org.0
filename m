Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084FF40BCBC
	for <lists+linux-next@lfdr.de>; Wed, 15 Sep 2021 02:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236035AbhIOAsv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 20:48:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:38120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233341AbhIOAsv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Sep 2021 20:48:51 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF58F61175;
        Wed, 15 Sep 2021 00:47:32 +0000 (UTC)
Date:   Tue, 14 Sep 2021 20:47:30 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20210914204730.13223588@gandalf.local.home>
In-Reply-To: <20210915104444.700fdb7b@canb.auug.org.au>
References: <20210915104444.700fdb7b@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 15 Sep 2021 10:44:44 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in:
> 
>   lib/bootconfig.c
> 
> between commit:
> 
>   77e02cf57b6c ("memblock: introduce saner 'memblock_free_ptr()' interface")
> 
> from Linus' tree and commit:
> 
>   6c7324bca2ec ("bootconfig: Fix to check the xbc_node is used before free it")
> 
> from the ftrace tree.
> 
> The new memblock_free_ptr() inroduced by Linus' tree copes with NULL
> pointers, so I just used that.  Which means that the ftrace tree patch
> will be redundant.
> 
> I fixed it up (see above) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

No need. Linus had issues with the commit in my tree and did his own fix
instead, which is what is conflicting. Let me go and remove those commits
from my for-next branch.

-- Steve
