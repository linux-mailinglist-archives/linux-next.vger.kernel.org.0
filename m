Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2827E28E1E0
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 16:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388859AbgJNOFX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 10:05:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:54482 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgJNOFX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 10:05:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1602684320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mY/jXV1h2vn/yDJei6QHbZyP772jxPE6iwtk0iRyK60=;
        b=WmTxaImszTjWybIZukJ87mgRlpd4VdvnDTBkoR2Z0jFgqH+u2C6sSvsMgjUh9t1olvUM7r
        XUSZj3/Bx0BEFWKzuuH/A6oN4SInAjhIr8A08+gr0RUQCz3YpyMfMPQ1VoezndrXWQRU7A
        L5PEIctmmazm1AKVhFIVLk6ZH3GcVlg=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AC177AD6B;
        Wed, 14 Oct 2020 14:05:20 +0000 (UTC)
Date:   Wed, 14 Oct 2020 16:05:14 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: BUG: KASAN: global-out-of-bounds in vprintk_store on x86_64
Message-ID: <20201014140514.GB17231@alley>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 2020-10-14 16:19:18, Naresh Kamboju wrote:
> While testing LTP controllers testing on x86_64 KASAN enabled linux
> next 20201013 tag
> kernel this kernel BUG noticed. The oom-killer log also noticed while
> running tests.
> 
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git commit: f2fb1afc57304f9dd68c20a08270e287470af2eb
>   git describe: next-20201013
>   make_kernelversion: 5.9.0
>   kernel-config:
> https://builds.tuxbuild.com/TXP6cqokP8BCYJrv7zf6kw/kernel.config
> 
> 
> steps to reproduce:
> -------------------------
> # cd /opt/ltp
> # ./runltp  -f controllers
> 
> Crash log:
> --------------
> [  221.921944] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=c,mems_allowed=0,oom_memcg=/0,task_memcg=in

This is the last string stored in the ring buffer before KASAN trigerred.

> [  221.922108] ==================================================================
> [  221.922111] BUG: KASAN: global-out-of-bounds in vprintk_store+0x362/0x3d0
> [  221.922112] Write of size 2 at addr ffffffffba51dbcd by task
> memcg_test_1/11282

My guess is that the size 2 is related to the string "in" from the
above line. It is likely done by

void pr_cont_kernfs_path(struct kernfs_node *kn)
{
[...]
    pr_cont("%s", kernfs_pr_cont_buf);

called from

void mem_cgroup_print_oom_context(struct mem_cgroup *memcg, struct
task_struct *p)
{
[...]
	if (p) {
		pr_cont(",task_memcg=");
		pr_cont_cgroup_path(task_cgroup(p, memory_cgrp_id));


> [  221.922113]
> [  221.922114] CPU: 1 PID: 11282 Comm: memcg_test_1 Not tainted
> 5.9.0-next-20201013 #1
> [  221.922116] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> 2.0b 07/27/2017
> [  221.922116] Call Trace:
> [  221.922117]  dump_stack+0xa4/0xd9
> [  221.922118]  print_address_description.constprop.0+0x21/0x210
> [  221.922119]  ? _raw_write_lock_bh+0xe0/0xe0
> [  221.922120]  ? vprintk_store+0x362/0x3d0
> [  221.922121]  kasan_report.cold+0x37/0x7c
> [  221.922122]  ? vprintk_store+0x362/0x3d0
> [  221.922123]  check_memory_region+0x18c/0x1f0
> [  221.922124]  memcpy+0x3c/0x60
> [  221.922125]  vprintk_store+0x362/0x3d0

It seems that vprintk() store was able to extend the last string
by the two characters. So this is likely:

static size_t log_output(int facility, int level, enum log_flags lflags,
			 const struct dev_printk_info *dev_info,
			 char *text, size_t text_len)
{
[...]
		if (prb_reserve_in_last(&e, prb, &r, caller_id, LOG_LINE_MAX)) {
			memcpy(&r.text_buf[r.info->text_len], text, text_len);

But very likely the two characters were copied to wrong location.
There are many similar lines in the full log and they always contain

    task_memcg=/0

It means that the size of the path is 2 characters but it should be
"/0". I guess that "in" was in the log buffer from the previous
wrap.

So, it seems that prb_reserve_in_last() correctly updated the size
of the extended record but it returned wrong pointer to the buffer
or wrong current length.

Anyway, prb_commit(&e) moved the buffer back to consistent state.

> [  221.922125]  ? __ia32_sys_syslog+0x50/0x50
> [  221.922126]  ? _raw_spin_lock_irqsave+0x9b/0x100
> [  221.922127]  ? _raw_spin_lock_irq+0xf0/0xf0
> [  221.922128]  ? __kasan_check_write+0x14/0x20
> [  221.922129]  vprintk_emit+0x8d/0x1f0
> [  221.922130]  vprintk_default+0x1d/0x20
> [  221.922131]  vprintk_func+0x5a/0x100
> [  221.922132]  printk+0xb2/0xe3
> [  221.922133]  ? swsusp_write.cold+0x189/0x189
> [  221.922134]  ? kernfs_vfs_xattr_set+0x60/0x60
> [  221.922134]  ? _raw_write_lock_bh+0xe0/0xe0
> [  221.922135]  ? trace_hardirqs_on+0x38/0x100
> [  221.922136]  pr_cont_kernfs_path.cold+0x49/0x4b
> [  221.922137]  mem_cgroup_print_oom_context.cold+0x74/0xc3
> [  221.922138]  dump_header+0x340/0x3bf
> [  221.922139]  oom_kill_process.cold+0xb/0x10
> [  221.922140]  out_of_memory+0x1e9/0x860
> [  221.922141]  ? oom_killer_disable+0x210/0x210
> [  221.922142]  mem_cgroup_out_of_memory+0x198/0x1c0
> [  221.922143]  ? mem_cgroup_count_precharge_pte_range+0x250/0x250
> [  221.922144]  try_charge+0xa9b/0xc50
> [  221.922145]  ? arch_stack_walk+0x9e/0xf0
> [  221.922146]  ? memory_high_write+0x230/0x230
> [  221.922146]  ? avc_has_extended_perms+0x830/0x830
> [  221.922147]  ? stack_trace_save+0x94/0xc0
> [  221.922148]  ? stack_trace_consume_entry+0x90/0x90
> [  221.922149]  __memcg_kmem_charge+0x73/0x120
> [  221.922150]  ? cred_has_capability+0x10f/0x200
> [  221.922151]  ? mem_cgroup_can_attach+0x260/0x260
> [  221.922152]  ? selinux_sb_eat_lsm_opts+0x2f0/0x2f0
> [  221.922153]  ? obj_cgroup_charge+0x16b/0x220
> [  221.922154]  ? kmem_cache_alloc+0x78/0x4c0
> [  221.922155]  obj_cgroup_charge+0x122/0x220
> [  221.922156]  ? vm_area_alloc+0x20/0x90
> [  221.922156]  kmem_cache_alloc+0x78/0x4c0
> [  221.922157]  vm_area_alloc+0x20/0x90
> [  221.922158]  mmap_region+0x3ed/0x9a0
> [  221.922159]  ? cap_mmap_addr+0x1d/0x80
> [  221.922160]  do_mmap+0x3ee/0x720
> [  221.922161]  vm_mmap_pgoff+0x16a/0x1c0
> [  221.922162]  ? randomize_stack_top+0x90/0x90
> [  221.922163]  ? copy_page_range+0x1980/0x1980
> [  221.922163]  ksys_mmap_pgoff+0xab/0x350
> [  221.922164]  ? find_mergeable_anon_vma+0x110/0x110
> [  221.922165]  ? __audit_syscall_entry+0x1a6/0x1e0
> [  221.922166]  __x64_sys_mmap+0x8d/0xb0
> [  221.922167]  do_syscall_64+0x38/0x50
> [  221.922168]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  221.922169] RIP: 0033:0x7fe8f5e75103
> [  221.922172] Code: 54 41 89 d4 55 48 89 fd 53 4c 89 cb 48 85 ff 74
> 56 49 89 d9 45 89 f8 45 89 f2 44 89 e2 4c 89 ee 48 89 ef b8 09 00 00
> 00 0f 05 <48> 3d 00 f0 ff ff 77 7d 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66
> 2e 0f
> [  221.922173] RSP: 002b:00007ffd38c90198 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000009
> [  221.922175] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fe8f5e75103
> [  221.922176] RDX: 0000000000000003 RSI: 0000000000001000 RDI: 0000000000000000
> [  221.922178] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [  221.922179] R10: 0000000000002022 R11: 0000000000000246 R12: 0000000000000003
> [  221.922180] R13: 0000000000001000 R14: 0000000000002022 R15: 0000000000000000
> [  221.922181]
> [  213O[  221.922182] The buggy address belongs to the variable:
> [  221.922183]  clear_seq+0x2d/0x40

I am slightly confused by this.

The address ffffffffba51dbcd seems to be from the range of
"module mapping space" adresses.

"clear_seq" is static variable from kernel/printk/printk.c.
I would expect that it is built-in and thus in the range
"kernel text mapping".

Anyway, the variable is defined as:

       static u64 clear_seq;

The size should be 8B. I wonder where 0x2d/0x40 comes from.

Well, it probaly is not important. I guess that there is a bug
somewhere in prb_reserve_in_last().


> [  221.922183]
> [  221.922184] Memory state around the buggy address:
> [  221.922185]  ffffffffba51da80: 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00
> [  221.922187]  ffffffffba51db00: 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00
> [  221.922188] >ffffffffba51db80: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
> 00 f9 f9 f9
> [  221.922189]                                               ^
> [  221.922190]  ffffffffba51dc00: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
> 00 f9 f9 f9
> [  221.922191]  ffffffffba51dc80: f9 f9 f9 f9 01 f9 f9 f9 f9 f9 f9 f9
> 00 f9 f9 f9
> [  221.922193] ==================================================================
> [  221.922194] Disabling lock debugging due to kernel taint
> [  221.922196] ,task=memcg_test_1,pid=11280,uid=0

This is the rest of the line that should have been concatenated. It
means that the code.

> [  221.922205] Memory cgroup out of memory: Killed process 11280
> (memcg_test_1) total-vm:4124kB, anon-rss:72kB, file-rss:0kB,
> shmem-rss:0kB, UID:0 pgtables:48kB oom_score_adj:0
> [  221.922509] memcg_test_1 invoked oom-killer:
> gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
> [  222.885676] CPU: 2 PID: 11283 Comm: memcg_test_1 Tainted: G    B
>          5.9.0-next-20201013 #1
> [  222.885678] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> 2.0b 07/27/2017
> [  222.885679] Call Trace:
> [  222.885683]  dump_stack+0xa4/0xd9
> [  222.885686]  dump_header+0x8f/0x3bf
> [  222.885689]  oom_kill_process.cold+0xb/0x10
> [  222.885692]  out_of_memory+0x1e9/0x860
> [  222.885697]  ? oom_killer_disable+0x210/0x210
> [  222.923728]  mem_cgroup_out_of_memory+0x198/0x1c0
> [  222.923731]  ? mem_cgroup_count_precharge_pte_range+0x250/0x250

The OOM is likely expected. It seems that the test is testing OOM
situations in memcg code.

I am going to dig more into it.

Best Regards,
Petr
