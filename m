Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121C42886D0
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 12:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387616AbgJIKYr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 06:24:47 -0400
Received: from foss.arm.com ([217.140.110.172]:47226 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387598AbgJIKYo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 06:24:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CCC2D6E;
        Fri,  9 Oct 2020 03:24:43 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.51.22])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 759393F66B;
        Fri,  9 Oct 2020 03:24:41 -0700 (PDT)
Date:   Fri, 9 Oct 2020 11:24:38 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Will Deacon <will@kernel.org>
Cc:     Qian Cai <cai@redhat.com>, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        James Morse <james.morse@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] arm64: initialize per-cpu offsets earlier
Message-ID: <20201009102438.GB87530@C02TD0UTHF1T.local>
References: <20201005164303.21389-1-mark.rutland@arm.com>
 <711bc57a314d8d646b41307008db2845b7537b3d.camel@redhat.com>
 <20201009085115.GC29594@willie-the-truck>
 <20201009094318.GA87530@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009094318.GA87530@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 09, 2020 at 10:43:18AM +0100, Mark Rutland wrote:
> Hi Qian,
> 
> On Fri, Oct 09, 2020 at 09:51:15AM +0100, Will Deacon wrote:
> > On Thu, Oct 08, 2020 at 09:18:24PM -0400, Qian Cai wrote:
> > > On Mon, 2020-10-05 at 17:43 +0100, Mark Rutland wrote:
> > > > The current initialization of the per-cpu offset register is difficult
> > > > to follow and this initialization is not always early enough for
> > > > upcoming instrumentation with KCSAN, where the instrumentation callbacks
> > > > use the per-cpu offset.
> > > > 
> > > > To make it possible to support KCSAN, and to simplify reasoning about
> > > > early bringup code, let's initialize the per-cpu offset earlier, before
> > > > we run any C code that may consume it. To do so, this patch adds a new
> > > > init_this_cpu_offset() helper that's called before the usual
> > > > primary/secondary start functions. For consistency, this is also used to
> > > > re-initialize the per-cpu offset after the runtime per-cpu areas have
> > > > been allocated (which can change CPU0's offset).
> > > > 
> > > > So that init_this_cpu_offset() isn't subject to any instrumentation that
> > > > might consume the per-cpu offset, it is marked with noinstr, preventing
> > > > instrumentation.
> > > > 
> > > > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > Cc: James Morse <james.morse@arm.com>
> > > > Cc: Will Deacon <will@kernel.org>
> > > 
> > > Reverting this commit on the top of today's linux-next fixed an issue that
> > > Thunder X2 is unable to boot:
> > > 
> > > .config: https://gitlab.com/cailca/linux-mm/-/blob/master/arm64.config
> 
> Sorry about this. :/
> 
> Will, to save you reading all the below, I think the right thing to do
> for now is to revert this.


> Looking at the assembly, task_cpu() gets instrumented (which puts this
> patch on dodgy ground generally and I think warrants the revert), but as
> it's instrumented with KASAN_INLINE that doesn't immediately explain the
> issue since the shadow should be up and so we shouldn't call the report
> function. I'll dig into this some more.

Ok; that's my fault due to trying to do this before kasan_early_init.

I see what's going on now. If you're happy to take a fixup instead of a
revert, patch below. Otherwise I'll a complete patch atop of the revert
after rc1.

Thanks,
Mark.

---->8----
From e93fcb9649c9ccfbea9a6f17b68280420685ddc5 Mon Sep 17 00:00:00 2001
From: Mark Rutland <mark.rutland@arm.com>
Date: Fri, 9 Oct 2020 11:06:32 +0100
Subject: [PATCH] arm64: fix per-cpu offset initialization

Qian sees a boot-time hang introduced by commit:

  353e228eb355be5a ("arm64: initialize per-cpu offsets earlier")

... which happens because task_cpu() can be instrumented by KASAN, and
we call init_this_cpu_offset() before we've performed the early KASAN
initialization.

We don't need to initialize the per-cpu offset before the early KASAN
initialization runs (and we didn't prior to the patch in question), so
we can avoid bothering with that.

However, were task_cpu() instrumented with something else, this could
cause similar issues, so let's also open-code that within
init_this_cpu_offset() to avoid that possibility.

It's also possible that set_my_cpu_offset() gets instrumented in
future, so let's avoid that by marking it __always_inline. It's only
used by init_this_cpu_offset(), so this doesn't matter for any other
code.

Finally, per_cpu_offset(x) is a macro expanding to __per_cpu_offset[x],
which is inlined and not instrumented.

Fixes: 353e228eb355be5a ("arm64: initialize per-cpu offsets earlier")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reported-by:  Qian Cai <cai@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 2 +-
 arch/arm64/kernel/head.S        | 2 --
 arch/arm64/kernel/setup.c       | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 0b6409b89e5e0..0c347d3faf55c 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -11,7 +11,7 @@
 #include <asm/cmpxchg.h>
 #include <asm/stack_pointer.h>
 
-static inline void set_my_cpu_offset(unsigned long off)
+static __always_inline void set_my_cpu_offset(unsigned long off)
 {
 	asm volatile(ALTERNATIVE("msr tpidr_el1, %0",
 				 "msr tpidr_el2, %0",
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index e28c9d4e5278c..9bbea14a9ca3f 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -448,8 +448,6 @@ SYM_FUNC_START_LOCAL(__primary_switched)
 	bl	__pi_memset
 	dsb	ishst				// Make zero page visible to PTW
 
-	bl	init_this_cpu_offset
-
 #ifdef CONFIG_KASAN
 	bl	kasan_early_init
 #endif
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 005171972764b..161eaa83264ea 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -278,7 +278,7 @@ EXPORT_SYMBOL_GPL(cpu_logical_map);
 
 void noinstr init_this_cpu_offset(void)
 {
-	unsigned int cpu = task_cpu(current);
+	unsigned int cpu = current->cpu;
 	set_my_cpu_offset(per_cpu_offset(cpu));
 }
 
-- 
2.11.0

