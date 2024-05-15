Return-Path: <linux-next+bounces-2311-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C55338C5FD3
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 06:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654871F21532
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 04:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038A923769;
	Wed, 15 May 2024 04:49:39 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CCE20314;
	Wed, 15 May 2024 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748578; cv=none; b=BasBgFotBsyaSgFRTFyQJgIguKzdfZ65qP81fNmg/3j3WF/EtaCJc6ARgXe/YN6FvlA0xIXnsFlQmjrkiiwo5tpPgNwOmPcKBkw2uxQlW8LYXiDIsQfXlQcs0lj5plPpf+LK7lr+DSavfr40rkm5hT8YCR5pwdJvHfWO8jf7vl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748578; c=relaxed/simple;
	bh=AVkqO/R8PDeeUExvLM3elvubZXwPS1QR3t18bGSbOlI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNYE9xoXlINlUOhIbyDhXu77+mqgVnqS7blFTLiL65n8Aseb4ZacZbZYOu6t9NDN+sd+KXh2QbQTSqwhAX/KVt2L0evt2S/w2WbHrNIGiefAHkQPfFZkG8K8Q6NMUfSd35dwCTLOoxY4iVo3vgYchwjoHkXnW3rF1/GhOFXdK64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3AAC116B1;
	Wed, 15 May 2024 04:49:38 +0000 (UTC)
Date: Wed, 15 May 2024 00:49:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Vincent Donnefort
 <vdonnefort@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240515004931.0d2e7af3@rorschach.local.home>
In-Reply-To: <20240515124808.06279d04@canb.auug.org.au>
References: <20240515124808.06279d04@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 May 2024 12:48:08 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:

Interesting, as I didn't get reports from it via zero-day bot.

> 
> In file included from arch/powerpc/include/asm/page.h:332,
>                  from arch/powerpc/include/asm/mmu.h:144,
>                  from arch/powerpc/include/asm/paca.h:18,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/thread_info.h:23,
>                  from include/asm-generic/preempt.h:5,
>                  from ./arch/powerpc/include/generated/asm/preempt.h:1,
>                  from include/linux/preempt.h:79,
>                  from include/linux/alloc_tag.h:11,
>                  from include/linux/percpu.h:5,
>                  from include/linux/context_tracking_state.h:5,
>                  from include/linux/hardirq.h:5,
>                  from include/linux/interrupt.h:11,
>                  from include/linux/trace_recursion.h:5,
>                  from kernel/trace/ring_buffer.c:7:
> kernel/trace/ring_buffer.c: In function '__rb_map_vma':
> kernel/trace/ring_buffer.c:6286:72: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
>  6286 |                 struct page *page = virt_to_page(cpu_buffer->subbuf_ids[s]);
>       |                                                  ~~~~~~~~~~~~~~~~~~~~~~^~~
>       |                                                                        |
>       |                                                                        long unsigned int
> include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
>    37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
>       |                                             ^~~
> kernel/trace/ring_buffer.c:6286:37: note: in expansion of macro 'virt_to_page'
>  6286 |                 struct page *page = virt_to_page(cpu_buffer->subbuf_ids[s]);
>       |                                     ^~~~~~~~~~~~
> arch/powerpc/include/asm/page.h:228:53: note: expected 'const void *' but argument is of type 'long unsigned int'
>   228 | static inline unsigned long virt_to_pfn(const void *kaddr)
>       |                                         ~~~~~~~~~~~~^~~~~
> 
> Introduced by commit
> 
>   117c39200d9d ("ring-buffer: Introducing ring-buffer mapping functions")
> 
> My arm multi_v7_defconfig build produced a similar warning.
> 
> Is this really intended for v6.10?  It seems a bit late.
> 

Well, I submitted this for the v6.9 merge window, and Linus had issues
with it. So we've been tweaking it for the entire time and it was ready
a bit earlier, but due to my vacation and traveling I missed pushing it
to next. :-p

Most the code has been well tested, but because it is late, I kept it
as a separate topic branch in case Linus still isn't happy with it.

-- Steve

