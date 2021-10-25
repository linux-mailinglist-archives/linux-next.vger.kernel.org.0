Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4C2438D85
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 04:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhJYCoj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 22:44:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230040AbhJYCoj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Oct 2021 22:44:39 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26B2E60E09;
        Mon, 25 Oct 2021 02:42:17 +0000 (UTC)
Date:   Sun, 24 Oct 2021 22:42:15 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211024224215.018c36cd@gandalf.local.home>
In-Reply-To: <20211025021119.GA1424114@embeddedor>
References: <20211018181559.5d3bcf7e@canb.auug.org.au>
        <20211025125446.51bed661@canb.auug.org.au>
        <20211025021119.GA1424114@embeddedor>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, 24 Oct 2021 21:11:19 -0500
"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> On Mon, Oct 25, 2021 at 12:54:46PM +1100, Stephen Rothwell wrote:
> > > --- a/include/linux/ftrace.h
> > > +++ b/include/linux/ftrace.h
> > > @@ -45,6 +45,7 @@ struct ftrace_ops;
> > >  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip);
> > >  #else
> > >  # define FTRACE_FORCE_LIST_FUNC 0
> > > +struct ftrace_regs;
> > >  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
> > >  			       struct ftrace_ops *op, struct ftrace_regs *fregs);
> > >  #endif
> > > -- 
> > > 2.33.0  
> > 
> > I am still applying this fix ...  
> 
> I will add this fix to the original patch for my tomorrow's -next tree.

Hmm, I pushed my version to my for-next branch. Do you have this in the
next tree?

  34cdd18b8d245f3e901e5325 ("tracing: Use linker magic instead of recasting
  ftrace_ops_list_func()")

Which shouldn't need this fix.

-- Steve
