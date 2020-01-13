Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 818641398E5
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 19:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgAMS1i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 13:27:38 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:60257 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728748AbgAMS1i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 13:27:38 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7df172c5;
        Mon, 13 Jan 2020 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to:cc
        :references:from:message-id:date:mime-version:in-reply-to
        :content-type:content-transfer-encoding; s=mail; bh=moav06hSVOYk
        S2yuW7KkxVxYhXw=; b=szqGeNyijNd994O48UZg8vFxSzCpV2TdeBwsVU/AlN2K
        a14JTvNeOrDBZ58P/HQ4iWuPn20S2h41CzlIZi40em8E1Dky4oiPwjfvLnlFEUK1
        Ioy4gu/c+syGwhd1cNxUbJ/HP5oLfi7NU5n+Pb2xfVlGMQRSZB9EJNcBssHHBF0y
        2IadE8KEnwHh3Gx0/r6ZExf4imBDeAEGfIMnlV/5ExjzM1b22sYLidB24FdaDqo5
        hFPm7nQWLoxYjUGZKrltK+IlNN22JoUXusep0oA+ch5MGtx5iuQPNVLyA8Kvy37I
        HlcLss3/WYmWnNaG6UvJCnd+LYylByygOjPcEn7nFQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9fba6697 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 13 Jan 2020 17:27:39 +0000 (UTC)
Subject: BUG_ON hit in "reimplement path_mountpoint() with less magic" [Was:
 Re: linux-next: Tree for Jan 13]
To:     viro@zeniv.linux.org.uk
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200113181457.209ab4a5@canb.auug.org.au>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <14674349-1864-2d10-1f09-55b1fb834475@zx2c4.com>
Date:   Mon, 13 Jan 2020 13:27:34 -0500
MIME-Version: 1.0
In-Reply-To: <20200113181457.209ab4a5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Al,

Your "reimplement path_mountpoint() with less magic" commit is causing 
oopses on the linux-next tests running on https://build.wireguard.com/ . 
Here's one such crash with debug symbols:

[   81.310222] ------------[ cut here ]------------
[   81.310684] kernel BUG at ../../../../../../../../fs/namei.c:684!
[   81.311261] invalid opcode: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC KASAN
[   81.311869] CPU: 2 PID: 554 Comm: ip Not tainted 
5.5.0-rc5-next-20200113-debug #1
[   81.312575] RIP: 0010:unlazy_walk+0x20a/0x2a0
[   81.312987] Code: 43 01 00 83 e3 01 74 3e e8 83 62 dd ff 48 c7 c6 48 
b2 47 81 48 c7 c7 40 d5 56 82 e8 f0 c3 d6 ff b8 f6 ff ff ff 5b 5d 41 5c 
c3 <0f> 0b 48 c7 c7 c0 1e 65 82 e8 53 2c 14 00 0f 0b 48 c7 c7 80 1e 65
[   81.314668] RSP: 0018:ffff888032b8fc38 EFLAGS: 00010246
[   81.315144] RAX: 0000000000001009 RBX: ffff888032b8fcd0 RCX: 
0000000032b8fcd8
[   81.315792] RDX: 1ffff11006571fa1 RSI: 1ffff11006571fa0 RDI: 
ffff888032b8fd08
[   81.316441] RBP: ffff888034c88008 R08: 0000000000000001 R09: 
ffff88803222a738
[   81.317089] R10: fffffbfff04fd048 R11: ffffffff827e8247 R12: 
ffff888032b8fcd8
[   81.317738] R13: ffff888032b8fe88 R14: ffff888032b8fd18 R15: 
ffff888032b8fcd0
[   81.318383] FS:  00007fcd43cb0d48(0000) GS:ffff888036500000(0000) 
knlGS:0000000000000000
[   81.319113] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   81.319638] CR2: 00007fcd43c5b8f0 CR3: 00000000164f1006 CR4: 
00000000001606a0
[   81.320283] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[   81.320932] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[   81.321580] Call Trace:
[   81.321813]  path_mountpoint+0x148/0x2b0
[   81.322174]  filename_mountpoint+0x149/0x200
[   81.322571]  ? path_mountpoint+0x2b0/0x2b0
[   81.322954]  ? 
trace_event_raw_event_rcu_quiescent_state_report+0x340/0x340
[   81.323592]  ? strncpy_from_user+0x6f/0x300
[   81.323977]  ? kmem_cache_alloc+0x2d3/0x300
[   81.324362]  ? getname_flags+0x89/0x3c0
[   81.324724]  ksys_umount+0x115/0xba0
[   81.325057]  ? __up_read+0x195/0x720
[   81.325388]  ? __detach_mounts+0x220/0x220
[   81.325769]  ? __down_read+0x3e0/0x3e0
[   81.326120]  ? trace_hardirqs_on_thunk+0x1a/0x1c
[   81.326547]  __x64_sys_umount+0x4b/0x70
[   81.326900]  do_syscall_64+0x90/0xd9a
[   81.327245]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   81.327708] RIP: 0033:0x7fcd43c16d1e
[   81.328039] Code: b8 a6 00 00 00 31 f6 0f 05 48 89 c7 e8 7b e5 ff ff 
48 83 c4 08 c3 66 0f 1f 44 00 00 48 83 ec 08 48 63 f6 b8 a6 00 00 00 0f 
05 <48> 89 c7 e8 5a e5 ff ff 48 83 c4 08 c3 0f 1f 44 00 00 48 83 ec 08
[   81.329716] RSP: 002b:00007fff06d4d850 EFLAGS: 00000206 ORIG_RAX: 
00000000000000a6
[   81.330398] RAX: ffffffffffffffda RBX: 00007fff06d4ea98 RCX: 
00007fcd43c16d1e
[   81.331044] RDX: 00000000ffffffff RSI: 0000000000000002 RDI: 
00007fff06d4d860
[   81.331693] RBP: 0000000000000002 R08: 0000000000000000 R09: 
00007fff06d4d680
[   81.332335] R10: 000055559d446fcf R11: 0000000000000206 R12: 
00007fff06d4d860
[   81.332982] R13: 00007fff06d4ea90 R14: 00007fff06d4ef99 R15: 
0000000000000000
[   81.335146] ---[ end trace 35c7405bba7e573a ]---
[   81.335583] RIP: 0010:unlazy_walk+0x20a/0x2a0
[   81.335984] Code: 43 01 00 83 e3 01 74 3e e8 83 62 dd ff 48 c7 c6 48 
b2 47 81 48 c7 c7 40 d5 56 82 e8 f0 c3 d6 ff b8 f6 ff ff ff 5b 5d 41 5c 
c3 <0f> 0b 48 c7 c7 c0 1e 65 82 e8 53 2c 14 00 0f 0b 48 c7 c7 80 1e 65
[   81.337702] RSP: 0018:ffff888032b8fc38 EFLAGS: 00010246
[   81.338190] RAX: 0000000000001009 RBX: ffff888032b8fcd0 RCX: 
0000000032b8fcd8
[   81.338842] RDX: 1ffff11006571fa1 RSI: 1ffff11006571fa0 RDI: 
ffff888032b8fd08
[   81.339492] RBP: ffff888034c88008 R08: 0000000000000001 R09: 
ffff88803222a738
[   81.340137] R10: fffffbfff04fd048 R11: ffffffff827e8247 R12: 
ffff888032b8fcd8
[   81.340784] R13: ffff888032b8fe88 R14: ffff888032b8fd18 R15: 
ffff888032b8fcd0
[   81.341435] FS:  00007fcd43cb0d48(0000) GS:ffff888036500000(0000) 
knlGS:0000000000000000
[   81.343468] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   81.344000] CR2: 00007fcd43c5b8f0 CR3: 00000000164f1006 CR4: 
00000000001606a0
[   81.344652] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[   81.345298] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[   81.346026] Kernel panic - not syncing: Fatal exception
[   81.346671] Kernel Offset: disabled

Regards,
Jason

On 1/13/20 2:14 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200110:
> 
> The vfs tree gained a conflict against the m68k tree.
> 
> The keys tree still had build failures so I used the version from
> next-20191211.  It also gained a conflict against the m68k tree.
> 
> The usb-gadget tree still had its conflict against Linus' tree, so I dropped
> it for today.
> 
> The pidfd tree gained conflicts against the m68k, vfs and keys trees.
> 
> The generic-ioremap tree gained a conflict against the tegra tree.
> 
> The kunit-next tree lost its failures.
> 
> Non-merge commits (relative to Linus' tree): 7258
>   7462 files changed, 345876 insertions(+), 165190 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig. And finally, a simple boot test of the powerpc
> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 314 trees (counting Linus' and 78 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 

