Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3FEA35DDA9
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 13:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236737AbhDMLWb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 07:22:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231374AbhDMLW3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Apr 2021 07:22:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B9D4613AB;
        Tue, 13 Apr 2021 11:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618312930;
        bh=g+Amr+H6gpQzOmh2GqQCzZ+IAJiCYARTeXychT5XtQw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sf3YGn4uk2N3C3JzIqhU4R+Eury8HX1qFGok8bBk/9fItimrUXvaqUy/VtGwVa1Lg
         WBAz4+a8B8OTyrif9/oU3RF09oNDzrZ5nRJYp+SEYHnXYp/p6yRcRMrCaYfTeIzSIM
         xplyhVdC4D/0NI3vXjpRUd0aQPjtPJv4neca6vFtONfZLx4ttqdwPjVL8fJGQ8i+m1
         DIEyOEhhjz0X9qXL+I8LEJ+admeF3/vCYAnmSa1PQXrbcp5v/dsRAdoo/6cfsnWsW+
         MFCvb2pv8PnDsGSeFMXTHG521GH+SboYWPAxSS83QrxCphwoxO5y9JVhrpYn6cYVar
         5vbbozq5SO49A==
Received: by mail-oi1-f180.google.com with SMTP id x77so7254781oix.8;
        Tue, 13 Apr 2021 04:22:10 -0700 (PDT)
X-Gm-Message-State: AOAM532ec/OHI45CL8fvfmInbZfr99MX2KgPF4Jkcy5qjYrIZVJ+INDi
        gx/S9+PagpaoYoBEH9j/NyJU3Yq5G80a+c1Q+Zo=
X-Google-Smtp-Source: ABdhPJxHJu1n1Zki/tBkBHJoZcQlKLeFNnkHd7jV3/qdFkWLAWoB316ByyIxvRqq+W3RkxUZb0weJjx7RBqmW6VB1UE=
X-Received: by 2002:a05:6808:4c3:: with SMTP id a3mr2875863oie.174.1618312929483;
 Tue, 13 Apr 2021 04:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210413154305.49442969@canb.auug.org.au>
In-Reply-To: <20210413154305.49442969@canb.auug.org.au>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 13 Apr 2021 13:21:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFfYizfBKRKne8L0Uc0B0uobxaLRUv+pnCaqAE3mrAJfg@mail.gmail.com>
Message-ID: <CAMj1kXFfYizfBKRKne8L0Uc0B0uobxaLRUv+pnCaqAE3mrAJfg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 13 Apr 2021 at 07:43, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the kvm-arm tree got a conflict in:
>
>   arch/arm64/include/asm/assembler.h
>
> between commits:
>
>   27248fe1abb2 ("arm64: assembler: remove conditional NEON yield macros")
>   13150149aa6d ("arm64: fpsimd: run kernel mode NEON with softirqs disabled")
>
> from the arm64 tree

Those patches are on a topic branch 'for-next/neon-softirqs-disabled'
in the arm64 tree, so probably best to just pull that into kvm-arm and
fix the conflicts there.

> and commits:
>
>   8f4de66e247b ("arm64: asm: Provide set_sctlr_el2 macro")
>   755db23420a1 ("KVM: arm64: Generate final CTR_EL0 value when running in Protected mode")
>
> from the kvm-arm tree.
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
>
> diff --cc arch/arm64/include/asm/assembler.h
> index ab569b0b45fc,34ddd8a0f3dd..000000000000
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@@ -15,7 -15,7 +15,8 @@@
>   #include <asm-generic/export.h>
>
>   #include <asm/asm-offsets.h>
>  +#include <asm/alternative.h>
> + #include <asm/asm-bug.h>
>   #include <asm/cpufeature.h>
>   #include <asm/cputype.h>
>   #include <asm/debug-monitors.h>
> @@@ -701,25 -705,95 +714,33 @@@ USER(\label, ic ivau, \tmp2)                    // inval
>         isb
>   .endm
>
> + .macro set_sctlr_el1, reg
> +       set_sctlr sctlr_el1, \reg
> + .endm
> +
> + .macro set_sctlr_el2, reg
> +       set_sctlr sctlr_el2, \reg
> + .endm
> +
>  -/*
>  - * Check whether to yield to another runnable task from kernel mode NEON code
>  - * (which runs with preemption disabled).
>  - *
>  - * if_will_cond_yield_neon
>  - *        // pre-yield patchup code
>  - * do_cond_yield_neon
>  - *        // post-yield patchup code
>  - * endif_yield_neon    <label>
>  - *
>  - * where <label> is optional, and marks the point where execution will resume
>  - * after a yield has been performed. If omitted, execution resumes right after
>  - * the endif_yield_neon invocation. Note that the entire sequence, including
>  - * the provided patchup code, will be omitted from the image if
>  - * CONFIG_PREEMPTION is not defined.
>  - *
>  - * As a convenience, in the case where no patchup code is required, the above
>  - * sequence may be abbreviated to
>  - *
>  - * cond_yield_neon <label>
>  - *
>  - * Note that the patchup code does not support assembler directives that change
>  - * the output section, any use of such directives is undefined.
>  - *
>  - * The yield itself consists of the following:
>  - * - Check whether the preempt count is exactly 1 and a reschedule is also
>  - *   needed. If so, calling of preempt_enable() in kernel_neon_end() will
>  - *   trigger a reschedule. If it is not the case, yielding is pointless.
>  - * - Disable and re-enable kernel mode NEON, and branch to the yield fixup
>  - *   code.
>  - *
>  - * This macro sequence may clobber all CPU state that is not guaranteed by the
>  - * AAPCS to be preserved across an ordinary function call.
>  - */
>  -
>  -      .macro          cond_yield_neon, lbl
>  -      if_will_cond_yield_neon
>  -      do_cond_yield_neon
>  -      endif_yield_neon        \lbl
>  -      .endm
>  -
>  -      .macro          if_will_cond_yield_neon
>  -#ifdef CONFIG_PREEMPTION
>  -      get_current_task        x0
>  -      ldr             x0, [x0, #TSK_TI_PREEMPT]
>  -      sub             x0, x0, #PREEMPT_DISABLE_OFFSET
>  -      cbz             x0, .Lyield_\@
>  -      /* fall through to endif_yield_neon */
>  -      .subsection     1
>  -.Lyield_\@ :
>  -#else
>  -      .section        ".discard.cond_yield_neon", "ax"
>  -#endif
>  -      .endm
>  -
>  -      .macro          do_cond_yield_neon
>  -      bl              kernel_neon_end
>  -      bl              kernel_neon_begin
>  -      .endm
>  -
>  -      .macro          endif_yield_neon, lbl
>  -      .ifnb           \lbl
>  -      b               \lbl
>  -      .else
>  -      b               .Lyield_out_\@
>  -      .endif
>  -      .previous
>  -.Lyield_out_\@ :
>  -      .endm
>  -
>         /*
>  -       * Check whether preempt-disabled code should yield as soon as it
>  -       * is able. This is the case if re-enabling preemption a single
>  -       * time results in a preempt count of zero, and the TIF_NEED_RESCHED
>  -       * flag is set. (Note that the latter is stored negated in the
>  -       * top word of the thread_info::preempt_count field)
>  +       * Check whether preempt/bh-disabled asm code should yield as soon as
>  +       * it is able. This is the case if we are currently running in task
>  +       * context, and either a softirq is pending, or the TIF_NEED_RESCHED
>  +       * flag is set and re-enabling preemption a single time would result in
>  +       * a preempt count of zero. (Note that the TIF_NEED_RESCHED flag is
>  +       * stored negated in the top word of the thread_info::preempt_count
>  +       * field)
>          */
>  -      .macro          cond_yield, lbl:req, tmp:req
>  -#ifdef CONFIG_PREEMPTION
>  +      .macro          cond_yield, lbl:req, tmp:req, tmp2:req
>         get_current_task \tmp
>         ldr             \tmp, [\tmp, #TSK_TI_PREEMPT]
>  +      /*
>  +       * If we are serving a softirq, there is no point in yielding: the
>  +       * softirq will not be preempted no matter what we do, so we should
>  +       * run to completion as quickly as we can.
>  +       */
>  +      tbnz            \tmp, #SOFTIRQ_SHIFT, .Lnoyield_\@
>  +#ifdef CONFIG_PREEMPTION
>         sub             \tmp, \tmp, #PREEMPT_DISABLE_OFFSET
>         cbz             \tmp, \lbl
>   #endif
