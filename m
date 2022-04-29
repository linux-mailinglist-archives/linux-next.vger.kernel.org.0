Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED0D5147F8
	for <lists+linux-next@lfdr.de>; Fri, 29 Apr 2022 13:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbiD2LX4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Apr 2022 07:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358250AbiD2LXz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Apr 2022 07:23:55 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE961A81A
        for <linux-next@vger.kernel.org>; Fri, 29 Apr 2022 04:20:38 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id g28so13859248ybj.10
        for <linux-next@vger.kernel.org>; Fri, 29 Apr 2022 04:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=L3mmxFtGGGPbCeO9YHS/N6LzY/l/JGVOv9dCdQDbPNA=;
        b=v4ydqymfzbbinHbmpn+hBq8uSnEiCvdVlotwirwsRqxK6gUTGJGNMshQskwZCgauM5
         qBXrWgAGWPQJYv7NEcpJBhIYi+obXpxQWJbSkc2rFXnosLkK/YshFyOVqul1Q0tp/JqG
         WU9EU1Rfvb7UxVUH1xu7odM9ak9L85U+OfzMpmmHnjmmwjIPEX5tb5yo7/vusBwFdiUe
         ws+kg0iYqIyGQ9Hgc7wOysVantu2dzUBM52h6I+ZFrO9SiX9/kYDcTYs/XwstEvcTrAQ
         5QwkDKrutr6pkrzRGn2lYNC01/wsBedauFFpvsoAnnvCQw/N5Jvrg7DGhKjFFnHay5mK
         RH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=L3mmxFtGGGPbCeO9YHS/N6LzY/l/JGVOv9dCdQDbPNA=;
        b=vs1UL7jJJS8Sc2OXinY/V1EYrs8QKFHg4PQHbjseImQJzsryBgFSpIaWpwsZ1F6VI9
         UZ9/TblGFm+JVONYbYcrdXybyOhk6tRcRA/jorLjqwOs7WFJXRARO94JCIpdqJsvuJSq
         Je9cTY0abJ7zdmBiLlw3tshTYrPfSjxfLTIW9cg+GpGkZPlJZYX13OiM+acb7zTYr/Uy
         SSskEL/MsDnGApG/wyWoKgwpLA8lTNRJKKhvbkdI54gK5sgDuA0J5sT8/dbQ7JcpYTJ2
         gk2e27QCODKxIHW9o9kN870B2OvS8NE4nannLhF47+DsfO3WVnlJamc+sOWPUj539bo7
         XRAg==
X-Gm-Message-State: AOAM532fdrgDA9WWI/nfEpQiDTHh2BIvVYHBkI1M4MVNwuvEg4SpHazR
        +fMwK6NSaHGEmU617BlmqwXZp+8YjRdvaPD5xOGJNVaOn60STw==
X-Google-Smtp-Source: ABdhPJwNU9A1Z3lCZgNROQWO8s2EA4fUJXM7JgFQFeQAv9PTvfbLB3X3D3g85+IjxYnSg8lUYWaD1WX3nVLJqQLnqMg=
X-Received: by 2002:a25:9909:0:b0:624:57e:d919 with SMTP id
 z9-20020a259909000000b00624057ed919mr34989975ybn.494.1651231236398; Fri, 29
 Apr 2022 04:20:36 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 29 Apr 2022 16:50:25 +0530
Message-ID: <CA+G9fYveMF-NU-rvrsbaora2g2QWxrkF7AWViuDrJyN9mNScJg@mail.gmail.com>
Subject: [next] mm: libhugetlbfs: WARNING: at mm/page_alloc.c:5368 __alloc_pages
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>, Zi Yan <ziy@nvidia.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        David Hildenbrand <david@redhat.com>,
        Eric Ren <renzhengeek@gmail.com>,
        kernel test robot <lkp@intel.com>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Minchan Kim <minchan@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Vlastimil Babka <vbabka@suse.cz>,
        Chen Wandun <chenwandun@huawei.com>, NeilBrown <neilb@suse.de>,
        joao.m.martins@oracle.com, mawupeng1@huawei.com,
        Wei Yang <richard.weiyang@gmail.com>,
        Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following kernel warning notices on Linux next-20220427 till date next-20220429
on qemu_arm64 and arm64 devices.

While testing libhugetlbfs test suite and ltp mm and hugetlb.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test log:
----------
truncate_above_4GB (2M: 64): PASS
brk_near_huge (2M: 64): brk_near_huge: malloc.c:2401: sysmalloc:
Assertion `(old_top == initial_top (av) && old_size == 0) ||
((unsigned long) (old_size) >= MINSIZE && prev_inuse (old_top) &&
((unsigned long) old_end & (pagesize - 1)) == 0)' failed.
[   15.685019] audit: type=1701 audit(1651222753.772:25):
auid=4294967295 uid=0 gid=0 ses=4294967295 pid=454
comm=\"brk_near_huge\"
exe=\"/usr/lib/libhugetlbfs/tests/obj64/brk_near_huge\" sig=6 res=1
[   15.685629] ------------[ cut here ]------------
[   15.685631] WARNING: CPU: 2 PID: 454 at mm/page_alloc.c:5368
__alloc_pages+0x624/0xd50
[   15.688908] Modules linked in: rfkill crct10dif_ce fuse
[   15.689714] CPU: 2 PID: 454 Comm: brk_near_huge Not tainted
5.18.0-rc4-next-20220429 #1
[   15.691218] Hardware name: linux,dummy-virt (DT)
[   15.691716] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   15.693109] pc : __alloc_pages+0x624/0xd50
[   15.693686] lr : alloc_pages+0xb8/0x170
[   15.694358] sp : ffff800008813630
[   15.694662] x29: ffff800008813630 x28: 000000000000000e x27: ffffbc6414591650
[   15.695663] x26: ffff0000c089f800 x25: ffff800008813c58 x24: 000000000000000e
[   15.697045] x23: 0000000000000dc0 x22: 0000000000000000 x21: 000000000000000e
[   15.697866] x20: ffffbc64160189a0 x19: 0000000000040dc0 x18: ffffffffffffffff
[   15.699028] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   15.700073] x14: 0000000000000000 x13: 0000000000000000 x12: ffff0000ff7f5b58
[   15.701344] x11: 0000000000000068 x10: ffffbc6414f7d000 x9 : ffffbc6413530e78
[   15.702773] x8 : fffffc000321c001 x7 : 00000000f0000000 x6 : 0000000000000001
[   15.703659] x5 : 0000000000000000 x4 : ffff0000c1a930c0 x3 : 0000000000000000
[   15.705314] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000040dc0
[   15.706179] Call trace:
[   15.706712]  __alloc_pages+0x624/0xd50
[   15.707231]  alloc_pages+0xb8/0x170
[   15.707870]  kmalloc_order+0x40/0x100
[   15.708482]  kmalloc_order_trace+0x38/0x130
[   15.709246]  __kmalloc+0x37c/0x3e0
[   15.709691]  __regset_get+0xa0/0x104
[   15.710131]  regset_get_alloc+0x20/0x2c
[   15.710524]  elf_core_dump+0x3a8/0xd10
[   15.711065]  do_coredump+0xe50/0x138c
[   15.711640]  get_signal+0x860/0x920
[   15.712249]  do_notify_resume+0x184/0x1480
[   15.712723]  el0_svc+0xa8/0xc0
[   15.713052]  el0t_64_sync_handler+0xbc/0x140
[   15.713741]  el0t_64_sync+0x18c/0x190
[   15.714206] ---[ end trace 0000000000000000 ]---
task-size-overrun (2M: 64): PASS

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 5469f0c06732a077c70a759a81f2a1f00b277694
  git_describe: next-20220429
  kernel_version: 5.18.0-rc4
  kernel-config: https://builds.tuxbuild.com/28SmyZKz6g9xF6bf4J2YibE8Lo0/config
  kernel-config: https://builds.tuxbuild.com/28SmyZKz6g9xF6bf4J2YibE8Lo0/config
  vmlinux : https://builds.tuxbuild.com/28SmyZKz6g9xF6bf4J2YibE8Lo0/vmlinux.xz
  System.map : https://builds.tuxbuild.com/28SmyZKz6g9xF6bf4J2YibE8Lo0/System.map


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
