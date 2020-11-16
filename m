Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C122B487F
	for <lists+linux-next@lfdr.de>; Mon, 16 Nov 2020 16:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729964AbgKPPGa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Nov 2020 10:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgKPPGZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Nov 2020 10:06:25 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82408C0613D1
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 07:06:25 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id h16so12177528otq.9
        for <linux-next@vger.kernel.org>; Mon, 16 Nov 2020 07:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=LXmaNST6ELpIVrVhrObsBHBWBQVHEVfnGhKfEMBr9+I=;
        b=DQPR0DsXw/+bJPTZBZdWjkL6AleNn7hrMuzZ8NbwKT3iz6O2gJHaQLELmAF43WMFfI
         Mb+WzlMO17A5NnTzKPQ166g4hDLtfVttXI/Svio3LVDKYjgpnSClota7y+LsUqsz9dJp
         OgQDfP8rMJgM2+jt0ok4nTCK3Gtb6cXDtV6mrA8ux5/xya9XsvqavrR093ofJSqtsmSI
         u7lPIvEnwWXkSOfbJqTFrpR+/gN/L1UC+sNTab+JcB5n/H5VL6jU/g88R8+8KrIXQNJx
         HeKa0CMyUgE3RixDMC6PuVAJXbQe8ByEANRPVuJ8y3l7LMJQHEHuzN2CvFVL/Y8vEmNL
         KmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=LXmaNST6ELpIVrVhrObsBHBWBQVHEVfnGhKfEMBr9+I=;
        b=hFMK1uD8DaO94k8TWCGFaQW7e4JWtBDue8ogO449T5R2lc9X1HARadRK21Hc6WVPHp
         UM5jNcrwZTyTxIH8SlPPlDpbhsL3haC0Piy62QtCIqa5hIjeK6wI0/I9m9JU094qTzIS
         UKPHatXVfeDH3tGTqHW74NOnD4+fP5lyUwpb9DlzZdBHdosduHOHeWAnaaguSETk5Lhb
         w2xcSwx1aA7BMUJLSmY3Ar2OSHBjuEftdtlNi0GN/YZBUSbX5WyUnT2h0GnChCpGbyJL
         ASKR1W7QIgh8EHJjrkiIlC7iYxEPsFOoQyBl8/k7OxjD/HKOUsDpMuKVQqC1EwRuC3SJ
         PSFw==
X-Gm-Message-State: AOAM532E9HeYjvyceqqD6zXj9WWFDwx25VUsdfIaZ+KjcHTGoA4IO61E
        MP0GeN7i8IjcHjqPZ9iWySBSH37+DEcXwrJjzkRBNg==
X-Google-Smtp-Source: ABdhPJwoJLdgJGuEMJHhrydqP2w4fhs+SkStd4rOUF5UnwED3adsc7G1t+6HETfoF8yiTOwA9QTncOKKOaTGNbCY2Jg=
X-Received: by 2002:a05:6830:225a:: with SMTP id t26mr11205825otd.266.1605539184494;
 Mon, 16 Nov 2020 07:06:24 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 16 Nov 2020 20:36:10 +0530
Message-ID: <CA+G9fYvbcYvGP90VDuxHHTRSpc+yh=uZxUC5ZOzDm-7dcmkQnA@mail.gmail.com>
Subject: [ arm ] BUG: KASAN: stack-out-of-bounds in save_trace+0xf8/0x14c
To:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The following kernel warning noticed on arm KASAN enabled config while
booting on qemu arm on Linux next 20201116 tag.

[   10.811824] BUG: KASAN: stack-out-of-bounds in save_trace+0xf8/0x14c
[   10.814330] Read of size 4 at addr c7aa37bc by task udevadm/192
[   10.816669]
[   10.817310] CPU: 0 PID: 192 Comm: udevadm Not tainted
5.10.0-rc3-next-20201116 #2
[   10.820576] Hardware name: Generic DT based system
[   10.822886] [<c0315abc>] (unwind_backtrace) from [<c030ebf8>]
(show_stack+0x10/0x14)
[   10.827114] [<c030ebf8>] (show_stack) from [<c16c91cc>]
(dump_stack+0xc8/0xe0)
[   10.830696] [<c16c91cc>] (dump_stack) from [<c051b4ec>]
(print_address_description.constprop.0+0x34/0x2dc)
[   10.835673] [<c051b4ec>] (print_address_description.constprop.0)
from [<c051b9e0>] (kasan_report+0x1a8/0x1c4)
[   10.840888] [<c051b9e0>] (kasan_report) from [<c030e624>]
(save_trace+0xf8/0x14c)
[   10.844773] [<c030e624>] (save_trace) from [<c030e50c>]
(walk_stackframe+0x1c/0x3c)
[   10.848513] [<c030e50c>] (walk_stackframe) from [<c030e79c>]
(__save_stack_trace+0x124/0x12c)
[   10.852745] [<c030e79c>] (__save_stack_trace) from [<c040bc9c>]
(stack_trace_save+0x90/0xc0)
[   10.856653] [<c040bc9c>] (stack_trace_save) from [<c051aeb8>]
(kasan_save_stack+0x1c/0x40)
[   10.860463] [<c051aeb8>] (kasan_save_stack) from [<c051afac>]
(kasan_set_track+0x28/0x30)
[   10.864263] [<c051afac>] (kasan_set_track) from [<c051c748>]
(kasan_set_free_info+0x20/0x34)
[   10.868176] [<c051c748>] (kasan_set_free_info) from [<c051ae74>]
(____kasan_slab_free+0xd4/0xfc)
[   10.872253] [<c051ae74>] (____kasan_slab_free) from [<c0519194>]
(kmem_cache_free+0x80/0x4a0)
[   10.876217] [<c0519194>] (kmem_cache_free) from [<c040032c>]
(rcu_core+0x384/0x7f4)
[   10.879852] [<c040032c>] (rcu_core) from [<c03014d8>]
(__do_softirq+0x188/0x3d0)
[   10.883309] [<c03014d8>] (__do_softirq) from [<c0361f88>]
(irq_exit+0x100/0x124)
[   10.886748] [<c0361f88>] (irq_exit) from [<c03e712c>]
(__handle_domain_irq+0x7c/0xdc)
[   10.890378] [<c03e712c>] (__handle_domain_irq) from [<c09a8e04>]
(gic_handle_irq+0xb4/0xe0)
[   10.894268] [<c09a8e04>] (gic_handle_irq) from [<c0300b8c>]
(__irq_svc+0x6c/0x94)
[   10.897739] Exception stack(0xc7aa3698 to 0xc7aa36e0)
[   10.900109] 3680:
    c03000c0 c25e6660
[   10.903902] 36a0: c263bb70BUG: KASAN: stack-out-of-bounds in
save_trace+0xf8/0x14c c263fd88 c7aa37e0 c315c5e0 c312d9a0 c7aa3880
c040bc9c c03000c0
[   10.907859] 36c0: a0030013 c7aa38ec c312d9a0 c7aa36e8 c0315330
c031508c a0030013 ffffffff
[   10.912344] [<c0300b8c>] (__irq_svc) from [<c031508c>]
(search_index+0x8/0xec)
[   10.916050] [<c031508c>] (search_index) from [<c0564990>]
(__d_lookup_rcu+0x58/0x2a8)
[   10.920147] [<c0564990>] (__d_lookup_rcu) from [<c03000c0>]
(ret_fast_syscall+0x0/0x58)
[   10.924242] Exception stack(0xc7aa3780 to 0xc7aa37c8)
[   10.926923] 3780: c25f18a0 c7aa4000 00000000 00000000 00000003
1312d000 5fb25e68 00000000
[   10.931004] 37a0: 00000000 80000000 ffffffff 7fffffff 5fb25e68
00000000 ee7e2590 00000000
[   10.935188] 37c0: 41b58ab3 c247c3ec
[   10.936910]
[   10.937652] The buggy address belongs to the page:
[   10.939933] page:(ptrval) refcount:0 mapcount:0 mapping:00000000
index:0x0 pfn:0x47aa3
[   10.943733] flags: 0x0()
[   10.944995] raw: 00000000 ee60cef0 ee60cef0 00000000 00000000
00000000 ffffffff 00000000
[   10.948786] raw: 00000000
[   10.950037] page dumped because: kasan: bad access detected
[   10.952655]
[   10.953405] addr c7aa37bc is located in stack of task udevadm/192
at offset 156 in frame:
[   10.957194]  unwind_frame+0x0/0x8c0
[   10.958853]
[   10.959616] this frame has 1 object:
[   10.961322]  [32, 116) 'ctrl'
[   10.961329]
[   10.963476] Memory state around the buggy address:
[   10.965699]  c7aa3680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   10.968752]  c7aa3700: 00 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00 00
[   10.971846] >c7aa3780: 00 00 04 f3 f3 f3 f3 f3 00 00 00 00 00 00 00 00
[   10.974831]                                 ^
[   10.976883]  c7aa3800: 00 00 00 00 00 00 00 00 f1 f1 f1 f1 00 04 f2 f2
[   10.979907]  c7aa3880: 00 00 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
[   10.982919] ==================================================================
[   10.986244] Disabling lock debugging due to kernel taint

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

full boot log link,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201116/testrun/3445674/suite/linux-log-parser/test/check-kernel-bug-1944975/log

metadata:
  git branch: master
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git describe: next-20201116
  kernel-config: https://builds.tuxbuild.com/1kMYEMmo35DocMgHZ9AtJReL3rN/config

-- 
Linaro LKFT
https://lkft.linaro.org
