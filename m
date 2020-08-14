Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13182446EB
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 11:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgHNJXt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 05:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgHNJXs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Aug 2020 05:23:48 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B26CC061384
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2020 02:23:48 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id p13so7892244ilh.4
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2020 02:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=8V/aMho6zRo/IgDuyYTA/d3Au1VvhjlbWbXRGp2EEZI=;
        b=fkCHTFEiCioUJWbB7wNGWVNSXq/YSH8BlbdWextsIEKMb2d0ouKGmuGWiZDJ0T4GSb
         xC3KlhDoeG5Hm1s9kQb8MlqrhlzPd+PUl4w/0d2/vSM8Rsam8nj9fdH7L5DMNm+21PdF
         SDHCfl06NZ9tn/8qtb4MtPm/Hzg29GeJyoT6Iy9luUOfHm7Rus7Fiwu7M41k83jlVsJF
         frfGPsMOJ0KZA7G75PJ21x7hUockNwjghl6u8pkbb7H0GxHzZRf7wPFHWIYbMbDO/Rgr
         cTaBZoMOoFd76cOLhQQowFL+C+NDFk5go94/LlQzH7Fy9ceOJBfX67+NVTlCHvdk4ziM
         7r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=8V/aMho6zRo/IgDuyYTA/d3Au1VvhjlbWbXRGp2EEZI=;
        b=sge6tj2uyiCGaLuPQ84pYK6exPjK8rvguvvdZIAriTgwusGz2LJ9B3+aWyLo+cBD9D
         lX8Vv/fQOopwE0tQ6/wO1fXrTuDxrWQNaWjurJalaA4Xi10gv3Inj7AzbYJXpVYZOAkB
         I1UKRzHybPpdfHETE3ibe/Op2k3ZA7gVP309CB1nCW/lALHm0SXUAYSAg2M30CtHlm/r
         cwFlpi/VCwKL552J/L7TaLcbCF6vP3n1i/n9j/+jet1Y0GJ3lCdJbiX5jZKnRZCyAqXD
         85AS3WPOE+JsAm15Zux88MtXdSMCeLsV/REWvc636ydgYI5zwORvNt5iAObeNo4xoVSV
         ilpQ==
X-Gm-Message-State: AOAM530yA76ObXaZs2IMucXMAz0bdahec6vfuYGeRytMkLDlQtlmn5V2
        iI1N/f2lqePpU2P0oIHUWxGY8fEmhF/QbYQ/UCgODakO7BGyPTRh
X-Google-Smtp-Source: ABdhPJxRVRx8pUikQudBW7zek83MrXBeiPgoYcasOTbgYHGnvUPGpU+72vHPmXeuChgmENaysM78JvghPrKMDoerL3I=
X-Received: by 2002:a92:1805:: with SMTP id 5mr1654018ily.127.1597397027244;
 Fri, 14 Aug 2020 02:23:47 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 14 Aug 2020 14:53:36 +0530
Message-ID: <CA+G9fYvVEhs_HROaXaW70mWrp_z6N4mJ-3rfFs0iAcT9Kg3A1A@mail.gmail.com>
Subject: WARNING: at kernel/trace/trace.c:1727 update_max_tr_single.part.0+0xa8/0x148
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Sean Paul <sean@poorly.run>, lkft-triage@lists.linaro.org,
        Ingo Molnar <mingo@redhat.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While running LTP tracing test case on arm64 the following kernel warnings
noticed on linux next tag 20200814.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 4993e4fe12af2d71b6a3ad16e1fcdc566795fda1
  git describe: next-20200814
  make_kernelversion: 5.8.0
  kernel-config:
https://builds.tuxbuild.com/-2CPc32SCi8u5tWn5mkUug/kernel.config

steps to reproduce:
# Boot qemu arm64 with trace configs enabled ^.
# cd /opt/ltp
# ./runltp -f tracing

output log,
------------
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
[   54.196774] ------------[ cut here ]------------
[   54.199689] WARNING: CPU: 2 PID: 1920 at kernel/trace/trace.c:1727
update_max_tr_single.part.0+0xa8/0x148
[   54.204796] Modules linked in: crct10dif_ce fuse
[   54.207742] CPU: 2 PID: 1920 Comm: cat Not tainted 5.8.0-next-20200814 #1
[   54.211443] Hardware name: linux,dummy-virt (DT)
[   54.214141] pstate: 80000085 (Nzcv daIf -PAN -UAO BTYPE=--)
[   54.217378] pc : update_max_tr_single.part.0+0xa8/0x148
[   54.220284] lr : update_max_tr_single.part.0+0x94/0x148
[   54.223139] sp : ffff800014e9b940
[   54.225086] x29: ffff800014e9b940 x28: ffff800012197000
[   54.228235] x27: ffff8000124e9000 x26: 0000000000000001
[   54.231345] x25: ffff800012545a00 x24: ffff80001001eb7c
[   54.234539] x23: 0000000000000002 x22: ffff800012213980
[   54.237713] x21: ffff0000e06dc9c0 x20: 0000000000000002
[   54.240884] x19: ffff800012213980 x18: 0000000000000000
[   54.244041] x17: 0000000000000000 x16: 0000000000000000
[   54.247148] x15: 0000000000000000 x14: ffff80001024fcf4
[   54.250352] x13: ffff80001024fc30 x12: ffff80001024f894
[   54.253501] x11: ffff80001024d1c8 x10: ffff800010244bc8
[   54.256671] x9 : ffff0000dec41680 x8 : 0000000000000001
[   54.259816] x7 : 00000000000002d8 x6 : 0000000000000312
[   54.262927] x5 : ffff0000fac05200 x4 : ffff0000fad73600
[   54.266093] x3 : ffff0000fad73400 x2 : 0000000000000002
[   54.269264] x1 : ffff0000fac05100 x0 : 00000000ffffffea
[   54.272513] Call trace:
[   54.274030]  update_max_tr_single.part.0+0xa8/0x148
[   54.276770]  update_max_tr_single+0x1c/0x28
[   54.279164]  check_critical_timing+0x1fc/0x210
[   54.281680]  tracer_preempt_on+0x130/0x178
[   54.283996]  trace_preempt_on+0x34/0x158
[   54.286173]  preempt_count_sub+0xb4/0xf0
[   54.288447]  _raw_spin_unlock+0x24/0x50
[   54.290607]  unmap_page_range+0x5f0/0x868
[   54.292860]  unmap_single_vma+0x90/0x120
[   54.295046]  unmap_vmas+0x78/0xf0
[   54.296983]  unmap_region+0xc0/0x128
[   54.299043]  __do_munmap+0x1bc/0x4e0
[   54.301118]  __vm_munmap+0x78/0xd8
[   54.303068]  __arm64_sys_munmap+0x3c/0x50
[   54.305373]  el0_svc_common.constprop.0+0x7c/0x198
[   54.308038]  do_el0_svc+0x2c/0x98
[   54.309936]  el0_sync_handler+0x9c/0x1b8
[   54.312168]  el0_sync+0x158/0x180
[   54.314048] ---[ end trace a683c8f878b562c7 ]---

<trim>

[  104.164380] ------------[ cut here ]------------
[  104.166499] WARNING: CPU: 0 PID: 701 at kernel/trace/trace.c:5774
__tracing_resize_ring_buffer+0x100/0x118
[  104.170865] Modules linked in: crct10dif_ce fuse
[  104.173049] CPU: 0 PID: 701 Comm: sh Tainted: G        W
5.8.0-next-20200814 #1
[  104.176715] Hardware name: linux,dummy-virt (DT)
[  104.178864] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[  104.181390] pc : __tracing_resize_ring_buffer+0x100/0x118
[  104.183847] lr : __tracing_resize_ring_buffer+0xfc/0x118
[  104.186280] sp : ffff80001433bd00
[  104.187805] x29: ffff80001433bd00 x28: ffff0000e10a49c0
[  104.190252] x27: 0000000000000000 x26: 0000000000000000
[  104.192662] x25: 0000000000000000 x24: 0000000000000000
[  104.195105] x23: 0000000001ccfc00 x22: 0000000001ccfc00
[  104.197534] x21: 00000000fffffff0 x20: ffffffffffffffff
[  104.199984] x19: ffff800012213980 x18: 0000000000000000
[  104.202438] x17: 0000000000000000 x16: 0000000000000000
[  104.204874] x15: 0000000000000000 x14: 0000000000000000
[  104.207379] x13: 0000000000000003 x12: 0000000000000000
[  104.209876] x11: 0000000000000001 x10: ffff80001433bc30
[  104.212289] x9 : ffff800010194980 x8 : ffff0000e10a5480
[  104.214735] x7 : 0000000000000004 x6 : 000000000000000f
[  104.217154] x5 : 0000000000000003 x4 : 0000000000000000
[  104.219588] x3 : ffff0000fac05138 x2 : 0000000000000000
[  104.222036] x1 : ffff0000e10a49c0 x0 : 00000000fffffff0
[  104.224442] Call trace:
[  104.225628]  __tracing_resize_ring_buffer+0x100/0x118
[  104.227908]  tracing_resize_ring_buffer+0x7c/0xb0
[  104.230069]  tracing_entries_write+0x74/0xd0
[  104.232011]  vfs_write+0xf8/0x238
[  104.233542]  ksys_write+0x74/0x100
[  104.235137]  __arm64_sys_write+0x24/0x30
[  104.236935]  el0_svc_common.constprop.0+0x7c/0x198
[  104.239194]  do_el0_svc+0x2c/0x98
[  104.240761]  el0_sync_handler+0x9c/0x1b8
[  104.242611]  el0_sync+0x158/0x180
[  104.244133] ---[ end trace a683c8f878b562c8 ]---

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

complete test log,
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200814/testrun/3066187/suite/linux-log-parser/test/check-kernel-bug-1668287/log


-- 
Linaro LKFT
https://lkft.linaro.org
