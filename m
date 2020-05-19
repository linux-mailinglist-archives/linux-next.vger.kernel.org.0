Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22111DA446
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 00:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgESWJc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 18:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgESWJc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 18:09:32 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266EEC08C5C0
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 15:09:32 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id h21so827331ejq.5
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=wbXocx2IVcd/8hG9Fw76EUVKCyEFsGvoPgyI2u8Yy7s=;
        b=UuoVs2/xVkQsqh8oRKq34Pi7IJzz+LxoGejoY/A86MXa6IeiwmeyUzjMuiXugpkXeM
         uqgKJCo1MiY6ZK2ei1nM2/349ru0e63XRYH5zD3LuwdgOnc8mMiNwy4xCYAROdsyW8gD
         032b+dSPWY9eIbClbaCYY6+2LXUKJmK0+0vcT66LdaQ/Z739mfN4IlsVFL7JjrQ3NxH9
         inmwLO1xpczAlXrEOyLybgtsbYttc/EJuT2eClMezcfLIvIzB06L1W/q/HPhCJbJtNB3
         w7nDDdiXbHS11rmiRGFzCGOrcfC655w8l7e5zCTE6XVnQuPm9yxdHFj+cX0Iah2VS/ck
         2+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wbXocx2IVcd/8hG9Fw76EUVKCyEFsGvoPgyI2u8Yy7s=;
        b=pld/AwTKHA4OC7+8Wr/2tMUVN2NZ+6zac3XIOaLuGGQuH4R3MGCzgJ7x61HHV0vuUJ
         UsFfAxcKeiU9cVke02PpPc+NMdTPczHEq2ooKW8kjSrqVxP4WQJODdSJJW+i5GzpB56z
         2VmYaYNEvK1GcGzg77OtT782p093sMBqMNCTsOc9zOEFn9aocWN781GmTAhC2kDnUsjs
         esqlALUzPbfithGyoQotwXA6S6fF9W2B6qR//JadGUJn0jTti3e6iTn/MsKrE7kvGjwv
         DwiHfmODBNyChTjKep1Z4S1WxFYvcYrOFjDDr5JYojL5yXMDbDwhV2i5tEdRtx8XNJ1L
         30BA==
X-Gm-Message-State: AOAM533Px/lnysbj0CNDtlNy9Hd2fprYiaEHs2kl9oxsMis58x98qcV4
        kJtbCfO2LJASJxpoQjrDvtE4j0wwJeYSzG5JwaS7BA==
X-Google-Smtp-Source: ABdhPJz8Afk0tO3ZoqGa4Ed2tdS7qerbDDkJXRn2mhV2+4mQheYHREs7S7MxTs1oJsVybE+vXqGgZgmrDb8ZCclPEFo=
X-Received: by 2002:a17:906:934d:: with SMTP id p13mr1192908ejw.452.1589926170654;
 Tue, 19 May 2020 15:09:30 -0700 (PDT)
MIME-Version: 1.0
From:   Qian Cai <cai@lca.pw>
Date:   Tue, 19 May 2020 18:09:19 -0400
Message-ID: <CAG=TAF6hJL-wfGLq3oa-ZGk3-YGEtuMyO2V9ePFUcbv99NWVSw@mail.gmail.com>
Subject: BUG: sleeping function called from atomic due to "Balance initial LPI
 affinity across CPUs"
To:     Marc Zyngier <maz@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     John Garry <john.garry@huawei.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Reverted the linux-next commit f068a62c548c ("irqchip/gic-v3-its:
Balance initial LPI affinity across CPUs") fixed these warnings during
boot,

its_select_cpu at drivers/irqchip/irq-gic-v3-its.c:1572

[  332.819381][ T3359] BUG: sleeping function called from invalid
context at mm/slab.h:568
[  332.827405][ T3359] in_atomic(): 1, irqs_disabled(): 128,
non_block: 0, pid: 3359, name: irqbalance
[  332.836455][ T3359] INFO: lockdep is turned off.
[  332.841076][ T3359] irq event stamp: 0
[  332.844836][ T3359] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[  332.851828][ T3359] hardirqs last disabled at (0):
[<ffff9000101ea65c>] copy_process+0x98c/0x1f34
[  332.860710][ T3359] softirqs last  enabled at (0):
[<ffff9000101ea690>] copy_process+0x9c0/0x1f34
[  332.869586][ T3359] softirqs last disabled at (0): [<0000000000000000>] 0x0
[  332.876560][ T3359] CPU: 155 PID: 3359 Comm: irqbalance Tainted: G
      W    L    5.7.0-rc6-next-20200519 #1
[  332.886563][ T3359] Hardware name: HPE Apollo 70
/C01_APACHE_MB         , BIOS L50_5.13_1.11 06/18/2019
[  332.897000][ T3359] Call trace:
[  332.900151][ T3359]  dump_backtrace+0x0/0x22c
[  332.904514][ T3359]  show_stack+0x28/0x34
[  332.908543][ T3359]  dump_stack+0x104/0x194
[  332.912738][ T3359]  ___might_sleep+0x314/0x328
[  332.917274][ T3359]  __might_sleep+0x7c/0xe0
[  332.921563][ T3359]  slab_pre_alloc_hook+0x44/0x8c
[  332.926360][ T3359]  __kmalloc_node+0xb0/0x618
[  332.930811][ T3359]  alloc_cpumask_var_node+0x48/0x94
[  332.935868][ T3359]  alloc_cpumask_var+0x10/0x1c
[  332.940496][ T3359]  its_select_cpu+0x58/0x2e4
[  332.944945][ T3359]  its_set_affinity+0xe8/0x27c
[  332.949576][ T3359]  msi_domain_set_affinity+0x78/0x114
[  332.954813][ T3359]  irq_do_set_affinity+0x84/0x198
[  332.959697][ T3359]  irq_set_affinity_locked+0x80/0x1a8
[  332.964927][ T3359]  __irq_set_affinity+0x54/0x84
[  332.969637][ T3359]  write_irq_affinity+0x16c/0x198
[  332.974520][ T3359]  irq_affinity_proc_write+0x34/0x44
[  332.979672][ T3359]  pde_write+0x5c/0x78
[  332.983602][ T3359]  proc_reg_write+0x74/0xc0
[  332.987974][ T3359]  __vfs_write+0x84/0x1d8
[  332.992163][ T3359]  vfs_write+0x13c/0x1b8
[  332.996265][ T3359]  ksys_write+0xb0/0x120
[  333.000385][ T3359]  __arm64_sys_write+0x54/0x88
[  333.005017][ T3359]  do_el0_svc+0x128/0x1dc
[  333.009213][ T3359]  el0_sync_handler+0xd0/0x268
[  333.013836][ T3359]  el0_sync+0x164/0x180
[  336.527739][ T3356] mlx5_core 0000:0b:00.1 enp11s0f1np1: Link down
