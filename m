Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2866B2B4E48
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 18:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388016AbgKPRnl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 12:43:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:54864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388010AbgKPRnk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Nov 2020 12:43:40 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E47DB2231B;
        Mon, 16 Nov 2020 17:43:39 +0000 (UTC)
Date:   Mon, 16 Nov 2020 12:43:38 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20201116124338.76a522e1@gandalf.local.home>
In-Reply-To: <20201116173502.392a769c@canb.auug.org.au>
References: <20201116173502.392a769c@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 16 Nov 2020 17:35:02 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/trace/ftrace-uses.rst:123: WARNING: Unexpected indentation.
> 
> Introduced by commit
> 
>   a25d036d939a ("ftrace: Reverse what the RECURSION flag means in the ftrace_ops")
> 

I'm not good at rst markup. Not sure how to fix this.

Thanks,

-- Steve
