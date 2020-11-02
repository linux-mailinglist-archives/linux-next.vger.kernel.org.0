Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9872A30B0
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 18:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgKBQ74 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 11:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38446 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727144AbgKBQ74 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 11:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604336393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rHVYEC3R+uL573dvI+j4hkedOtk/gLNvawdX1RWFrcw=;
        b=Hxi78QSZK0I/JbW+2DPHSaalmxOrAtA1itz6l4HxCpspoPQYp41puQgUZXU7OLLNExHmgB
        /Sr1KokXKheA/0LovMMZGo/Wz8POIj9YUu++TnV30NiNjEeYHjpwr2TKj0YiHmyPXBWgN3
        WJ4pe8hOLK5V9iiZF4JkPFUoz2385DQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455--bP4TOxmPhmyCstV3q6kOg-1; Mon, 02 Nov 2020 11:59:48 -0500
X-MC-Unique: -bP4TOxmPhmyCstV3q6kOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F4DA8030CE;
        Mon,  2 Nov 2020 16:59:46 +0000 (UTC)
Received: from ovpn-112-12.rdu2.redhat.com (ovpn-112-12.rdu2.redhat.com [10.10.112.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A70CA5579F;
        Mon,  2 Nov 2020 16:59:41 +0000 (UTC)
Message-ID: <362e3645e2c0891309c07e244a147f0c32f106da.camel@redhat.com>
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
From:   Qian Cai <cai@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 02 Nov 2020 11:59:41 -0500
In-Reply-To: <20201101173153.GC9375 () osiris>
References: <20201101173153.GC9375 () osiris>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, 2020-11-01 at 17:31 +0000, Heiko Carstens wrote:
> On Thu, Oct 29, 2020 at 10:21:11AM -0600, Jens Axboe wrote:
> > Wire up TIF_NOTIFY_SIGNAL handling for s390.
> > 
> > Cc: linux-s390@vger.kernel.org
> > Signed-off-by: Jens Axboe <axboe@kernel.dk>

Even though I did confirm that today's linux-next contains this additional patch
from Heiko below, a z10 guest is still unable to boot. Reverting the whole
series (reverting only "s390: add support for TIF_NOTIFY_SIGNAL" introduced
compiling errors) fixed the problem, i.e., git revert --no-edit
af0dd809f3d3..7b074c15374c [1]

.config: https://cailca.coding.net/public/linux/mm/git/files/master/s390.config

01: [    3.284902] systemd[1]: systemd 239 (239-40.el8) running in system mode. 
01: (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +
01: GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR
01: E2 default-hierarchy=legacy)                                                
01: [    3.285558] systemd[1]: Detected virtualization zvm.                     
01: [    3.285585] systemd[1]: Detected architecture s390x.                     
01: [    3.285618] systemd[1]: Running in initial RAM disk.                     
01: [    3.376459] systemd[1]: Set hostname to <ibm-z-137.rhts.eng.bos.redhat.co
01: m>.                                                                         
01: [    3.464950] mkdir (45) used greatest stack depth: 57824 bytes left       
01:                                                                             
01: Welcome to [0;34mRed Hat Enterprise Linux 8.3 (Ootpa) dracut-049-95.git20200
01: 804.el8 (Initramfs)[0m!                                                     
01:                                                                             
00: [   87.908107] random: crng init done     
                                     
01: [  490.492263] INFO: task (sd-executor):42 can't die for more than 368 secon
01: ds.                                                                         
01: [  490.492303] task:(sd-executor)   state:R  running task     stack:58984 pi
01: d:   42 ppid:     1 flags:0x00000002                                        
01: [  490.492359] Call Trace:                                                  
01: [  490.492382]  [<00000000163f0652>] __schedule+0xa12/0x1840                
01: [  490.492391]  [<00000000163f1562>] schedule+0xe2/0x310
(inlined by) __preempt_count_add at arch/s390/include/asm/preempt.h:56
(discriminator 1)
(inlined by) __preempt_count_sub at arch/s390/include/asm/preempt.h:63
(discriminator 1)
(inlined by) schedule at kernel/sched/core.c:4602 (discriminator 1)
01: [  490.492399]  [<000000001640390a>] system_call+0xe2/0x278
system_call at arch/s390/kernel/entry.S:424
01: [  490.492407] no locks held by (sd-executor)/42.                           
01: [  490.492420]                                                              
01: [  490.492420] Showing all locks held in the system:                        
01: [  490.492438] 1 lock held by khungtaskd/25:                                
01: [  490.492445]  #0: 0000000016b92c80 (rcu_read_lock){....}-{1:2}, at: rcu_lo
01: ck_acquire.constprop.54+0x0/0x50                                            
01: [  490.492481]                                                              
01: [  490.492488] =============================================                
01: [  490.492488]

[1]:
7b074c15374c io_uring: remove 'twa_signal_ok' deadlock work-around
eb48a0f216fa kernel: remove checking for TIF_NOTIFY_SIGNAL
c634e6b63a81 signal: kill JOBCTL_TASK_WORK
f8b667db31a3 io_uring: JOBCTL_TASK_WORK is no longer used by task_work
c50eb9d59bb1 task_work: remove legacy TWA_SIGNAL path
1d48c8d6d71e xtensa: add support for TIF_NOTIFY_SIGNAL
8ef9c750c5a1 um: add support for TIF_NOTIFY_SIGNAL
3f242a158b7c sparc: add support for TIF_NOTIFY_SIGNAL
40c7ac5c4790 sh: add support for TIF_NOTIFY_SIGNAL
5e59963ed1ac riscv: add support for TIF_NOTIFY_SIGNAL
9333d15595e8 openrisc: add support for TIF_NOTIFY_SIGNAL
c34f87ae2e81 nds32: add support for TIF_NOTIFY_SIGNAL
27af2ca0cdda microblaze: add support for TIF_NOTIFY_SIGNAL
ef1863c4081e ia64: add support for TIF_NOTIFY_SIGNAL
58d670021acc hexagon: add support for TIF_NOTIFY_SIGNAL
1facd6bf079c h8300: add support for TIF_NOTIFY_SIGNAL
1b81145fc28d csky: add support for TIF_NOTIFY_SIGNAL
bbc8d03c0bf3 c6x: add support for TIF_NOTIFY_SIGNAL
6cbc413682ac arm: add support for TIF_NOTIFY_SIGNAL
e9822185daa1 alpha: add support for TIF_NOTIFY_SIGNAL
4c3d9c3b415a s390: add support for TIF_NOTIFY_SIGNAL
d0772a4d9367 mips: add support for TIF_NOTIFY_SIGNAL
07246df9ebe4 powerpc: add support for TIF_NOTIFY_SIGNAL
9edbc08ce909 parisc: add support for TIF_NOTIFY_SIGNAL
c96152dd9c01 nios32: add support for TIF_NOTIFY_SIGNAL
89d22e3adff3 m68k: add support for TIF_NOTIFY_SIGNAL
3db7550a998c arm64: add support for TIF_NOTIFY_SIGNAL
9161d936d1ff arc: add support for TIF_NOTIFY_SIGNAL
fdb5f027ce66 task_work: use TIF_NOTIFY_SIGNAL if available
323b0fba756d x86: wire up TIF_NOTIFY_SIGNAL
a1a5bc3e8659 kernel: add support for TIF_NOTIFY_SIGNAL
c0947f6b6ed2 kernel: add task_sigpending() helper

> > ---
> > 
> > 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> > for details:
> > 
> > https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> > 
> > As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> > as that will enable a set of cleanups once all of them support it. I'm
> > happy carrying this patch if need be, or it can be funelled through the
> > arch tree. Let me know.
> > 
> >  arch/s390/include/asm/thread_info.h | 2 ++
> >  arch/s390/kernel/entry.S            | 7 ++++++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/s390/include/asm/thread_info.h
> > b/arch/s390/include/asm/thread_info.h
> > index 13a04fcf7762..0045341ade48 100644
> > --- a/arch/s390/include/asm/thread_info.h
> > +++ b/arch/s390/include/asm/thread_info.h
> > @@ -65,6 +65,7 @@ void arch_setup_new_exec(void);
> >  #define TIF_GUARDED_STORAGE	4	/* load guarded storage control
> > block */
> >  #define TIF_PATCH_PENDING	5	/* pending live patching update */
> >  #define TIF_PGSTE		6	/* New mm's will use 4K page tables */
> > +#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
> >  #define TIF_ISOLATE_BP		8	/* Run process with isolated BP */
> >  #define TIF_ISOLATE_BP_GUEST	9	/* Run KVM guests with isolated BP
> > */
> >  
> > @@ -82,6 +83,7 @@ void arch_setup_new_exec(void);
> >  #define TIF_SYSCALL_TRACEPOINT	27	/* syscall tracepoint
> > instrumentation */
> >  
> >  #define _TIF_NOTIFY_RESUME	BIT(TIF_NOTIFY_RESUME)
> > +#define _TIF_NOTIFY_SIGNAL	BIT(TIF_NOTIFY_SIGNAL)
> >  #define _TIF_SIGPENDING		BIT(TIF_SIGPENDING)
> >  #define _TIF_NEED_RESCHED	BIT(TIF_NEED_RESCHED)
> >  #define _TIF_UPROBE		BIT(TIF_UPROBE)
> > diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
> > index 86235919c2d1..a30d891e8045 100644
> > --- a/arch/s390/kernel/entry.S
> > +++ b/arch/s390/kernel/entry.S
> > @@ -52,7 +52,8 @@ STACK_SIZE  = 1 << STACK_SHIFT
> >  STACK_INIT = STACK_SIZE - STACK_FRAME_OVERHEAD - __PT_SIZE
> >  
> >  _TIF_WORK	= (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NEED_RESCHED | \
> > -		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING)
> > +		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING | \
> > +		   _TIF_NOTIFY_SIGNAL)
> >  _TIF_TRACE	= (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP | \
> >  		   _TIF_SYSCALL_TRACEPOINT)
> >  _CIF_WORK	= (_CIF_ASCE_PRIMARY | _CIF_ASCE_SECONDARY | _CIF_FPU)
> > @@ -463,6 +464,8 @@ ENTRY(system_call)
> >  #endif
> >  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
> >  	jo	.Lsysc_syscall_restart
> > +	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
> > +	jo	.Lsysc_sigpending
> >  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
> >  	jo	.Lsysc_sigpending
> >  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
> > @@ -857,6 +860,8 @@ ENTRY(io_int_handler)
> >  #endif
> >  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
> >  	jo	.Lio_sigpending
> > +	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
> > +	jo	.Lio_sigpending
> >  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
> >  	jo	.Lio_notify_resume
> >  	TSTMSK	__TI_flags(%r12),_TIF_GUARDED_STORAGE
> 
> (full quote so you can make sense of the patch below).
> 
> Please merge the patch below into this one. With that:
> 
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> 
> diff --git a/arch/s390/kernel/entry.S b/arch/s390/kernel/entry.S
> index a30d891e8045..31f16d903ef3 100644
> --- a/arch/s390/kernel/entry.S
> +++ b/arch/s390/kernel/entry.S
> @@ -464,9 +464,7 @@ ENTRY(system_call)
>  #endif
>  	TSTMSK	__PT_FLAGS(%r11),_PIF_SYSCALL_RESTART
>  	jo	.Lsysc_syscall_restart
> -	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
> -	jo	.Lsysc_sigpending
> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
>  	jo	.Lsysc_sigpending
>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>  	jo	.Lsysc_notify_resume
> @@ -858,9 +856,7 @@ ENTRY(io_int_handler)
>  	TSTMSK	__TI_flags(%r12),_TIF_PATCH_PENDING
>  	jo	.Lio_patch_pending
>  #endif
> -	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
> -	jo	.Lio_sigpending
> -	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_SIGNAL
> +	TSTMSK	__TI_flags(%r12),(_TIF_SIGPENDING|_TIF_NOTIFY_SIGNAL)
>  	jo	.Lio_sigpending
>  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
>  	jo	.Lio_notify_resum

