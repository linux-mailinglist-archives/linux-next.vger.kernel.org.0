Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A17B23300F
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 12:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgG3KJ3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 06:09:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:57762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbgG3KJ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 06:09:28 -0400
Received: from gaia (unknown [95.146.230.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A05720809;
        Thu, 30 Jul 2020 10:09:26 +0000 (UTC)
Date:   Thu, 30 Jul 2020 11:09:23 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Marc Zyngier <maz@misterjones.org>
Cc:     Willy Tarreau <w@1wt.eu>, Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20200730100923.GE25149@gaia>
References: <20200730090828.2349e159@canb.auug.org.au>
 <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
 <202007292007.D87DBD34B@keescook>
 <20200730032250.GB7790@1wt.eu>
 <20200730061407.GA7941@1wt.eu>
 <102fc7a6fa4c2767879a6f911a9a16d5@misterjones.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <102fc7a6fa4c2767879a6f911a9a16d5@misterjones.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 30, 2020 at 10:59:09AM +0100, Marc Zyngier wrote:
> From 33d819f4efa0a4474b5dc2e4bcaef1b886ca30c3 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Thu, 30 Jul 2020 10:53:05 +0100
> Subject: [PATCH] arm64: Drop unnecessary include from asm/smp.h
> 
> asm/pointer_auth.h is not needed anymore in asm/smp.h, as 62a679cb2825
> ("arm64: simplify ptrauth initialization") removed the keys from the
> secondary_data structure.
> 
> This also cures a compilation issue introduced by f227e3ec3b5c
> ("random32: update the net random state on interrupt and activity").
> 
> Fixes: 62a679cb2825 ("arm64: simplify ptrauth initialization")
> Fixes: f227e3ec3b5c ("random32: update the net random state on interrupt and
> activity")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/smp.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index ea268d88b6f7..a0c8a0b65259 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -30,7 +30,6 @@
>  #include <linux/threads.h>
>  #include <linux/cpumask.h>
>  #include <linux/thread_info.h>
> -#include <asm/pointer_auth.h>
> 
>  DECLARE_PER_CPU_READ_MOSTLY(int, cpu_number);

I think this arm64 patch makes sense irrespective of any other generic
fixes. If Will wants to take it as a fix:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

(otherwise I'll queue it for 5.9)
