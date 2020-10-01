Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3079328067C
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 20:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732407AbgJASYv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 14:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732384AbgJASYu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 14:24:50 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0B4C0613E3
        for <linux-next@vger.kernel.org>; Thu,  1 Oct 2020 11:24:50 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id n61so6415848ota.10
        for <linux-next@vger.kernel.org>; Thu, 01 Oct 2020 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7Y8kwT+ROkgjZr0Bqbw1zBd8u6aeCCa5OOj6AKhB4fk=;
        b=gkhPgFzGjJMsz5ghjHdA/sGZd3J6aQAA1JuFyZ56AEuvCbzt0o0nitxaL/bfbc4vyb
         ZaUzMfiw6JALKv72W4NgHU6eMZZYNm/amG6bgFdl0qESiLHu4C2/0jss9hk3QUWp/fRW
         semtDI5Ok4/0lxLZ/iJ2Tta0XrbQTUdm2aOVLQGdsPKURboWfBctCOzWU1dQsjDcgCGn
         7eTUclWwVgasO8gZiu/MN/1hL9IooZboMmN9fJm32vISG0YOOeMoE0qRyqLn50jexm9n
         c1pS5v2RNj2hcWNysJvZANmqk3EtH55Q8PnHfDIxLH6h+CazIRnNTstf6RYgXEgVxVUx
         KAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7Y8kwT+ROkgjZr0Bqbw1zBd8u6aeCCa5OOj6AKhB4fk=;
        b=WcGEPA1CGLacKO4y1A4DLPEWZAAxSsJvHd3/VohoLX/CYGJSoiv3U103b38BWBdVbY
         cS5iSmbz1E3Nm7r19knXgYe8HexnfHdHzLr/ddNg856NK4owlrQU3laP+/VNfW2oyZ+U
         FT6AgEB1zIUI8SO0sx3E/jwsCc2lLjoF/lk9fdabjX1KA3R56uBiojuhqpI5BPjfHV67
         E8QZuar4wGSHj1pV07Nif6PNw0zXHPNGOvrcYLXkFp6mQ2gkv93R1s6zTdE7lthOC4rF
         8x1ei2ZpBbFcIbQit6K0km7auKC51BVQVcIyVkDxb13yO+YQnbWLGbsXjZbgN24Tu9/H
         uGiw==
X-Gm-Message-State: AOAM530J9VXTcO7cJ1lPtAdoiZc3WCUpBtfl8wvHYJYJY1Qo4o2DmHMH
        0uAXJLOUPkvazWulwMe1UltopJWuhzZShmsGP1zT3a7n8EtlLgJp
X-Google-Smtp-Source: ABdhPJxWy/dpIvIDE/9/cGX1GNZNxseEYh6cB+HFNMCEeGK1IxO6vBuNub9gh4y7ASbo3xoJaIH/2w5QgNadoQojr3U=
X-Received: by 2002:a05:6830:2104:: with SMTP id i4mr6082572otc.266.1601576688890;
 Thu, 01 Oct 2020 11:24:48 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 1 Oct 2020 23:54:37 +0530
Message-ID: <CA+G9fYvPXVRO0NV7yL=FxCmFEMYkCwdz7R=9W+_votpT824YJA@mail.gmail.com>
Subject: BUG: kernel NULL pointer dereference, address: 00000024 - ftrace
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While running kselftest on i386 on Linux next 20201001 kernel this bug
was noticed.
BUG: kernel NULL pointer dereference, address: 00000024


steps to reproduce:
# cd  /opt/kselftests/ftrace
# ./ftracetest

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: d39294091fee6b89d9c4a683bb19441b25098330
  git describe: next-20201001ftracetest
  make_kernelversion: 5.9.0-rc7
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-core2-32/lkft/linux-next/872/config

# selftests: ftrace: ftracetest
# === Ftrace unit tests ===
# [1] Basic trace file check [PASS]
# [2] Basic test for tracers [PASS]
# [3] Basic trace clock test [PASS]
# [4] Basic event tracing check [PASS]
# [5] Change the ringbuffer size [PASS]
# [6] Snapshot and tracing setting [PASS]
# [7] trace_pipe and trace_marker [PASS]
# [8] Test ftrace direct functions against tracers [UNRESOLVED]
# [9] Test ftrace direct functions against kprobes [UNRESOLVED]
# [10] Generic dynamic event - add/remove kprobe events [PASS]
# [11] Generic dynamic event - add/remove synthetic events [PASS]
# [12] Generic dynamic event - selective clear (compatibility) [PASS]
# [13] Generic dynamic event - generic clear event [PASS]
# [14] event tracing - enable/disable with event level files
[  207.481763] BUG: kernel NULL pointer dereference, address: 00000024
[  207.488050] #PF: supervisor read access in kernel mode
[  207.493205] #PF: error_code(0x0000) - not-present page
[  207.498355] *pde = 00000000
[  207.501258] Oops: 0000 [#1] SMP
[  207.504421] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G        W
  5.9.0-rc7-next-20201001 #1
[  207.513205] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.0b 07/27/2017
[  207.520680] EIP: trace_event_raw_event_sched_switch+0x10/0x180
[  207.526510] Code: 08 5b 5e 5f 5d c3 8d 74 26 00 31 c0 eb e4 e8 27
1d de 00 8d b4 26 00 00 00 00 55 89 e5 57 56 53 89 c6 89 cf 83 ec 28
8b 45 08 <8b> 5e 24 89 55 cc 89 45 d0 65 a1 14 00 00 00 89 45 f0 31 c0
f6 c7
[  207.545253] EAX: f55aa480 EBX: f55aa480 ECX: f55adb40 EDX: 00000000
[  207.551510] ESI: 00000000 EDI: f55adb40 EBP: f55bbf20 ESP: f55bbeec
[  207.557769] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210092
[  207.564554] CR0: 80050033 CR2: 00000024 CR3: 10830000 CR4: 003506d0
[  207.570811] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  207.577069] DR6: fffe0ff0 DR7: 00000400
[  207.580898] Call Trace:
[  207.583344]  ? pick_next_task_fair+0x165/0x3b0
[  207.587794]  __schedule+0x4dc/0xa90
[  207.591283]  schedule_idle+0x1c/0x40
[  207.594863]  do_idle+0x185/0x2a0
[  207.598097]  cpu_startup_entry+0x25/0x30
[  207.602021]  start_secondary+0x106/0x140
[  207.605946]  startup_32_smp+0x164/0x168
[  207.609778] Modules linked in: sch_fq sch_ingress veth algif_hash
x86_pkg_temp_thermal fuse [last unloaded: test_bpf]
[  207.620385] CR2: 0000000000000024
[  207.623697] ---[ end trace 6ad815a56bdaaf71 ]---
[  207.628342] EIP: trace_event_raw_event_sched_switch+0x10/0x180
[  207.634173] Code: 08 5b 5e 5f 5d c3 8d 74 26 00 31 c0 eb e4 e8 27
1d de 00 8d b4 26 00 00 00 00 55 89 e5 57 56 53 89 c6 89 cf 83 ec 28
8b 45 08 <8b> 5e 24 89 55 cc 89 45 d0 65 a1 14 00 00 00 89 45 f0 31 c0
f6 c7
[  207.652918] EAX: f55aa480 EBX: f55aa480 ECX: f55adb40 EDX: 00000000
[  207.659175] ESI: 00000000 EDI: f55adb40 EBP: f55bbf20 ESP: f55bbeec
[  207.665433] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00210092
[  207.672211] CR0: 80050033 CR2: 00000024 CR3: 10830000 CR4: 003506d0
[  207.678466] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  207.684740] DR6: fffe0ff0 DR7: 00000400
[  207.688597] Kernel panic - not syncing: Attempted to kill the idle task!
[  207.695329] Kernel Offset: disabled
[  207.698828] ---[ end Kernel panic - not syncing: Attempted to kill
the idle task! ]---


full test log,
https://lkft.validation.linaro.org/scheduler/job/1809544#L6012

-- 
Linaro LKFT
https://lkft.linaro.org
