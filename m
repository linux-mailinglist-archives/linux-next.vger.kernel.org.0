Return-Path: <linux-next+bounces-4645-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813CF9BF10C
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 16:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FABB28171F
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 15:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15C418FDA9;
	Wed,  6 Nov 2024 15:02:32 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2134185B58;
	Wed,  6 Nov 2024 15:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730905352; cv=none; b=C1/OMniCjtDt4tU8VzXci77RMURriRcQA1zLqJNbK2sc6WPSyEE9vWh2EdvCJ46kbQqUD3UhgWY+1wYVz2owIaay3YzaU7U4BjMRFKfFLR58Yo/3gftTDVyvB4DDm5ZvaZD+1UZ7BWirp+re8L4InI+Vvs0E3LkWCYCMGhYbGwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730905352; c=relaxed/simple;
	bh=kIz+8V4sBTHidb7f8LH/ek7rCSYajiNxjPqyV9mjyUo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rLudq8cX0qgXnElzJaXRpJg55Aihs7R+LFf2z5pStm5d0IAanx7OgwrEEXqONDBrFCmhx8dyqEF4mL6ohRZRTTXgBx/+A6wAKvbPqemBCjFKcJUXKEdbyROhRlyeqKLppeqjapCJKxQjrlVkRtWLghVhFXQPNS5NG04IJBzMEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338F0C4CECC;
	Wed,  6 Nov 2024 15:02:31 +0000 (UTC)
Date: Wed, 6 Nov 2024 10:02:34 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241106100234.189029a5@gandalf.local.home>
In-Reply-To: <20241106140414.760b502c@canb.auug.org.au>
References: <20241106140414.760b502c@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Nov 2024 14:04:14 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/ftrace.h:23,
>                  from include/linux/kvm_host.h:32,
>                  from arch/powerpc/include/asm/kvm_ppc.h:19,
>                  from arch/powerpc/include/asm/dbell.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:36:
> arch/powerpc/include/asm/ftrace.h: In function 'arch_ftrace_set_direct_caller':
> arch/powerpc/include/asm/ftrace.h:141:38: error: invalid use of undefined type 'struct ftrace_regs'
>   141 |         struct pt_regs *regs = &fregs->regs;
>       |                                      ^~
> 
> Caused by commit
> 
>   7888af4166d4 ("ftrace: Make ftrace_regs abstract from direct use")
> 
> interacting with commit
> 
>   a52f6043a223 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS")
> 
> from the powerpc tree.
> 
> I have applied the following merge fix patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Nov 2024 13:33:53 +1100
> Subject: [PATCH] fix up for "ftrace: Make ftrace_regs abstract from direct use"
> 
> from the ftrace tree interacting with "powerpc/ftrace: Add support for
> DYNAMIC_FTRACE_WITH_DIRECT_CALLS" from the powerpc tree
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/ftrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index bb2c90997618..db481b336bca 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -138,7 +138,7 @@ unsigned long ftrace_call_adjust(unsigned long addr);
>   */
>  static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fregs, unsigned long addr)
>  {
> -	struct pt_regs *regs = &fregs->regs;
> +	struct pt_regs *regs = &arch_ftrace_regs(fregs)->regs;
>  

This fix looks fine to me. How should we handle this when we send our pull
requests to Linus? I may forgot about this issue, and it also matters who's
tree goes first.

-- Steve


>  	regs->orig_gpr3 = addr;
>  }


