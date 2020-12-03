Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412612CD429
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 12:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbgLCLCH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 06:02:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:48598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728779AbgLCLCH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 06:02:07 -0500
Date:   Thu, 3 Dec 2020 11:01:23 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: manual merge of the block tree with the arm64 tree
Message-ID: <20201203110122.GC2224@gaia>
References: <20201203142530.4d962ea5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142530.4d962ea5@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 03, 2020 at 02:25:30PM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm64/include/asm/thread_info.h
> index 015beafe58f5,cdcf307764aa..000000000000
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@@ -63,7 -66,9 +63,8 @@@ void arch_release_task_struct(struct ta
>   #define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
>   #define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
>   #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
> - #define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
>  -#define TIF_FSCHECK		5	/* Check FS is USER_DS on return */
> ++#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
> + #define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
>  -#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>   #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
>   #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
>   #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
> @@@ -96,7 -103,8 +98,8 @@@
>   
>   #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
>   				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
> - 				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT)
>  -				 _TIF_UPROBE | _TIF_FSCHECK | _TIF_MTE_ASYNC_FAULT | \
> ++				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
> + 				 _TIF_NOTIFY_SIGNAL)

Thanks Stephen. It looks alright to me.

-- 
Catalin
