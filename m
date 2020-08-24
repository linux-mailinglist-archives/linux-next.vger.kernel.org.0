Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F2124F96A
	for <lists+linux-next@lfdr.de>; Mon, 24 Aug 2020 11:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbgHXJpW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 05:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbgHXJpN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2020 05:45:13 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9AEC061574
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2020 02:45:12 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id d20so2404350ual.13
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2020 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=AmggO2iRjZrWxkV12yhtcjMt1LI8ycTMjahy8GW7Vko=;
        b=rnLn0PWvo0HEt2CQADxQD+1OgJPYjPAkpUWe0Eyh+hTh3/h5Ra1cZaekZlvxLqlWaS
         S602HSP9UbYc9fC6j3VpbK+p4JiyGDSIu7TDQFDGaI1y9P7eNbrCGzUiUDPGUvW4gmZB
         zytZn28vvMBsnpDnvlsN5mh7BHgnjOAjLn0azRfJLW8NPgekKIwg/oxblqdMfvMTbM5l
         NYWaC97GdsJG6Y67jn7Ue8GQbwe63GD/HuHSY7aJKpcZKK14Rd/55aW98+SlC89Fesve
         sbCRhlEJGf5q0tONbJq2H1MpFi83n+kwFBEkew8nQpPI8lX7QnQFE8/VXg7r/BvTNrNq
         +Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=AmggO2iRjZrWxkV12yhtcjMt1LI8ycTMjahy8GW7Vko=;
        b=m7tgG+tYx93Dd6c6ftNpuFmvk68PPOPdt+AH2wNIqEdOPnSVme+QGdzb8OWcmNWmpQ
         GnAyk2a9Jx0+BIL2b0+2tuEjeHV/S+5rZlYLx4UboIjL+1Uxm7BI71WuXOvH4MDW4cWQ
         xMx+kY1NOKqd89WBKqC3IfxnQIeXbEiUO/HAxTI8G2jseak5hHA5tClnN6EwnbqRCQtj
         1Us9U3lLXTC6/o2Aqea8YXWJHGm2PplLKRNu8F5tVjasYpV98vqSefIhRLiRUWXKlRQd
         y0Rv7vLBIJFmuhX52sQ33R1jTb7sPMDi93cu5UF+EKsENimNwFG9krzxddOoLR9//GI7
         JCzw==
X-Gm-Message-State: AOAM533sR06X9aPWb4ciK4MGVbzrLo9MA4bPoj1u7MS9O8HK0ctiyegM
        hGY5xkucfns7ndREt+s5cvgLWZJx+TbkwlJIiSIPLQ==
X-Google-Smtp-Source: ABdhPJySKCsw8h5LPwzTIEA4D6szrtlSM1K/FfWo0SgFQzKJYlpnGjO7jwhnApSpL+ZbX/2DgVFm5nrrf3Ng6/AgqLk=
X-Received: by 2002:ab0:3443:: with SMTP id a3mr639007uaq.6.1598262306611;
 Mon, 24 Aug 2020 02:45:06 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 24 Aug 2020 15:14:55 +0530
Message-ID: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
Subject: BUG: Bad page state in process true  pfn:a8fed on arm
To:     linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        LTP List <ltp@lists.linux.it>
Cc:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Xu <peterx@redhat.com>, opendmb@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        afzal.mohd.ma@gmail.com, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Kernel BUG noticed on arm architecture on linux next 20200824 tag kernel
while running LTP CVE "thp01 -I 120" , LTP mm, LTP hugetlb test cases
and libhugetlbfs test suite.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: d8be0e12a522d53a45f85fb241ffd06108d40b03
  git describe: next-20200824
  make_kernelversion: 5.9.0-rc2
  kernel-config:
https://builds.tuxbuild.com/ISOcMRs1P2wwVCv7Uhpe5A/kernel.config

steps to reproduce:
  boot arm device or qemu_arm
  # cd /opt/ltp/testcases/bin
  # ./thp01 -I 120

output:
=========
thp01.c:98: PASS: system didn't crash.
thp01.c:98: PASS: system didn't crash.
[   67.545247] BUG: Bad page state in process true  pfn:a8fed
[   67.550767] page:9640c0ab refcount:0 mapcount:-1024
mapping:00000000 index:0x0 pfn:0xa8fed
[   67.559068] flags: 0x0()
[   67.561616] raw: 00000000 00000000 00000100 00000122 00000000
00000000 00000000 00000000
[   67.569742] raw: fffffbff 00000000 00000000 00000000
[   67.574725] page dumped because: nonzero mapcount
[   67.579446] Modules linked in: snd_soc_simple_card
snd_soc_simple_card_utils snd_soc_core ac97_bus snd_pcm_dmaengine
snd_pcm snd_timer snd soundcore
[   67.592848] CPU: 0 PID: 670 Comm: true Not tainted 5.9.0-rc2-next-20200824 #1
[   67.600012] Hardware name: Generic DRA74X (Flattened Device Tree)
[   67.606131] Backtrace:
[   67.608601] [<c040e860>] (dump_backtrace) from [<c040ebd4>]
(show_stack+0x20/0x24)
[   67.616205]  r7:c20ccad4 r6:00000000 r5:60010193 r4:c20ccad4
[   67.621894] [<c040ebb4>] (show_stack) from [<c0940e58>]
(dump_stack+0xec/0x118)
[   67.629239] [<c0940d6c>] (dump_stack) from [<c05db030>] (bad_page+0xf8/0x128)
[   67.636405]  r10:00000000 r9:0030f231 r8:0000001f r7:c19eb22c
r6:eebaec70 r5:c2003d00
[   67.644267]  r4:c2289b14 r3:4c6a9f02
[   67.647857] [<c05daf38>] (bad_page) from [<c05db0ec>]
(check_free_page_bad+0x8c/0x90)
[   67.655721]  r7:efc2d130 r6:efc2d130 r5:0000001f r4:00000000
[   67.661408] [<c05db060>] (check_free_page_bad) from [<c05dc41c>]
(free_pcppages_bulk+0x1d4/0x778)
[   67.670316]  r5:0000001f r4:efc2d13c
[   67.673909] [<c05dc248>] (free_pcppages_bulk) from [<c05dcb98>]
(free_unref_page_commit+0xd4/0xf8)
[   67.682907]  r10:efc29f7c r9:d28a1c10 r8:20010113 r7:eeb96168
r6:c21fd900 r5:efc2d13c
[   67.690767]  r4:2dc68000
[   67.693312] [<c05dcac4>] (free_unref_page_commit) from [<c05ddb80>]
(free_unref_page+0x7c/0x9c)
[   67.702046]  r7:00080000 r6:eeb96160 r5:20010113 r4:000a87b2
[   67.707730] [<c05ddb04>] (free_unref_page) from [<c05ddbec>]
(__free_pages+0x4c/0x58)
[   67.715593]  r7:c220427c r6:e87b2014 r5:00000003 r4:00000000
[   67.721280] [<c05ddba0>] (__free_pages) from [<c05ddcf4>]
(free_pages.part.0+0x34/0x38)
[   67.729317]  r5:00000003 r4:e87b2000
[   67.732907] [<c05ddcc0>] (free_pages.part.0) from [<c05ddd18>]
(free_pages+0x20/0x24)
[   67.740779] [<c05ddcf8>] (free_pages) from [<c05cdad8>]
(tlb_remove_table_rcu+0x50/0x54)
[   67.748911] [<c05cda88>] (tlb_remove_table_rcu) from [<c04d31e4>]
(rcu_core+0x26c/0xa9c)
[   67.757035]  r7:c220427c r6:c2004f38 r5:e87b2000 r4:ffffe000
[   67.762721] [<c04d2f78>] (rcu_core) from [<c04d3a2c>] (rcu_core_si+0x18/0x1c)
[   67.769886]  r10:d28a0000 r9:00000200 r8:00000100 r7:c2203ee4
r6:00000009 r5:0000000a
[   67.777749]  r4:c20030a4
[   67.780297] [<c04d3a14>] (rcu_core_si) from [<c0401edc>]
(__do_softirq+0x1ac/0x480)
[   67.787988] [<c0401d30>] (__do_softirq) from [<c0458e38>]
(irq_exit+0xdc/0x104)
[   67.795327]  r10:e8632dd0 r9:fa213000 r8:e98dc000 r7:00000000
r6:00000001 r5:00000000
[   67.803189]  r4:ffffe000
[   67.805737] [<c0458d5c>] (irq_exit) from [<c04b9fb4>]
(__handle_domain_irq+0x70/0xc0)
[   67.813599]  r5:00000000 r4:c1fc0290
[   67.817192] [<c04b9f44>] (__handle_domain_irq) from [<c040182c>]
(gic_handle_irq+0x68/0xac)
[   67.825579]  r9:fa213000 r8:fa21200c r7:d28a1d38 r6:c20cd210
r5:fa212000 r4:c2006a20
[   67.833357] [<c04017c4>] (gic_handle_irq) from [<c0400bfc>]
(__irq_svc+0x5c/0x7c)
[   67.840870] Exception stack(0xd28a1d38 to 0xd28a1d80)
[   67.845940] 1d20:
    00000000 e714b004
[   67.854153] 1d40: e8632de0 be974000 e714b000 40048000 e8632a90
40036000 e8632c98 e714b004
[   67.862364] 1d60: e8632dd0 d28a1dc4 e8632a90 d28a1d88 40048000
c05cb290 90010013 ffffffff
[   67.870577]  r9:d28a0000 r8:e8632c98 r7:d28a1d6c r6:ffffffff
r5:90010013 r4:c05cb290
[   67.878355] [<c05caf50>] (__do_munmap) from [<c05cb424>]
(__vm_munmap+0x7c/0xc4)
[   67.885782]  r10:e714b000 r9:00000000 r8:e714b040 r7:00012000
r6:d28a1ddc r5:40036000
[   67.893646]  r4:d28a0000
[   67.896193] [<c05cb3a8>] (__vm_munmap) from [<c05cb488>]
(vm_munmap+0x1c/0x20)
[   67.903444]  r10:00000000 r9:e84289c0 r8:00032000 r7:00000802
r6:00000000 r5:40016000
[   67.911307]  r4:00020000
[   67.913853] [<c05cb46c>] (vm_munmap) from [<c069e984>] (elf_map+0x94/0xf8)
[   67.920759] [<c069e8f0>] (elf_map) from [<c06a07f0>]
(load_elf_binary+0x9e0/0x13f0)
[   67.928447]  r8:d28a0000 r7:00000005 r6:00000000 r5:e72f60e0 r4:00000000
[   67.935180] [<c069fe10>] (load_elf_binary) from [<c062e2c0>]
(bprm_execve+0x324/0x6f0)
[   67.943129]  r10:c207d280 r9:e87fc05c r8:fffffff8 r7:00000006
r6:c228de30 r5:c2082ac4
[   67.950990]  r4:e87fc000
[   67.953532] [<c062df9c>] (bprm_execve) from [<c062e7e0>]
(do_execveat_common+0x154/0x178)
[   67.961745]  r10:0000000b r9:be97da44 r8:000383c8 r7:ffffff9c
r6:e856b000 r5:e87fc000
[   67.969607]  r4:00000000
[   67.972152] [<c062e68c>] (do_execveat_common) from [<c062f524>]
(sys_execve+0x40/0x48)
[   67.980103]  r9:d28a0000 r8:c0400364 r7:0000000b r6:be97da44
r5:be97da44 r4:000383c8
[   67.987880] [<c062f4e4>] (sys_execve) from [<c04001a0>]
(ret_fast_syscall+0x0/0x28)
[   67.995566] Exception stack(0xd28a1fa8 to 0xd28a1ff0)
[   68.000637] 1fa0:                   00045320 000383c8 be97d760
000383c8 be97da44 65757274
[   68.008849] 1fc0: 00045320 000383c8 be97da44 0000000b 00000005
0000009a be97d760 be97d834
[   68.017061] 1fe0: be97d769 be97d75c b6ef5da0 b6ef56ac
[   68.022131]  r5:000383c8 r4:00045320
[   68.025720] Disabling lock debugging due to kernel taint
[   68.031053] BUG: Bad page state in process true  pfn:a1c71
[   68.036563] page:0f0cc66e refcount:0 mapcount:-1024
mapping:00000000 index:0x0 pfn:0xa1c71
[   68.044861] flags: 0x0()
[   68.047408] raw: 00000000 00000000 00000100 00000122 00000000
00000000 00000000 00000000
[   68.055530] raw: fffffbff 00000000 00000000 00000000
[   68.060514] page dumped because: nonzero mapcount
[   68.065235] Modules linked in: snd_soc_simple_card
snd_soc_simple_card_utils snd_soc_core ac97_bus snd_pcm_dmaengine
snd_pcm snd_timer snd soundcore
[   68.078631] CPU: 0 PID: 670 Comm: true Tainted: G    B
5.9.0-rc2-next-20200824 #1
[   68.087188] Hardware name: Generic DRA74X (Flattened Device Tree)
[   68.093305] Backtrace:
[   68.095767] [<c040e860>] (dump_backtrace) from [<c040ebd4>]
(show_stack+0x20/0x24)
[   68.103369]  r7:c20ccad4 r6:00000000 r5:60010193 r4:c20ccad4
[   68.109054] [<c040ebb4>] (show_stack) from [<c0940e58>]
(dump_stack+0xec/0x118)
[   68.116394] [<c0940d6c>] (dump_stack) from [<c05db030>] (bad_page+0xf8/0x128)
[   68.123562]  r10:00000001 r9:0030f231 r8:0000001d r7:c19eb22c
r6:eea54530 r5:0000001d
[   68.131426]  r4:c2289b14 r3:4c6a9f02
[   68.135018] [<c05daf38>] (bad_page) from [<c05db0ec>]
(check_free_page_bad+0x8c/0x90)
[   68.142880]  r7:efc2d130 r6:efc2d130 r5:0000001d r4:00000000
[   68.148565] [<c05db060>] (check_free_page_bad) from [<c05dc41c>]
(free_pcppages_bulk+0x1d4/0x778)
[   68.157473]  r5:0000001d r4:efc2d13c
[   68.161063] [<c05dc248>] (free_pcppages_bulk) from [<c05dcb98>]
(free_unref_page_commit+0xd4/0xf8)
[   68.170059]  r10:efc29f7c r9:d28a1c10 r8:20010113 r7:eeb96168
r6:c21fd900 r5:efc2d13c
[   68.177919]  r4:2dc68000
[   68.180464] [<c05dcac4>] (free_unref_page_commit) from [<c05ddb80>]
(free_unref_page+0x7c/0x9c)
[   68.189199]  r7:00080000 r6:eeb96160 r5:20010113 r4:000a87b2
[   68.194884] [<c05ddb04>] (free_unref_page) from [<c05ddbec>]
(__free_pages+0x4c/0x58)
[   68.202746]  r7:c220427c r6:e87b2014 r5:00000003 r4:00000000
[   68.208430] [<c05ddba0>] (__free_pages) from [<c05ddcf4>]
(free_pages.part.0+0x34/0x38)
[   68.216464]  r5:00000003 r4:e87b2000
[   68.220057] [<c05ddcc0>] (free_pages.part.0) from [<c05ddd18>]
(free_pages+0x20/0x24)
[   68.227922] [<c05ddcf8>] (free_pages) from [<c05cdad8>]
(tlb_remove_table_rcu+0x50/0x54)
[   68.236050] [<c05cda88>] (tlb_remove_table_rcu) from [<c04d31e4>]
(rcu_core+0x26c/0xa9c)
[   68.244173]  r7:c220427c r6:c2004f38 r5:e87b2000 r4:ffffe000
[   68.249859] [<c04d2f78>] (rcu_core) from [<c04d3a2c>] (rcu_core_si+0x18/0x1c)
[   68.257026]  r10:d28a0000 r9:00000200 r8:00000100 r7:c2203ee4
r6:00000009 r5:0000000a
[   68.264886]  r4:c20030a4
[   68.267430] [<c04d3a14>] (rcu_core_si) from [<c0401edc>]
(__do_softirq+0x1ac/0x480)
[   68.275120] [<c0401d30>] (__do_softirq) from [<c0458e38>]
(irq_exit+0xdc/0x104)
[   68.282461]  r10:e8632dd0 r9:fa213000 r8:e98dc000 r7:00000000
r6:00000001 r5:00000000
[   68.290325]  r4:ffffe000
[   68.292870] [<c0458d5c>] (irq_exit) from [<c04b9fb4>]
(__handle_domain_irq+0x70/0xc0)
[   68.300730]  r5:00000000 r4:c1fc0290
[   68.304321] [<c04b9f44>] (__handle_domain_irq) from [<c040182c>]
(gic_handle_irq+0x68/0xac)
[   68.312707]  r9:fa213000 r8:fa21200c r7:d28a1d38 r6:c20cd210
r5:fa212000 r4:c2006a20
[   68.320483] [<c04017c4>] (gic_handle_irq) from [<c0400bfc>]
(__irq_svc+0x5c/0x7c)
[   68.327995] Exception stack(0xd28a1d38 to 0xd28a1d80)
[   68.333064] 1d20:
    00000000 e714b004
[   68.341278] 1d40: e8632de0 be974000 e714b000 40048000 e8632a90
40036000 e8632c98 e714b004
[   68.349489] 1d60: e8632dd0 d28a1dc4 e8632a90 d28a1d88 40048000
c05cb290 90010013 ffffffff
[   68.357702]  r9:d28a0000 r8:e8632c98 r7:d28a1d6c r6:ffffffff
r5:90010013 r4:c05cb290
[   68.365481] [<c05caf50>] (__do_munmap) from [<c05cb424>]
(__vm_munmap+0x7c/0xc4)
[   68.372908]  r10:e714b000 r9:00000000 r8:e714b040 r7:00012000
r6:d28a1ddc r5:40036000
[   68.380768]  r4:d28a0000
[   68.383312] [<c05cb3a8>] (__vm_munmap) from [<c05cb488>]
(vm_munmap+0x1c/0x20)
[   68.390568]  r10:00000000 r9:e84289c0 r8:00032000 r7:00000802
r6:00000000 r5:40016000
[   68.398430]  r4:00020000
[   68.400974] [<c05cb46c>] (vm_munmap) from [<c069e984>] (elf_map+0x94/0xf8)
[   68.407877] [<c069e8f0>] (elf_map) from [<c06a07f0>]
(load_elf_binary+0x9e0/0x13f0)
[   68.415568]  r8:d28a0000 r7:00000005 r6:00000000 r5:e72f60e0 r4:00000000
[   68.422298] [<c069fe10>] (load_elf_binary) from [<c062e2c0>]
(bprm_execve+0x324/0x6f0)
[   68.430248]  r10:c207d280 r9:e87fc05c r8:fffffff8 r7:00000006
r6:c228de30 r5:c2082ac4
[   68.438110]  r4:e87fc000
[   68.440652] [<c062df9c>] (bprm_execve) from [<c062e7e0>]
(do_execveat_common+0x154/0x178)
[   68.448867]  r10:0000000b r9:be97da44 r8:000383c8 r7:ffffff9c
r6:e856b000 r5:e87fc000
[   68.456728]  r4:00000000
[   68.459271] [<c062e68c>] (do_execveat_common) from [<c062f524>]
(sys_execve+0x40/0x48)
[   68.467221]  r9:d28a0000 r8:c0400364 r7:0000000b r6:be97da44
r5:be97da44 r4:000383c8
[   68.474999] [<c062f4e4>] (sys_execve) from [<c04001a0>]
(ret_fast_syscall+0x0/0x28)
[   68.482685] Exception stack(0xd28a1fa8 to 0xd28a1ff0)
[   68.487755] 1fa0:                   00045320 000383c8 be97d760
000383c8 be97da44 65757274
[   68.495966] 1fc0: 00045320 000383c8 be97da44 0000000b 00000005
0000009a be97d760 be97d834
[   68.504179] 1fe0: be97d769 be97d75c b6ef5da0 b6ef56ac
[   68.509249]  r5:000383c8 r4:00045320
[   68.512836] BUG: Bad page state in process true  pfn:a8feb
[   68.518347] page:08571436 refcount:0 mapcount:-1024
mapping:00000000 index:0x0 pfn:0xa8feb
[   68.526644] flags: 0x0()
[   68.529187] raw: 00000000 00000000 00000100 00000122 00000000
00000000 00000000 00000000
[   68.537311] raw: fffffbff 00000000 00000000 00000000
[   68.542295] page dumped because: nonzero mapcount
[   68.547016] Modules linked in: snd_soc_simple_card
snd_soc_simple_card_utils snd_soc_core ac97_bus snd_pcm_dmaengine
snd_pcm snd_timer snd soundcore
[   68.560408] CPU: 0 PID: 670 Comm: true Tainted: G    B
5.9.0-rc2-next-20200824 #1
[   68.568967] Hardware name: Generic DRA74X (Flattened Device Tree)
[   68.575084] Backtrace:
[   68.577543] [<c040e860>] (dump_backtrace) from [<c040ebd4>]
(show_stack+0x20/0x24)
[   68.585145]  r7:c20ccad4 r6:00000000 r5:60010193 r4:c20ccad4
[   68.590829] [<c040ebb4>] (show_stack) from [<c0940e58>]
(dump_stack+0xec/0x118)
[   68.598170] [<c0940d6c>] (dump_stack) from [<c05db030>] (bad_page+0xf8/0x128)
[   68.605335]  r10:00000002 r9:0030f231 r8:0000001b r7:c19eb22c
r6:eebaec10 r5:0000001b
[   68.613198]  r4:c2289b14 r3:4c6a9f02
[   68.616791] [<c05daf38>] (bad_page) from [<c05db0ec>]
(check_free_page_bad+0x8c/0x90)
[   68.624654]  r7:efc2d130 r6:efc2d130 r5:0000001b r4:00000000
[   68.630340] [<c05db060>] (check_free_page_bad) from [<c05dc41c>]
(free_pcppages_bulk+0x1d4/0x778)
[   68.639247]  r5:0000001b r4:efc2d13c
[   68.642838] [<c05dc248>] (free_pcppages_bulk) from [<c05dcb98>]
(free_unref_page_commit+0xd4/0xf8)
[   68.651833]  r10:efc29f7c r9:d28a1c10 r8:20010113 r7:eeb96168
r6:c21fd900 r5:efc2d13c
[   68.659697]  r4:2dc68000
[   68.662243] [<c05dcac4>] (free_unref_page_commit) from [<c05ddb80>]
(free_unref_page+0x7c/0x9c)
[   68.670976]  r7:00080000 r6:eeb96160 r5:20010113 r4:000a87b2
[   68.676659] [<c05ddb04>] (free_unref_page) from [<c05ddbec>]
(__free_pages+0x4c/0x58)
[   68.684520]  r7:c220427c r6:e87b2014 r5:00000003 r4:00000000
[   68.690203] [<c05ddba0>] (__free_pages) from [<c05ddcf4>]
(free_pages.part.0+0x34/0x38)
[   68.698239]  r5:00000003 r4:e87b2000
[   68.701831] [<c05ddcc0>] (free_pages.part.0) from [<c05ddd18>]
(free_pages+0x20/0x24)
[   68.709699] [<c05ddcf8>] (free_pages) from [<c05cdad8>]
(tlb_remove_table_rcu+0x50/0x54)
[   68.717827] [<c05cda88>] (tlb_remove_table_rcu) from [<c04d31e4>]
(rcu_core+0x26c/0xa9c)
[   68.725950]  r7:c220427c r6:c2004f38 r5:e87b2000 r4:ffffe000
[   68.731634] [<c04d2f78>] (rcu_core) from [<c04d3a2c>] (rcu_core_si+0x18/0x1c)
[   68.738801]  r10:d28a0000 r9:00000200 r8:00000100 r7:c2203ee4
r6:00000009 r5:0000000a
[   68.746661]  r4:c20030a4
[   68.749207] [<c04d3a14>] (rcu_core_si) from [<c0401edc>]
(__do_softirq+0x1ac/0x480)
[   68.756898] [<c0401d30>] (__do_softirq) from [<c0458e38>]
(irq_exit+0xdc/0x104)
[   68.764238]  r10:e8632dd0 r9:fa213000 r8:e98dc000 r7:00000000
r6:00000001 r5:00000000
[   68.772098]  r4:ffffe000
[   68.774644] [<c0458d5c>] (irq_exit) from [<c04b9fb4>]
(__handle_domain_irq+0x70/0xc0)
[   68.782506]  r5:00000000 r4:c1fc0290
[   68.786097] [<c04b9f44>] (__handle_domain_irq) from [<c040182c>]
(gic_handle_irq+0x68/0xac)
[   68.794483]  r9:fa213000 r8:fa21200c r7:d28a1d38 r6:c20cd210
r5:fa212000 r4:c2006a20
[   68.802258] [<c04017c4>] (gic_handle_irq) from [<c0400bfc>]
(__irq_svc+0x5c/0x7c)
[   68.809772] Exception stack(0xd28a1d38 to 0xd28a1d80)
[   68.814846] 1d20:
    00000000 e714b004
[   68.823057] 1d40: e8632de0 be974000 e714b000 40048000 e8632a90
40036000 e8632c98 e714b004
[   68.831268] 1d60: e8632dd0 d28a1dc4 e8632a90 d28a1d88 40048000
c05cb290 90010013 ffffffff
[   68.839483]  r9:d28a0000 r8:e8632c98 r7:d28a1d6c r6:ffffffff
r5:90010013 r4:c05cb290
[   68.847262] [<c05caf50>] (__do_munmap) from [<c05cb424>]
(__vm_munmap+0x7c/0xc4)
[   68.854688]  r10:e714b000 r9:00000000 r8:e714b040 r7:00012000
r6:d28a1ddc r5:40036000
[   68.862547]  r4:d28a0000
[   68.865091] [<c05cb3a8>] (__vm_munmap) from [<c05cb488>]
(vm_munmap+0x1c/0x20)
[   68.872347]  r10:00000000 r9:e84289c0 r8:00032000 r7:00000802
r6:00000000 r5:40016000
[   68.880209]  r4:00020000
[   68.882752] [<c05cb46c>] (vm_munmap) from [<c069e984>] (elf_map+0x94/0xf8)
[   68.889655] [<c069e8f0>] (elf_map) from [<c06a07f0>]
(load_elf_binary+0x9e0/0x13f0)
[   68.897347]  r8:d28a0000 r7:00000005 r6:00000000 r5:e72f60e0 r4:00000000
[   68.904077] [<c069fe10>] (load_elf_binary) from [<c062e2c0>]
(bprm_execve+0x324/0x6f0)
[   68.912026]  r10:c207d280 r9:e87fc05c r8:fffffff8 r7:00000006
r6:c228de30 r5:c2082ac4
[   68.919889]  r4:e87fc000
[   68.922432] [<c062df9c>] (bprm_execve) from [<c062e7e0>]
(do_execveat_common+0x154/0x178)
[   68.930646]  r10:0000000b r9:be97da44 r8:000383c8 r7:ffffff9c
r6:e856b000 r5:e87fc000
[   68.938508]  r4:00000000
[   68.941050] [<c062e68c>] (do_execveat_common) from [<c062f524>]
(sys_execve+0x40/0x48)
[   68.949000]  r9:d28a0000 r8:c0400364 r7:0000000b r6:be97da44
r5:be97da44 r4:000383c8
[   68.956775] [<c062f4e4>] (sys_execve) from [<c04001a0>]
(ret_fast_syscall+0x0/0x28)
[   68.964463] Exception stack(0xd28a1fa8 to 0xd28a1ff0)
[   68.969534] 1fa0:                   00045320 000383c8 be97d760
000383c8 be97da44 65757274
[   68.977749] 1fc0: 00045320 000383c8 be97da44 0000000b 00000005
0000009a be97d760 be97d834
[   68.985961] 1fe0: be97d769 be97d75c b6ef5da0 b6ef56ac
[   68.991033]  r5:000383c8 r4:00045320
[   68.994621] BUG: Bad page state in process true  pfn:a7176
[   69.000131] page:70e75d1f refcount:0 mapcount:-1024
mapping:00000000 index:0x0 pfn:0xa7176
[   69.008427] flags: 0x0()
[   69.010973] raw: 00000000 00000000 00000100 00000122 00000000
00000000 00000000 00000000
[   69.019096] raw: fffffbff 00000000 00000000 00000000
[   69.024079] page dumped because: nonzero mapcount
[   69.028798] Modules linked in: snd_soc_simple_card
snd_soc_simple_card_utils snd_soc_core ac97_bus snd_pcm_dmaengine
snd_pcm snd_timer snd soundcore
[   69.042193] CPU: 0 PID: 670 Comm: true Tainted: G    B
5.9.0-rc2-next-20200824 #1
[   69.050752] Hardware name: Generic DRA74X (Flattened Device Tree)
[   69.056866] Backtrace:
[   69.059327] [<c040e860>] (dump_backtrace) from [<c040ebd4>]
(show_stack+0x20/0x24)
[   69.066927]  r7:c20ccad4 r6:00000000 r5:60010193 r4:c20ccad4
[   69.072611] [<c040ebb4>] (show_stack) from [<c0940e58>]
(dump_stack+0xec/0x118)
[   69.079956] [<c0940d6c>] (dump_stack) from [<c05db030>] (bad_page+0xf8/0x128)
[   69.087121]  r10:00000002 r9:0030f231 r8:0000001a r7:c19eb22c
r6:eeb53620 r5:0000001a
[   69.094985]  r4:c2289b14 r3:4c6a9f02
[   69.098577] [<c05daf38>] (bad_page) from [<c05db0ec>]
(check_free_page_bad+0x8c/0x90)
[   69.106440]  r7:efc2d130 r6:efc2d130 r5:0000001a r4:00000000
[   69.112123] [<c05db060>] (check_free_page_bad) from [<c05dc41c>]
(free_pcppages_bulk+0x1d4/0x778)
[   69.121030]  r5:0000001a r4:efc2d13c
[   69.124621] [<c05dc248>] (free_pcppages_bulk) from [<c05dcb98>]
(free_unref_page_commit+0xd4/0xf8)
[   69.133620]  r10:efc29f7c r9:d28a1c10 r8:20010113 r7:eeb96168
r6:c21fd900 r5:efc2d13c
[   69.141481]  r4:2dc68000
[   69.144026] [<c05dcac4>] (free_unref_page_commit) from [<c05ddb80>]
(free_unref_page+0x7c/0x9c)
[   69.152760]  r7:00080000 r6:eeb96160 r5:20010113 r4:000a87b2
[   69.158445] [<c05ddb04>] (free_unref_page) from [<c05ddbec>]
(__free_pages+0x4c/0x58)
[   69.166307]  r7:c220427c r6:e87b2014 r5:00000003 r4:00000000
[   69.171990] [<c05ddba0>] (__free_pages) from [<c05ddcf4>]
(free_pages.part.0+0x34/0x38)
[   69.180026]  r5:00000003 r4:e87b2000
[   69.183618] [<c05ddcc0>] (free_pages.part.0) from [<c05ddd18>]
(free_pages+0x20/0x24)
[   69.191484] [<c05ddcf8>] (free_pages) from [<c05cdad8>]
(tlb_remove_table_rcu+0x50/0x54)
[   69.199613] [<c05cda88>] (tlb_remove_table_rcu) from [<c04d31e4>]
(rcu_core+0x26c/0xa9c)
[   69.207737]  r7:c220427c r6:c2004f38 r5:e87b2000 r4:ffffe000
[   69.213421] [<c04d2f78>] (rcu_core) from [<c04d3a2c>] (rcu_core_si+0x18/0x1c)
[   69.220586]  r10:d28a0000 r9:00000200 r8:00000100 r7:c2203ee4
r6:00000009 r5:0000000a
[   69.228447]  r4:c20030a4
[   69.230992] [<c04d3a14>] (rcu_core_si) from [<c0401edc>]
(__do_softirq+0x1ac/0x480)
[   69.238681] [<c0401d30>] (__do_softirq) from [<c0458e38>]
(irq_exit+0xdc/0x104)
[   69.246024]  r10:e8632dd0 r9:fa213000 r8:e98dc000 r7:00000000
r6:00000001 r5:00000000
[   69.253884]  r4:ffffe000
[   69.256429] [<c0458d5c>] (irq_exit) from [<c04b9fb4>]
(__handle_domain_irq+0x70/0xc0)
[   69.264290]  r5:00000000 r4:c1fc0290
[   69.267880] [<c04b9f44>] (__handle_domain_irq) from [<c040182c>]
(gic_handle_irq+0x68/0xac)
[   69.276265]  r9:fa213000 r8:fa21200c r7:d28a1d38 r6:c20cd210
r5:fa212000 r4:c2006a20
[   69.284041] [<c04017c4>] (gic_handle_irq) from [<c0400bfc>]
(__irq_svc+0x5c/0x7c)
[   69.291552] Exception stack(0xd28a1d38 to 0xd28a1d80)
[   69.296622] 1d20:
    00000000 e714b004
[   69.304837] 1d40: e8632de0 be974000 e714b000 40048000 e8632a90
40036000 e8632c98 e714b004
[   69.313050] 1d60: e8632dd0 d28a1dc4 e8632a90 d28a1d88 40048000
c05cb290 90010013 ffffffff
[   69.321263]  r9:d28a0000 r8:e8632c98 r7:d28a1d6c r6:ffffffff
r5:90010013 r4:c05cb290
[   69.329039] [<c05caf50>] (__do_munmap) from [<c05cb424>]
(__vm_munmap+0x7c/0xc4)
[   69.336468]  r10:e714b000 r9:00000000 r8:e714b040 r7:00012000
r6:d28a1ddc r5:40036000
[   69.344331]  r4:d28a0000
[   69.346876] [<c05cb3a8>] (__vm_munmap) from [<c05cb488>]
(vm_munmap+0x1c/0x20)
[   69.354130]  r10:00000000 r9:e84289c0 r8:00032000 r7:00000802
r6:00000000 r5:40016000
[   69.361992]  r4:00020000
[   69.364534] [<c05cb46c>] (vm_munmap) from [<c069e984>] (elf_map+0x94/0xf8)
[   69.371437] [<c069e8f0>] (elf_map) from [<c06a07f0>]
(load_elf_binary+0x9e0/0x13f0)
[   69.379127]  r8:d28a0000 r7:00000005 r6:00000000 r5:e72f60e0 r4:00000000
[   69.385856] [<c069fe10>] (load_elf_binary) from [<c062e2c0>]
(bprm_execve+0x324/0x6f0)
[   69.393806]  r10:c207d280 r9:e87fc05c r8:fffffff8 r7:00000006
r6:c228de30 r5:c2082ac4
[   69.401669]  r4:e87fc000
[   69.404211] [<c062df9c>] (bprm_execve) from [<c062e7e0>]
(do_execveat_common+0x154/0x178)
[   69.412424]  r10:0000000b r9:be97da44 r8:000383c8 r7:ffffff9c
r6:e856b000 r5:e87fc000
[   69.420286]  r4:00000000
[   69.422828] [<c062e68c>] (do_execveat_common) from [<c062f524>]
(sys_execve+0x40/0x48)
[   69.430779]  r9:d28a0000 r8:c0400364 r7:0000000b r6:be97da44
r5:be97da44 r4:000383c8
[   69.438554] [<c062f4e4>] (sys_execve) from [<c04001a0>]
(ret_fast_syscall+0x0/0x28)
[   69.446242] Exception stack(0xd28a1fa8 to 0xd28a1ff0)
[   69.451315] 1fa0:                   00045320 000383c8 be97d760
000383c8 be97da44 65757274
[   69.459526] 1fc0: 00045320 000383c8 be97da44 0000000b 00000005
0000009a be97d760 be97d834
[   69.467737] 1fe0: be97d769 be97d75c b6ef5da0 b6ef56ac
[   69.472811]  r5:000383c8 r4:00045320
[   69.476401] BUG: Bad page state in process true  pfn:a8fe9
[   69.481907] page:2b6af1d0 refcount:0 mapcount:-1024
mapping:00000000 index:0x0 pfn:0xa8fe9
[   69.490205] flags: 0x0()
[   69.492750] raw: 00000000 00000000 00000100 00000122 00000000
00000000 00000000 00000000
[   69.500876] raw: fffffbff 00000000 00000000 00000000
[   69.505859] page dumped because: nonzero mapcount
[   69.510577] Modules linked in: snd_soc_simple_card
snd_soc_simple_card_utils snd_soc_core ac97_bus snd_pcm_dmaengine
snd_pcm snd_timer snd soundcore
[   69.523974] CPU: 0 PID: 670 Comm: true Tainted: G    B
5.9.0-rc2-next-20200824 #1
[   69.532533] Hardware name: Generic DRA74X (Flattened Device Tree)
[   69.538648] Backtrace:
[   69.541108] [<c040e860>] (dump_backtrace) from [<c040ebd4>]
(show_stack+0x20/0x24)
[   69.548708]  r7:c20ccad4 r6:00000000 r5:60010193 r4:c20ccad4
[   69.554396] [<c040ebb4>] (show_stack) from [<c0940e58>]
(dump_stack+0xec/0x118)
[   69.561738] [<c0940d6c>] (dump_stack) from [<c05db030>] (bad_page+0xf8/0x128)
[   69.568903]  r10:00000004 r9:0030f231 r8:00000017 r7:c19eb22c
r6:eebaebb0 r5:00000017
[   69.576762]  r4:c2289b14 r3:4c6a9f02
[   69.580354] [<c05daf38>] (bad_page) from [<c05db0ec>]
(check_free_page_bad+0x8c/0x90)
[   69.588215]  r7:efc2d130 r6:efc2d130 r5:00000017 r4:00000000
[   69.593900] [<c05db060>] (check_free_page_bad) from [<c05dc41c>]
(free_pcppages_bulk+0x1d4/0x778)
[   69.602810]  r5:00000017 r4:efc2d13c
[   69.606402] [<c05dc248>] (free_pcppages_bulk) from [<c05dcb98>]
(free_unref_page_commit+0xd4/0xf8)
[   69.615398]  r10:efc29f7c r9:d28a1c10 r8:20010113 r7:eeb96168
r6:c21fd900 r5:efc2d13c
[   69.623259]  r4:2dc68000
[   69.625805] [<c05dcac4>] (free_unref_page_commit) from [<c05ddb80>]
(free_unref_page+0x7c/0x9c)
[   69.634538]  r7:00080000 r6:eeb96160 r5:20010113 r4:000a87b2
[   69.640223] [<c05ddb04>] (free_unref_page) from [<c05ddbec>]
(__free_pages+0x4c/0x58)
[   69.648084]  r7:c220427c r6:e87b2014 r5:00000003 r4:00000000
[   69.653767] [<c05ddba0>] (__free_pages) from [<c05ddcf4>]
(free_pages.part.0+0x34/0x38)
[   69.661803]  r5:00000003 r4:e87b2000
[   69.665395] [<c05ddcc0>] (free_pages.part.0) from [<c05ddd18>]
(free_pages+0x20/0x24)
[   69.673260] [<c05ddcf8>] (free_pages) from [<c05cdad8>]
(tlb_remove_table_rcu+0x50/0x54)
[   69.681388] [<c05cda88>] (tlb_remove_table_rcu) from [<c04d31e4>]
(rcu_core+0x26c/0xa9c)
[   69.689510]  r7:c220427c r6:c2004f38 r5:e87b2000 r4:ffffe000
[   69.695196] [<c04d2f78>] (rcu_core) from [<c04d3a2c>] (rcu_core_si+0x18/0x1c)
[   69.702362]  r10:d28a0000 r9:00000200 r8:00000100 r7:c2203ee4
r6:00000009 r5:0000000a
[   69.710224]  r4:c20030a4
[   69.712768] [<c04d3a14>] (rcu_core_si) from [<c0401edc>]
(__do_softirq+0x1ac/0x480)
[   69.720461] [<c0401d30>] (__do_softirq) from [<c0458e38>]
(irq_exit+0xdc/0x104)
[   69.727800]  r10:e8632dd0 r9:fa213000 r8:e98dc000 r7:00000000
r6:00000001 r5:00000000
[   69.735663]  r4:ffffe000
[   69.738209] [<c0458d5c>] (irq_exit) from [<c04b9fb4>]
(__handle_domain_irq+0x70/0xc0)
[   69.746069]  r5:00000000 r4:c1fc0290
[   69.749658] [<c04b9f44>] (__handle_domain_irq) from [<c040182c>]
(gic_handle_irq+0x68/0xac)
[   69.758043]  r9:fa213000 r8:fa21200c r7:d28a1d38 r6:c20cd210
r5:fa212000 r4:c2006a20
[   69.765820] [<c04017c4>] (gic_handle_irq) from [<c0400bfc>]
(__irq_svc+0x5c/0x7c)
[   69.773332] Exception stack(0xd28a1d38 to 0xd28a1d80)
[   69.778404] 1d20:
    00000000 e714b004
[   69.786618] 1d40: e8632de0 be974000 e714b000 40048000 e8632a90
40036000 e8632c98 e714b004
[   69.794831] 1d60: e8632dd0 d28a1dc4 e8632a90 d28a1d88 40048000
c05cb290 90010013 ffffffff
[   69.803042]  r9:d28a0000 r8:e8632c98 r7:d28a1d6c r6:ffffffff
r5:90010013 r4:c05cb290
[   69.810821] [<c05caf50>] (__do_munmap) from [<c05cb424>]
(__vm_munmap+0x7c/0xc4)
[   69.818250]  r10:e714b000 r9:00000000 r8:e714b040 r7:00012000
r6:d28a1ddc r5:40036000
[   69.826113]  r4:d28a0000
[   69.828657] [<c05cb3a8>] (__vm_munmap) from [<c05cb488>]
(vm_munmap+0x1c/0x20)
[   69.835912]  r10:00000000 r9:e84289c0 r8:00032000 r7:00000802
r6:00000000 r5:40016000
[   69.843774]  r4:00020000
[   69.846317] [<c05cb46c>] (vm_munmap) from [<c069e984>] (elf_map+0x94/0xf8)
[   69.853220] [<c069e8f0>] (elf_map) from [<c06a07f0>]
(load_elf_binary+0x9e0/0x13f0)
[   69.860909]  r8:d28a0000 r7:00000005 r6:00000000 r5:e72f60e0 r4:00000000
[   69.867637] [<c069fe10>] (load_elf_binary) from [<c062e2c0>]
(bprm_execve+0x324/0x6f0)
[   69.875590]  r10:c207d280 r9:e87fc05c r8:fffffff8 r7:00000006
r6:c228de30 r5:c2082ac4
[   69.883450]  r4:e87fc000
[   69.885992] [<c062df9c>] (bprm_execve) from [<c062e7e0>]
(do_execveat_common+0x154/0x178)
[   69.894207]  r10:0000000b r9:be97da44 r8:000383c8 r7:ffffff9c
r6:e856b000 r5:e87fc000
[   69.902069]  r4:00000000
[   69.904612] [<c062e68c>] (do_execveat_common) from [<c062f524>]
(sys_execve+0x40/0x48)
[   69.912561]  r9:d28a0000 r8:c0400364 r7:0000000b r6:be97da44
r5:be97da44 r4:000383c8
[   69.920337] [<c062f4e4>] (sys_execve) from [<c04001a0>]
(ret_fast_syscall+0x0/0x28)
[   69.928027] Exception stack(0xd28a1fa8 to 0xd28a1ff0)
[   69.933100] 1fa0:                   00045320 000383c8 be97d760
000383c8 be97da44 65757274
[   69.941311] 1fc0: 00045320 000383c8 be97da44 0000000b 00000005
0000009a be97d760 be97d834
[   69.949524] 1fe0: be97d769 be97d75c b6ef5da0 b6ef56ac
[   69.954597]  r5:000383c8 r4:00045320
[   69.958184] BUG: Bad page state in process true  pfn:a72bb
[   69.963691] page:035a253e refcount:0 mapcount:-1024
mapping:00000000 index:0x0 pfn:0xa72bb
[   69.971987] flags: 0x0()
[   69.974532] raw: 00000000 00000000 00000100 00000122 00000000
00000000 00000000 00000000
[   69.982658] raw: fffffbff 00000000 00000000 00000000
[   69.987641] page dumped because: nonzero mapcount
[   69.992359] Modules linked in: snd_soc_simple_card
snd_soc_simple_card_utils snd_soc_core ac97_bus snd_pcm_dmaengine
snd_pcm snd_timer snd soundcore
[   70.005752] CPU: 0 PID: 670 Comm: true Tainted: G    B
5.9.0-rc2-next-20200824 #1

Fulll test log,
https://lkft.validation.linaro.org/scheduler/job/1701626#L2841


https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200824/testrun/3109125/suite/linux-log-parser/test/check-kernel-bug-1701604/log

https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200824/testrun/3110121/suite/linux-log-parser/test/check-kernel-bug-1701607/log

-- 
Linaro LKFT
https://lkft.linaro.org
