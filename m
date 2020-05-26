Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF74B1DBC27
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 20:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgETSAD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 14:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgETSAC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 14:00:02 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F96EC08C5C1
        for <linux-next@vger.kernel.org>; Wed, 20 May 2020 11:00:02 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z6so4829597ljm.13
        for <linux-next@vger.kernel.org>; Wed, 20 May 2020 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtpCTLjeaytdekB4adxVz/e/JZwQHur4soi/tkekgkg=;
        b=RwL7kSM3fz9MR6t5Ar2hYTR0dC+a68qyUw6+z9033WeXCAUoxY8PEL7x2rcKx9bIWT
         l6A08Wjxs5sPfZMw5X09MFSUjE1qHLWgyYHW8VFFkTznN60/pkdMAWpnger7o85A8dVP
         qTXxWNl+c9c6DyvNDvC0ebMsh3xbuJUKuQ8Rz44tF4eOqCus/XLjH8vxAcgNxnvE6ECD
         vDEUVjfrmmgeklu12ukdEkM3ps7/O48UUdbhbzh08v+evhakhTrUIyOdzD4cM7odKyc2
         jWOem0ysPrATgUJg9nMtB+WUY+Ngyots1DIicBIYLP8IlhqZc/3YjYx7aeu0g0fnDMxE
         4bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtpCTLjeaytdekB4adxVz/e/JZwQHur4soi/tkekgkg=;
        b=gnWcaO1l07SHH1yWV5442z6Z033hEaQK9q83lSUaSo+rZWqfl+hGfR+4w30WjE/Mh1
         IgeqJ2BkgMAEfuYKBO2cLaiNgfWBxDJXsSscX/N7ezgoXi3W091beDscciJ1ZbFmm757
         Hr3mfkHGsHP3CxkYc8QP5jg8Jp3YwPPojKUgd1kpoJpvLpafE4JQUnlHB/ldtnXlEOfF
         CGtcVe51N8WTZuCnV0VC/O7Famr1jzVKkvyTZ1SvhC3BTK5U3GDBdAKjy5C4koIofhcn
         dpXcVEVNbYeF2+yyQyXl+tDbC8PbHYwSQJH+8Vuay0M9GEm2quAc0dWcdDS2sEj/C8Ni
         zTiA==
X-Gm-Message-State: AOAM530GarSl05yAhgwG3mvBuzvR/Ww+QLacoqP6HH9P+qyVgvWyEIas
        FtH1riv4A3t6MUqfN6qKzJad5rsZXjb9LeW2FIP7bQ==
X-Google-Smtp-Source: ABdhPJxMVT2aazzajf86PZFdGt2E7whHDnP+nICKDm4NC6feIw0z4SprtT2do+git6kUcT4Xo3qaJQi4N/SBczqLtpU=
X-Received: by 2002:a2e:3012:: with SMTP id w18mr3286415ljw.55.1589997600706;
 Wed, 20 May 2020 11:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz> <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz> <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
In-Reply-To: <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 20 May 2020 23:29:49 +0530
Message-ID: <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
Subject: Re: mm: mkfs.ext4 invoked oom-killer on i386 - pagecache_get_page
To:     Chris Down <chris@chrisdown.name>,
        Yafang Shao <laoar.shao@gmail.com>,
        Michal Hocko <mhocko@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>
Cc:     "Linux F2FS DEV, Mailing List" 
        <linux-f2fs-devel@lists.sourceforge.net>,
        linux-ext4 <linux-ext4@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, Arnd Bergmann <arnd@arndb.de>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>, Chao Yu <chao@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Chao Yu <yuchao0@huawei.com>, lkft-triage@lists.linaro.org,
        Johannes Weiner <hannes@cmpxchg.org>,
        Roman Gushchin <guro@fb.com>, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 20 May 2020 at 17:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
>
> This issue is specific on 32-bit architectures i386 and arm on linux-next tree.
> As per the test results history this problem started happening from
> Bad : next-20200430
> Good : next-20200429
>
> steps to reproduce:
> dd if=/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190504A00573
> of=/dev/null bs=1M count=2048
> or
> mkfs -t ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190804A00BE5
>
>
> Problem:
> [   38.802375] dd invoked oom-killer: gfp_mask=0x100cc0(GFP_USER),
> order=0, oom_score_adj=0

As a part of investigation on this issue LKFT teammate Anders Roxell
git bisected the problem and found bad commit(s) which caused this problem.

The following two patches have been reverted on next-20200519 and retested the
reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
( invoked oom-killer is gone now)

Revert "mm, memcg: avoid stale protection values when cgroup is above
protection"
    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.

Revert "mm, memcg: decouple e{low,min} state mutations from protection
checks"
    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.

i386 test log shows mkfs -t ext4 pass
https://lkft.validation.linaro.org/scheduler/job/1443405#L1200

ref:
https://lore.kernel.org/linux-mm/cover.1588092152.git.chris@chrisdown.name/
https://lore.kernel.org/linux-mm/CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com/T/#t

-- 
Linaro LKFT
https://lkft.linaro.org
