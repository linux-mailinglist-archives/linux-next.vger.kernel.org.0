Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8C311A488A
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 18:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgDJQfR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 12:35:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41586 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgDJQfR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 12:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=TRThMvJrJ77BRGLmP5EFduvk56mVkGjYXB6C0FefVGw=; b=loHYXk5QKTzVFvXXiCTSSmhLTi
        ZBBS+2tyqOVzWFKaeFEjo60p6hzQRofgwU8i0aNMvy+JCckCisbBmDIBb5Nxar7KeIqP/0eUKGOnH
        26j6RDyUx8EUx9rM/p/Y371sxDIzXIhcd0rI+Ik390O7RZ6t5gu15XX3mOj79B9mHVLRMylWswUjs
        R9gkhmeLQsO1oVlvh5sAjWehMtu2VBHVHovBfM2WEj+ELTBWgiDqz9Mk3AoWgunwDIHW8yZxWoyGO
        YrXROe1LUUAMLCa9dN9DgDRon48rancPGxBDj8J4U4Jnh2MFkrDUyzdjlbSFajQ8bW2xH9G4nzJ2I
        PfB7pDng==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jMwcd-0002i6-4V; Fri, 10 Apr 2020 16:35:15 +0000
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20200410132706.170811b7@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
Date:   Fri, 10 Apr 2020 09:35:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410132706.170811b7@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/9/20 8:27 PM, Stephen Rothwell wrote:
> Hi all,
> 
> The merge window has opened, so please do not add any material for the
> next release into your linux-next included trees/branches until after
> the merge window closes.
> 
> Changes since 20200409:
> 
> Non-merge commits (relative to Linus' tree): 1117
>  1196 files changed, 28228 insertions(+), 10145 deletions(-)
> 
> ----------------------------------------------------------------------------

Hi,

KASAN detects a use-after-free in _raw_spin_lock_irqsave while
running lib/test_printf.ko.

[  561.003273] ==================================================================
[  561.007580] BUG: KASAN: use-after-free in _raw_spin_lock_irqsave+0x75/0xe0
[  561.011846] Write of size 4 at addr ffff888126e96f30 by task modprobe/1454

[  561.019924] CPU: 0 PID: 1454 Comm: modprobe Not tainted 5.6.0-next-20200410 #1
[  561.023934] Hardware name: TOSHIBA PORTEGE R835/Portable PC, BIOS Version 4.10   01/08/2013
[  561.028001] Call Trace:
[  561.032034]  dump_stack+0x7d/0xaa
[  561.036063]  print_address_description.constprop.0+0x1f/0x280
[  561.040095]  __kasan_report.cold+0x78/0xd3
[  561.044120]  ? fwnode_remove_software_node+0x3b/0x40
[  561.048090]  ? load_module+0x1b21/0x1fd0
[  561.052015]  ? _raw_spin_lock_irqsave+0x75/0xe0
[  561.055926]  kasan_report+0x41/0x60
[  561.059771]  ? _raw_spin_lock_irqsave+0x75/0xe0
[  561.063613]  check_memory_region+0x18c/0x1f0
[  561.067400]  __kasan_check_write+0x14/0x20
[  561.071144]  _raw_spin_lock_irqsave+0x75/0xe0
[  561.074868]  ? _raw_write_unlock_bh+0x30/0x30
[  561.078495]  ? ida_destroy+0x1a9/0x220
[  561.082144]  ida_free+0xc7/0x240
[  561.085694]  ? fprop_new_period.cold+0x25/0x25
[  561.089228]  ? kasan_slab_free+0xe/0x10
[  561.092738]  ? kfree+0x90/0x270
[  561.096183]  software_node_release+0x4d/0x150
[  561.099644]  kobject_put+0x103/0x260
[  561.103109]  kobject_del+0x85/0xa0
[  561.106457]  kobject_put+0xe1/0x260
[  561.109785]  fwnode_remove_software_node+0x3b/0x40
[  561.113061]  software_node_unregister_nodes+0x33/0x60
[  561.116274]  test_printf_init+0x10c5/0x1a78 [test_printf]
[  561.119483]  ? test_hashed+0xd9/0xd9 [test_printf]
[  561.122639]  ? __schedule+0x4d0/0xc80
[  561.125785]  ? _raw_spin_lock_bh+0xd0/0xd0
[  561.128855]  ? __kasan_check_write+0x14/0x20
[  561.131843]  ? llist_add_batch+0x38/0x60
[  561.134802]  ? __irq_work_queue_local+0x6a/0x80
[  561.137704]  ? handle_cmd_completion+0xd00/0x1200
[  561.140590]  ? test_hashed+0xd9/0xd9 [test_printf]
[  561.143438]  ? alloc_debug_processing+0x47/0x180
[  561.146186]  ? recalibrate_cpu_khz+0x10/0x10
[  561.148931]  ? test_hashed+0xd9/0xd9 [test_printf]
[  561.151653]  do_one_initcall+0xde/0x240
[  561.154347]  ? initcall_blacklisted+0x160/0x160
[  561.157077]  ? kasan_unpoison_shadow+0x38/0x50
[  561.159752]  ? kasan_unpoison_shadow+0x38/0x50
[  561.162322]  ? kasan_poison_shadow+0x30/0x40
[  561.164876]  ? __asan_register_globals+0x5a/0x70
[  561.167374]  do_init_module+0x11d/0x370
[  561.169828]  load_module+0x1b58/0x1fd0
[  561.172245]  ? post_relocation+0x6e0/0x6e0
[  561.174601]  ? __kasan_check_write+0x14/0x20
[  561.176943]  ? kernel_read+0x9b/0xc0
[  561.179204]  ? __kasan_check_write+0x14/0x20
[  561.181462]  ? kernel_read_file+0x252/0x390
[  561.183739]  ? copy_strings_kernel+0xb0/0xb0
[  561.185954]  ? arch_get_unmapped_area+0x330/0x330
[  561.188188]  ? __fget_light+0xad/0x110
[  561.190388]  __do_sys_finit_module+0x130/0x1c0
[  561.192615]  ? __do_sys_finit_module+0x130/0x1c0
[  561.194864]  ? __do_sys_init_module+0x240/0x240
[  561.197063]  ? randomize_stack_top+0x90/0x90
[  561.199276]  ? find_mergeable_anon_vma+0x110/0x110
[  561.201481]  ? ext4_llseek+0xbf/0x170
[  561.203705]  __x64_sys_finit_module+0x3e/0x50
[  561.205923]  do_syscall_64+0x6d/0x230
[  561.208149]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  561.210390] RIP: 0033:0x7fda31c50f59
[  561.212642] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 4f 0c 00 f7 d8 64 89 01 48
[  561.217689] RSP: 002b:00007fff946ee448 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  561.220334] RAX: ffffffffffffffda RBX: 000055f0c1400a20 RCX: 00007fda31c50f59
[  561.223023] RDX: 0000000000000000 RSI: 000055f0bf4543b0 RDI: 0000000000000003
[  561.225722] RBP: 0000000000040000 R08: 0000000000000000 R09: 000055f0c1400930
[  561.228448] R10: 0000000000000003 R11: 0000000000000246 R12: 000055f0bf4543b0
[  561.231176] R13: 0000000000000000 R14: 000055f0c1400ac0 R15: 000055f0c1400a20

[  561.236503] Allocated by task 1454:
[  561.239160]  save_stack+0x23/0x50
[  561.241784]  __kasan_kmalloc.constprop.0+0xcf/0xe0
[  561.244446]  kasan_kmalloc+0x9/0x10
[  561.247117]  swnode_register+0x4f/0x300
[  561.249771]  software_node_register+0x3b/0x60
[  561.252432]  software_node_register_nodes+0x49/0x80
[  561.255104]  test_printf_init+0xff0/0x1a78 [test_printf]
[  561.257767]  do_one_initcall+0xde/0x240
[  561.260417]  do_init_module+0x11d/0x370
[  561.263071]  load_module+0x1b58/0x1fd0
[  561.265683]  __do_sys_finit_module+0x130/0x1c0
[  561.268319]  __x64_sys_finit_module+0x3e/0x50
[  561.270958]  do_syscall_64+0x6d/0x230
[  561.273552]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

[  561.278921] Freed by task 1454:
[  561.281558]  save_stack+0x23/0x50
[  561.284221]  __kasan_slab_free+0x137/0x180
[  561.286897]  kasan_slab_free+0xe/0x10
[  561.289528]  kfree+0x90/0x270
[  561.292183]  software_node_release+0x128/0x150
[  561.294865]  kobject_put+0x103/0x260
[  561.297501]  kobject_del+0x85/0xa0
[  561.300154]  kobject_put+0xe1/0x260
[  561.302784]  kobject_del+0x85/0xa0
[  561.305344]  kobject_put+0xe1/0x260
[  561.307914]  fwnode_remove_software_node+0x3b/0x40
[  561.310468]  software_node_unregister_nodes+0x33/0x60
[  561.313074]  test_printf_init+0x10c5/0x1a78 [test_printf]
[  561.315695]  do_one_initcall+0xde/0x240
[  561.318284]  do_init_module+0x11d/0x370
[  561.320892]  load_module+0x1b58/0x1fd0
[  561.323465]  __do_sys_finit_module+0x130/0x1c0
[  561.326048]  __x64_sys_finit_module+0x3e/0x50
[  561.328625]  do_syscall_64+0x6d/0x230
[  561.331206]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

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
[  561.414158] RIP: 0010:ida_free+0x14e/0x240
[  561.417350] Code: 89 c8 be 08 00 00 00 48 89 8d 30 ff ff ff 48 c1 f8 06 49 8d 7c c5 00 48 89 bd 28 ff ff ff e8 69 a1 cf ff 48 8b 8d 30 ff ff ff <49> 0f a3 4d 00 48 89 8d 30 ff ff ff 72 5d 49 8b 7f 90 4c 89 f6 e8
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
[  561.461233]  ? fprop_new_period.cold+0x25/0x25
[  561.465047]  ? kasan_slab_free+0xe/0x10
[  561.468853]  ? kfree+0x90/0x270
[  561.472615]  software_node_release+0x4d/0x150
[  561.476409]  kobject_put+0x103/0x260
[  561.480181]  kobject_del+0x85/0xa0
[  561.483898]  kobject_put+0xe1/0x260
[  561.487543]  fwnode_remove_software_node+0x3b/0x40
[  561.491215]  software_node_unregister_nodes+0x33/0x60
[  561.494881]  test_printf_init+0x10c5/0x1a78 [test_printf]
[  561.498519]  ? test_hashed+0xd9/0xd9 [test_printf]
[  561.502049]  ? __schedule+0x4d0/0xc80
[  561.505384]  ? _raw_spin_lock_bh+0xd0/0xd0
[  561.508716]  ? __kasan_check_write+0x14/0x20
[  561.511978]  ? llist_add_batch+0x38/0x60
[  561.515202]  ? __irq_work_queue_local+0x6a/0x80
[  561.518387]  ? handle_cmd_completion+0xd00/0x1200
[  561.521556]  ? test_hashed+0xd9/0xd9 [test_printf]
[  561.524751]  ? alloc_debug_processing+0x47/0x180
[  561.527886]  ? recalibrate_cpu_khz+0x10/0x10
[  561.531042]  ? test_hashed+0xd9/0xd9 [test_printf]
[  561.534221]  do_one_initcall+0xde/0x240
[  561.537361]  ? initcall_blacklisted+0x160/0x160
[  561.540483]  ? kasan_unpoison_shadow+0x38/0x50
[  561.543632]  ? kasan_unpoison_shadow+0x38/0x50
[  561.546724]  ? kasan_poison_shadow+0x30/0x40
[  561.549743]  ? __asan_register_globals+0x5a/0x70
[  561.552733]  do_init_module+0x11d/0x370
[  561.555672]  load_module+0x1b58/0x1fd0
[  561.558602]  ? post_relocation+0x6e0/0x6e0
[  561.561528]  ? __kasan_check_write+0x14/0x20
[  561.564450]  ? kernel_read+0x9b/0xc0
[  561.567317]  ? __kasan_check_write+0x14/0x20
[  561.570134]  ? kernel_read_file+0x252/0x390
[  561.572895]  ? copy_strings_kernel+0xb0/0xb0
[  561.575513]  ? arch_get_unmapped_area+0x330/0x330
[  561.578030]  ? __fget_light+0xad/0x110
[  561.580480]  __do_sys_finit_module+0x130/0x1c0
[  561.582928]  ? __do_sys_finit_module+0x130/0x1c0
[  561.585367]  ? __do_sys_init_module+0x240/0x240
[  561.587809]  ? randomize_stack_top+0x90/0x90
[  561.590199]  ? find_mergeable_anon_vma+0x110/0x110
[  561.592587]  ? ext4_llseek+0xbf/0x170
[  561.594939]  __x64_sys_finit_module+0x3e/0x50
[  561.597238]  do_syscall_64+0x6d/0x230
[  561.599497]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  561.601768] RIP: 0033:0x7fda31c50f59
[  561.604006] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 07 4f 0c 00 f7 d8 64 89 01 48
[  561.609039] RSP: 002b:00007fff946ee448 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[  561.611681] RAX: ffffffffffffffda RBX: 000055f0c1400a20 RCX: 00007fda31c50f59
[  561.614350] RDX: 0000000000000000 RSI: 000055f0bf4543b0 RDI: 0000000000000003
[  561.617066] RBP: 0000000000040000 R08: 0000000000000000 R09: 000055f0c1400930
[  561.619806] R10: 0000000000000003 R11: 0000000000000246 R12: 000055f0bf4543b0
[  561.622505] R13: 0000000000000000 R14: 000055f0c1400ac0 R15: 000055f0c1400a20
[  561.625213] Modules linked in: test_printf(+) test_bitfield test_list_sort test_string btrfs blake2b_generic uvcvideo xor zstd_decompress zstd_compress videobuf2_vmalloc xxhash videobuf2_memops raid6_pq videobuf2_v4l2 libcrc32c videodev videobuf2_common x86_pkg_temp_thermal [last unloaded: test_firmware]
[  561.631178] CR2: 0000000000000000
[  561.634214] ---[ end trace 0fb795f377a49e0a ]---
[  561.637280] RIP: 0010:ida_free+0x14e/0x240
[  561.640345] Code: 89 c8 be 08 00 00 00 48 89 8d 30 ff ff ff 48 c1 f8 06 49 8d 7c c5 00 48 89 bd 28 ff ff ff e8 69 a1 cf ff 48 8b 8d 30 ff ff ff <49> 0f a3 4d 00 48 89 8d 30 ff ff ff 72 5d 49 8b 7f 90 4c 89 f6 e8
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


Sorry if this is already known. I haven't noticed it anywhere.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
-- 
dunlab-notbot
