Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7725AFE25E
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 17:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfKOQLj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 11:11:39 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33075 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfKOQLj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 11:11:39 -0500
Received: by mail-lj1-f195.google.com with SMTP id t5so11288985ljk.0
        for <linux-next@vger.kernel.org>; Fri, 15 Nov 2019 08:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DhK4DKuyalgGkfGQF8W/jtH+nmgwPlt4uYEWmMRs5zo=;
        b=ST5d9iHXySRawFc/gvdUME/FDfltAeliJVXUYlMC0mJ4vNFQMphgtmPRfgVb7nD3Yf
         d/VpD+0nwHjT38GAk5HSDys1oWHKtfQaj227cGfls4xhffsQqHJEf1NB0LenZfw+nqt0
         q6FzlHPj2eDjHL6kv0Cq++nFvIROZHj1tEKzFYL4Q4XHZ2PK6JDkkvqtgG3kbV9XpXHG
         a6UJvbXMkF1KH4zUpsQY6DBUyRi0ZOCx6DlSjYbQjdt5j/rsGVt3qP/GISopzVQcfLrs
         zsIWMu5OzqQEmWiWtwFhyrxH4Br60HCJMSh1JlAkhCM5NBEsaLbvuFEx5cOoF3Qfx1WR
         o3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DhK4DKuyalgGkfGQF8W/jtH+nmgwPlt4uYEWmMRs5zo=;
        b=WDAYGEuoQKoOPRG5ap/eRpjXud532xcPffhf8QDgJO+qNwB8M+Y+A+ETnuMcbhGUlv
         2wu9G5DhvaQrS6GysIsDrcy8KtVn+x1/Lw6jmQ0/GQk1lUJJ0ib4lKbK9O3v8YXLRMv6
         PrdnkKWUNHdeHhmKj6+lVsAs4coEiCOgQJ2iDEk2qDqgwrWYB/ljUyoIO881J1SLXwtX
         XmgAiTByBv8wTZ6s3yx9B7SzB6BerXwBOfx9UbhnTW7e4DJ3w3t/5dyyW7TvhFILsbBj
         tA5UI7I4Z1j0K9Ug8u3dRFdOdbVbc/4ZoPNMX7Xht6JKGbwzgAbanBH4Ai2nhNnCw8HK
         tRuA==
X-Gm-Message-State: APjAAAXMC4kjs4nuESwd59ZtC67fauTc4odgDY37Lg3Gt5cw9ISRj6j+
        1f1GaeIuos3SFMMhUqzzSMoldPNrSx/zTX3epmpIIw==
X-Google-Smtp-Source: APXvYqxA4S6N1EFgayLXM/XuOmLAjGKURpKPWEA38Qqe+TPn86TUVwajPWfvbPHHPFL7Cxg+ACPuAnN/loR3t9g/OLc=
X-Received: by 2002:a2e:a410:: with SMTP id p16mr11900408ljn.46.1573834296252;
 Fri, 15 Nov 2019 08:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20191115190525.77efdf6c@canb.auug.org.au>
In-Reply-To: <20191115190525.77efdf6c@canb.auug.org.au>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 15 Nov 2019 21:41:25 +0530
Message-ID: <CA+G9fYsmRv3bsdAHvcPRso_Q5EtKxh1==uZqreuW6YenhBJcfA@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 15
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>,
        John Stultz <john.stultz@linaro.org>,
        lkft-triage@lists.linaro.org, mingo@redhat.com, will@kernel.org,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Results from Linaro=E2=80=99s test farm.
Regressions detected on qemu_i386 and i386.

On Fri, 15 Nov 2019 at 13:35, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>
> Hi all,
>
> Changes since 20191114:
>
> The sound-asoc-fixes tree still had its build failure for which I reverte=
d
> a commit.
>
> The clk tree gained conflicts against the tegra tree.
>
> The pm tree gained a conflict against the printk tree.
>
> The ftrace tree gained a conflict against the arm64 tree.
>
> The pwm tree gained a conflict against the devicetree tree.
>
> The y2038 tree lost its build failure.
>
> The livepatching tree gained a conflict against the ftrace tree.
>
> The pidfd tree gained a conflict against Linus' tree.
>
> The hmm tree lost its build failure.
>
> The akpm-current tree gained a build failure for which I reverted
> a commit.
>
> Non-merge commits (relative to Linus' tree): 10789
>  9588 files changed, 429750 insertions(+), 197654 deletions(-)
>

qemu_i386 booting linux next 5.4.0-rc7-next-20191115 failed.

[    1.805887] EXT4-fs (sda): mounted filesystem with ordered data
mode. Opts: (null)
[    1.807154] VFS: Mounted root (ext4 filesystem) readonly on device 8:0.
[    1.810314] devtmpfs: mounted
[    1.813888] Freeing unused kernel image (initmem) memory: 1040K
[    1.815309] Write protecting kernel text and read-only data: 18552k
[    1.816278] Run /sbin/init as init process
[    1.825107]
[    1.825107] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    1.825107] WARNING: suspicious RCU usage
[    1.825107] 5.4.0-rc7-next-20191115 #1 Not tainted
[    1.825107] -----------------------------
[    1.825107] /usr/src/kernel/arch/x86/kernel/traps.c:261 entry code
didn't wake RCU!
[    1.825107]
[    1.825107] other info that might help us debug this:
[    1.825107]
[    1.825107]
[    1.825107] RCU used illegally from idle CPU!
[    1.825107] rcu_scheduler_active =3D 2, debug_locks =3D 1
[    1.836522] BUG: unable to handle page fault for address: 1b9a0f5d
[    1.835913] RCU used illegally from extended quiescent state!
[    1.835913] 3 locks held by swapper/0/0:
[    1.837507] #PF: supervisor instruction fetch in kernel mode
[    1.837507] #PF: error_code(0x0010) - not-present page
[    1.835913]  #0: c4855870 (console_lock){+.+.}, at: vprintk_emit+0xce/0x=
290
[    1.837507] *pde =3D 00000000
[    1.835913]  #1: c48556c0 (console_owner){....}, at:
console_unlock+0x1d5/0x600
[    1.837507] Oops: 0010 [#1] SMP
[    1.837507] CPU: 2 PID: 0 Comm: swapper/2 Not tainted
5.4.0-rc7-next-20191115 #1
[    1.835913]  #2: c50d0b10 (&port_lock_key){....}, at:
serial8250_console_write+0x7c/0x280
[    1.837507] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[    1.837507] EIP: 0x1b9a0f5d
[    1.835913]
[    1.835913] stack backtrace:
[    1.835913] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
5.4.0-rc7-next-20191115 #1
[    1.837507] Code: Bad RIP value.
[    1.835913] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[    1.837507] EAX: c481fcbc EBX: c4826e34 ECX: 00000000 EDX: 00000003
[    1.837507] ESI: 00000001 EDI: 1b9a0f5d EBP: f4dbfe54 ESP: f4dbfe30
[    1.835913] Call Trace:
[    1.837507] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 0021004=
6
[    1.837507] CR0: 80050033 CR2: 1b9a0f33 CR3: 34eca000 CR4: 003406d0
[    1.835913]  dump_stack+0x6e/0x96
[    1.837507] Call Trace:
[    1.835913]  lockdep_rcu_suspicious+0xab/0xe0
[    1.837507]  <SOFTIRQ>
[    1.835913]  do_error_trap+0xb4/0xe0
[    1.837507]  ? __wake_up_common+0x7b/0x140
[    1.835913]  ? do_overflow+0x20/0x20
[    1.837507]  __wake_up_common_lock+0x6f/0xa0
[    1.835913]  do_invalid_op+0x28/0x40
[    1.837507]  __wake_up+0x12/0x20
[    1.835913]  ? user_path_at_empty+0x2a/0x40
[    1.837507]  wake_up_bit+0x5e/0x80
[    1.835913]  common_exception+0x13c/0x154
[    1.837507]  unlock_buffer+0x16/0x20
[    1.835913] EIP: 0xf4eb6530
[    1.837507]  __end_buffer_read_notouch+0x1c/0x30
[    1.835913] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 <ff> ff ff ff 3f 00 00 00 ff ff ff ff 3f 00 00 00 ff ff ff ff
3f 00
[    1.837507]  end_buffer_read_sync+0x10/0x20
[    1.835913] EAX: c4826e48 EBX: c38f2cea ECX: 00000000 EDX: 00000006
[    1.835913] ESI: c481ff64 EDI: 00000000 EBP: c481ffb4 ESP: c481ff38
[    1.837507]  end_bio_bh_io_sync+0x25/0x40
[    1.835913] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 0021020=
6
[    1.835913]  ? user_path_at_empty+0x2a/0x40
[    1.837507]  bio_endio+0x124/0x280
[    1.835913]  ? do_overflow+0x20/0x20
[    1.837507]  blk_update_request+0xa3/0x3f0
[    1.835913]  ? do_faccessat+0xa3/0x230
[    1.837507]  scsi_end_request+0x28/0x2f0
[    1.835913]  ? sys_access+0x18/0x20
[    1.837507]  scsi_io_completion+0x59/0x510
[    1.835913]  ? do_int80_syscall_32+0x55/0x1d0
[    1.837507]  scsi_finish_command+0xba/0xd0
[    1.835913]  ? entry_INT80_32+0xfb/0xfb
[    1.837507]  scsi_softirq_done+0x109/0x120
[    1.837507]  ? smp_irq_move_cleanup_interrupt+0xb0/0xb0
[    1.837507]  blk_done_softirq+0x73/0xa0
[    1.837507]  __do_softirq+0xb1/0x3c3
[    1.837507]  ? smp_irq_move_cleanup_interrupt+0xb0/0xb0
[    1.837507]  call_on_stack+0x15/0x50
[    1.837507]  </SOFTIRQ>
[    1.837507]  ? irq_exit+0xb5/0xc0
[    1.837507]  ? smp_call_function_single_interrupt+0x142/0x1d0
[    1.837507]  ? call_function_single_interrupt+0x106/0x10c
[    1.837507]  ? default_idle+0x2d/0x160
[    1.837507]  ? default_idle+0x2d/0x160
[    1.837507]  ? arch_cpu_idle+0x12/0x20
[    1.837507]  ? default_idle_call+0x23/0x40
[    1.837507]  ? do_idle+0x17f/0x230
[    1.837507]  ? complete+0x3f/0x50
[    1.837507]  ? cpu_startup_entry+0x25/0x30
[    1.837507]  ? start_secondary+0x167/0x220
[    1.837507]  ? startup_32_smp+0x164/0x168
[    1.837507] Modules linked in:
[    1.837507] CR2: 000000001b9a0f5d
[    1.837507] ------------[ cut here ]------------
[    1.837507] WARNING: CPU: 2 PID: 0 at
/usr/src/kernel/kernel/locking/mutex.c:1419 mutex_trylock+0x130/0x140
[    1.837507] Modules linked in:
[    1.837507] CPU: 2 PID: 0 Comm: swapper/2 Not tainted
5.4.0-rc7-next-20191115 #1
[    1.837507] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[    1.837507] EIP: mutex_trylock+0x130/0x140
[    1.837507] Code: 26 00 ff 75 04 8d 46 34 6a 00 6a 01 6a 00 b9 01
00 00 00 31 d2 e8 80 48 41 ff 83 c4 10 8d 65 f4 b8 01 00 00 00 5b 5e
5f 5d c3 <0f> 0b e9 fd fe ff ff 89 f6 8d bc 27 00 00 00 00 0f 1f 44 00
00 55
[    1.837507] EAX: 80000102 EBX: 00000001 ECX: 00000020 EDX: 00000008
[    1.837507] ESI: c485e320 EDI: f4dbfdd8 EBP: f4dbfc8c ESP: f4dbfc7c
[    1.837507] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 0021000=
6
[    1.837507] CR0: 80050033 CR2: 1b9a0f33 CR3: 34eca000 CR4: 003406d0
[    1.837507] Call Trace:
[    1.837507]  <SOFTIRQ>
[    1.837507]  __crash_kexec+0x25/0xd0
[    1.837507]  ? _raw_spin_unlock_irqrestore+0x47/0x50
[    1.837507]  ? __printk_safe_flush+0x123/0x1e0
[    1.837507]  ? vprintk_emit+0xe3/0x290
[    1.837507]  ? cpumask_next+0x15/0x20
[    1.837507]  ? printk_safe_flush+0x4e/0x60
[    1.837507]  crash_kexec+0x3c/0x50
[    1.837507]  oops_end+0xa7/0xc0
[    1.837507]  no_context+0xf4/0x3a0
[    1.837507]  ? unwind_next_frame+0x13/0x20
[    1.837507]  ? arch_stack_walk+0x6f/0xc0
[    1.837507]  __bad_area_nosemaphore.constprop.31+0x39/0x180
[    1.837507]  bad_area_nosemaphore+0xf/0x20
[    1.837507]  __do_page_fault+0x26c/0x440
[    1.837507]  do_page_fault+0x24/0x1e0
[    1.837507]  ? __do_page_fault+0x440/0x440
[    1.837507]  ? __do_page_fault+0x440/0x440
[    1.837507]  common_exception_read_cr2+0x13f/0x156
[    1.837507] EIP: 0x1b9a0f5d
[    1.837507] Code: Bad RIP value.
[    1.837507] EAX: c481fcbc EBX: c4826e34 ECX: 00000000 EDX: 00000003
[    1.837507] ESI: 00000001 EDI: 1b9a0f5d EBP: f4dbfe54 ESP: f4dbfe30
[    1.837507] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 0021004=
6
[    1.837507]  ? __do_page_fault+0x440/0x440
[    1.837507]  ? __wake_up_common+0x7b/0x140
[    1.837507]  ? __wake_up_common_lock+0x6f/0xa0
[    1.837507]  ? __wake_up+0x12/0x20
[    1.837507]  ? wake_up_bit+0x5e/0x80
[    1.837507]  ? unlock_buffer+0x16/0x20
[    1.837507]  ? __end_buffer_read_notouch+0x1c/0x30
[    1.837507]  ? end_buffer_read_sync+0x10/0x20
[    1.837507]  ? end_bio_bh_io_sync+0x25/0x40
[    1.837507]  ? bio_endio+0x124/0x280
[    1.837507]  ? blk_update_request+0xa3/0x3f0
[    1.837507]  ? scsi_end_request+0x28/0x2f0
[    1.837507]  ? scsi_io_completion+0x59/0x510
[    1.837507]  ? scsi_finish_command+0xba/0xd0
[    1.837507]  ? scsi_softirq_done+0x109/0x120
[    1.837507]  ? smp_irq_move_cleanup_interrupt+0xb0/0xb0
[    1.837507]  ? blk_done_softirq+0x73/0xa0
[    1.837507]  ? __do_softirq+0xb1/0x3c3
[    1.837507]  ? smp_irq_move_cleanup_interrupt+0xb0/0xb0
[    1.837507]  ? call_on_stack+0x15/0x50
[    1.837507]  </SOFTIRQ>
[    1.837507]  ? irq_exit+0xb5/0xc0
[    1.837507]  ? smp_call_function_single_interrupt+0x142/0x1d0
[    1.837507]  ? call_function_single_interrupt+0x106/0x10c
[    1.837507]  ? default_idle+0x2d/0x160
[    1.837507]  ? default_idle+0x2d/0x160
[    1.837507]  ? arch_cpu_idle+0x12/0x20
[    1.837507]  ? default_idle_call+0x23/0x40
[    1.837507]  ? do_idle+0x17f/0x230
[    1.837507]  ? complete+0x3f/0x50
[    1.837507]  ? cpu_startup_entry+0x25/0x30
[    1.837507]  ? start_secondary+0x167/0x220
[    1.837507]  ? startup_32_smp+0x164/0x168
[    1.837507] irq event stamp: 5821
[    1.837507] hardirqs last  enabled at (5820): [<c3acfd07>]
blk_done_softirq+0x47/0xa0
[    1.837507] hardirqs last disabled at (5821): [<c43348f4>]
_raw_spin_lock_irqsave+0x14/0x40
[    1.837507] softirqs last  enabled at (5816): [<c36f0a7f>]
_local_bh_enable+0x1f/0x40
[    1.837507] softirqs last disabled at (5817): [<c36a1ac5>]
call_on_stack+0x15/0x50
[    1.837507] ---[ end trace 55146f98867a961a ]---
[    1.837507] ------------[ cut here ]------------

Ref:
https://lkft.validation.linaro.org/scheduler/job/1011549#L561

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  git commit: 5a6fcbeabe3e20459ed8504690b2515dacc5246f
  git describe: next-20191115
  make_kernelversion: 5.4.0-rc7
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-core2-32/lkft=
/linux-next/647/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-core2-32/lkft=
/linux-next/647

P.S. Apology for adding you if it is not your subsystem.

--
Linaro LKFT
https://lkft.linaro.org
