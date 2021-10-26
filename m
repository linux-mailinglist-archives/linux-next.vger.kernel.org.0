Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4219443BC4E
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 23:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237205AbhJZVZC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 17:25:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:53794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235941AbhJZVZC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 17:25:02 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93BA360E09;
        Tue, 26 Oct 2021 21:22:37 +0000 (UTC)
Date:   Tue, 26 Oct 2021 17:22:36 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ftrace tree
Message-ID: <20211026172236.560c034b@gandalf.local.home>
In-Reply-To: <20211027081728.1ff488bf@canb.auug.org.au>
References: <20211027081728.1ff488bf@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 27 Oct 2021 08:17:28 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commit
> 
>   7a335f11747c ("ftrace/sh: Add arch_ftrace_ops_list_func stub to have compressed image still link")
> 
> is missing a Signed-off-by from its author.

No, it has the wrong author. Patches I write go through my patchwork, and
somehow it added the linux-sh mailing list as the author, when it was
actually suppose to be me. Something must have went oops in my scripts :-/

Thanks for catching it. I'll rebase to make it have me as the author.

-- Steve
