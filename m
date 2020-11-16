Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0509D2B5104
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 20:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729088AbgKPTYe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 14:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729060AbgKPTYe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 14:24:34 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3C1C0613CF;
        Mon, 16 Nov 2020 11:24:34 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AD20E6D9;
        Mon, 16 Nov 2020 19:24:33 +0000 (UTC)
Date:   Mon, 16 Nov 2020 12:24:32 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20201116122432.796af13b@lwn.net>
In-Reply-To: <20201116124338.76a522e1@gandalf.local.home>
References: <20201116173502.392a769c@canb.auug.org.au>
        <20201116124338.76a522e1@gandalf.local.home>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 16 Nov 2020 12:43:38 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> > After merging the ftrace tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > Documentation/trace/ftrace-uses.rst:123: WARNING: Unexpected indentation.
> > 
> > Introduced by commit
> > 
> >   a25d036d939a ("ftrace: Reverse what the RECURSION flag means in the ftrace_ops")
> >   
> 
> I'm not good at rst markup. Not sure how to fix this.

Looking at the commit in question:

> +Protect your callback
> +=====================
> +
> +As functions can be called from anywhere, and it is possible that a function
> +called by a callback may also be traced, and call that same callback,
> +recursion protection must be used. There are two helper functions that
> +can help in this regard. If you start your code with:
> +
> +	int bit;
> +
> +	bit = ftrace_test_recursion_trylock();
> +	if (bit < 0)
> +		return;

The problem is those literal blocks.  The easiest fix will be to just use
the double-colon notation to indicate a literal block, so the paragraph
above would end with "...start your code with::".  Note that there's a few
of them to fix.

Thanks,

jon
