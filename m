Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF9CFCDEB
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 19:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNSih (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 13:38:37 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38809 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfKNSig (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 13:38:36 -0500
Received: by mail-lj1-f193.google.com with SMTP id v8so7798346ljh.5
        for <linux-next@vger.kernel.org>; Thu, 14 Nov 2019 10:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fv+x4zW2njrn6Ke6QncDAlks4mggZKZDSLuFb8EsEck=;
        b=J4RvUC24VUpqET6+nlp6W415YlCtZvLy5SUC5jfU/vPUYBUDaiKqX8WeJF2uuxKfpU
         QMaoB1SmYDpk9tN8zs7uGxxVS3wDrukMM8Wbm9ui3o6KarDMlV5n5zXH0wgQkvz0llRD
         T/NhBtN2B+6iQSudDh9oXjDUOxupMt/6mptyHuDdDEx2Dcdk6/mcQmIhC09Oq2/dNUMd
         g0yp39lzEno3CjKovsCVUI0nvEZTWrmeHm0cOA7OLE8J099Vkj1TPwF6GC37Mk5Wm7Ka
         rFvihbo5ma7Q4ilh6UyBa4/bAITuAb4maZ7OqkeO5VWtNFDaBc4gD9KLmf+xl2O90ltN
         OmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fv+x4zW2njrn6Ke6QncDAlks4mggZKZDSLuFb8EsEck=;
        b=fiN7lzEpneM8zZZ3hcEPK53D9LaigddXg/zfshCsXaWeoi3LPZxY/SZmkjVJ3KCw44
         qXfSKhhQUrMbTvG5Op8JXcc0VMA4b8Gy73HX0gAxB+PuLktwvLlzDdzlZ8tjwTyJ1EUK
         tWgQ8BomCp3SMyzaG5Aext7GfjU8ezjEG9usMqZG8UveuE8X+Hoysa78b8Rs0XCZriW3
         vuxUbmla/LpBGf/trrJwRlv6jJpcnI2PaZer98O95TQmmscPg1wTn0nuJLYblL3AJTmH
         iVkNsjRGgOtyPA+vjYeSFsE1Xs8JjdDgw9wGFRY0ItOYsoQ0PiqK8mLJMMkR/tKuwTzY
         gP+w==
X-Gm-Message-State: APjAAAU012AFUkwCXOG8K1qi7uZCmVuAoidHFXC/BAWkeWcTwvRTAnbn
        qZRslwFz7xT4O5R1c4ubWLh87CzmEKVeUw0tcjwW1dEy
X-Google-Smtp-Source: APXvYqz37Z/bX+GKajRC8I96oAStwUKol4Vs7Bfy0iYx4fC8a82+JMiPQFnFbDXys8QQ4LmdJgM494Fjmoh2Cc+/XjQ=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr7969476lji.141.1573756713180;
 Thu, 14 Nov 2019 10:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20191114193132.5de921a7@canb.auug.org.au>
In-Reply-To: <20191114193132.5de921a7@canb.auug.org.au>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 15 Nov 2019 00:08:21 +0530
Message-ID: <CA+G9fYtpOaYDoUEzQuYxmKJLFH2GDvK3ipWienn-zHDB+nOMbg@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 14
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Brown <broonie@kernel.org>, lkft-triage@lists.linaro.org,
        LTP List <ltp@lists.linux.it>,
        Jan Stancek <jstancek@redhat.com>, chrubis <chrubis@suse.cz>,
        Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 14 Nov 2019 at 14:01, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>
> Hi all,
> Changes since 20191113:
> The y2038 tree gained a build failure for which I applied a patch.
<trim>
> The akpm-current tree gained a conflict against the y2038 tree.
>
> Non-merge commits (relative to Linus' tree): 10388
>  9238 files changed, 397357 insertions(+), 174171 deletions(-)

Results from Linaro=E2=80=99s test farm.
Regressions detected on x86_64, and i386.

LTP syscalls settimeofday01/02 failed on x86_64 and i386 running
5.4.0-rc7-next-20191114.

Following  ltp-syscalls-tests failed.
    * settimeofday01
    * settimeofday02
    * stime01
    * stime02

tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
setsockopt04.c:39: INFO: Try to set send buffer size to: 4294967040
[ 1278.348740] BUG: unable to handle page fault for address: 000000000061f6=
58
[ 1278.356134] #PF: supervisor read access in kernel mode
[ 1278.361278] #PF: error_code(0x0001) - permissions violation
[ 1278.366858] PGD 80000004225a3067 P4D 80000004225a3067 PUD 417941067
PMD 456981067 PTE 800000037df85067
[ 1278.376165] Oops: 0001 [#1] SMP PTI
[ 1278.379655] CPU: 2 PID: 9737 Comm: settimeofday01 Not tainted
5.4.0-rc7-next-20191114 #1
[ 1278.387733] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[ 1278.395206] RIP: 0010:__x64_sys_settimeofday+0x77/0x120
[ 1278.400429] Code: 55 d8 0f 85 88 00 00 00 be cf 00 00 00 48 c7 c7
88 8a bc 90 e8 0a 12 13 00 48 8d 43 08 e8 c1 7e cc 00 85 c0 48 89 55
e0 75 66 <48> 81 7b 08 40 42 0f 00 0f 8f 81 00 00 00 48 69 d2 e8 03 00
00 4d
[ 1278.419167] RSP: 0018:ffffa59582333ef8 EFLAGS: 00010246
[ 1278.424392] RAX: 0000000000000000 RBX: 000000000061f650 RCX: 00000000000=
00000
[ 1278.431515] RDX: 0000000000096b6a RSI: ffff8c3e555e1918 RDI: ffff8c3e5b2=
26648
[ 1278.438637] RBP: ffffa59582333f28 R08: 0000000000000000 R09: 00000000000=
00000
[ 1278.445763] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[ 1278.452884] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[ 1278.460010] FS:  00007f9675fb8580(0000) GS:ffff8c3e9fb00000(0000)
knlGS:0000000000000000
[ 1278.468085] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1278.473825] CR2: 000000000061f658 CR3: 000000045a56a002 CR4: 00000000003=
606e0
[ 1278.480985] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[ 1278.488113] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[ 1278.495238] Call Trace:
[ 1278.497684]  do_syscall_64+0x55/0x1d0
[ 1278.501349]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[ 1278.506402] RIP: 0033:0x7f9675a97fd7
[ 1278.509984] Code: b9 0c 00 ba 2c 00 00 00 48 8d 35 bc 9b 0c 00 48
8d 3d ed 79 0c 00 e8 38 c4 f7 ff 0f 1f 84 00 00 00 00 00 b8 a4 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 91 be 2f 00 f7 d8 64 89
01 48
[ 1278.528723] RSP: 002b:00007ffcb08e0b68 EFLAGS: 00000202 ORIG_RAX:
00000000000000a4
[ 1278.536280] RAX: ffffffffffffffda RBX: 00007f9675fb8500 RCX: 00007f9675a=
97fd7
[ 1278.543406] RDX: 0000000000000064 RSI: 0000000000000000 RDI: 00000000006=
1f650
[ 1278.550529] RBP: 0000000000000000 R08: 00007ffcb093d080 R09: 00007ffcb08=
e0b40
[ 1278.557654] R10: 00000000000005de R11: 0000000000000202 R12: 20c49ba5e35=
3f7cf
[ 1278.564776] R13: 00007ffcb08e0c60 R14: 0000000000000000 R15: 00000000000=
00000
[ 1278.571946] Modules linked in: tun btrfs xor zstd_decompress
zstd_compress raid6_pq xfs libcrc32c x86_pkg_temp_thermal fuse
[ 1278.583062] CR2: 000000000061f658
[ 1278.586372] ---[ end trace 261d3ba98695973b ]---
[ 1278.590984] RIP: 0010:__x64_sys_settimeofday+0x77/0x120
[ 1278.596202] Code: 55 d8 0f 85 88 00 00 00 be cf 00 00 00 48 c7 c7
88 8a bc 90 e8 0a 12 13 00 48 8d 43 08 e8 c1 7e cc 00 85 c0 48 89 55
e0 75 66 <48> 81 7b 08 40 42 0f 00 0f 8f 81 00 00 00 48 69 d2 e8 03 00
00 4d
[ 1278.614949] RSP: 0018:ffffa59582333ef8 EFLAGS: 00010246
[ 1278.620172] RAX: 0000000000000000 RBX: 000000000061f650 RCX: 00000000000=
00000
[ 1278.627296] RDX: 0000000000096b6a RSI: ffff8c3e555e1918 RDI: ffff8c3e5b2=
26648
[ 1278.634419] RBP: ffffa59582333f28 R08: 0000000000000000 R09: 00000000000=
00000
[ 1278.641541] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[ 1278.648665] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[ 1278.655791] FS:  00007f9675fb8580(0000) GS:ffff8c3e9fb00000(0000)
knlGS:0000000000000000
[ 1278.663866] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1278.669605] CR2: 000000000061f658 CR3: 000000045a56a002 CR4: 00000000003=
606e0
[ 1278.676729] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[ 1278.683861] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[ 1278.690988] BUG: sleeping function called from invalid context at
/usr/src/kernel/include/linux/percpu-rwsem.h:38
[ 1278.701237] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid:
9737, name: settimeofday01
[ 1278.709747] INFO: lockdep is turned off.
[ 1278.713665] irq event stamp: 2496
[ 1278.716976] hardirqs last  enabled at (2495): [<ffffffff8f5a0e2f>]
ktime_get_coarse_real_ts64+0x5f/0xb0
[ 1278.726361] hardirqs last disabled at (2496): [<ffffffff8f401e2b>]
trace_hardirqs_off_thunk+0x1a/0x1c
[ 1278.735564] softirqs last  enabled at (2004): [<ffffffff90600338>]
__do_softirq+0x338/0x43a
[ 1278.743931] softirqs last disabled at (1993): [<ffffffff8f4ffc48>]
irq_exit+0xb8/0xc0
[ 1278.751752] CPU: 2 PID: 9737 Comm: settimeofday01 Tainted: G      D
          5.4.0-rc7-next-20191114 #1
[ 1278.761216] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[ 1278.768697] Call Trace:
[ 1278.771148]  dump_stack+0x7a/0xa5
[ 1278.774461]  ___might_sleep+0x163/0x250
[ 1278.778299]  __might_sleep+0x4a/0x80
[ 1278.781879]  exit_signals+0x33/0x2d0
[ 1278.785457]  do_exit+0xb6/0xcf0
[ 1278.788593]  ? __x64_sys_settimeofday+0x6f/0x120
[ 1278.793206]  rewind_stack_do_exit+0x17/0x20
[ 1278.797390] RIP: 0033:0x7f9675a97fd7
[ 1278.800985] Code: b9 0c 00 ba 2c 00 00 00 48 8d 35 bc 9b 0c 00 48
8d 3d ed 79 0c 00 e8 38 c4 f7 ff 0f 1f 84 00 00 00 00 00 b8 a4 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 91 be 2f 00 f7 d8 64 89
01 48
[ 1278.819723] RSP: 002b:00007ffcb08e0b68 EFLAGS: 00000202 ORIG_RAX:
00000000000000a4
[ 1278.827279] RAX: ffffffffffffffda RBX: 00007f9675fb8500 RCX: 00007f9675a=
97fd7
[ 1278.834402] RDX: 0000000000000064 RSI: 0000000000000000 RDI: 00000000006=
1f650
[ 1278.841526] RBP: 0000000000000000 R08: 00007ffcb093d080 R09: 00007ffcb08=
e0b40
[ 1278.848652] R10: 00000000000005de R11: 0000000000000202 R12: 20c49ba5e35=
3f7cf
[ 1278.855774] R13: 00007ffcb08e0c60 R14: 0000000000000000 R15: 00000000000=
00000

setsockopt04.c:40: INFO: Send buffer size was set to: 4608
setsockopt04.c:45: PASS: Was unable to set negative send b
[ 1278.874497] BUG: unable to handle page fault for address: 000000000061f6=
68
[ 1278.882362] #PF: supervisor read access in kernel mode
[ 1278.887493] #PF: error_code(0x0001) - permissions violation
[ 1278.893057] PGD 8000000412ef1067 P4D 8000000412ef1067 PUD 423a10067
PMD 456981067 PTE 800000037dfe6067
[ 1278.902348] Oops: 0001 [#2] SMP PTI
[ 1278.905833] CPU: 0 PID: 9738 Comm: settimeofday02 Tainted: G      D
W         5.4.0-rc7-next-20191114 #1
[ 1278.915303] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[ 1278.922776] RIP: 0010:__x64_sys_settimeofday+0x77/0x120

Complete log:
-------------------
https://lkft.validation.linaro.org/scheduler/job/1010601#L13874

summary:
--------------
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  git commit: 8466d23e6e677cb58e237d1f35588497b8dd5c5c
  git describe: next-20191114
  make_kernelversion: 5.4.0-rc7
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-corei7-64/lkf=
t/linux-next/646/config

--
Linaro LKFT
https://lkft.linaro.org
