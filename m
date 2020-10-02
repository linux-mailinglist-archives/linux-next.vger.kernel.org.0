Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A62C280F8A
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 11:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgJBJJi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 05:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBJJh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 05:09:37 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9096CC0613D0
        for <linux-next@vger.kernel.org>; Fri,  2 Oct 2020 02:09:37 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id 4so167154ooh.11
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2020 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FfRCOyJ+EaFKOr3Aio0ATDsi4SO+lyczP5yA1MZQ5e0=;
        b=j/WOA/G5nLeq0+z7X7XdOb9FeYv6+7RcT/uNKRuepLJCg+seMU9yWk1vcmt+C5r59C
         kMz8uVU3wlrX4MazPR4SODyBIUcXkTZZLPzyJobZxTdwCP8FCFQNfUoF5gQOGSScPU+s
         7NgpSO03/mMlvlnTNpwaEzvEUD2hUP6kOlyLgExUno5Hzko+/xRxDa0unGdNCQjDKYJe
         jZ2djbgz20zzwlDpPy1JtNSk/1lenZ7j+MLK5Nk60o/SxUBBlo2H78wOcFaQkIiEzSCX
         KnXWM1gfunkxsK7TRMv2vYL4BAMBqlO+JY3Q6kVkylx15gK+2984OW7Cp0xre2DeoGCw
         gYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FfRCOyJ+EaFKOr3Aio0ATDsi4SO+lyczP5yA1MZQ5e0=;
        b=R3u6XcP4SZowvXL5d8DUqUe0oG652Ajn4ate55FIR2NhcfcLVNY/SU5xf7Oy4Cs69D
         RXWW33/2xseBj/nd9SrjWcPtdUu9brpIdxOSpOcCJH/W1FqbCm4fvuApTMIr7EzOC+FZ
         gjabqsTvtAlbgaKCZID9c5ZojYsIs7mzZ14VZ2sa74weIxgJsXzzaSaA2D1+qyfHQ7y6
         lC4xaeJPKru7y9WYRBMg3YTCUpgEm6PSbgnbqqmuFEdzrkoSZ6RMJjc4R/oZr94Thqoq
         YHV/ViF/Xp55pIGbLIZZHkRS4lafHHAddzjimMIECNwekfX3vLJnERJByfB2aoMQPXsW
         YrHQ==
X-Gm-Message-State: AOAM530MIcOUzJXuyl7vM3jhnE7xiBlqNxWIfYBcAt/kZXIuucSjnIHu
        Vhg2OXVcVzywv2jSmV5/mwEjGM7pojGLseaxMsilahKFFBK3h/RL
X-Google-Smtp-Source: ABdhPJwoHf5y9qn43pRyYCZ4uhpEQ+4hPyozHUpFuwptzv6ycXJb1CUeH4MS6V90pjT4l2f9yOJSzu5gy1b8jT25ZwM=
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr1133578ooa.1.1601629775860;
 Fri, 02 Oct 2020 02:09:35 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 2 Oct 2020 14:39:24 +0530
Message-ID: <CA+G9fYvE--g01a=eTs1Teo_AAZke34WvtOKxZ+7WhLnmkymQgA@mail.gmail.com>
Subject: Internal error: Oops: __traceiter_rcu_dyntick and rcu_nmi_enter
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org,
        lkft-triage@lists.linaro.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Leo Yan <leo.yan@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While running LTP tracing the following kernel warning was noticed on
qemu_arm running linux next 20201001 kernel.
I have not bisected this problem yet.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

steps to reproduce:
# boot qemu arm with linux next 20201001 tag kernel and this command line

/usr/bin/qemu-system-aarch64 -cpu host,aarch64=off -machine
virt-2.10,accel=kvm -nographic -net
nic,model=virtio,macaddr=BA:DD:AD:CC:09:02 -net tap -m 2048 -monitor
none -kernel /kernel/zImage --append "console=ttyAMA0 root=/dev/vda
rw" -hda /rootfs/rpb-console-image-lkft-am57xx-evm-20200723162735-41.rootfs.ext4
-m 4096 -smp 2 -nographic

# cd  /opt/ltp/
# ./runltp -s tracing

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git commit: d39294091fee6b89d9c4a683bb19441b25098330
  git describe: next-20201001
  make_kernelversion: 5.9.0-rc7
  kernel-config:
https://builds.tuxbuild.com/hw-PTbFtm7XJ15ZoA5Agjw/kernel.config

Test output log:
--------------------
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
[  118.092279] 8<--- cut here ---
[  118.093743] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[  118.097204] pgd = 5cbbb903
[  118.098406] [00000000] *pgd=00000000
[  118.099886] Internal error: Oops: 5 [#1] SMP ARM
[  118.102124] Modules linked in: crc32_arm_ce sha2_arm_ce sha256_arm
sha1_arm_ce sha1_arm aes_arm_ce crypto_simd
[  118.107642] CPU: 0 PID: 919 Comm: (agetty) Not tainted
5.9.0-rc7-next-20201001 #1
[  118.111384] Hardware name: Generic DT based system
[  118.113677] PC is at __traceiter_rcu_dyntick+0x34/0x68
[  118.116173] LR is at rcu_nmi_enter+0x158/0x17c
[  118.118348] pc : [<c03cd414>]    lr : [<c12517c0>]    psr: 60000093
[  118.121347] sp : eb333c20  ip : c03cd3f8  fp : eb333c4c
[  118.123862] r10: eb333e18  r9 : c18da374  r8 : 005f67aa
[  118.126722] r7 : 40000000  r6 : 40000002  r5 : ee4d5ec0  r4 : 00000000
[  118.129822] r3 : 40000002  r2 : 40000000  r1 : c18da374  r0 : c1f30ca0
[  118.132978] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment none
[  118.136502] Control: 10c5383d  Table: 690a406a  DAC: 00000051
[  118.139302] Process (agetty) (pid: 919, stack limit = 0x423671c1)
[  118.142166] Stack: (0xeb333c20 to 0xeb334000)
[  118.144241] 3c20: eb333ccc eb333c30 00000002 ee4d5ec0 eb332000
00000000 c1d04f54 0000001f
[  118.148079] 3c40: eb333c7c eb333c50 c12517c0 c03cd3ec 005f67aa
c1cbac10 60000093 c0500464
[  118.151904] 3c60: ffffe000 c1f31380 c0502384 00000001 eb333c8c
eb333c80 c12517f4 c1251674
[  118.155748] 3c80: eb333ca4 eb333c90 c03db214 c12517f0 c1cbac10
c0500464 eb333ccc eb333ca8
[  118.159746] 3ca0: c044bd08 c03db1f8 ebba56c0 00000dc0 c051d0cc
60000013 ee4d9258 c1f9b28c
[  118.163658] 3cc0: eb333cf4 eb333cd0 c0500464 c044bc00 ed9006c0
00000000 00000000 00000dc0
[  118.167535] 3ce0: c1d056e0 c1f9b28c eb333d3c eb333cf8 c0502384
c0500408 ffffe000 687b39a1
[  118.171412] 3d00: eb333d34 c1da6628 c051d0cc 0000f0f4 00020101
c1da6628 eb27d180 00020101
[  118.175257] 3d20: 00020101 000002c0 00000000 eb333e18 eb333d5c
eb333d40 c051d0cc c0501ebc
[  118.179074] 3d40: c1da6628 c1d04bc0 eb27d180 00020101 eb333d8c
eb333d60 c051d570 c051d0a8
[  118.182905] 3d60: 00000001 eb333e18 eb332000 eb332000 eb333ee8
eb333ee8 eb333e18 ffffff9c
[  118.187135] 3d80: eb333e14 eb333d90 c052d17c c051d514 c052e0e0
00000403 eb333dcc eb333da8
[  118.191102] 3da0: c0452290 c043b58c 40000013 eb332000 00000041
eb332000 ed8e8000 00001000
[  118.195036] 3dc0: eb333e14 eb333dd0 c04bc420 c0452218 ed805080
687b39a1 ed8e8000 eb332000
[  118.198974] 3de0: 00000003 687b39a1 00000000 eb332000 eb332000
eb333ee8 00000001 eb333e18
[  118.203347] 3e00: ffffff9c ffffff9c eb333ed4 eb333e18 c052f61c
c052d13c ebe70800 e81167c0
[  118.207566] 3e20: 00000000 00100000 eb333e94 eb333e38 c03131b4
c044d940 ebe70800 00000003
[  118.211702] 3e40: 00000003 00000000 c05404f0 c0541488 ebe70800
00000000 eb333e5c 00100000
[  118.215701] 3e60: eb333e94 687b39a1 c03131b4 00000003 ebe70800
e81167c0 00000000 00100000
[  118.219782] 3e80: 000a0101 00000100 eb333ec4 edbb3000 00000000
c05404e4 ffffff9c eb332000
[  118.223752] 3ea0: eb333f30 edbb3000 00000000 687b39a1 ffffff9c
eb332000 00000003 edbb3000
[  118.227999] 3ec0: 00000000 eb332000 eb333f2c eb333ed8 c0516c78
c052f5ac eb333f0c eb333ee8
[  118.231954] 3ee0: c035fa10 eb27dd70 00020101 687b0000 00000002
00000100 00000001 687b39a1
[  118.236161] 3f00: 00000142 00000000 00000000 000a0101 00000000
eb332000 ffffff9c 00605738
[  118.240218] 3f20: eb333f94 eb333f30 c0518374 c0516a70 000a0101
00000000 00000000 00000000
[  118.244210] 3f40: 00000000 00000000 000a0101 00000000 00000000
00000000 00000000 00000000
[  118.248508] 3f60: 00000000 687b39a1 00000142 00000000 00000000
b6f25900 00000142 c0300284
[  118.252549] 3f80: eb332000 00000142 eb333fa4 eb333f98 c05183fc
c05182e8 00000000 eb333fa8
[  118.256884] 3fa0: c03000c0 c05183ec 00000000 00000000 ffffff9c
00605738 000a0101 00000000
[  118.261036] 3fc0: 00000000 00000000 b6f25900 00000142 00605738
00000000 00000001 befa7514
[  118.265154] 3fe0: b6c15210 befa7440 b6db7380 b6bfe338 60000010
ffffff9c 00000000 00000000
[  118.269399] Backtrace:
[  118.270680] [<c03cd3e0>] (__traceiter_rcu_dyntick) from
[<c12517c0>] (rcu_nmi_enter+0x158/0x17c)
[  118.275211]  r9:0000001f r8:c1d04f54 r7:00000000 r6:eb332000
r5:ee4d5ec0 r4:00000002
[  118.278994] [<c1251668>] (rcu_nmi_enter) from [<c12517f4>]
(rcu_irq_enter+0x10/0x14)
[  118.282731]  r9:00000001 r8:c0502384 r7:c1f31380 r6:ffffe000
r5:c0500464 r4:60000093
[  118.286527] [<c12517e4>] (rcu_irq_enter) from [<c03db214>]
(rcu_irq_enter_irqson+0x28/0x44)
[  118.290545] [<c03db1ec>] (rcu_irq_enter_irqson) from [<c044bd08>]
(trace_hardirqs_on+0x114/0x1b0)
[  118.294786]  r5:c0500464 r4:c1cbac10
[  118.296529] [<c044bbf4>] (trace_hardirqs_on) from [<c0500464>]
(__slab_alloc.constprop.0+0x68/0x6c)
[  118.300895]  r9:c1f9b28c r8:ee4d9258 r7:60000013 r6:c051d0cc
r5:00000dc0 r4:ebba56c0
[  118.304648] [<c05003fc>] (__slab_alloc.constprop.0) from
[<c0502384>] (kmem_cache_alloc+0x4d4/0x684)
[  118.309048]  r9:c1f9b28c r8:c1d056e0 r7:00000dc0 r6:00000000
r5:00000000 r4:ed9006c0
[  118.312803] [<c0501eb0>] (kmem_cache_alloc) from [<c051d0cc>]
(__alloc_file+0x30/0xd4)
[  118.316606]  r10:eb333e18 r9:00000000 r8:000002c0 r7:00020101
r6:00020101 r5:eb27d180
[  118.320369]  r4:c1da6628
[  118.321632] [<c051d09c>] (__alloc_file) from [<c051d570>]
(alloc_empty_file+0x68/0x130)
[  118.325452]  r7:00020101 r6:eb27d180 r5:c1d04bc0 r4:c1da6628
[  118.328214] [<c051d508>] (alloc_empty_file) from [<c052d17c>]
(path_openat+0x4c/0xe2c)
[  118.332028]  r9:ffffff9c r8:eb333e18 r7:eb333ee8 r6:eb333ee8
r5:eb332000 r4:eb332000
[  118.335759] [<c052d130>] (path_openat) from [<c052f61c>]
(do_filp_open+0x7c/0xe8)
[  118.339432]  r10:ffffff9c r9:ffffff9c r8:eb333e18 r7:00000001
r6:eb333ee8 r5:eb332000
[  118.343198]  r4:eb332000
[  118.344449] [<c052f5a0>] (do_filp_open) from [<c0516c78>]
(do_sys_openat2+0x214/0x2d4)
[  118.348303]  r8:eb332000 r7:00000000 r6:edbb3000 r5:00000003 r4:eb332000
[  118.351537] [<c0516a64>] (do_sys_openat2) from [<c0518374>]
(do_sys_open+0x98/0xd4)
[  118.355219]  r10:00605738 r9:ffffff9c r8:eb332000 r7:00000000
r6:000a0101 r5:00000000
[  118.358972]  r4:00000000
[  118.360235] [<c05182dc>] (do_sys_open) from [<c05183fc>]
(sys_openat+0x1c/0x20)
[  118.363722]  r10:00000142 r9:eb332000 r8:c0300284 r7:00000142
r6:b6f25900 r5:00000000
[  118.367455]  r4:00000000
[  118.368707] [<c05183e0>] (sys_openat) from [<c03000c0>]
(ret_fast_syscall+0x0/0x28)
[  118.372366] Exception stack(0xeb333fa8 to 0xeb333ff0)
[  118.374829] 3fa0:                   00000000 00000000 ffffff9c
00605738 000a0101 00000000
[  118.378763] 3fc0: 00000000 00000000 b6f25900 00000142 00605738
00000000 00000001 befa7514
[  118.382680] 3fe0: b6c15210 befa7440 b6db7380 b6bfe338
[  118.385101] Code: e1a09001 e590415c e1a07002 e1a06003 (e5945000)
[  118.388047] ---[ end trace d9dd2a672e7123ad ]---

full test log
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201001/testrun/3260001/suite/linux-log-parser/test/check-kernel-trace-1809841/log

-- 
Linaro LKFT
https://lkft.linaro.org
