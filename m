Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F83CFDDAB
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 13:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfKOMZT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 07:25:19 -0500
Received: from foss.arm.com ([217.140.110.172]:58224 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727715AbfKOMZR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 07:25:17 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00A2031B;
        Fri, 15 Nov 2019 04:25:17 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15C963F534;
        Fri, 15 Nov 2019 04:25:15 -0800 (PST)
Date:   Fri, 15 Nov 2019 12:25:14 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the arm64 tree
Message-ID: <20191115122513.GB41572@lakrids.cambridge.arm.com>
References: <20191115135357.10386fac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115135357.10386fac@canb.auug.org.au>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15, 2019 at 01:53:57PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in:
> 
>   include/asm-generic/vmlinux.lds.h
> 
> between commit:
> 
>   a1326b17ac03 ("module/ftrace: handle patchable-function-entry")
> 
> from the arm64 tree and commit:
> 
>   b83b43ffc6e4 ("fgraph: Fix function type mismatches of ftrace_graph_return using ftrace_stub")
> 
> from the ftrace tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks Stephen!

Steven (Rostedt), what's your preference for handling this?

We can drop revert the arm64 change to vmlinux.lds.h for now (and I can
send it as a subsequent cleanup), or you could merge my
arm64/ftrace-with-regs branch and fix this up in the ftrace tree.

Thanks,
Mark.

> 
> diff --cc include/asm-generic/vmlinux.lds.h
> index 63cedc3c0c77,0f358be551cd..000000000000
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@@ -136,19 -110,30 +136,29 @@@
>   #endif
>   
>   #ifdef CONFIG_FTRACE_MCOUNT_RECORD
>  -#ifdef CC_USING_PATCHABLE_FUNCTION_ENTRY
>  +/*
>  + * The ftrace call sites are logged to a section whose name depends on the
>  + * compiler option used. A given kernel image will only use one, AKA
>  + * FTRACE_CALLSITE_SECTION. We capture all of them here to avoid header
>  + * dependencies for FTRACE_CALLSITE_SECTION's definition.
>  + */
> + /*
> +  * Need to also make ftrace_graph_stub point to ftrace_stub
> +  * so that the same stub location may have different protocols
> +  * and not mess up with C verifiers.
> +  */
>  -#define MCOUNT_REC()	. = ALIGN(8);				\
>  -			__start_mcount_loc = .;			\
>  -			KEEP(*(__patchable_function_entries))	\
>  -			__stop_mcount_loc = .;			\
>  -			ftrace_graph_stub = ftrace_stub;
>  -#else
>   #define MCOUNT_REC()	. = ALIGN(8);				\
>   			__start_mcount_loc = .;			\
>   			KEEP(*(__mcount_loc))			\
>  +			KEEP(*(__patchable_function_entries))	\
> - 			__stop_mcount_loc = .;
> + 			__stop_mcount_loc = .;			\
> + 			ftrace_graph_stub = ftrace_stub;
>  -#endif
>   #else
> - #define MCOUNT_REC()
> + # ifdef CONFIG_FUNCTION_TRACER
> + #  define MCOUNT_REC()	ftrace_graph_stub = ftrace_stub;
> + # else
> + #  define MCOUNT_REC()
> + # endif
>   #endif
>   
>   #ifdef CONFIG_TRACE_BRANCH_PROFILING


