Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6411E21B549
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 14:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgGJMnD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 08:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJMnD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 08:43:03 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB1DC08C5CE
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2020 05:43:02 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id q8so5845656iow.7
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2020 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r/dOvrsXq9UZVaYMu55uS/7BJZvBtFTu4b0fUWD9CAU=;
        b=HX93rdlezltNLXqGhhVbMf6luWFJT47FUsvJ9QIDJyKjVXKELDLosejP2vKNbvaoKf
         EBpDS1xMJY45R+VkjBAfLgnUK5bA9fHRJPpKDWjUUlda6zlAt+K6rg0v5Vj7uJEq4giO
         kzk0oJw0WkF4f9QVfTzPZTpVohj3O0lq1qyfddw9Yvk2e6pCMqjO+H3wkRUc/J+PVAo1
         OVSGWO71/NaW2N5SRRq4iDpv670lpq6/C8usW8bHiUAXSHgH/KfRkKk329aJ+KQsOaH3
         lGMFH9zy3RE3bB/bCagBjVnLarFbkmMFiW4LxJAu3hJN8jnutilnaLd0db5mdHOJuYAI
         A8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r/dOvrsXq9UZVaYMu55uS/7BJZvBtFTu4b0fUWD9CAU=;
        b=O2TLMqPmLYBjl37jMPW+BwP5ULlGgNWQG2ScTfcCzY5vjhgHK61gK7hskoOWEjPWjz
         Ipj0Vy0Enf3H7fX+gPxEDM5I8dyVlQa3EFBT2wVBZMX7zA2L4nzv6441D1bl/S8YCDPy
         R6ivHBLpeJZSVnPKDXebivU/DCmyLzD1ETQmpzVRa15UT9v9i1QXgQMI6AOpBX73+RsJ
         qIvGCpihstjDw6nj4IaH88rCFP0Dqp/f6NnWQYGdhYANG4iM4hwZSFajqunmLBMVkkdw
         LVRxoF2CX+X1IM9ZaQh4vTIdi32YUlbi72NSkX8eOdJ+95ruh8s/q+a6wVjW7yX31dQ9
         hAKQ==
X-Gm-Message-State: AOAM533NqH/YJ0n6h5DGDOGES/vsQka/AVhf53rB8K8nOPqAYB6xsNrv
        rl62yoZqm1g8f7UupPw/z6H0EXkHtlM+YA==
X-Google-Smtp-Source: ABdhPJzJDlIsIcZE0+4n6JyZKhgvXll3A/8vivkggjHmU8FS5y+H7pENAGl/lZzeKs/biVcAEY6zzQ==
X-Received: by 2002:a5d:9c44:: with SMTP id 4mr47794019iof.15.1594384981239;
        Fri, 10 Jul 2020 05:43:01 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id b24sm3647609ioh.6.2020.07.10.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 05:43:00 -0700 (PDT)
Date:   Fri, 10 Jul 2020 08:42:53 -0400
From:   Qian Cai <cai@lca.pw>
To:     Yafang Shao <laoar.shao@gmail.com>
Cc:     mhocko@kernel.org, rientjes@google.com, akpm@linux-foundation.org,
        linux-mm@kvack.org, sfr@canb.auug.org.au,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm, oom: make the calculation of oom badness more
 accurate
Message-ID: <20200710124253.GA1125@lca.pw>
References: <1594309987-9919-1-git-send-email-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594309987-9919-1-git-send-email-laoar.shao@gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 09, 2020 at 11:53:07AM -0400, Yafang Shao wrote:
> Recently we found an issue on our production environment that when memcg
> oom is triggered the oom killer doesn't chose the process with largest
> resident memory but chose the first scanned process. Note that all
> processes in this memcg have the same oom_score_adj, so the oom killer
> should chose the process with largest resident memory.
> 
> Bellow is part of the oom info, which is enough to analyze this issue.
> [7516987.983223] memory: usage 16777216kB, limit 16777216kB, failcnt 52843037
> [7516987.983224] memory+swap: usage 16777216kB, limit 9007199254740988kB, failcnt 0
> [7516987.983225] kmem: usage 301464kB, limit 9007199254740988kB, failcnt 0
> [...]
> [7516987.983293] [ pid ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
> [7516987.983510] [ 5740]     0  5740      257        1    32768        0          -998 pause
> [7516987.983574] [58804]     0 58804     4594      771    81920        0          -998 entry_point.bas
> [7516987.983577] [58908]     0 58908     7089      689    98304        0          -998 cron
> [7516987.983580] [58910]     0 58910    16235     5576   163840        0          -998 supervisord
> [7516987.983590] [59620]     0 59620    18074     1395   188416        0          -998 sshd
> [7516987.983594] [59622]     0 59622    18680     6679   188416        0          -998 python
> [7516987.983598] [59624]     0 59624  1859266     5161   548864        0          -998 odin-agent
> [7516987.983600] [59625]     0 59625   707223     9248   983040        0          -998 filebeat
> [7516987.983604] [59627]     0 59627   416433    64239   774144        0          -998 odin-log-agent
> [7516987.983607] [59631]     0 59631   180671    15012   385024        0          -998 python3
> [7516987.983612] [61396]     0 61396   791287     3189   352256        0          -998 client
> [7516987.983615] [61641]     0 61641  1844642    29089   946176        0          -998 client
> [7516987.983765] [ 9236]     0  9236     2642      467    53248        0          -998 php_scanner
> [7516987.983911] [42898]     0 42898    15543      838   167936        0          -998 su
> [7516987.983915] [42900]  1000 42900     3673      867    77824        0          -998 exec_script_vr2
> [7516987.983918] [42925]  1000 42925    36475    19033   335872        0          -998 python
> [7516987.983921] [57146]  1000 57146     3673      848    73728        0          -998 exec_script_J2p
> [7516987.983925] [57195]  1000 57195   186359    22958   491520        0          -998 python2
> [7516987.983928] [58376]  1000 58376   275764    14402   290816        0          -998 rosmaster
> [7516987.983931] [58395]  1000 58395   155166     4449   245760        0          -998 rosout
> [7516987.983935] [58406]  1000 58406 18285584  3967322 37101568        0          -998 data_sim
> [7516987.984221] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=3aa16c9482ae3a6f6b78bda68a55d32c87c99b985e0f11331cddf05af6c4d753,mems_allowed=0-1,oom_memcg=/kubepods/podf1c273d3-9b36-11ea-b3df-246e9693c184,task_memcg=/kubepods/podf1c273d3-9b36-11ea-b3df-246e9693c184/1f246a3eeea8f70bf91141eeaf1805346a666e225f823906485ea0b6c37dfc3d,task=pause,pid=5740,uid=0
> [7516987.984254] Memory cgroup out of memory: Killed process 5740 (pause) total-vm:1028kB, anon-rss:4kB, file-rss:0kB, shmem-rss:0kB
> [7516988.092344] oom_reaper: reaped process 5740 (pause), now anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
> 
> We can find that the first scanned process 5740 (pause) was killed, but its
> rss is only one page. That is because, when we calculate the oom badness in
> oom_badness(), we always ignore the negtive point and convert all of these
> negtive points to 1. Now as oom_score_adj of all the processes in this
> targeted memcg have the same value -998, the points of these processes are
> all negtive value. As a result, the first scanned process will be killed.
> 
> The oom_socre_adj (-998) in this memcg is set by kubelet, because it is a
> a Guaranteed pod, which has higher priority to prevent from being killed by
> system oom.
> 
> To fix this issue, we should make the calculation of oom point more
> accurate. We can achieve it by convert the chosen_point from 'unsigned
> long' to 'long'.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>

Reverting this commit fixed the crash below while recovering from kenrel OOM,

Reproducer:

# git clone https://github.com/cailca/linux-mm
# cd linux-mm; make
# ./random 5 (just mmap and CoW)

[  261.362982][ T1770] Out of memory and no killable processes...
[  261.391982][ T1770] Kernel panic - not syncing: System is deadlocked on memory
[  261.428413][ T1770] CPU: 44 PID: 1770 Comm: random Not tainted 5.8.0-rc4-next-20200710 #1
[  261.467527][ T1770] Hardware name: HP ProLiant BL660c Gen9, BIOS I38 10/17/2018
[  261.501318][ T1770] Call Trace:
[  261.516258][ T1770]  dump_stack+0x9d/0xe0
[  261.534637][ T1770]  panic+0x2a1/0x522
[  261.551839][ T1770]  ? __warn_printk+0xd6/0xd6
[  261.572119][ T1770]  ? printk+0x9a/0xc0
[  261.589553][ T1770]  ? dump_header.cold.33+0x166/0x16b
[  261.613525][ T1770]  ? llist_add_batch+0x52/0x90
[  261.635103][ T1770]  out_of_memory.cold.42+0x3b/0x4f
[  261.657861][ T1770]  ? oom_killer_disable+0x210/0x210
[  261.681348][ T1770]  ? mutex_trylock+0x23a/0x2a0
[  261.703208][ T1770]  __alloc_pages_slowpath.constprop.73+0x19e8/0x2420
[  261.733036][ T1770]  ? rcu_read_lock_sched_held+0xaa/0xd0
[  261.757853][ T1770]  ? warn_alloc+0x120/0x120
[  261.777793][ T1770]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[  261.802347][ T1770]  ? lock_downgrade+0x720/0x720
[  261.823934][ T1770]  __alloc_pages_nodemask+0x66b/0x7d0
[  261.847732][ T1770]  ? __alloc_pages_slowpath.constprop.73+0x2420/0x2420
[  261.878316][ T1770]  ? up_read+0x1b2/0x755
[  261.995886][ T1770]  pagecache_get_page+0x15e/0x550
[  262.017892][ T1770]  ? filemap_fault+0x1321/0x1dd0
[  262.039864][ T1770]  filemap_fault+0xafb/0x1dd0
[  262.060633][ T1770]  __xfs_filemap_fault.constprop.6+0x119/0x490
[  262.088029][ T1770]  __do_fault+0xf5/0x550
[  262.106738][ T1770]  ? handle_mm_fault+0x26ec/0x2ef0
[  262.129316][ T1770]  handle_mm_fault+0x21de/0x2ef0
[  262.151211][ T1770]  ? copy_page_range+0x580/0x580
[  262.173193][ T1770]  do_user_addr_fault+0x2af/0x824
[  262.195424][ T1770]  ? trace_hardirqs_off_finish+0x1e7/0x250
[  262.220967][ T1770]  exc_page_fault+0x56/0xa0
[  262.240805][ T1770]  ? asm_exc_page_fault+0x8/0x30
[  262.262230][ T1770]  asm_exc_page_fault+0x1e/0x30
[  262.283642][ T1770] RIP: 0033:0x7f3427adf120
[  262.303060][ T1770] Code: Bad RIP value.
[  262.321132][ T1770] RSP: 002b:00007f34279eaeb8 EFLAGS: 00010206
[  262.348422][ T1770] RAX: 00007f33ee9d5000 RBX: 0000000000000000 RCX: 00007f3427ae28c7
[  262.384779][ T1770] RDX: 00007f310353e000 RSI: 00000003234abf33 RDI: 0000000000000000
[  262.424217][ T1770] RBP: 00007f34279eaef0 R08: 00000000ffffffff R09: 0000000000000000
[  262.463773][ T1770] R10: 0000000000000004 R11: 00007f3427adf120 R12: 00007ffc762430ce
[  262.500186][ T1770] R13: 00007ffc762430cf R14: 0000000000000000 R15: 00007f34279eafc0
[  262.536172][ T1770] Kernel Offset: 0x31600000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[  262.588968][ T1770] ---[ end Kernel panic - not syncing: System is deadlocked on memory ]---

More Console outputs prior to the crash,

[  246.610518][ T1778] random invoked oom-killer: gfp_mask=0x100dca(GFP_HIGHUSER_MOVABLE|__GFP_ZERO), order=0, oom_score_adj=0
[  246.668114][ T1778] CPU: 16 PID: 1778 Comm: random Not tainted 5.8.0-rc4-next-20200710 #1
[  246.706299][ T1778] Hardware name: HP ProLiant BL660c Gen9, BIOS I38 10/17/2018
[  246.739649][ T1778] Call Trace:
[  246.754012][ T1778]  dump_stack+0x9d/0xe0
[  246.772361][ T1778]  dump_header+0x104/0x830
[  246.792033][ T1778]  ? ___ratelimit+0x1c6/0x400
[  246.812735][ T1778]  oom_kill_process+0x11f/0x330
[  246.834146][ T1778]  out_of_memory+0x63f/0x1320
[  246.856993][ T1778]  ? oom_killer_disable+0x210/0x210
[  246.883648][ T1778]  ? mutex_trylock+0x23a/0x2a0
[  246.907003][ T1778]  __alloc_pages_slowpath.constprop.73+0x19e8/0x2420
[  246.938698][ T1778]  ? __lock_acquire+0xc57/0x4da0
[  246.963601][ T1778]  ? warn_alloc+0x120/0x120
[  246.985262][ T1778]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[  247.011387][ T1778]  ? lock_downgrade+0x720/0x720
[  247.034009][ T1778]  __alloc_pages_nodemask+0x66b/0x7d0
[  247.058147][ T1778]  ? handle_mm_fault+0x1f3/0x2ef0
[  247.080475][ T1778]  ? __alloc_pages_slowpath.constprop.73+0x2420/0x2420
[  247.111122][ T1778]  ? mark_held_locks+0xb0/0x110
[  247.133124][ T1778]  alloc_pages_vma+0xa5/0x4c0
[  247.156360][ T1778]  handle_mm_fault+0x1bdf/0x2ef0
[  247.179379][ T1778]  ? copy_page_range+0x580/0x580
[  247.200926][ T1778]  do_user_addr_fault+0x2af/0x824
[  247.223331][ T1778]  exc_page_fault+0x56/0xa0
[  247.243202][ T1778]  ? asm_exc_page_fault+0x8/0x30
[  247.265347][ T1778]  asm_exc_page_fault+0x1e/0x30
[  247.286788][ T1778] RIP: 0033:0x402cb9
[  247.303935][ T1778] Code: Bad RIP value.
[  247.321938][ T1778] RSP: 002b:00007f1e2c92eec0 EFLAGS: 00010206
[  247.349179][ T1778] RAX: 00007f1a7d0c6000 RBX: 0000000000000000 RCX: 00007f3427ae28c7
[  247.385115][ T1778] RDX: 00007f17e4fd6000 RSI: 00000003234abf33 RDI: 0000000000000000
[  247.420982][ T1778] RBP: 00007f1e2c92eef0 R08: 00000000ffffffff R09: 0000000000000000
[  247.456715][ T1778] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffc762430ce
[  247.492327][ T1778] R13: 00007ffc762430cf R14: 0000000000000000 R15: 00007f1e2c92efc0
[  247.528232][ T1778] Mem-Info:
[  247.541762][ T1778] active_anon:25261757 inactive_anon:2144151 isolated_anon:0
[  247.541762][ T1778]  active_file:138 inactive_file:81 isolated_file:21
[  247.541762][ T1778]  unevictable:0 dirty:0 writeback:0
[  247.541762][ T1778]  slab_reclaimable:26958 slab_unreclaimable:1049075
[  247.541762][ T1778]  mapped:1189 shmem:2353 pagetables:55339 bounce:0
[  247.541762][ T1778]  free:69553 free_pcp:1530 free_cma:0
[  247.716529][ T1778] Node 0 active_anon:12887656kB inactive_anon:1955060kB active_file:0kB inactive_file:24kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:8kB dirty:0kB writeback:0kB shmem:504kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 13785088kB writeback_tmp:0kB kernel_stack:5024kB all_unreclaimable? no
[  247.848980][ T1778] Node 1 active_anon:29008916kB inactive_anon:3085700kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:364kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 28985344kB writeback_tmp:0kB kernel_stack:4128kB all_unreclaimable? yes
[  247.980966][ T1778] Node 2 active_anon:29063680kB inactive_anon:1757120kB active_file:212kB inactive_file:296kB unevictable:0kB isolated(anon):0kB isolated(file):8kB mapped:4696kB dirty:0kB writeback:0kB shmem:8292kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 29159424kB writeback_tmp:0kB kernel_stack:5568kB all_unreclaimable? no
[  248.117727][ T1778] Node 3 active_anon:30090240kB inactive_anon:1778724kB active_file:268kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:252kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 30033920kB writeback_tmp:0kB kernel_stack:4480kB all_unreclaimable? yes
[  248.254628][ T1778] Node 0 DMA free:15904kB min:16kB low:28kB high:40kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB managed:15904kB mlocked:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[  248.378815][ T1778] lowmem_reserve[]: 0 1810 15429 15429
[  248.403362][ T1778] Node 0 DMA32 free:56160kB min:2180kB low:4032kB high:5884kB reserved_highatomic:0KB active_anon:1820964kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:1948156kB managed:1880848kB mlocked:0kB pagetables:8kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[  248.538800][ T1778] lowmem_reserve[]: 0 0 13619 13619
[  248.562446][ T1778] Node 0 Normal free:28424kB min:16404kB low:30348kB high:44292kB reserved_highatomic:12288KB active_anon:11066692kB inactive_anon:1955060kB active_file:0kB inactive_file:8kB unevictable:0kB writepending:0kB present:31457280kB managed:13951408kB mlocked:0kB pagetables:29868kB bounce:0kB free_pcp:828kB local_pcp:4kB free_cma:0kB
[  248.708696][ T1778] lowmem_reserve[]: 0 0 0 0
[  248.728635][ T1778] Node 1 Normal free:56784kB min:38852kB low:71876kB high:104900kB reserved_highatomic:18432KB active_anon:29008916kB inactive_anon:3085700kB active_file:40kB inactive_file:0kB unevictable:0kB writepending:0kB present:33554432kB managed:33027152kB mlocked:0kB pagetables:63652kB bounce:0kB free_pcp:500kB local_pcp:0kB free_cma:0kB
[  248.872458][ T1778] lowmem_reserve[]: 0 0 0 0
[  248.892503][ T1778] Node 2 Normal free:53868kB min:44996kB low:78020kB high:111044kB reserved_highatomic:10240KB active_anon:29071368kB inactive_anon:1757120kB active_file:644kB inactive_file:1132kB unevictable:0kB writepending:0kB present:33554432kB managed:33027156kB mlocked:0kB pagetables:63888kB bounce:0kB free_pcp:16036kB local_pcp:248kB free_cma:0kB
[  249.038452][ T1778] lowmem_reserve[]: 0 0 0 0
[  249.058650][ T1778] Node 3 Normal free:41936kB min:38852kB low:71876kB high:104900kB reserved_highatomic:4096KB active_anon:30090280kB inactive_anon:1778724kB active_file:248kB inactive_file:0kB unevictable:0kB writepending:0kB present:33554432kB managed:33026648kB mlocked:0kB pagetables:63992kB bounce:0kB free_pcp:2160kB local_pcp:508kB free_cma:0kB
[  249.205090][ T1778] lowmem_reserve[]: 0 0 0 0
[  249.226088][ T1778] Node 0 DMA: 2*4kB (U) 1*8kB (U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB 1*1024kB (U) 1*2048kB (M) 3*4096kB (M) = 15904kB
[  249.292333][ T1778] Node 0 DMA32: 2*4kB (U) 3*8kB (UM) 4*16kB (UM) 2*32kB (M) 3*64kB (UM) 2*128kB (UM) 5*256kB (UM) 6*512kB (M) 6*1024kB (UM) 0*2048kB 11*4096kB (M) = 56160kB
[  249.365090][ T1778] Node 0 Normal: 117*4kB (UE) 137*8kB (UE) 469*16kB (UME) 179*32kB (UE) 58*64kB (UE) 11*128kB (UE) 0*256kB 4*512kB (M) 6*1024kB (M) 0*2048kB 0*4096kB = 28108kB
[  249.437775][ T1778] Node 1 Normal: 162*4kB (UM) 83*8kB (U) 447*16kB (UME) 52*32kB (UME) 20*64kB (UME) 4*128kB (UME) 3*256kB (ME) 48*512kB (UM) 19*1024kB (M) 0*2048kB 0*4096kB = 56720kB
[  249.513107][ T1778] Node 2 Normal: 594*4kB (UM) 347*8kB (UM) 1014*16kB (UE) 99*32kB (UME) 79*64kB (UME) 144*128kB (UM) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 48032kB
[  249.583100][ T1778] Node 3 Normal: 225*4kB (U) 174*8kB (UM) 814*16kB (UME) 170*32kB (UE) 81*64kB (UE) 63*128kB (UE) 8*256kB (UE) 1*512kB (M) 5*1024kB (UM) 0*2048kB 0*4096kB = 41684kB
[  249.657751][ T1778] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[  249.704216][ T1778] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[  249.747344][ T1778] Node 1 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[  249.789951][ T1778] Node 1 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[  249.833177][ T1778] Node 2 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[  249.876892][ T1778] Node 2 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[  249.918701][ T1778] Node 3 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[  249.961959][ T1778] Node 3 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[  250.003640][ T1778] 830052 total pagecache pages
[  250.024344][ T1778] 827547 pages in swap cache
[  250.044627][ T1778] Swap cache stats: add 1048489, delete 221144, find 135/169
[  250.077908][ T1778] Free swap  = 0kB
[  250.094176][ T1778] Total swap = 4194300kB
[  250.112858][ T1778] 33521181 pages RAM
[  250.130761][ T1778] 0 pages HighMem/MovableOnly
[  250.152483][ T1778] 4788902 pages reserved
[  250.171254][ T1778] 0 pages hwpoisoned
[  250.189104][ T1778] Tasks state (memory values in pages):
[  250.216265][ T1778] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
[  250.260075][ T1778] [    893]     0   893    27572     1402   249856        0             0 systemd-journal
[  250.305110][ T1778] [    928]     0   928    26661      567   229376        0         -1000 systemd-udevd
[  250.349061][ T1778] [   1147]     0  1147    31227      173   143360       31             0 irqbalance
[  250.392400][ T1778] [   1155]    81  1155    18672      144   167936       53          -900 dbus-daemon
[  250.435855][ T1778] [   1157]   998  1157   508379     1349   385024      902             0 polkitd
[  250.477995][ T1778] [   1158]     0  1158    53104      391   421888      101             0 sssd
[  250.518371][ T1778] [   1159]     0  1159    97608      478   368640      129             0 NetworkManager
[  250.562804][ T1778] [   1162]   994  1162    95357      173   229376       35             0 rngd
[  250.604826][ T1778] [   1164]   995  1164     7366       48    94208       19             0 chronyd
[  250.648036][ T1778] [   1169]     0  1169     7337      374    86016      742             0 ksmtuned
[  250.690923][ T1778] [   1200]     0  1200    23773      130   204800       98         -1000 sshd
[  250.736317][ T1778] [   1203]     0  1203   106493     3161   434176     1244             0 tuned
[  250.777240][ T1778] [   1219]     0  1219    10394      100   106496       32             0 rhsmcertd
[  250.819134][ T1778] [   1238]     0  1238    54766      421   438272      216             0 sssd_be
[  250.861075][ T1778] [   1246]     0  1246    55309      406   462848        0             0 sssd_nss
[  250.903953][ T1778] [   1255]     0  1255    24020      219   208896       29             0 systemd-logind
[  250.947724][ T1778] [   1263]     0  1263     3918       25    77824        8             0 agetty
[  250.987890][ T1778] [   1272]     0  1272    23433      337   225280       17             0 systemd
[  251.029612][ T1778] [   1285]     0  1285    37329      427   299008      259             0 (sd-pam)
[  251.072439][ T1778] [   1517]     0  1517    54398      193   184320       46             0 rsyslogd
[  251.116327][ T1778] [   1527]     0  1527     9024      196   102400       25             0 crond
[  251.158985][ T1778] [   1531]     0  1531    63396      180   118784       24         -1000 restraintd
[  251.204944][ T1778] [   1541]     0  1541     6312       71    81920       17         -1000 10_bash_login
[  251.254455][ T1778] [   1568]     0  1568     2425        6    61440       49             0 make
[  251.296110][ T1778] [   1572]     0  1572     6312       92    81920       10             0 runtest.sh
[  251.340690][ T1778] [   1658]     0  1658    38227      293   299008       19             0 sshd
[  251.382404][ T1778] [   1674]     0  1674    38227      264   294912       51             0 sshd
[  251.424319][ T1778] [   1686]     0  1686     6346       45    94208      105             0 bash
[  251.466076][ T1778] [   1768]     0  1768     1639        0    61440       28             0 random
[  251.508756][ T1778] [   1769]     0  1769 32924969 26568800 221474816  1042033             0 random
[  251.551728][ T1778] [   1793]     0  1793     1821       25    61440        0             0 sleep
[  251.593685][ T1778] [   1798]     0  1798     1821       15    57344        0             0 sleep
[  251.635656][ T1778] oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),cpuset=/,mems_allowed=0-3,global_oom,task_memcg=/system.slice/dbus.service,task=dbus-daemon,pid=1155,uid=81
[  251.716666][ T1778] Out of memory: Killed process 1155 (dbus-daemon) total-vm:74688kB, anon-rss:572kB, file-rss:4kB, shmem-rss:0kB, UID:81 pgtables:164kB oom_score_adj:-900
[  251.795110][  T353] oom_reaper: reaped process 1155 (dbus-daemon), now anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
[  251.877615][ T1793] sleep (1793) used greatest stack depth: 18696 bytes left
[  256.237437][ T1770] random invoked oom-killer: gfp_mask=0x100cca(GFP_HIGHUSER_MOVABLE), order=0, oom_score_adj=0
[  256.289783][ T1770] CPU: 44 PID: 1770 Comm: random Not tainted 5.8.0-rc4-next-20200710 #1
[  256.329061][ T1770] Hardware name: HP ProLiant BL660c Gen9, BIOS I38 10/17/2018
[  256.363958][ T1770] Call Trace:
[  256.378672][ T1770]  dump_stack+0x9d/0xe0
[  256.397817][ T1770]  dump_header+0x104/0x830
[  256.418135][ T1770]  ? oom_evaluate_task+0x2fb/0x550
[  256.441580][ T1770]  out_of_memory+0xf17/0x1320
[  256.463209][ T1770]  ? oom_killer_disable+0x210/0x210
[  256.486890][ T1770]  ? mutex_trylock+0x23a/0x2a0
[  256.509086][ T1770]  __alloc_pages_slowpath.constprop.73+0x19e8/0x2420
[  256.539952][ T1770]  ? rcu_read_lock_sched_held+0xaa/0xd0
[  256.565885][ T1770]  ? warn_alloc+0x120/0x120
[  256.586540][ T1770]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[  256.611648][ T1770]  ? lock_downgrade+0x720/0x720
[  256.633613][ T1770]  __alloc_pages_nodemask+0x66b/0x7d0
[  256.658355][ T1770]  ? __alloc_pages_slowpath.constprop.73+0x2420/0x2420
[  256.690335][ T1770]  ? up_read+0x1b2/0x755
[  256.709484][ T1770]  pagecache_get_page+0x15e/0x550
[  256.732772][ T1770]  ? filemap_fault+0x1321/0x1dd0
[  256.755246][ T1770]  filemap_fault+0xafb/0x1dd0
[  256.778313][ T1770]  __xfs_filemap_fault.constprop.6+0x119/0x490
[  256.808802][ T1770]  __do_fault+0xf5/0x550
[  256.828058][ T1770]  ? handle_mm_fault+0x26ec/0x2ef0
[  256.851543][ T1770]  handle_mm_fault+0x21de/0x2ef0
[  256.874265][ T1770]  ? copy_page_range+0x580/0x580
[  256.897346][ T1770]  do_user_addr_fault+0x2af/0x824
[  256.919942][ T1770]  ? trace_hardirqs_off_finish+0x1e7/0x250
[  256.947004][ T1770]  exc_page_fault+0x56/0xa0
[  256.967920][ T1770]  ? asm_exc_page_fault+0x8/0x30
[  256.991703][ T1770]  asm_exc_page_fault+0x1e/0x30
[  257.013863][ T1770] RIP: 0033:0x7f3427adf120
[  257.034132][ T1770] Code: Bad RIP value.
[  257.053045][ T1770] RSP: 002b:00007f34279eaeb8 EFLAGS: 00010206
[  257.081173][ T1770] RAX: 00007f33ee9d5000 RBX: 0000000000000000 RCX: 00007f3427ae28c7
[  257.118606][ T1770] RDX: 00007f310353e000 RSI: 00000003234abf33 RDI: 0000000000000000
[  257.155693][ T1770] RBP: 00007f34279eaef0 R08: 00000000ffffffff R09: 0000000000000000
[  257.192771][ T1770] R10: 0000000000000004 R11: 00007f3427adf120 R12: 00007ffc762430ce
[  257.229803][ T1770] R13: 00007ffc762430cf R14: 0000000000000000 R15: 00007f34279eafc0
[  257.267345][ T1770] Mem-Info:
[  257.282676][ T1770] active_anon:25449780 inactive_anon:1965016 isolated_anon:0
[  257.282676][ T1770]  active_file:65 inactive_file:0 isolated_file:0
[  257.282676][ T1770]  unevictable:0 dirty:0 writeback:0
[  257.282676][ T1770]  slab_reclaimable:27023 slab_unreclaimable:1048444
[  257.282676][ T1770]  mapped:392 shmem:2334 pagetables:55543 bounce:0
[  257.282676][ T1770]  free:62065 free_pcp:554 free_cma:0
[  257.461086][ T1770] Node 0 active_anon:12935916kB inactive_anon:1909368kB active_file:36kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:12kB dirty:0kB writeback:0kB shmem:504kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 13744128kB writeback_tmp:0kB kernel_stack:5056kB all_unreclaimable? yes
[  257.596604][ T1770] Node 1 active_anon:29673204kB inactive_anon:2420336kB active_file:0kB inactive_file:16kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:352kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 28454912kB writeback_tmp:0kB kernel_stack:4128kB all_unreclaimable? yes
[  257.729603][ T1770] Node 2 active_anon:29105592kB inactive_anon:1743448kB active_file:80kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:1664kB dirty:0kB writeback:0kB shmem:8244kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 28469248kB writeback_tmp:0kB kernel_stack:5568kB all_unreclaimable? yes
[  257.869589][ T1770] Node 3 active_anon:30084408kB inactive_anon:1786912kB active_file:172kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:236kB shmem_thp: 0kB shmem_pmdmapped: 0kB anon_thp: 29853696kB writeback_tmp:0kB kernel_stack:4448kB all_unreclaimable? yes
[  258.002724][ T1770] Node 0 DMA free:15904kB min:16kB low:28kB high:40kB reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:15992kB managed:15904kB mlocked:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[  258.125796][ T1770] lowmem_reserve[]: 0 1810 15429 15429
[  258.150081][ T1770] Node 0 DMA32 free:56160kB min:2180kB low:4032kB high:5884kB reserved_highatomic:0KB active_anon:1820964kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:1948156kB managed:1880848kB mlocked:0kB pagetables:8kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[  258.282380][ T1770] lowmem_reserve[]: 0 0 13619 13619
[  258.306345][ T1770] Node 0 Normal free:27708kB min:16404kB low:30348kB high:44292kB reserved_highatomic:12288KB active_anon:11114952kB inactive_anon:1909368kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:31457280kB managed:13951408kB mlocked:0kB pagetables:29840kB bounce:0kB free_pcp:1100kB local_pcp:0kB free_cma:0kB
[  258.451411][ T1770] lowmem_reserve[]: 0 0 0 0
[  258.471323][ T1770] Node 1 Normal free:56716kB min:38852kB low:71876kB high:104900kB reserved_highatomic:18432KB active_anon:29673208kB inactive_anon:2420336kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:33554432kB managed:33027152kB mlocked:0kB pagetables:63984kB bounce:0kB free_pcp:724kB local_pcp:0kB free_cma:0kB
[  258.611278][ T1770] lowmem_reserve[]: 0 0 0 0
[  258.631152][ T1770] Node 2 Normal free:48984kB min:38852kB low:71876kB high:104900kB reserved_highatomic:10240KB active_anon:29105592kB inactive_anon:1743448kB active_file:108kB inactive_file:0kB unevictable:0kB writepending:0kB present:33554432kB managed:33027156kB mlocked:0kB pagetables:64248kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
[  258.771172][ T1770] lowmem_reserve[]: 0 0 0 0
[  258.791140][ T1770] Node 3 Normal free:42624kB min:38852kB low:71876kB high:104900kB reserved_highatomic:4096KB active_anon:30084408kB inactive_anon:1786912kB active_file:220kB inactive_file:0kB unevictable:0kB writepending:0kB present:33554432kB managed:33026648kB mlocked:0kB pagetables:64092kB bounce:0kB free_pcp:356kB local_pcp:40kB free_cma:0kB
[  258.939974][ T1770] lowmem_reserve[]: 0 0 0 0
[  258.959555][ T1770] Node 0 DMA: 2*4kB (U) 1*8kB (U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB 1*1024kB (U) 1*2048kB (M) 3*4096kB (M) = 15904kB
[  259.026918][ T1770] Node 0 DMA32: 2*4kB (U) 3*8kB (UM) 4*16kB (UM) 2*32kB (M) 3*64kB (UM) 2*128kB (UM) 5*256kB (UM) 6*512kB (M) 6*1024kB (UM) 0*2048kB 11*4096kB (M) = 56160kB
[  259.099706][ T1770] Node 0 Normal: 69*4kB (UME) 142*8kB (UME) 472*16kB (UME) 203*32kB (UME) 68*64kB (UME) 14*128kB (UME) 0*256kB 0*512kB 6*1024kB (M) 0*2048kB 0*4096kB = 27748kB
[  259.175171][ T1770] Node 1 Normal: 105*4kB (UME) 77*8kB (UME) 438*16kB (UME) 28*32kB (UME) 12*64kB (UME) 3*128kB (UE) 2*256kB (E) 20*512kB (UM) 35*1024kB (M) 0*2048kB 0*4096kB = 56684kB
[  259.252959][ T1770] Node 2 Normal: 526*4kB (UM) 406*8kB (UM) 1107*16kB (UME) 156*32kB (UME) 159*64kB (UME) 82*128kB (UM) 1*256kB (M) 0*512kB 0*1024kB 0*2048kB 0*4096kB = 48984kB
[  259.326006][ T1770] Node 3 Normal: 282*4kB (UM) 199*8kB (UM) 828*16kB (UME) 167*32kB (UME) 83*64kB (UME) 75*128kB (UME) 9*256kB (UME) 0*512kB 4*1024kB (UM) 0*2048kB 0*4096kB = 42624kB
[  259.406007][ T1770] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[  259.452447][ T1770] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[  259.496823][ T1770] Node 1 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[  259.539971][ T1770] Node 1 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[  259.581942][ T1770] Node 2 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[  259.625200][ T1770] Node 2 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[  259.666879][ T1770] Node 3 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=1048576kB
[  259.709798][ T1770] Node 3 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[  259.751068][ T1770] 742508 total pagecache pages
[  259.772116][ T1770] 740154 pages in swap cache
[  259.792405][ T1770] Swap cache stats: add 1048884, delete 308889, find 186/397
[  259.825548][ T1770] Free swap  = 0kB
[  259.843259][ T1770] Total swap = 4194300kB
[  259.863815][ T1770] 33521181 pages RAM
[  259.882683][ T1770] 0 pages HighMem/MovableOnly
[  259.904128][ T1770] 4788902 pages reserved
[  259.922912][ T1770] 0 pages hwpoisoned
[  259.940059][ T1770] Tasks state (memory values in pages):
[  259.964779][ T1770] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
[  260.007423][ T1770] [    893]     0   893    27572      680   249856        0             0 systemd-journal
[  260.052192][ T1770] [    928]     0   928    26661      555   229376       12         -1000 systemd-udevd
[  260.096152][ T1770] [   1147]     0  1147    31227      169   143360       35             0 irqbalance
[  260.138753][ T1770] [   1157]   998  1157   508379     1412   385024      867             0 polkitd
[  260.181125][ T1770] [   1158]     0  1158    53104      384   421888      108             0 sssd
[  260.222429][ T1770] [   1159]     0  1159    97608      531   368640      106             0 NetworkManager
[  260.267509][ T1770] [   1162]   994  1162    95357      172   229376       36             0 rngd
[  260.308103][ T1770] [   1164]   995  1164     7366       45    94208       22             0 chronyd
[  260.350334][ T1770] [   1169]     0  1169     7337      371    86016      745             0 ksmtuned
[  260.395957][ T1770] [   1200]     0  1200    23773      128   204800      100         -1000 sshd
[  260.436408][ T1770] [   1203]     0  1203   106493     3196   434176     1214             0 tuned
[  260.476988][ T1770] [   1219]     0  1219    10394       99   106496       33             0 rhsmcertd
[  260.519120][ T1770] [   1238]     0  1238    54766      420   438272      217             0 sssd_be
[  260.560519][ T1770] [   1246]     0  1246    55309      406   462848        0             0 sssd_nss
[  260.602315][ T1770] [   1255]     0  1255    24020      226   208896       23             0 systemd-logind
[  260.646396][ T1770] [   1263]     0  1263     3918       23    77824       10             0 agetty
[  260.687288][ T1770] [   1272]     0  1272    23433      342   225280       16             0 systemd
[  260.728686][ T1770] [   1285]     0  1285    37329      420   299008      266             0 (sd-pam)
[  260.770420][ T1770] [   1517]     0  1517    54398      166   184320       46             0 rsyslogd
[  260.812273][ T1770] [   1527]     0  1527     9024      190   102400       31             0 crond
[  260.853747][ T1770] [   1531]     0  1531    63396      179   118784       25         -1000 restraintd
[  260.901574][ T1770] [   1541]     0  1541     6312       71    81920       17         -1000 10_bash_login
[  260.945269][ T1770] [   1568]     0  1568     2425        6    61440       49             0 make
[  260.985486][ T1770] [   1572]     0  1572     6312       89    81920       12             0 runtest.sh
[  261.028161][ T1770] [   1658]     0  1658    38227      291   299008       21             0 sshd
[  261.068328][ T1770] [   1674]     0  1674    38227      262   294912       53             0 sshd
[  261.108488][ T1770] [   1686]     0  1686     6346       45    94208      105             0 bash
[  261.148602][ T1770] [   1768]     0  1768     1639        0    61440       28             0 random
[  261.189874][ T1770] [   1769]     0  1769 32924969 26661064 222212096  1042153             0 random
[  261.233064][ T1770] [   1798]     0  1798     1821       15    57344        0             0 sleep
[  261.274004][ T1770] [   1799]     0  1799    15922       63   143360        0             0 systemd-cgroups
[  261.320765][ T1770] [   1801]     0  1801     1090       23    53248        0             0 sleep
[  261.362982][ T1770] Out of memory and no killable processes...
[  261.391982][ T1770] Kernel panic - not syncing: System is deadlocked on memory
[  261.428413][ T1770] CPU: 44 PID: 1770 Comm: random Not tainted 5.8.0-rc4-next-20200710 #1
[  261.467527][ T1770] Hardware name: HP ProLiant BL660c Gen9, BIOS I38 10/17/2018
[  261.501318][ T1770] Call Trace:
[  261.516258][ T1770]  dump_stack+0x9d/0xe0
[  261.534637][ T1770]  panic+0x2a1/0x522
[  261.551839][ T1770]  ? __warn_printk+0xd6/0xd6
[  261.572119][ T1770]  ? printk+0x9a/0xc0
[  261.589553][ T1770]  ? dump_header.cold.33+0x166/0x16b
[  261.613525][ T1770]  ? llist_add_batch+0x52/0x90
[  261.635103][ T1770]  out_of_memory.cold.42+0x3b/0x4f
[  261.657861][ T1770]  ? oom_killer_disable+0x210/0x210
[  261.681348][ T1770]  ? mutex_trylock+0x23a/0x2a0
[  261.703208][ T1770]  __alloc_pages_slowpath.constprop.73+0x19e8/0x2420
[  261.733036][ T1770]  ? rcu_read_lock_sched_held+0xaa/0xd0
[  261.757853][ T1770]  ? warn_alloc+0x120/0x120
[  261.777793][ T1770]  ? __alloc_pages_nodemask+0x3b7/0x7d0
[  261.802347][ T1770]  ? lock_downgrade+0x720/0x720
[  261.823934][ T1770]  __alloc_pages_nodemask+0x66b/0x7d0
[  261.847732][ T1770]  ? __alloc_pages_slowpath.constprop.73+0x2420/0x2420
[  261.878316][ T1770]  ? up_read+0x1b2/0x755
[  261.995886][ T1770]  pagecache_get_page+0x15e/0x550
[  262.017892][ T1770]  ? filemap_fault+0x1321/0x1dd0
[  262.039864][ T1770]  filemap_fault+0xafb/0x1dd0
[  262.060633][ T1770]  __xfs_filemap_fault.constprop.6+0x119/0x490
[  262.088029][ T1770]  __do_fault+0xf5/0x550
[  262.106738][ T1770]  ? handle_mm_fault+0x26ec/0x2ef0
[  262.129316][ T1770]  handle_mm_fault+0x21de/0x2ef0
[  262.151211][ T1770]  ? copy_page_range+0x580/0x580
[  262.173193][ T1770]  do_user_addr_fault+0x2af/0x824
[  262.195424][ T1770]  ? trace_hardirqs_off_finish+0x1e7/0x250
[  262.220967][ T1770]  exc_page_fault+0x56/0xa0
[  262.240805][ T1770]  ? asm_exc_page_fault+0x8/0x30
[  262.262230][ T1770]  asm_exc_page_fault+0x1e/0x30
[  262.283642][ T1770] RIP: 0033:0x7f3427adf120
[  262.303060][ T1770] Code: Bad RIP value.
[  262.321132][ T1770] RSP: 002b:00007f34279eaeb8 EFLAGS: 00010206
[  262.348422][ T1770] RAX: 00007f33ee9d5000 RBX: 0000000000000000 RCX: 00007f3427ae28c7
[  262.384779][ T1770] RDX: 00007f310353e000 RSI: 00000003234abf33 RDI: 0000000000000000
[  262.424217][ T1770] RBP: 00007f34279eaef0 R08: 00000000ffffffff R09: 0000000000000000
[  262.463773][ T1770] R10: 0000000000000004 R11: 00007f3427adf120 R12: 00007ffc762430ce
[  262.500186][ T1770] R13: 00007ffc762430cf R14: 0000000000000000 R15: 00007f34279eafc0
[  262.536172][ T1770] Kernel Offset: 0x31600000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[  262.588968][ T1770] ---[ end Kernel panic - not syncing: System is deadlocked on memory ]---

> ---
>  drivers/tty/sysrq.c |  1 +
>  fs/proc/base.c      |  7 ++++++-
>  include/linux/oom.h |  4 ++--
>  mm/memcontrol.c     |  1 +
>  mm/oom_kill.c       | 19 ++++++++-----------
>  mm/page_alloc.c     |  1 +
>  6 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 7c95afa9..e83fd46 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -382,6 +382,7 @@ static void moom_callback(struct work_struct *ignored)
>  		.memcg = NULL,
>  		.gfp_mask = gfp_mask,
>  		.order = -1,
> +		.chosen_points = LONG_MIN,
>  	};
>  
>  	mutex_lock(&oom_lock);
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index d86c0af..bf16406 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -551,8 +551,13 @@ static int proc_oom_score(struct seq_file *m, struct pid_namespace *ns,
>  {
>  	unsigned long totalpages = totalram_pages() + total_swap_pages;
>  	unsigned long points = 0;
> +	long badness;
>  
> -	points = oom_badness(task, totalpages) * 1000 / totalpages;
> +	badness = oom_badness(task, totalpages);
> +	if (badness != LONG_MIN) {
> +		/* Let's keep the range of points as [0, 2000]. */
> +		points = (1000 + badness * 1000 / (long)totalpages) * 2 / 3;
> +	}
>  	seq_printf(m, "%lu\n", points);
>  
>  	return 0;
> diff --git a/include/linux/oom.h b/include/linux/oom.h
> index c696c26..f022f58 100644
> --- a/include/linux/oom.h
> +++ b/include/linux/oom.h
> @@ -48,7 +48,7 @@ struct oom_control {
>  	/* Used by oom implementation, do not set */
>  	unsigned long totalpages;
>  	struct task_struct *chosen;
> -	unsigned long chosen_points;
> +	long chosen_points;
>  
>  	/* Used to print the constraint info. */
>  	enum oom_constraint constraint;
> @@ -107,7 +107,7 @@ static inline vm_fault_t check_stable_address_space(struct mm_struct *mm)
>  
>  bool __oom_reap_task_mm(struct mm_struct *mm);
>  
> -extern unsigned long oom_badness(struct task_struct *p,
> +long oom_badness(struct task_struct *p,
>  		unsigned long totalpages);
>  
>  extern bool out_of_memory(struct oom_control *oc);
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 1962232..df73b30 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1559,6 +1559,7 @@ static bool mem_cgroup_out_of_memory(struct mem_cgroup *memcg, gfp_t gfp_mask,
>  		.memcg = memcg,
>  		.gfp_mask = gfp_mask,
>  		.order = order,
> +		.chosen_points = LONG_MIN,
>  	};
>  	bool ret;
>  
> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> index 6e94962..2dd5a90 100644
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -196,17 +196,17 @@ static bool is_dump_unreclaim_slabs(void)
>   * predictable as possible.  The goal is to return the highest value for the
>   * task consuming the most memory to avoid subsequent oom failures.
>   */
> -unsigned long oom_badness(struct task_struct *p, unsigned long totalpages)
> +long oom_badness(struct task_struct *p, unsigned long totalpages)
>  {
>  	long points;
>  	long adj;
>  
>  	if (oom_unkillable_task(p))
> -		return 0;
> +		return LONG_MIN;
>  
>  	p = find_lock_task_mm(p);
>  	if (!p)
> -		return 0;
> +		return LONG_MIN;
>  
>  	/*
>  	 * Do not even consider tasks which are explicitly marked oom
> @@ -218,7 +218,7 @@ unsigned long oom_badness(struct task_struct *p, unsigned long totalpages)
>  			test_bit(MMF_OOM_SKIP, &p->mm->flags) ||
>  			in_vfork(p)) {
>  		task_unlock(p);
> -		return 0;
> +		return LONG_MIN;
>  	}
>  
>  	/*
> @@ -233,11 +233,7 @@ unsigned long oom_badness(struct task_struct *p, unsigned long totalpages)
>  	adj *= totalpages / 1000;
>  	points += adj;
>  
> -	/*
> -	 * Never return 0 for an eligible task regardless of the root bonus and
> -	 * oom_score_adj (oom_score_adj can't be OOM_SCORE_ADJ_MIN here).
> -	 */
> -	return points > 0 ? points : 1;
> +	return points;
>  }
>  
>  static const char * const oom_constraint_text[] = {
> @@ -336,12 +332,12 @@ static int oom_evaluate_task(struct task_struct *task, void *arg)
>  	 * killed first if it triggers an oom, then select it.
>  	 */
>  	if (oom_task_origin(task)) {
> -		points = ULONG_MAX;
> +		points = LONG_MAX;
>  		goto select;
>  	}
>  
>  	points = oom_badness(task, oc->totalpages);
> -	if (!points || points < oc->chosen_points)
> +	if (points == LONG_MIN || points < oc->chosen_points)
>  		goto next;
>  
>  select:
> @@ -1128,6 +1124,7 @@ void pagefault_out_of_memory(void)
>  		.memcg = NULL,
>  		.gfp_mask = 0,
>  		.order = 0,
> +		.chosen_points = LONG_MIN,
>  	};
>  
>  	if (mem_cgroup_oom_synchronize(true))
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e028b87c..8eec9d65 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3896,6 +3896,7 @@ void warn_alloc(gfp_t gfp_mask, nodemask_t *nodemask, const char *fmt, ...)
>  		.memcg = NULL,
>  		.gfp_mask = gfp_mask,
>  		.order = order,
> +		.chosen_points = LONG_MIN,
>  	};
>  	struct page *page;
>  
> -- 
> 1.8.3.1
> 
> 
