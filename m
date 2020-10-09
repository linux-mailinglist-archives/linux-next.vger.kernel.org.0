Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6BD288638
	for <lists+linux-next@lfdr.de>; Fri,  9 Oct 2020 11:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733101AbgJIJnf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Oct 2020 05:43:35 -0400
Received: from foss.arm.com ([217.140.110.172]:46284 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbgJIJne (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Oct 2020 05:43:34 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B141ED6E;
        Fri,  9 Oct 2020 02:43:33 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.51.22])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB13A3F66B;
        Fri,  9 Oct 2020 02:43:31 -0700 (PDT)
Date:   Fri, 9 Oct 2020 10:43:18 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Will Deacon <will@kernel.org>
Cc:     Qian Cai <cai@redhat.com>, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        James Morse <james.morse@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] arm64: initialize per-cpu offsets earlier
Message-ID: <20201009094318.GA87530@C02TD0UTHF1T.local>
References: <20201005164303.21389-1-mark.rutland@arm.com>
 <711bc57a314d8d646b41307008db2845b7537b3d.camel@redhat.com>
 <20201009085115.GC29594@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009085115.GC29594@willie-the-truck>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Qian,

On Fri, Oct 09, 2020 at 09:51:15AM +0100, Will Deacon wrote:
> On Thu, Oct 08, 2020 at 09:18:24PM -0400, Qian Cai wrote:
> > On Mon, 2020-10-05 at 17:43 +0100, Mark Rutland wrote:
> > > The current initialization of the per-cpu offset register is difficult
> > > to follow and this initialization is not always early enough for
> > > upcoming instrumentation with KCSAN, where the instrumentation callbacks
> > > use the per-cpu offset.
> > > 
> > > To make it possible to support KCSAN, and to simplify reasoning about
> > > early bringup code, let's initialize the per-cpu offset earlier, before
> > > we run any C code that may consume it. To do so, this patch adds a new
> > > init_this_cpu_offset() helper that's called before the usual
> > > primary/secondary start functions. For consistency, this is also used to
> > > re-initialize the per-cpu offset after the runtime per-cpu areas have
> > > been allocated (which can change CPU0's offset).
> > > 
> > > So that init_this_cpu_offset() isn't subject to any instrumentation that
> > > might consume the per-cpu offset, it is marked with noinstr, preventing
> > > instrumentation.
> > > 
> > > Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: James Morse <james.morse@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > 
> > Reverting this commit on the top of today's linux-next fixed an issue that
> > Thunder X2 is unable to boot:
> > 
> > .config: https://gitlab.com/cailca/linux-mm/-/blob/master/arm64.config

Sorry about this. :/

Will, to save you reading all the below, I think the right thing to do
for now is to revert this.

Building with that config, I see a boot time-hang on the primary CPU
under QEMU TCG, with or without VHE (in both cases, a stuck in a
recursive synchronous exception). With the patch reverted, the kernel
boots.

Looking at the assembly, task_cpu() gets instrumented (which puts this
patch on dodgy ground generally and I think warrants the revert), but as
it's instrumented with KASAN_INLINE that doesn't immediately explain the
issue since the shadow should be up and so we shouldn't call the report
function. I'll dig into this some more.

Assembly dumps below; for init_this_cpu_offset the reference to
page_wait_table+0x4d00 is generating the address for __per_cpu_offset,
but objdump doesn't have enough info to resolve that nicely.

| ffffa00011143bc0 <init_this_cpu_offset>:
| ffffa00011143bc0:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
| ffffa00011143bc4:       d5384100        mrs     x0, sp_el0
| ffffa00011143bc8:       910003fd        mov     x29, sp
| ffffa00011143bcc:       97bb29b9        bl      ffffa0001000e2b0 <task_cpu>
| ffffa00011143bd0:       f0004ea1        adrp    x1, ffffa00011b1a000 <page_wait_table+0x4d00>
| ffffa00011143bd4:       913c6021        add     x1, x1, #0xf18
| ffffa00011143bd8:       f8605820        ldr     x0, [x1, w0, uxtw #3]
| ffffa00011143bdc:       97bb29b1        bl      ffffa0001000e2a0 <set_my_cpu_offset>
| ffffa00011143be0:       a8c17bfd        ldp     x29, x30, [sp], #16
| ffffa00011143be4:       d65f03c0        ret

| ffffa0001000e2b0 <task_cpu>:
| ffffa0001000e2b0:       a9be7bfd        stp     x29, x30, [sp, #-32]!
| ffffa0001000e2b4:       d2d40001        mov     x1, #0xa00000000000             // #175921860444160
| ffffa0001000e2b8:       f2fbffe1        movk    x1, #0xdfff, lsl #48
| ffffa0001000e2bc:       910003fd        mov     x29, sp
| ffffa0001000e2c0:       f9000bf3        str     x19, [sp, #16]
| ffffa0001000e2c4:       aa0003f3        mov     x19, x0
| ffffa0001000e2c8:       91012000        add     x0, x0, #0x48
| ffffa0001000e2cc:       52800062        mov     w2, #0x3                        // #3
| ffffa0001000e2d0:       d343fc03        lsr     x3, x0, #3
| ffffa0001000e2d4:       38e16861        ldrsb   w1, [x3, x1]
| ffffa0001000e2d8:       7100003f        cmp     w1, #0x0
| ffffa0001000e2dc:       7a411041        ccmp    w2, w1, #0x1, ne  // ne = any
| ffffa0001000e2e0:       540000aa        b.ge    ffffa0001000e2f4 <task_cpu+0x44>  // b.tcont
| ffffa0001000e2e4:       b9404a60        ldr     w0, [x19, #72]
| ffffa0001000e2e8:       f9400bf3        ldr     x19, [sp, #16]
| ffffa0001000e2ec:       a8c27bfd        ldp     x29, x30, [sp], #32
| ffffa0001000e2f0:       d65f03c0        ret
| ffffa0001000e2f4:       9415af1f        bl      ffffa00010579f70 <__asan_report_load4_noabort>
| ffffa0001000e2f8:       17fffffb        b       ffffa0001000e2e4 <task_cpu+0x34>
| ffffa0001000e2fc:       d503201f        nop

| ffffa0001000e2a0 <set_my_cpu_offset>:
| ffffa0001000e2a0:       d518d080        msr     tpidr_el1, x0
| ffffa0001000e2a4:       d65f03c0        ret
| ffffa0001000e2a8:       d503201f        nop
| ffffa0001000e2ac:       d503201f        nop

Thanks,
Mark.
