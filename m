Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C06321CCE0
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 03:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgGMBth (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 21:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgGMBth (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jul 2020 21:49:37 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB571C061794;
        Sun, 12 Jul 2020 18:49:36 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id a12so11768772ion.13;
        Sun, 12 Jul 2020 18:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UCgQ5OkChFctXpXHrvYqS2fAOh+viWd11lFcxLhVv70=;
        b=qZg7ixS7tk+RWK/Qp6mI8RJyBT93Jprv/Nt3c9e+iAsOLuO+t2387QP4Z3jwm3hAV9
         leQcRYeEv2BwFEZt4tnoek/l94C8gK0qHTI0uM26YlEQCpPCFaPLYwmnYiPNBeGjo+1r
         mnVIV6UzED2ZO6Cr4kP+zgdE+APXrQGu0rVmh9F0igzvR84885uFN/1AGDIe6gMGxCVF
         WjeMpzu/D3zjA/+aQ6xq3FAVStdVUN/t5uUkayDIjzcMsBnVPHTLzfqRjtfV/J7Sapkw
         JkeXLqdnWvjdHgK2v7nusHcyNV9bZRIVXAWLaqy0KwKqvdcacktZJ/T1evyqrsrb+I/F
         cbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UCgQ5OkChFctXpXHrvYqS2fAOh+viWd11lFcxLhVv70=;
        b=spBzneGP105Uw5jBnHSw0bNrGDfwwtujGpQLc4+kdXUkAcf1IlukGMSxMzAordubyn
         SziGY7y077n9Er7JNGTyOFBJQx5qLnNRhBNrsbhzu06gBVbGQJ81hzwX6/Fr4072DHoO
         ZsZTPKFnm5I5Ahc2W2JOTncWDxsMsKh43N5UVdOLtpDDBV0mDJCfyH6dQVFdPwP3PYdn
         KEfi+/smK9wdlD/wWbupovW5d+4z8ZHwZ6JkvIxzZgp+s2jHYsVx53Yj19iowJjc5g6N
         pt+50m9jvsqi3Xk3jTsGfT4SR1l8I/ZRQviKIQOpyjE3RzsZSeI84KVU9vK28qS0esCP
         fYwQ==
X-Gm-Message-State: AOAM533XF4347T2be+PAk2v2QsLj4fdVdnyef75SZLv7342DG1MPiVyZ
        BmW0J3Z3V1QEW6aoccmXD682OQwRSJjrfCXz6+U=
X-Google-Smtp-Source: ABdhPJz46PulmRo4JCRnlh8JcJ/1jHzGCXBxdJA2NCgzUw0WXnc7jAxK9MRNA3uGHqO09X2gboHPO/Fof6tl0TDQScI=
X-Received: by 2002:a6b:c343:: with SMTP id t64mr4349756iof.66.1594604975937;
 Sun, 12 Jul 2020 18:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <1594396651-9931-1-git-send-email-laoar.shao@gmail.com> <CA+G9fYuYwef7HcKbiDk_DQkKzdKf87yCnc7nHXeCmbQmFWHEUA@mail.gmail.com>
In-Reply-To: <CA+G9fYuYwef7HcKbiDk_DQkKzdKf87yCnc7nHXeCmbQmFWHEUA@mail.gmail.com>
From:   Yafang Shao <laoar.shao@gmail.com>
Date:   Mon, 13 Jul 2020 09:49:00 +0800
Message-ID: <CALOAHbCLAXb1+n+xZiiZc1n11_n+j1XaEoTp8WnTeq4vocOgeQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm, oom: make the calculation of oom badness more accurate
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Michal Hocko <mhocko@kernel.org>, Qian Cai <cai@lca.pw>,
        David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 13, 2020 at 2:34 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> On Fri, 10 Jul 2020 at 21:28, Yafang Shao <laoar.shao@gmail.com> wrote:
> >
> > Recently we found an issue on our production environment that when memc=
g
> > oom is triggered the oom killer doesn't chose the process with largest
> > resident memory but chose the first scanned process. Note that all
> > processes in this memcg have the same oom_score_adj, so the oom killer
> > should chose the process with largest resident memory.
> >
> > Bellow is part of the oom info, which is enough to analyze this issue.
> > [7516987.983223] memory: usage 16777216kB, limit 16777216kB, failcnt 52=
843037
> > [7516987.983224] memory+swap: usage 16777216kB, limit 9007199254740988k=
B, failcnt 0
> > [7516987.983225] kmem: usage 301464kB, limit 9007199254740988kB, failcn=
t 0
> [...]
> > [7516987.984221] oom-kill:constraint=3DCONSTRAINT_MEMCG,nodemask=3D(nul=
l),cpuset=3D3aa16c9482ae3a6f6b78bda68a55d32c87c99b985e0f11331cddf05af6c4d75=
3,mems_allowed=3D0-1,oom_memcg=3D/kubepods/podf1c273d3-9b36-11ea-b3df-246e9=
693c184,task_memcg=3D/kubepods/podf1c273d3-9b36-11ea-b3df-246e9693c184/1f24=
6a3eeea8f70bf91141eeaf1805346a666e225f823906485ea0b6c37dfc3d,task=3Dpause,p=
id=3D5740,uid=3D0
> > [7516987.984254] Memory cgroup out of memory: Killed process 5740 (paus=
e) total-vm:1028kB, anon-rss:4kB, file-rss:0kB, shmem-rss:0kB
> > [7516988.092344] oom_reaper: reaped process 5740 (pause), now anon-rss:=
0kB, file-rss:0kB, shmem-rss:0kB
> >
> > We can find that the first scanned process 5740 (pause) was killed, but=
 its
> > rss is only one page. That is because, when we calculate the oom badnes=
s in
> > oom_badness(), we always ignore the negtive point and convert all of th=
ese
> > negtive points to 1. Now as oom_score_adj of all the processes in this
> > targeted memcg have the same value -998, the points of these processes =
are
> > all negtive value. As a result, the first scanned process will be kille=
d.
> >
> > The oom_socre_adj (-998) in this memcg is set by kubelet, because it is=
 a
> > a Guaranteed pod, which has higher priority to prevent from being kille=
d by
> > system oom.
> >
> > To fix this issue, we should make the calculation of oom point more
> > accurate. We can achieve it by convert the chosen_point from 'unsigned
> > long' to 'long'.
> >
> > [cai@lca.pw: reported a issue in the previous version]
> > [mhocko@suse.com: fixed the issue reported by Cai]
> > [mhocko@suse.com: add the comment in proc_oom_score()]
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Acked-by: Michal Hocko <mhocko@suse.com>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Qian Cai <cai@lca.pw>
> >
> > ---
> > v2 -> v3:
> > - fix the type of variable 'point' in oom_evaluate_task()
> > - initialize oom_control->chosen_points in select_bad_process() per Mic=
hal
> > - update the comment in proc_oom_score() per Michal
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
>
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> I have noticed kernel panic with v2 patch while running LTP mm test suite=
.
>
> [ 63.451494] Out of memory and no killable processes...
> [ 63.456633] Kernel panic - not syncing: System is deadlocked on memory
>
> Then I have removed the v2 patch and applied this below v3 patch and re-t=
ested.
> No regression noticed with v3 patch while running LTP mm on x86_64 and ar=
m.
>
> OTOH,
> oom01 test case started with 100 iterations but runltp got killed after t=
he
> 6th iteration [3]. I think this is expected.
>
> test steps:
>           - cd /opt/ltp
>           - ./runltp -s oom01 -I 100 || true
>
> [  209.052842] Out of memory: Killed process 519 (runltp)
> total-vm:10244kB, anon-rss:904kB, file-rss:4kB, shmem-rss:0kB, UID:0
> pgtables:60kB oom_score_adj:0
> [  209.066782] oom_reaper: reaped process 519 (runltp), now
> anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
> /lava-1558245/0/tests/0_prep-tmp-disk/run.sh: line 21:   519 Killed
>               ./runltp -s oom01 -I 100
>
> > ---
> >  fs/proc/base.c      | 11 ++++++++++-
> >  include/linux/oom.h |  4 ++--
> >  mm/oom_kill.c       | 22 ++++++++++------------
> >  3 files changed, 22 insertions(+), 15 deletions(-)
>
>
> Reference test jobs,
> [1] https://lkft.validation.linaro.org/scheduler/job/1558246#L9189
> [2] https://lkft.validation.linaro.org/scheduler/job/1558247#L17213
> [3] https://lkft.validation.linaro.org/scheduler/job/1558245#L1407

Thanks for the test, Naresh.

--=20
Thanks
Yafang
