Return-Path: <linux-next+bounces-5814-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6916A647A6
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 10:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA0AA188DA9E
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 09:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C51221710;
	Mon, 17 Mar 2025 09:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Hd8HN8xt"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7E92E3373;
	Mon, 17 Mar 2025 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204342; cv=none; b=HKhJfX1KMMZhQ+kG2p+Wk+13PZy6uUzBvB2QgT7/are6hdfjnbmE7Tb4tkrO7kDh7XIqGtQE1C87AOvZbkfipt5Efd/ZHP85U2b5uHLOrYCH3d198lq2Wsi2Dmpsv58X42cUnQW4WK9jn/Oz8NfZ38wQsfTsdx0i+hteoCq86uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204342; c=relaxed/simple;
	bh=P83TY0gOs7vPUW/KjHn5qXlUWoTtrYzEJqZWCh5o4Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGaXaPjsV1fjgcTlwpDYoaAj9bohFje7K+7wiTWHbvL0FRdHi7WYctv6ET8vynrfO2ZEUNpGOjTA5s3wFEHACo9AT+RmS0X7T2sIaOPSCq6Y+mHhBKKI6jRgwGKbh7RBd7BSAQJq9znqoKFvulMumWyf1LwY/97IrfQuLcrW1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Hd8HN8xt; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EKUyx7KbRM5GU2Q4/TLVPYUhyMHFXhXGrBJE0yM5/N8=; b=Hd8HN8xtwy0CmVK217jVStXdr5
	A6CyiZLXDBX70gp7ve2I3ybOpcI5HNAj5avecq5MPFr+aDcgQflForxjuPOTmiPOcK1vP8HmWBIN6
	0tvFl470Sbvtzi8Fxxz+PEOmU8ptr0IhZ/Qx+8RT4bD/sfT9biqS2sL9ZzMum5XsLakbxlGZbJLtw
	gD1yBahkqG1Ge0/FwETgRdQzG/auzJJ/2POdPAX+VC6ajmX24cP4Xs0egMi/+XqopfR/WpCAHneKg
	IP4L3RqboWcBOgiAXfa+P42NJVwMzWTHT61gyaGFMSkV2dGxggEGky4GohSvQUlqxcsdg05tC+YgP
	NAyBe4Sw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6vx-00000003Pbq-0Lmd;
	Mon, 17 Mar 2025 09:38:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2F046300783; Mon, 17 Mar 2025 10:38:56 +0100 (CET)
Date: Mon, 17 Mar 2025 10:38:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, jirislaby@kernel.org,
	ubizjak@gmail.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250317093856.GA34541@noisy.programming.kicks-ass.net>
References: <20250304162402.475eb3bc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304162402.475eb3bc@canb.auug.org.au>

On Tue, Mar 04, 2025 at 04:25:31PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from include/asm-generic/percpu.h:7,
>                  from arch/x86/include/asm/percpu.h:597,
>                  from arch/x86/include/asm/preempt.h:6,
>                  from include/linux/preempt.h:79,
>                  from include/linux/spinlock.h:56,
>                  from include/linux/wait.h:9,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:7,
>                  from kernel/events/core.c:11:
> kernel/events/core.c: In function 'this_cpc':
> include/linux/percpu-defs.h:220:45: error: initialization from pointer to non-enclosed address space
>   220 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
>       |                                             ^
> include/linux/percpu-defs.h:251:9: note: in expansion of macro '__verify_pcpu_ptr'
>   251 |         __verify_pcpu_ptr(ptr);                                         \
>       |         ^~~~~~~~~~~~~~~~~
> kernel/events/core.c:1222:17: note: in expansion of macro 'this_cpu_ptr'
>  1222 |         return *this_cpu_ptr(pmu->cpu_pmu_context);
>       |                 ^~~~~~~~~~~~
> 
> (and many more similar)
> 
> Presumably caused by commit
> 
>   f67d1ffd841f ("perf/core: Detach 'struct perf_cpu_pmu_context' and 'struct pmu' lifetimes")
> 
> I have used the tip tree from next-20250303 for today.

Right. Sorry for not noticing before, and thanks Jiri for poking me.

So the below resolution make it go for me. The problem appears to be
that due to:

  bcecd5a529c1 ("percpu: repurpose __percpu tag as a named address space qualifier")

this makes that this_cpu_ptr() wants a '__percpu *', instead we feed it
'__percpu**' which confuses things.

What would be the best way around to getting this resolved, should I
stick the below in a fixup patch in tip/perf/core, or do we carry this
in a merge resolution somewhere?

diff --cc include/linux/perf_event.h
index 4d0b0b007498,76f4265efee9..000000000000
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@@ -343,7 -343,7 +343,7 @@@ struct pmu 
  	 */
  	unsigned int			scope;
  
- 	struct perf_cpu_pmu_context __percpu *cpu_pmu_context;
 -	struct perf_cpu_pmu_context __percpu **cpu_pmu_context;
++	struct perf_cpu_pmu_context * __percpu *cpu_pmu_context;
  	atomic_t			exclusive_cnt; /* < 0: cpu; > 0: tsk */
  	int				task_ctx_nr;
  	int				hrtimer_interval_ms;

