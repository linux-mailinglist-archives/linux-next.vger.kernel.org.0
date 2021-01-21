Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED8A2FF167
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 18:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388271AbhAURJC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 12:09:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388501AbhAURIO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2021 12:08:14 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE11C06174A
        for <linux-next@vger.kernel.org>; Thu, 21 Jan 2021 09:07:34 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id l9so3673837ejx.3
        for <linux-next@vger.kernel.org>; Thu, 21 Jan 2021 09:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=eQLhd0RmecsUtEwCOZ8FyndJtq64hLkT3ga0vHtTJyA=;
        b=cVnCzHWFDMq4b1Y+wJLNcLc+tppx3MXwY2Cstab5yAO3oBx1p9md0AU31OZIUJm9U1
         Nqp87MRNfENPWnHem7RBWmPEDrFFg+GF4aNGpget7mS6Ibe+/Fvzq97P9qp4MAKXSXvV
         YRlNTq+h3snzqV6GBTLYwblp0Ioz1bBlqEuqfYVFAriuThvhYGECX5oftPmiDOSRDH/D
         YkpW+HxMZftqG4IN0MhpdpR599evmq7R9HhiLm0YSO4liM4OIomKtUYCN54tN5Aw8N+d
         7ham/alDhE28VnkaUNyQ2pJIaoYZj+ohp2M4xQDIvqDUjEINPxVAEmOUVIhLrLcCmhNJ
         A6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=eQLhd0RmecsUtEwCOZ8FyndJtq64hLkT3ga0vHtTJyA=;
        b=JgPV9DjtYfhDepmhKJhbI7VJtTT7NIHRHyXnHyMG/5zUV29Mh8A0QBvyTbMSJiohz0
         3JKoXWCWLFZImnAmcLZ70tdjMenyePyUtxhTEagemMz21EBaIr2IXEA0PX2yfDhQIG/H
         WCygoNozVVLM+OsNlhaUnGb2SNgxmErAD3tjyjl9kj6j+SBdzpwB5bflbMioVtApbLIU
         tMTepcKqyaDb2469Xw4Nb6m/Jl91AQUQ2Ael9dltzFcDAkh7mwLA7p7I3WBmvuss7/dC
         /iHJnmCWkAcUJDlj9jioWWsqBAjRIUIM7jsQZp7Hwhg7Bx92DO71Mt/goLmovQGKFzNX
         HUOQ==
X-Gm-Message-State: AOAM533mN2LYwyISSjJ8vHaUvlRrMt89JrPW4gqJPpbPyObdtg3Tzpth
        2gwU83UsxV4SrbPBLU3wc6jbrRFc8qjVOaXi4OhpnQ==
X-Google-Smtp-Source: ABdhPJy26oMJqrssJrRugiqhP60IfyO4cinwsLNNZtZpjPkgr6BozMryJUzfIoUzBChNvfJweoKhon2o9u48dshOJhU=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr279216eju.375.1611248852718;
 Thu, 21 Jan 2021 09:07:32 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 21 Jan 2021 22:37:21 +0530
Message-ID: <CA+G9fYvV5SZ47M-XpABya11okgR7BJQk-3dDuFWzgVmGN3Lurg@mail.gmail.com>
Subject: rcu-torture: Internal error: Oops: 96000006
To:     rcu@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

While running rcu-torture test on qemu_arm64 and arm64 Juno-r2 device
the following kernel crash noticed. This started happening from Linux next
next-20210111 tag to next-20210121.

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20210111
  kernel-config: https://builds.tuxbuild.com/1muTTn7AfqcWvH5x2Alxifn7EUH/config

output log:

[  621.538050] mem_dump_obj() slab test: rcu_torture_stats =
ffff0000c0a3ac40, &rhp = ffff800012debe40, rhp = ffff0000c8cba000, &z
= ffff8000091ab8e0
[  621.546662] mem_dump_obj(ZERO_SIZE_PTR):
[  621.546696] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000008
[  621.555431] Mem abort info:
[  621.557243]   ESR = 0x96000006
[  621.559074]   EC = 0x25: DABT (current EL), IL = 32 bits
[  621.562240]   SET = 0, FnV = 0
[  621.563626]   EA = 0, S1PTW = 0
[  621.565134] Data abort info:
[  621.566425]   ISV = 0, ISS = 0x00000006
[  621.568064]   CM = 0, WnR = 0
[  621.569571] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101ef0000
[  621.572446] [0000000000000008] pgd=0000000102ee1003,
p4d=0000000102ee1003, pud=0000000100b25003, pmd=0000000000000000
[  621.577007] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[  621.579359] Modules linked in: rcutorture(-) torture rfkill crct10dif_ce fuse
[  621.582549] CPU: 2 PID: 422 Comm: rcu_torture_sta Not tainted
5.11.0-rc2-next-20210111 #2
[  621.585294] Hardware name: linux,dummy-virt (DT)
[  621.586671] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
[  621.588497] pc : kmem_valid_obj+0x58/0xa8
[  621.589748] lr : kmem_valid_obj+0x40/0xa8
[  621.591022] sp : ffff800012debdc0
[  621.592026] x29: ffff800012debdc0 x28: 0000000000000000
[  621.593652] x27: ffff800012e8b988 x26: ffff0000c634dbc0
[  621.595287] x25: 0000000000000000 x24: ffff8000091a1e60
[  621.596882] x23: ffff8000091ab8e0 x22: ffff0000c0a3ac40
[  621.598464] x21: ffff0000c1f44100 x20: ffff8000091a5e90
[  621.600070] x19: 0000000000000000 x18: 0000000000000010
[  621.601692] x17: 0000000000007fff x16: 00000000ffffffff
[  621.603303] x15: ffff0000c0a3b0b8 x14: 66203d2070687226
[  621.604866] x13: 202c303463613361 x12: 2c30346562656432
[  621.606455] x11: ffff80001246cbc0 x10: ffff800012454b80
[  621.608064] x9 : ffff8000100370c8 x8 : 0000000100000000
[  621.609649] x7 : 0000000000000018 x6 : ffff800012816348
[  621.611253] x5 : ffff800012816348 x4 : 0000000000000001
[  621.612849] x3 : 0000000000000001 x2 : 0000000140000000
[  621.614455] x1 : 0000000000000000 x0 : fffffc0000000000
[  621.616062] Call trace:
[  621.616816]  kmem_valid_obj+0x58/0xa8
[  621.617933]  mem_dump_obj+0x20/0xc8
[  621.619015]  rcu_torture_stats+0xf0/0x298 [rcutorture]
[  621.620578]  kthread+0x120/0x158
[  621.621583]  ret_from_fork+0x10/0x34
[  621.622685] Code: 8b000273 b25657e0 d34cfe73 8b131813 (f9400660)
[  621.624570] ---[ end trace 2a00688830f37ea1 ]---

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Full test log:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210111/testrun/3716647/suite/linux-log-parser/test/check-kernel-oops-2124993/log
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210121/testrun/3791289/suite/linux-log-parser/test/check-kernel-oops-2172413/log

-- 
Linaro LKFT
https://lkft.linaro.org
