Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E86F21B5A8
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 14:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgGJM64 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 08:58:56 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:39136 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJM64 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 08:58:56 -0400
Received: by mail-ej1-f65.google.com with SMTP id w6so5925866ejq.6;
        Fri, 10 Jul 2020 05:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o3vs3eoWNKLgdeaOgka2di4fFfsPGUfmp/HII8PLK2Q=;
        b=lz/8OqVJ5gkHALTWf7MfFaqrt0oeDStIs1THrUoqkMyVRTqSKAcZruuiwj2rh5P5R3
         PQ+nYEzBbEyMncKiTlVrl/lKBSW3/U7iAV8nl4tPWFfqFXJuTfmfHJnP8068iHjofhKp
         AgBGhur43UYQLLkoHalbE5HCgr/zM18O44lPMa5zE4VxwudJ71kjPUC/zUDhVhp5PxTZ
         291CqV7VD96XlSzQCZ+IzrPlImTIWk4rkwveJBH/QP22PDSTxoyv2mjKhHmXEsEAvqKw
         WB5MU5KGUQOk1ashuAUrtCOR3d9Civtn7Yh0CchFupr39o2xqW3IKSEE+p1tyAAYaW2C
         4lHQ==
X-Gm-Message-State: AOAM531v7u7xlOvy0BKXXW1qPuxiXtKarJAqccvrKX7BizsRdlIas2rT
        JWTIpPz6OdzTWBv9a08w1gM=
X-Google-Smtp-Source: ABdhPJx2Svx+XMVDHg6qJCDn1flaIzKpTLG6PM81LpgTFxtvt80lYM3e18Ho2rBRAsbMVx6gZsA9Lw==
X-Received: by 2002:a17:906:3152:: with SMTP id e18mr63163905eje.137.1594385934419;
        Fri, 10 Jul 2020 05:58:54 -0700 (PDT)
Received: from localhost (ip-37-188-148-171.eurotel.cz. [37.188.148.171])
        by smtp.gmail.com with ESMTPSA id f17sm3637904ejr.71.2020.07.10.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 05:58:53 -0700 (PDT)
Date:   Fri, 10 Jul 2020 14:58:52 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     Qian Cai <cai@lca.pw>
Cc:     Yafang Shao <laoar.shao@gmail.com>, rientjes@google.com,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm, oom: make the calculation of oom badness more
 accurate
Message-ID: <20200710125852.GC3022@dhcp22.suse.cz>
References: <1594309987-9919-1-git-send-email-laoar.shao@gmail.com>
 <20200710124253.GA1125@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710124253.GA1125@lca.pw>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri 10-07-20 08:42:53, Qian Cai wrote:
> On Thu, Jul 09, 2020 at 11:53:07AM -0400, Yafang Shao wrote:
> > Recently we found an issue on our production environment that when memcg
> > oom is triggered the oom killer doesn't chose the process with largest
> > resident memory but chose the first scanned process. Note that all
> > processes in this memcg have the same oom_score_adj, so the oom killer
> > should chose the process with largest resident memory.
> > 
> > Bellow is part of the oom info, which is enough to analyze this issue.
> > [7516987.983223] memory: usage 16777216kB, limit 16777216kB, failcnt 52843037
> > [7516987.983224] memory+swap: usage 16777216kB, limit 9007199254740988kB, failcnt 0
> > [7516987.983225] kmem: usage 301464kB, limit 9007199254740988kB, failcnt 0
> > [...]
> > [7516987.983293] [ pid ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
> > [7516987.983510] [ 5740]     0  5740      257        1    32768        0          -998 pause
> > [7516987.983574] [58804]     0 58804     4594      771    81920        0          -998 entry_point.bas
> > [7516987.983577] [58908]     0 58908     7089      689    98304        0          -998 cron
> > [7516987.983580] [58910]     0 58910    16235     5576   163840        0          -998 supervisord
> > [7516987.983590] [59620]     0 59620    18074     1395   188416        0          -998 sshd
> > [7516987.983594] [59622]     0 59622    18680     6679   188416        0          -998 python
> > [7516987.983598] [59624]     0 59624  1859266     5161   548864        0          -998 odin-agent
> > [7516987.983600] [59625]     0 59625   707223     9248   983040        0          -998 filebeat
> > [7516987.983604] [59627]     0 59627   416433    64239   774144        0          -998 odin-log-agent
> > [7516987.983607] [59631]     0 59631   180671    15012   385024        0          -998 python3
> > [7516987.983612] [61396]     0 61396   791287     3189   352256        0          -998 client
> > [7516987.983615] [61641]     0 61641  1844642    29089   946176        0          -998 client
> > [7516987.983765] [ 9236]     0  9236     2642      467    53248        0          -998 php_scanner
> > [7516987.983911] [42898]     0 42898    15543      838   167936        0          -998 su
> > [7516987.983915] [42900]  1000 42900     3673      867    77824        0          -998 exec_script_vr2
> > [7516987.983918] [42925]  1000 42925    36475    19033   335872        0          -998 python
> > [7516987.983921] [57146]  1000 57146     3673      848    73728        0          -998 exec_script_J2p
> > [7516987.983925] [57195]  1000 57195   186359    22958   491520        0          -998 python2
> > [7516987.983928] [58376]  1000 58376   275764    14402   290816        0          -998 rosmaster
> > [7516987.983931] [58395]  1000 58395   155166     4449   245760        0          -998 rosout
> > [7516987.983935] [58406]  1000 58406 18285584  3967322 37101568        0          -998 data_sim
> > [7516987.984221] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=3aa16c9482ae3a6f6b78bda68a55d32c87c99b985e0f11331cddf05af6c4d753,mems_allowed=0-1,oom_memcg=/kubepods/podf1c273d3-9b36-11ea-b3df-246e9693c184,task_memcg=/kubepods/podf1c273d3-9b36-11ea-b3df-246e9693c184/1f246a3eeea8f70bf91141eeaf1805346a666e225f823906485ea0b6c37dfc3d,task=pause,pid=5740,uid=0
> > [7516987.984254] Memory cgroup out of memory: Killed process 5740 (pause) total-vm:1028kB, anon-rss:4kB, file-rss:0kB, shmem-rss:0kB
> > [7516988.092344] oom_reaper: reaped process 5740 (pause), now anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
> > 
> > We can find that the first scanned process 5740 (pause) was killed, but its
> > rss is only one page. That is because, when we calculate the oom badness in
> > oom_badness(), we always ignore the negtive point and convert all of these
> > negtive points to 1. Now as oom_score_adj of all the processes in this
> > targeted memcg have the same value -998, the points of these processes are
> > all negtive value. As a result, the first scanned process will be killed.
> > 
> > The oom_socre_adj (-998) in this memcg is set by kubelet, because it is a
> > a Guaranteed pod, which has higher priority to prevent from being killed by
> > system oom.
> > 
> > To fix this issue, we should make the calculation of oom point more
> > accurate. We can achieve it by convert the chosen_point from 'unsigned
> > long' to 'long'.
> > 
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> 
> Reverting this commit fixed the crash below while recovering from kenrel OOM,

I suspect that the previous version of the patch has been tested (in
Linux next). Does this version exhibit the same problem?

I will have a closer look. Is the full dmesg available somewhere?
-- 
Michal Hocko
SUSE Labs
