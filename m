Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEE6365A6D
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 15:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhDTNqB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 09:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbhDTNp7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Apr 2021 09:45:59 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC118C06174A
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 06:45:27 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u21so58382419ejo.13
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JM/icD7T6W7gUmifoxKrWVUnrbXmjHlobg/xWhxiON8=;
        b=nrm4jqVJyL/uYF050/4PlBVj3Tyyl/gfqAr6HJ7EE2l5bTfhJvfimT+d/Dp0DcMSKR
         pQBxjkglRZhBHwOMtFnvFg6AgIAG6Jpey+RTKIxgRiutULFS1exLDXsQLhbtapqukAsr
         NSOZywKZSUjpAljZN50HWftvvDIZ7KDtl6ezkZFKT33tUbCWwVJIqb23qLv0k0SijJaG
         NvXqYmOKtgGV0PAPcNKAWfuTunuOrzp+gI+apgM7v4Pi5PLk4/8itLsDXszbc1bMh8xo
         MuxHtb4dng353Y5eLleEcfQThMhDTC8TdgMrfBlTmf024D3EqCvGqhkkSah20eaLB7Lu
         EhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JM/icD7T6W7gUmifoxKrWVUnrbXmjHlobg/xWhxiON8=;
        b=UOfjTizlyk3qMCCANZHzNHn7d2NjtAzPJ1fy5DuSQzvsGq1A+0PaaRUkFY5Os54ZAp
         uki3/QociHTDvqpHj/TJWjPKwhPvpW8PDqAZBhErvW6sRVPuWT1H+TS5j2QElROmnrXR
         a+5rzzCZpciK372PRo4iW0b3Lf2B5mqDxuJO01jgIP9PCASl4dc8fvdDPSkrdxJv2UQK
         6qdrau1D/deuwxF0J58qAFx9CcGLiP6VVXYlx2nGjkfuyNXP8d2jepbg+pRMirmv9zVv
         wqn306EfYaj3BcFUPmtTK4PPxJvPbdWZHmNiVJOP5V5jCg9q/N3GH82TcqBqqDpLssNy
         yiFQ==
X-Gm-Message-State: AOAM533jm8/Kyob1bwzVi0HJKOxXo6QTMheYPLWurHRKyFnqnCEmzpJL
        PlkboLH5FQ9UkUuISvXP7XyQvQ+KZ/1ixSfmK0DELA==
X-Google-Smtp-Source: ABdhPJw3XlRc1ZNbIgf8VyJD9I/aKgCKRkxwe3MDwn0+iYuhZN3brndS+Lf8tTAvUaQGs0JIVIsEh2wuQNNGzeWL4BQ=
X-Received: by 2002:a17:906:3749:: with SMTP id e9mr18435125ejc.247.1618926326304;
 Tue, 20 Apr 2021 06:45:26 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 20 Apr 2021 19:15:14 +0530
Message-ID: <CA+G9fYskw4f8GDnn+YngdXihFGs5vP5EekDNqECY7XKTd9cbRg@mail.gmail.com>
Subject: BUG: KASAN: use-after-free in page_to_skb.isra.0+0x300/0x418
To:     virtualization@lists.linux-foundation.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        Alan Bennett <alan.bennett@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following kernel BUG reported on qemu-arm64 running linux next 20210420
the config is enabled with KASAN.

steps to reproduce:
----------------------------
- Build the arm64 kernel with KASAN enabled.
- boot it with below command and you will notice
 /usr/bin/qemu-system-aarch64 -cpu host -machine virt,accel=kvm
-nographic -net nic,model=virtio,macaddr=BA:DD:AD:CC:09:10 -net tap -m
1024 -monitor none -kernel kernel/Image.gz --append "console=ttyAMA0
root=/dev/vda rw" -hda
rootfs/rpb-console-image-lkft-juno-20210414125244-133.rootfs.ext4 -m
4096 -smp 4 -nographic


crash log:
-------------
[   23.711647] BUG: KASAN: use-after-free in page_to_skb.isra.0+0x300/0x418
[   23.715349] Read of size 12 at addr ffff0000cf63f800 by task systemd/1
[   23.718528]
[   23.719331] CPU: 0 PID: 1 Comm: systemd Not tainted
5.12.0-rc8-next-20210420 #1
[   23.722836] Hardware name: linux,dummy-virt (DT)
[   23.725114] Call trace:
[   23.726345]  dump_backtrace+0x0/0x2f0
[   23.728167]  show_stack+0x20/0x30
[   23.729843]  dump_stack+0x120/0x19c
[   23.731576]  print_address_description.constprop.0+0x6c/0x30c
[   23.734357]  kasan_report+0x1e0/0x248
[   23.736155]  kasan_check_range+0x100/0x1b8
[   23.738183]  memcpy+0x54/0x100
[   23.739707]  page_to_skb.isra.0+0x300/0x418
[   23.742027]  receive_buf+0x113c/0x2118
[   23.743881]  virtnet_poll+0x28c/0x980
[   23.745712]  __napi_poll+0x64/0x2e8
[   23.747450]  net_rx_action+0x204/0x448
[   23.749315]  __do_softirq+0x20c/0x70c
[   23.751124]  irq_exit+0x184/0x190
[   23.752786]  __handle_domain_irq+0x8c/0xf0
[   23.754790]  gic_handle_irq+0xe4/0x128
[   23.756612]  el1_irq+0xb4/0x14c
[   23.758194]  copy_page+0x48/0xe8
[   23.759815]  copy_user_highpage+0x20/0x50
[   23.761791]  wp_page_copy+0x178/0xe00
[   23.763592]  do_wp_page+0x10c/0x890
[   23.765330]  __handle_mm_fault+0xbb8/0x1560
[   23.767381]  handle_mm_fault+0x160/0x360
[   23.769320]  do_page_fault+0x1d4/0x5b0
[   23.771122]  do_mem_abort+0x68/0x100
[   23.772849]  el0_da+0x3c/0x50
[   23.774295]  el0_sync_handler+0x88/0xb8
[   23.776133]  el0_sync+0x18c/0x1c0
[   23.777751]
[   23.778520] Unable to handle kernel paging request at virtual
address dead000000000418
[   23.782211] Mem abort info:
[   23.783557]   ESR = 0x96000004
[   23.785383]   EC = 0x25: DABT (current EL), IL = 32 bits
[   23.787934]   SET = 0, FnV = 0
[   23.789451]   EA = 0, S1PTW = 0
[   23.791000] Data abort info:
[   23.792418]   ISV = 0, ISS = 0x00000004
[   23.794293]   CM = 0, WnR = 0
[   23.795756] [dead000000000418] address between user and kernel address ranges
[   23.799181] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   23.801878] Modules linked in: rfkill crct10dif_ce fuse
[   23.804467] CPU: 0 PID: 1 Comm: systemd Not tainted
5.12.0-rc8-next-20210420 #1
[   23.807965] Hardware name: linux,dummy-virt (DT)
[   23.810215] pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO BTYPE=--)
[   23.813114] pc : print_address_description.constprop.0+0xb4/0x30c
[   23.816067] lr : print_address_description.constprop.0+0x78/0x30c
[   23.819042] sp : ffff8000100077d0
[   23.820694] x29: ffff8000100077d0 x28: ffff0000cf63f80c
[   23.823289] x27: 000000000000780c x26: 000000000000000c
[   23.825884] x25: ffff0000c623e934 x24: ffff800015779000
[   23.828476] x23: ffff8000129f1888 x22: dead000000000400
[   23.831080] x21: 000000000000000c x20: fffffc00033d8fc0
[   23.833672] x19: ffff0000cf63f800 x18: 0000000000000000
[   23.836262] x17: 0000000000000000 x16: 0000000000000000
[   23.838866] x15: 0000000000000000 x14: 0000000000000000
[   23.841454] x13: 0000000000000000 x12: ffff60001b568d2c
[   23.844033] x11: 1fffe0001b568d2b x10: ffff60001b568d2b
[   23.846652] x9 : ffff8000101768f4 x8 : ffff0000dab4695b
[   23.849250] x7 : 0000000000000001 x6 : ffff0000dab46958
[   23.851827] x5 : 00009fffe4a972d5 x4 : dfff800000000000
[   23.854581] x3 : ffff000000000000 x2 : 00000000000cf63f
[   23.857178] x1 : 0000000000000000 x0 : dead000000000400
[   23.859756] Call trace:
[   23.860996]  print_address_description.constprop.0+0xb4/0x30c
[   23.863786]  kasan_report+0x1e0/0x248
[   23.865613]  kasan_check_range+0x100/0x1b8
[   23.867627]  memcpy+0x54/0x100
[   23.869179]  page_to_skb.isra.0+0x300/0x418
[   23.871234]  receive_buf+0x113c/0x2118
[   23.873092]  virtnet_poll+0x28c/0x980
[   23.874888]  __napi_poll+0x64/0x2e8
[   23.876609]  net_rx_action+0x204/0x448
[   23.878482]  __do_softirq+0x20c/0x70c
[   23.880278]  irq_exit+0x184/0x190
[   23.881950]  __handle_domain_irq+0x8c/0xf0
[   23.883952]  gic_handle_irq+0xe4/0x128
[   23.885800]  el1_irq+0xb4/0x14c
[   23.887344]  copy_page+0x48/0xe8
[   23.888964]  copy_user_highpage+0x20/0x50
[   23.890922]  wp_page_copy+0x178/0xe00
[   23.892753]  do_wp_page+0x10c/0x890
[   23.894491]  __handle_mm_fault+0xbb8/0x1560
[   23.896528]  handle_mm_fault+0x160/0x360
[   23.898475]  do_page_fault+0x1d4/0x5b0
[   23.900321]  do_mem_abort+0x68/0x100
[   23.902096]  el0_da+0x3c/0x50
[   23.903567]  el0_sync_handler+0x88/0xb8
[   23.905462]  el0_sync+0x18c/0x1c0
[   23.907123] Code: d2ffffe3 79405681 aa1603e0 d346fc42 (b9401ac6)
[   23.910073] ---[ end trace fd09da2bec4267c7 ]---
[   23.912299] Kernel panic - not syncing: Oops: Fatal exception in interrupt
[   23.915576] SMP: stopping secondary CPUs
[   23.917615] Kernel Offset: disabled
[   23.919303] CPU features: 0x00240002,20002004
[   23.921405] Memory Limit: none
[   23.922914] ---[ end Kernel panic - not syncing: Oops: Fatal
exception in interrupt ]---

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Full test log:
------------------
https://lkft.validation.linaro.org/scheduler/job/2555059#L646
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210420/testrun/4398870/suite/linux-log-parser/test/check-kernel-bug-2555059/log


metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20210420
  kernel-config: https://builds.tuxbuild.com/1rQkHtEDo0W1xQ7zqLlKg72HPil/config

--
Linaro LKFT
https://lkft.linaro.org
