Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7576D2B79F4
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 10:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgKRJF1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 04:05:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:41994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbgKRJFY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 04:05:24 -0500
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54AB824656;
        Wed, 18 Nov 2020 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605690323;
        bh=hpHhzpr+59/pVi/V2wsNVtiUe8IEmf1kPxNf7ZU+56s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LXiWVCsSLAcGQvV9EOuYYkL+U9fswuQ7JSyrpdIbCrasX1q5Tj1Fog1UOwdBMPsEi
         A1fLmw4pL3evgyU+oUH5F8sZrafJppvuFFbEbQLiAAqfDkp0cd5Brmbqo5kZ1Z6jGB
         GKBZYP8OLlN/Jm3/zLtZKhFI9vajiaH8ckbcI3eE=
Received: by mail-ot1-f52.google.com with SMTP id n89so1064031otn.3;
        Wed, 18 Nov 2020 01:05:23 -0800 (PST)
X-Gm-Message-State: AOAM5328v3UvEtjEsLTG7xEs54B18ca6gw8X4gb/rIT6CRI+2KVSfWeV
        gxiBRWuGvpFLq4XWNnLL/EVPcyWCax7X7MaQ+tI=
X-Google-Smtp-Source: ABdhPJz20jU1s8vpNJHiAQRe2MQNQEjjU5Zv6NpjEVZCZF74sWGAwHKqUf8MB3YYV+CAw8O9WqjWEejR9lichNenR/0=
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr5577412otd.90.1605690322509;
 Wed, 18 Nov 2020 01:05:22 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYvbcYvGP90VDuxHHTRSpc+yh=uZxUC5ZOzDm-7dcmkQnA@mail.gmail.com>
In-Reply-To: <CA+G9fYvbcYvGP90VDuxHHTRSpc+yh=uZxUC5ZOzDm-7dcmkQnA@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 18 Nov 2020 10:05:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH91aza4K0nvEkY9oK=J_i8UvVg8xFF1Tri3OEQM_SL4A@mail.gmail.com>
Message-ID: <CAMj1kXH91aza4K0nvEkY9oK=J_i8UvVg8xFF1Tri3OEQM_SL4A@mail.gmail.com>
Subject: Re: [ arm ] BUG: KASAN: stack-out-of-bounds in save_trace+0xf8/0x14c
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 16 Nov 2020 at 16:06, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following kernel warning noticed on arm KASAN enabled config while
> booting on qemu arm on Linux next 20201116 tag.
>
> [   10.811824] BUG: KASAN: stack-out-of-bounds in save_trace+0xf8/0x14c

This looks like the same false positive we have seen before - the code
that captures the call stack when allocating or freeing memory may
inadvertently do an out of bound access, but this is kind of ok for
diagnostic code so my suggestion was to just disable the
instrumentation here (like other architectures do as well):

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9028/1


> [   10.814330] Read of size 4 at addr c7aa37bc by task udevadm/192
> [   10.816669]
> [   10.817310] CPU: 0 PID: 192 Comm: udevadm Not tainted
> 5.10.0-rc3-next-20201116 #2
> [   10.820576] Hardware name: Generic DT based system
> [   10.822886] [<c0315abc>] (unwind_backtrace) from [<c030ebf8>]
> (show_stack+0x10/0x14)
> [   10.827114] [<c030ebf8>] (show_stack) from [<c16c91cc>]
> (dump_stack+0xc8/0xe0)
> [   10.830696] [<c16c91cc>] (dump_stack) from [<c051b4ec>]
> (print_address_description.constprop.0+0x34/0x2dc)
> [   10.835673] [<c051b4ec>] (print_address_description.constprop.0)
> from [<c051b9e0>] (kasan_report+0x1a8/0x1c4)
> [   10.840888] [<c051b9e0>] (kasan_report) from [<c030e624>]
> (save_trace+0xf8/0x14c)
> [   10.844773] [<c030e624>] (save_trace) from [<c030e50c>]
> (walk_stackframe+0x1c/0x3c)
> [   10.848513] [<c030e50c>] (walk_stackframe) from [<c030e79c>]
> (__save_stack_trace+0x124/0x12c)
> [   10.852745] [<c030e79c>] (__save_stack_trace) from [<c040bc9c>]
> (stack_trace_save+0x90/0xc0)
> [   10.856653] [<c040bc9c>] (stack_trace_save) from [<c051aeb8>]
> (kasan_save_stack+0x1c/0x40)
> [   10.860463] [<c051aeb8>] (kasan_save_stack) from [<c051afac>]
> (kasan_set_track+0x28/0x30)
> [   10.864263] [<c051afac>] (kasan_set_track) from [<c051c748>]
> (kasan_set_free_info+0x20/0x34)
> [   10.868176] [<c051c748>] (kasan_set_free_info) from [<c051ae74>]
> (____kasan_slab_free+0xd4/0xfc)
> [   10.872253] [<c051ae74>] (____kasan_slab_free) from [<c0519194>]
> (kmem_cache_free+0x80/0x4a0)
> [   10.876217] [<c0519194>] (kmem_cache_free) from [<c040032c>]
> (rcu_core+0x384/0x7f4)
> [   10.879852] [<c040032c>] (rcu_core) from [<c03014d8>]
> (__do_softirq+0x188/0x3d0)
> [   10.883309] [<c03014d8>] (__do_softirq) from [<c0361f88>]
> (irq_exit+0x100/0x124)
> [   10.886748] [<c0361f88>] (irq_exit) from [<c03e712c>]
> (__handle_domain_irq+0x7c/0xdc)
> [   10.890378] [<c03e712c>] (__handle_domain_irq) from [<c09a8e04>]
> (gic_handle_irq+0xb4/0xe0)
> [   10.894268] [<c09a8e04>] (gic_handle_irq) from [<c0300b8c>]
> (__irq_svc+0x6c/0x94)
> [   10.897739] Exception stack(0xc7aa3698 to 0xc7aa36e0)
> [   10.900109] 3680:
>     c03000c0 c25e6660
> [   10.903902] 36a0: c263bb70BUG: KASAN: stack-out-of-bounds in
> save_trace+0xf8/0x14c c263fd88 c7aa37e0 c315c5e0 c312d9a0 c7aa3880
> c040bc9c c03000c0
> [   10.907859] 36c0: a0030013 c7aa38ec c312d9a0 c7aa36e8 c0315330
> c031508c a0030013 ffffffff
> [   10.912344] [<c0300b8c>] (__irq_svc) from [<c031508c>]
> (search_index+0x8/0xec)
> [   10.916050] [<c031508c>] (search_index) from [<c0564990>]
> (__d_lookup_rcu+0x58/0x2a8)
> [   10.920147] [<c0564990>] (__d_lookup_rcu) from [<c03000c0>]
> (ret_fast_syscall+0x0/0x58)
> [   10.924242] Exception stack(0xc7aa3780 to 0xc7aa37c8)
> [   10.926923] 3780: c25f18a0 c7aa4000 00000000 00000000 00000003
> 1312d000 5fb25e68 00000000
> [   10.931004] 37a0: 00000000 80000000 ffffffff 7fffffff 5fb25e68
> 00000000 ee7e2590 00000000
> [   10.935188] 37c0: 41b58ab3 c247c3ec
> [   10.936910]
> [   10.937652] The buggy address belongs to the page:
> [   10.939933] page:(ptrval) refcount:0 mapcount:0 mapping:00000000
> index:0x0 pfn:0x47aa3
> [   10.943733] flags: 0x0()
> [   10.944995] raw: 00000000 ee60cef0 ee60cef0 00000000 00000000
> 00000000 ffffffff 00000000
> [   10.948786] raw: 00000000
> [   10.950037] page dumped because: kasan: bad access detected
> [   10.952655]
> [   10.953405] addr c7aa37bc is located in stack of task udevadm/192
> at offset 156 in frame:
> [   10.957194]  unwind_frame+0x0/0x8c0
> [   10.958853]
> [   10.959616] this frame has 1 object:
> [   10.961322]  [32, 116) 'ctrl'
> [   10.961329]
> [   10.963476] Memory state around the buggy address:
> [   10.965699]  c7aa3680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   10.968752]  c7aa3700: 00 00 00 00 f1 f1 f1 f1 00 00 00 00 00 00 00 00
> [   10.971846] >c7aa3780: 00 00 04 f3 f3 f3 f3 f3 00 00 00 00 00 00 00 00
> [   10.974831]                                 ^
> [   10.976883]  c7aa3800: 00 00 00 00 00 00 00 00 f1 f1 f1 f1 00 04 f2 f2
> [   10.979907]  c7aa3880: 00 00 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
> [   10.982919] ==================================================================
> [   10.986244] Disabling lock debugging due to kernel taint
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> full boot log link,
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20201116/testrun/3445674/suite/linux-log-parser/test/check-kernel-bug-1944975/log
>
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git describe: next-20201116
>   kernel-config: https://builds.tuxbuild.com/1kMYEMmo35DocMgHZ9AtJReL3rN/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org
