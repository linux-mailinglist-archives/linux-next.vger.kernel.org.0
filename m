Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CCD432468
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 19:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233317AbhJRRKx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 13:10:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231739AbhJRRKw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Oct 2021 13:10:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC5DB60FC3;
        Mon, 18 Oct 2021 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634576921;
        bh=rnqH7xQLQwahEjIjKpK9LRzICcShFH40bJhxOwZthU0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a01NpQT11bLt58cMuXYcuXlq3AAG+cEYHjuEWCQQRCdMEWxNA0ZldCMCwpeE8+6Y3
         aWJMtNj1S3x5ESMcVPmTfN0MLLrK+e410ib608SjvPVqc2ylErS5yB4+Jji42E5bOZ
         0vBs//bXWtqPlvyRrvmkbYx4+AJ0k8Od4dM+eshnKdbTVYz5oGp1IGq/BBTX82emns
         wJ2e0dAbcDuJoJd8DBc3AV7cIZ9tieoI7ZXquMBBZYPpsdhvr2MaASsxVSKGVRhGtR
         3YLzIFwwmUmFubnBNDnXwwNj+LUHcRdJlWaZ29FDhZpX4vHjr/ksdKNH+fObtMeSC6
         jO52jEFbQqnBQ==
Date:   Mon, 18 Oct 2021 12:13:15 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211018171315.GA1233957@embeddedor>
References: <20211018181559.5d3bcf7e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018181559.5d3bcf7e@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks, Stephen.
--
Gustavo

On Mon, Oct 18, 2021 at 06:15:59PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
> 
> In file included from include/linux/perf_event.h:49,
>                  from arch/powerpc/perf/callchain.c:9:
> include/linux/ftrace.h:49:41: error: 'struct ftrace_regs' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>    49 |           struct ftrace_ops *op, struct ftrace_regs *fregs);
>       |                                         ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> (many of these)
> 
> Caused by commit
> 
>   c45ede6c2781 ("ftrace: Fix -Wmissing-prototypes errors")
> 
> I have added the following fixup for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Oct 2021 17:56:30 +1100
> Subject: [PATCH] fixup for "ftrace: Fix -Wmissing-prototypes errors"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/ftrace.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 871b51bec170..ada656c6824d 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -45,6 +45,7 @@ struct ftrace_ops;
>  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip);
>  #else
>  # define FTRACE_FORCE_LIST_FUNC 0
> +struct ftrace_regs;
>  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
>  			       struct ftrace_ops *op, struct ftrace_regs *fregs);
>  #endif
> -- 
> 2.33.0
> 
> -- 
> Cheers,
> Stephen Rothwell


