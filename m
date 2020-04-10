Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0821B1A49D7
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 20:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDJS3Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 14:29:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49610 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJS3Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 14:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=FX/3QFcTdrKudJcDN1R2Z/zq5kuQdI6zbrJMBXM0wi0=; b=a9dOcvBnd8cEvekZwdvbwpzUJq
        N/Le9UFPz7NUVQ8P/XPK7p/3vjlCC8kBzQf67+be9wP3IIjLtDz3rhPd5Z0k4Au8hZCHXcmcl0zpS
        ay4iCpF+i8wa/D83wq3VmcJ0af9LtSJTpf0MeHI9clf03mXwy8MSGfiPZf61S4sY1k6U/sgyYOhdZ
        TK639uBxBHqa5SJgPXkuyeUmAFBPIclWnhHbXnmTDLZGvrTqpQ4Y1R87g0B8TsR5H49pfeReYlpoM
        i+5vczv2ri/1x4JuMuTyf+Y0pZWhfPUmhLS6SRGV5PPFlNCxN7qnPW3J3k6K6TjuP0VDE432z+mq4
        yLB1kzOQ==;
Received: from [2601:1c0:6280:3f0::b79b]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jMyP6-0005Vp-K0; Fri, 10 Apr 2020 18:29:25 +0000
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20200410132706.170811b7@canb.auug.org.au>
 <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
 <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2b0f5d2e-3fe5-10c9-2a9a-9a0b341a52d5@infradead.org>
Date:   Fri, 10 Apr 2020 11:29:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/10/20 11:11 AM, Linus Torvalds wrote:
> On Fri, Apr 10, 2020 at 9:35 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> KASAN detects a use-after-free in _raw_spin_lock_irqsave while
>> running lib/test_printf.ko.
> 
> Btw, can you run these kinds of reports through scripts/decode_stacktrace.sh?
> 
> If you have debug info in your build, it will give much more
> meaningful backtraces with file names and line numbers (and points to
> inlining decisions etc too)

I have debug info.

> (For individual symbols, use scripts/faddr2line, but the
> decode_stacktrace script does them all in one go).

Yeah, I know about faddr2line but not this one.

> I wonder if these scripts aren't well enough known, I see a lot of raw
> dumps that could be immensely improved with a little scripting - but
> they need the original vmlinux binary with debug info, so you can't do
> it after-the-fact somewhere else..

[I found the script's help output not so helpful.]



[  561.003273] ==================================================================
[  561.007580] BUG: KASAN: use-after-free in _raw_spin_lock_irqsave (linux-next-20200410/rdd64/../include/linux/instrumented.h:71 linux-next-20200410/rdd64/../include/asm-generic/atomic-instrumented.h:695 linux-next-20200410/rdd64/../include/asm-generic/qspinlock.h:78 linux-next-20200410/rdd64/../include/linux/spinlock.h:194 linux-next-20200410/rdd64/../include/linux/spinlock_api_smp.h:119 linux-next-20200410/rdd64/../kernel/locking/spinlock.c:159) 
[  561.011846] Write of size 4 at addr ffff888126e96f30 by task modprobe/1454

[  561.019924] CPU: 0 PID: 1454 Comm: modprobe Not tainted 5.6.0-next-20200410 #1
[  561.023934] Hardware name: TOSHIBA PORTEGE R835/Portable PC, BIOS Version 4.10   01/08/2013
[  561.028001] Call Trace:
[  561.032034] dump_stack (linux-next-20200410/rdd64/../lib/dump_stack.c:120) 
[  561.036063] print_address_description.constprop.0 (linux-next-20200410/rdd64/../mm/kasan/report.c:383) 
[  561.040095] __kasan_report.cold (linux-next-20200410/rdd64/../mm/kasan/report.c:512) 
[  561.044120] ? fwnode_remove_software_node (linux-next-20200410/rdd64/../drivers/base/swnode.c:784) 
[  561.048090] ? load_module (linux-next-20200410/rdd64/../kernel/module.c:3874) 
[  561.052015] ? _raw_spin_lock_irqsave (linux-next-20200410/rdd64/../include/linux/instrumented.h:71 linux-next-20200410/rdd64/../include/asm-generic/atomic-instrumented.h:695 linux-next-20200410/rdd64/../include/asm-generic/qspinlock.h:78 linux-next-20200410/rdd64/../include/linux/spinlock.h:194 linux-next-20200410/rdd64/../include/linux/spinlock_api_smp.h:119 linux-next-20200410/rdd64/../kernel/locking/spinlock.c:159) 
[  561.055926] kasan_report (linux-next-20200410/rdd64/../arch/x86/include/asm/smap.h:69 linux-next-20200410/rdd64/../mm/kasan/common.c:629) 
[  561.059771] ? _raw_spin_lock_irqsave (linux-next-20200410/rdd64/../include/linux/instrumented.h:71 linux-next-20200410/rdd64/../include/asm-generic/atomic-instrumented.h:695 linux-next-20200410/rdd64/../include/asm-generic/qspinlock.h:78 linux-next-20200410/rdd64/../include/linux/spinlock.h:194 linux-next-20200410/rdd64/../include/linux/spinlock_api_smp.h:119 linux-next-20200410/rdd64/../kernel/locking/spinlock.c:159) 
[  561.063613] check_memory_region (linux-next-20200410/rdd64/../mm/kasan/generic.c:194) 
[  561.067400] __kasan_check_write (linux-next-20200410/rdd64/../mm/kasan/common.c:79) 
[  561.071144] _raw_spin_lock_irqsave (linux-next-20200410/rdd64/../include/linux/instrumented.h:71 linux-next-20200410/rdd64/../include/asm-generic/atomic-instrumented.h:695 linux-next-20200410/rdd64/../include/asm-generic/qspinlock.h:78 linux-next-20200410/rdd64/../include/linux/spinlock.h:194 linux-next-20200410/rdd64/../include/linux/spinlock_api_smp.h:119 linux-next-20200410/rdd64/../kernel/locking/spinlock.c:159) 
[  561.074868] ? _raw_write_unlock_bh (linux-next-20200410/rdd64/../kernel/locking/spinlock.c:158) 
[  561.078495] ? ida_destroy (linux-next-20200410/rdd64/../lib/idr.c:538) 
[  561.082144] ida_free (linux-next-20200410/rdd64/../lib/idr.c:495 (discriminator 2)) 
[  561.085694] ? fprop_new_period.cold (linux-next-20200410/rdd64/../lib/idr.c:486) 
[  561.089228] ? kasan_slab_free (linux-next-20200410/rdd64/../mm/kasan/common.c:466) 
[  561.092738] ? kfree (linux-next-20200410/rdd64/../mm/slub.c:1478 linux-next-20200410/rdd64/../mm/slub.c:3035 linux-next-20200410/rdd64/../mm/slub.c:4003) 
[  561.096183] software_node_release (linux-next-20200410/rdd64/../include/linux/list.h:132 linux-next-20200410/rdd64/../include/linux/list.h:146 linux-next-20200410/rdd64/../drivers/base/swnode.c:613) 
[  561.099644] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:697 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739) 
[  561.103109] kobject_del (linux-next-20200410/rdd64/../lib/kobject.c:629) 
[  561.106457] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:690 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739) 
[  561.109785] fwnode_remove_software_node (linux-next-20200410/rdd64/../drivers/base/swnode.c:784) 
[  561.113061] software_node_unregister_nodes (linux-next-20200410/rdd64/../drivers/base/swnode.c:721 (discriminator 2)) 
[  561.116274] test_printf_init (linux-next-20200410/rdd64/../lib/test_printf.c:685 linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.119483] ? test_hashed (linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.122639] ? __schedule (linux-next-20200410/rdd64/../kernel/sched/core.c:3367 linux-next-20200410/rdd64/../kernel/sched/core.c:4088) 
[  561.125785] ? _raw_spin_lock_bh (linux-next-20200410/rdd64/../kernel/locking/spinlock.c:150) 
[  561.128855] ? __kasan_check_write (linux-next-20200410/rdd64/../mm/kasan/common.c:79) 
[  561.131843] ? llist_add_batch (linux-next-20200410/rdd64/../lib/llist.c:33) 
[  561.134802] ? __irq_work_queue_local (linux-next-20200410/rdd64/../kernel/irq_work.c:57 linux-next-20200410/rdd64/../kernel/irq_work.c:53) 
[  561.137704] ? handle_cmd_completion (linux-next-20200410/rdd64/../drivers/usb/host/xhci-ring.c:279 linux-next-20200410/rdd64/../drivers/usb/host/xhci-ring.c:1172 linux-next-20200410/rdd64/../drivers/usb/host/xhci-ring.c:1478) 
[  561.140590] ? test_hashed (linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.143438] ? alloc_debug_processing (linux-next-20200410/rdd64/../mm/slub.c:1140) 
[  561.146186] ? recalibrate_cpu_khz (linux-next-20200410/rdd64/../arch/x86/include/asm/msr.h:236 linux-next-20200410/rdd64/../arch/x86/kernel/tsc.c:1087) 
[  561.148931] ? test_hashed (linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.151653] do_one_initcall (linux-next-20200410/rdd64/../init/main.c:1161) 
[  561.154347] ? initcall_blacklisted (linux-next-20200410/rdd64/../init/main.c:1152) 
[  561.157077] ? kasan_unpoison_shadow (linux-next-20200410/rdd64/../mm/kasan/common.c:147) 
[  561.159752] ? kasan_unpoison_shadow (linux-next-20200410/rdd64/../mm/kasan/common.c:147) 
[  561.162322] ? kasan_poison_shadow (linux-next-20200410/rdd64/../mm/kasan/common.c:132) 
[  561.164876] ? __asan_register_globals (linux-next-20200410/rdd64/../mm/kasan/generic.c:222 (discriminator 3)) 
[  561.167374] do_init_module (linux-next-20200410/rdd64/../kernel/module.c:3539) 
[  561.169828] load_module (linux-next-20200410/rdd64/../kernel/module.c:3890) 
[  561.172245] ? post_relocation (linux-next-20200410/rdd64/../kernel/module.c:3744) 
[  561.174601] ? __kasan_check_write (linux-next-20200410/rdd64/../mm/kasan/common.c:79) 
[  561.176943] ? kernel_read (linux-next-20200410/rdd64/../arch/x86/include/asm/bitops.h:55 linux-next-20200410/rdd64/../include/asm-generic/bitops/instrumented-atomic.h:29 linux-next-20200410/rdd64/../include/linux/thread_info.h:55 linux-next-20200410/rdd64/../arch/x86/include/asm/uaccess.h:33 linux-next-20200410/rdd64/../fs/read_write.c:442) 
[  561.179204] ? __kasan_check_write (linux-next-20200410/rdd64/../mm/kasan/common.c:79) 
[  561.181462] ? kernel_read_file (linux-next-20200410/rdd64/../arch/x86/include/asm/atomic.h:97 linux-next-20200410/rdd64/../include/asm-generic/atomic-instrumented.h:241 linux-next-20200410/rdd64/../include/linux/fs.h:2957 linux-next-20200410/rdd64/../include/linux/fs.h:2954 linux-next-20200410/rdd64/../fs/exec.c:964) 
[  561.183739] ? copy_strings_kernel (linux-next-20200410/rdd64/../fs/exec.c:901) 
[  561.185954] ? arch_get_unmapped_area (linux-next-20200410/rdd64/../arch/x86/kernel/sys_x86_64.c:171) 
[  561.188188] ? __fget_light (linux-next-20200410/rdd64/../fs/file.c:797 (discriminator 1)) 
[  561.190388] __do_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3980) 
[  561.192615] ? __do_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3980) 
[  561.194864] ? __do_sys_init_module (linux-next-20200410/rdd64/../kernel/module.c:3957) 
[  561.197063] ? randomize_stack_top (linux-next-20200410/rdd64/../mm/util.c:496) 
[  561.199276] ? find_mergeable_anon_vma (linux-next-20200410/rdd64/../mm/mmap.c:1556) 
[  561.201481] ? ext4_llseek (linux-next-20200410/rdd64/../fs/ext4/file.c:850) 
[  561.203705] __x64_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3956) 
[  561.205923] do_syscall_64 (linux-next-20200410/rdd64/../arch/x86/entry/common.c:295) 
[  561.208149] entry_SYSCALL_64_after_hwframe (linux-next-20200410/rdd64/../arch/x86/entry/entry_64.S:184) 
[  561.210390] RIP: 0033:0x7fda31c50f59
[ 561.212642] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 4f 0c 00 f7 d8 64 89 01 48
All code
========
   0:	00 c3                	add    %al,%bl
   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   9:	00 00 00 
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d 07 4f 0c 00 	mov    0xc4f07(%rip),%rcx        # 0xc4f41
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d 07 4f 0c 00 	mov    0xc4f07(%rip),%rcx        # 0xc4f17
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[  561.217689] RSP: 002b:00007fff946ee448 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  561.220334] RAX: ffffffffffffffda RBX: 000055f0c1400a20 RCX: 00007fda31c50f59
[  561.223023] RDX: 0000000000000000 RSI: 000055f0bf4543b0 RDI: 0000000000000003
[  561.225722] RBP: 0000000000040000 R08: 0000000000000000 R09: 000055f0c1400930
[  561.228448] R10: 0000000000000003 R11: 0000000000000246 R12: 000055f0bf4543b0
[  561.231176] R13: 0000000000000000 R14: 000055f0c1400ac0 R15: 000055f0c1400a20

[  561.236503] Allocated by task 1454:
[  561.239160] save_stack (linux-next-20200410/rdd64/../mm/kasan/common.c:50) 
[  561.241784] __kasan_kmalloc.constprop.0 (linux-next-20200410/rdd64/../mm/kasan/common.c:57 linux-next-20200410/rdd64/../mm/kasan/common.c:495 linux-next-20200410/rdd64/../mm/kasan/common.c:468) 
[  561.244446] kasan_kmalloc (linux-next-20200410/rdd64/../mm/kasan/common.c:510) 
[  561.247117] swnode_register (linux-next-20200410/rdd64/../drivers/base/swnode.c:639) 
[  561.249771] software_node_register (linux-next-20200410/rdd64/../include/linux/err.h:60 linux-next-20200410/rdd64/../drivers/base/swnode.c:740) 
[  561.252432] software_node_register_nodes (linux-next-20200410/rdd64/../drivers/base/swnode.c:700) 
[  561.255104] test_printf_init (linux-next-20200410/rdd64/../lib/test_printf.c:612 linux-next-20200410/rdd64/../lib/test_printf.c:670 linux-next-20200410/rdd64/../lib/test_printf.c:683 linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.257767] do_one_initcall (linux-next-20200410/rdd64/../init/main.c:1161) 
[  561.260417] do_init_module (linux-next-20200410/rdd64/../kernel/module.c:3539) 
[  561.263071] load_module (linux-next-20200410/rdd64/../kernel/module.c:3890) 
[  561.265683] __do_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3980) 
[  561.268319] __x64_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3956) 
[  561.270958] do_syscall_64 (linux-next-20200410/rdd64/../arch/x86/entry/common.c:295) 
[  561.273552] entry_SYSCALL_64_after_hwframe (linux-next-20200410/rdd64/../arch/x86/entry/entry_64.S:184) 

[  561.278921] Freed by task 1454:
[  561.281558] save_stack (linux-next-20200410/rdd64/../mm/kasan/common.c:50) 
[  561.284221] __kasan_slab_free (linux-next-20200410/rdd64/../mm/kasan/common.c:458) 
[  561.286897] kasan_slab_free (linux-next-20200410/rdd64/../mm/kasan/common.c:466) 
[  561.289528] kfree (linux-next-20200410/rdd64/../mm/slub.c:1478 linux-next-20200410/rdd64/../mm/slub.c:3035 linux-next-20200410/rdd64/../mm/slub.c:4003) 
[  561.292183] software_node_release (linux-next-20200410/rdd64/../drivers/base/swnode.c:624) 
[  561.294865] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:697 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739) 
[  561.297501] kobject_del (linux-next-20200410/rdd64/../lib/kobject.c:629) 
[  561.300154] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:690 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739) 
[  561.302784] kobject_del (linux-next-20200410/rdd64/../lib/kobject.c:629) 
[  561.305344] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:690 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739) 
[  561.307914] fwnode_remove_software_node (linux-next-20200410/rdd64/../drivers/base/swnode.c:784) 
[  561.310468] software_node_unregister_nodes (linux-next-20200410/rdd64/../drivers/base/swnode.c:721 (discriminator 2)) 
[  561.313074] test_printf_init (linux-next-20200410/rdd64/../lib/test_printf.c:685 linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.315695] do_one_initcall (linux-next-20200410/rdd64/../init/main.c:1161) 
[  561.318284] do_init_module (linux-next-20200410/rdd64/../kernel/module.c:3539) 
[  561.320892] load_module (linux-next-20200410/rdd64/../kernel/module.c:3890) 
[  561.323465] __do_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3980) 
[  561.326048] __x64_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3956) 
[  561.328625] do_syscall_64 (linux-next-20200410/rdd64/../arch/x86/entry/common.c:295) 
[  561.331206] entry_SYSCALL_64_after_hwframe (linux-next-20200410/rdd64/../arch/x86/entry/entry_64.S:184) 

[  561.336199] The buggy address belongs to the object at ffff888126e96ec8
which belongs to the cache kmalloc-192 of size 192
[  561.340919] The buggy address is located 104 bytes inside of
192-byte region [ffff888126e96ec8, ffff888126e96f88)
[  561.345544] The buggy address belongs to the page:
[  561.347907] page:ffffea00049ba500 refcount:1 mapcount:0 mapping:00000000485a8f09 index:0xffff888126e95ba8 head:ffffea00049ba500 order:2 compound_mapcount:0 compound_pincount:0
[  561.353112] flags: 0x17ff000000010200(slab|head)
[  561.355769] raw: 17ff000000010200 ffffea0004955e08 ffff888128003850 ffff88812800cb40
[  561.358488] raw: ffff888126e95ba8 00000000001e0013 00000001ffffffff 0000000000000000
[  561.361283] page dumped because: kasan: bad access detected

[  561.366841] Memory state around the buggy address:
[  561.369622]  ffff888126e96e00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  561.372510]  ffff888126e96e80: fc fc fc fc fc fc fc fc fc fb fb fb fb fb fb fb
[  561.375395] >ffff888126e96f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  561.378230]                                      ^
[  561.381074]  ffff888126e96f80: fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  561.383996]  ffff888126e97000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  561.386894] ==================================================================
[  561.389814] Disabling lock debugging due to kernel taint
[  561.392774] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  561.395803] #PF: supervisor read access in kernel mode
[  561.398809] #PF: error_code(0x0000) - not-present page
[  561.401806] PGD 0 P4D 0
[  561.404796] Oops: 0000 [#1] PREEMPT SMP KASAN PTI
[  561.407830] CPU: 0 PID: 1454 Comm: modprobe Tainted: G    B             5.6.0-next-20200410 #1
[  561.410964] Hardware name: TOSHIBA PORTEGE R835/Portable PC, BIOS Version 4.10   01/08/2013
[  561.414158] RIP: 0010:ida_free (linux-next-20200410/rdd64/../arch/x86/include/asm/bitops.h:218 linux-next-20200410/rdd64/../include/asm-generic/bitops/instrumented-non-atomic.h:111 linux-next-20200410/rdd64/../lib/idr.c:508) 
[ 561.417350] Code: 89 c8 be 08 00 00 00 48 89 8d 30 ff ff ff 48 c1 f8 06 49 8d 7c c5 00 48 89 bd 28 ff ff ff e8 69 a1 cf ff 48 8b 8d 30 ff ff ff <49> 0f a3 4d 00 48 89 8d 30 ff ff ff 72 5d 49 8b 7f 90 4c 89 f6 e8
All code
========
   0:	89 c8                	mov    %ecx,%eax
   2:	be 08 00 00 00       	mov    $0x8,%esi
   7:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
   e:	48 c1 f8 06          	sar    $0x6,%rax
  12:	49 8d 7c c5 00       	lea    0x0(%r13,%rax,8),%rdi
  17:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  1e:	e8 69 a1 cf ff       	callq  0xffffffffffcfa18c
  23:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
  2a:*	49 0f a3 4d 00       	bt     %rcx,0x0(%r13)		<-- trapping instruction
  2f:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
  36:	72 5d                	jb     0x95
  38:	49 8b 7f 90          	mov    -0x70(%r15),%rdi
  3c:	4c 89 f6             	mov    %r14,%rsi
  3f:	e8                   	.byte 0xe8

Code starting with the faulting instruction
===========================================
   0:	49 0f a3 4d 00       	bt     %rcx,0x0(%r13)
   5:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
   c:	72 5d                	jb     0x6b
   e:	49 8b 7f 90          	mov    -0x70(%r15),%rdi
  12:	4c 89 f6             	mov    %r14,%rsi
  15:	e8                   	.byte 0xe8
[  561.424256] RSP: 0018:ffff888119d074c8 EFLAGS: 00010002
[  561.427790] RAX: 0000000000000001 RBX: 1ffff110233a0e9c RCX: 0000000000000000
[  561.431384] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000000000000000
[  561.435022] RBP: ffff888119d075a8 R08: 0000000000000001 R09: ffffed10233a0e8d
[  561.438693] R10: 0000000000000008 R11: ffffed10233a0e8c R12: 0000000000000000
[  561.442377] R13: 0000000000000000 R14: 0000000000000246 R15: ffff888119d07580
[  561.446080] FS:  00007fda31b2b740(0000) GS:ffff888128c00000(0000) knlGS:0000000000000000
[  561.449825] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  561.453542] CR2: 0000000000000000 CR3: 0000000126304006 CR4: 00000000000606f0
[  561.457345] Call Trace:
[  561.461233] ? fprop_new_period.cold (linux-next-20200410/rdd64/../lib/idr.c:486) 
[  561.465047] ? kasan_slab_free (linux-next-20200410/rdd64/../mm/kasan/common.c:466) 
[  561.468853] ? kfree (linux-next-20200410/rdd64/../mm/slub.c:1478 linux-next-20200410/rdd64/../mm/slub.c:3035 linux-next-20200410/rdd64/../mm/slub.c:4003) 
[  561.472615] software_node_release (linux-next-20200410/rdd64/../include/linux/list.h:132 linux-next-20200410/rdd64/../include/linux/list.h:146 linux-next-20200410/rdd64/../drivers/base/swnode.c:613) 
[  561.476409] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:697 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739) 
[  561.480181] kobject_del (linux-next-20200410/rdd64/../lib/kobject.c:629) 
[  561.483898] kobject_put (linux-next-20200410/rdd64/../lib/kobject.c:690 linux-next-20200410/rdd64/../lib/kobject.c:722 linux-next-20200410/rdd64/../include/linux/kref.h:65 linux-next-20200410/rdd64/../lib/kobject.c:739) 
[  561.487543] fwnode_remove_software_node (linux-next-20200410/rdd64/../drivers/base/swnode.c:784) 
[  561.491215] software_node_unregister_nodes (linux-next-20200410/rdd64/../drivers/base/swnode.c:721 (discriminator 2)) 
[  561.494881] test_printf_init (linux-next-20200410/rdd64/../lib/test_printf.c:685 linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.498519] ? test_hashed (linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.502049] ? __schedule (linux-next-20200410/rdd64/../kernel/sched/core.c:3367 linux-next-20200410/rdd64/../kernel/sched/core.c:4088) 
[  561.505384] ? _raw_spin_lock_bh (linux-next-20200410/rdd64/../kernel/locking/spinlock.c:150) 
[  561.508716] ? __kasan_check_write (linux-next-20200410/rdd64/../mm/kasan/common.c:79) 
[  561.511978] ? llist_add_batch (linux-next-20200410/rdd64/../lib/llist.c:33) 
[  561.515202] ? __irq_work_queue_local (linux-next-20200410/rdd64/../kernel/irq_work.c:57 linux-next-20200410/rdd64/../kernel/irq_work.c:53) 
[  561.518387] ? handle_cmd_completion (linux-next-20200410/rdd64/../drivers/usb/host/xhci-ring.c:279 linux-next-20200410/rdd64/../drivers/usb/host/xhci-ring.c:1172 linux-next-20200410/rdd64/../drivers/usb/host/xhci-ring.c:1478) 
[  561.521556] ? test_hashed (linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.524751] ? alloc_debug_processing (linux-next-20200410/rdd64/../mm/slub.c:1140) 
[  561.527886] ? recalibrate_cpu_khz (linux-next-20200410/rdd64/../arch/x86/include/asm/msr.h:236 linux-next-20200410/rdd64/../arch/x86/kernel/tsc.c:1087) 
[  561.531042] ? test_hashed (linux-next-20200410/rdd64/../lib/test_printf.c:688) test_printf
[  561.534221] do_one_initcall (linux-next-20200410/rdd64/../init/main.c:1161) 
[  561.537361] ? initcall_blacklisted (linux-next-20200410/rdd64/../init/main.c:1152) 
[  561.540483] ? kasan_unpoison_shadow (linux-next-20200410/rdd64/../mm/kasan/common.c:147) 
[  561.543632] ? kasan_unpoison_shadow (linux-next-20200410/rdd64/../mm/kasan/common.c:147) 
[  561.546724] ? kasan_poison_shadow (linux-next-20200410/rdd64/../mm/kasan/common.c:132) 
[  561.549743] ? __asan_register_globals (linux-next-20200410/rdd64/../mm/kasan/generic.c:222 (discriminator 3)) 
[  561.552733] do_init_module (linux-next-20200410/rdd64/../kernel/module.c:3539) 
[  561.555672] load_module (linux-next-20200410/rdd64/../kernel/module.c:3890) 
[  561.558602] ? post_relocation (linux-next-20200410/rdd64/../kernel/module.c:3744) 
[  561.561528] ? __kasan_check_write (linux-next-20200410/rdd64/../mm/kasan/common.c:79) 
[  561.564450] ? kernel_read (linux-next-20200410/rdd64/../arch/x86/include/asm/bitops.h:55 linux-next-20200410/rdd64/../include/asm-generic/bitops/instrumented-atomic.h:29 linux-next-20200410/rdd64/../include/linux/thread_info.h:55 linux-next-20200410/rdd64/../arch/x86/include/asm/uaccess.h:33 linux-next-20200410/rdd64/../fs/read_write.c:442) 
[  561.567317] ? __kasan_check_write (linux-next-20200410/rdd64/../mm/kasan/common.c:79) 
[  561.570134] ? kernel_read_file (linux-next-20200410/rdd64/../arch/x86/include/asm/atomic.h:97 linux-next-20200410/rdd64/../include/asm-generic/atomic-instrumented.h:241 linux-next-20200410/rdd64/../include/linux/fs.h:2957 linux-next-20200410/rdd64/../include/linux/fs.h:2954 linux-next-20200410/rdd64/../fs/exec.c:964) 
[  561.572895] ? copy_strings_kernel (linux-next-20200410/rdd64/../fs/exec.c:901) 
[  561.575513] ? arch_get_unmapped_area (linux-next-20200410/rdd64/../arch/x86/kernel/sys_x86_64.c:171) 
[  561.578030] ? __fget_light (linux-next-20200410/rdd64/../fs/file.c:797 (discriminator 1)) 
[  561.580480] __do_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3980) 
[  561.582928] ? __do_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3980) 
[  561.585367] ? __do_sys_init_module (linux-next-20200410/rdd64/../kernel/module.c:3957) 
[  561.587809] ? randomize_stack_top (linux-next-20200410/rdd64/../mm/util.c:496) 
[  561.590199] ? find_mergeable_anon_vma (linux-next-20200410/rdd64/../mm/mmap.c:1556) 
[  561.592587] ? ext4_llseek (linux-next-20200410/rdd64/../fs/ext4/file.c:850) 
[  561.594939] __x64_sys_finit_module (linux-next-20200410/rdd64/../kernel/module.c:3956) 
[  561.597238] do_syscall_64 (linux-next-20200410/rdd64/../arch/x86/entry/common.c:295) 
[  561.599497] entry_SYSCALL_64_after_hwframe (linux-next-20200410/rdd64/../arch/x86/entry/entry_64.S:184) 
[  561.601768] RIP: 0033:0x7fda31c50f59
[ 561.604006] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 4f 0c 00 f7 d8 64 89 01 48
All code
========
   0:	00 c3                	add    %al,%bl
   2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   9:	00 00 00 
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	48 89 f8             	mov    %rdi,%rax
  14:	48 89 f7             	mov    %rsi,%rdi
  17:	48 89 d6             	mov    %rdx,%rsi
  1a:	48 89 ca             	mov    %rcx,%rdx
  1d:	4d 89 c2             	mov    %r8,%r10
  20:	4d 89 c8             	mov    %r9,%r8
  23:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
  28:	0f 05                	syscall 
  2a:*	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax		<-- trapping instruction
  30:	73 01                	jae    0x33
  32:	c3                   	retq   
  33:	48 8b 0d 07 4f 0c 00 	mov    0xc4f07(%rip),%rcx        # 0xc4f41
  3a:	f7 d8                	neg    %eax
  3c:	64 89 01             	mov    %eax,%fs:(%rcx)
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
   6:	73 01                	jae    0x9
   8:	c3                   	retq   
   9:	48 8b 0d 07 4f 0c 00 	mov    0xc4f07(%rip),%rcx        # 0xc4f17
  10:	f7 d8                	neg    %eax
  12:	64 89 01             	mov    %eax,%fs:(%rcx)
  15:	48                   	rex.W
[  561.609039] RSP: 002b:00007fff946ee448 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  561.611681] RAX: ffffffffffffffda RBX: 000055f0c1400a20 RCX: 00007fda31c50f59
[  561.614350] RDX: 0000000000000000 RSI: 000055f0bf4543b0 RDI: 0000000000000003
[  561.617066] RBP: 0000000000040000 R08: 0000000000000000 R09: 000055f0c1400930
[  561.619806] R10: 0000000000000003 R11: 0000000000000246 R12: 000055f0bf4543b0
[  561.622505] R13: 0000000000000000 R14: 000055f0c1400ac0 R15: 000055f0c1400a20
[  561.625213] Modules linked in: test_printf(+) test_bitfield test_list_sort test_string btrfs blake2b_generic uvcvideo xor zstd_decompress zstd_compress videobuf2_vmalloc xxhash videobuf2_memops raid6_pq videobuf2_v4l2 libcrc32c videodev videobuf2_common x86_pkg_temp_thermal [last unloaded: test_firmware]
[  561.631178] CR2: 0000000000000000
[  561.634214] ---[ end trace 0fb795f377a49e0a ]---
[  561.637280] RIP: 0010:ida_free (linux-next-20200410/rdd64/../arch/x86/include/asm/bitops.h:218 linux-next-20200410/rdd64/../include/asm-generic/bitops/instrumented-non-atomic.h:111 linux-next-20200410/rdd64/../lib/idr.c:508) 
[ 561.640345] Code: 89 c8 be 08 00 00 00 48 89 8d 30 ff ff ff 48 c1 f8 06 49 8d 7c c5 00 48 89 bd 28 ff ff ff e8 69 a1 cf ff 48 8b 8d 30 ff ff ff <49> 0f a3 4d 00 48 89 8d 30 ff ff ff 72 5d 49 8b 7f 90 4c 89 f6 e8
All code
========
   0:	89 c8                	mov    %ecx,%eax
   2:	be 08 00 00 00       	mov    $0x8,%esi
   7:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
   e:	48 c1 f8 06          	sar    $0x6,%rax
  12:	49 8d 7c c5 00       	lea    0x0(%r13,%rax,8),%rdi
  17:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  1e:	e8 69 a1 cf ff       	callq  0xffffffffffcfa18c
  23:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
  2a:*	49 0f a3 4d 00       	bt     %rcx,0x0(%r13)		<-- trapping instruction
  2f:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
  36:	72 5d                	jb     0x95
  38:	49 8b 7f 90          	mov    -0x70(%r15),%rdi
  3c:	4c 89 f6             	mov    %r14,%rsi
  3f:	e8                   	.byte 0xe8

Code starting with the faulting instruction
===========================================
   0:	49 0f a3 4d 00       	bt     %rcx,0x0(%r13)
   5:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
   c:	72 5d                	jb     0x6b
   e:	49 8b 7f 90          	mov    -0x70(%r15),%rdi
  12:	4c 89 f6             	mov    %r14,%rsi
  15:	e8                   	.byte 0xe8
[  561.647015] RSP: 0018:ffff888119d074c8 EFLAGS: 00010002
[  561.650388] RAX: 0000000000000001 RBX: 1ffff110233a0e9c RCX: 0000000000000000
[  561.653835] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000000000000000
[  561.657248] RBP: ffff888119d075a8 R08: 0000000000000001 R09: ffffed10233a0e8d
[  561.660683] R10: 0000000000000008 R11: ffffed10233a0e8c R12: 0000000000000000
[  561.664139] R13: 0000000000000000 R14: 0000000000000246 R15: ffff888119d07580
[  561.667587] FS:  00007fda31b2b740(0000) GS:ffff888128c00000(0000) knlGS:0000000000000000
[  561.671117] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  561.674632] CR2: 0000000000000000 CR3: 0000000126304006 CR4: 00000000000606f0
[  561.678258] note: modprobe[1454] exited with preempt_count 1





-- 
~Randy
