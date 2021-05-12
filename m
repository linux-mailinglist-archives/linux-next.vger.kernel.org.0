Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B9F37B99F
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 11:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhELJvU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 05:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhELJvR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 05:51:17 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C5F0C06174A
        for <linux-next@vger.kernel.org>; Wed, 12 May 2021 02:50:09 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id t4so34129731ejo.0
        for <linux-next@vger.kernel.org>; Wed, 12 May 2021 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GUt7kPgBJMN4yeVeOkrnQPhryLYrZDgrYjGs4lAolt0=;
        b=ny8mv3++m4i3B4RuxmYCDHFPZlicowKuAS8DYTUdpV+/w8b0YH+X604s0wwq/lCGyb
         DR8eoBJ0erFDUQLA3OXISUEEsuXm3Qn6YXjhTCR9ohPlny+kEmsvNAJoH0I2u/byDzPQ
         1cSY5VjBECxKDVWnjy9nRoKB4cnb29GlY8tXoxiWTo+fai6eDqa8D5TiL7FfFE8tXE9c
         nbVvECz0MehXQkRQYmIoF6PlwprkF+LxUuReOEYb8HjkkxGSEMycPm1A2QSUSFSmusdu
         gDaoqJ4t9oDulXcRivGVbe7vO3W2gkOmCqV6bOi2QPctaaIzFy3z8GZpXikvFW9XOCcy
         isrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GUt7kPgBJMN4yeVeOkrnQPhryLYrZDgrYjGs4lAolt0=;
        b=CAYE8PM+WhPrg5+Ff1eJoyGPR0W8Pi3KZv47rFG8550rC9M9bOH6wmnA3o7LFwtEjw
         DE4xVFiEoCH7zjWyyDC9AY65xt3rrYc2qX2G9CO2OVz4Led15a2z8UxHEBYJiuiUhtfs
         pdmbaVvnxno8admUtXoK9yeGMIj9xl0Haua8xJt8tc7UOSWsdBdvtxKkNpq5f48RdutJ
         DV9kpy/4hZ5/RzuLsglo5QPTcPzMSiZzKXq4A9XgYo+CrllJ1IFcjaRZNK4dPaJaKyn+
         kP1+h1CIFFjm2hVytGeN+JLqWyuf+50N4aehBG76lkYCZvIF5xCbCpdq3cus5MGRDMFX
         DY1g==
X-Gm-Message-State: AOAM53147zlVxmCTtdfhtNssJhzMtG3h2GgWAWN9wAEoedNigWzn28Fb
        O9tCW9WiC55d/h1jWk4iA15BbOLyGtEWytIbW4Nt6A==
X-Google-Smtp-Source: ABdhPJycczh8p/R6rx9xEBWFUyXO2Fgq/he1OuYyct0gYcV96QiIqDD7coLQ1IQIpCvWW6ASdZG4MS0Qqsy1mLrWMbc=
X-Received: by 2002:a17:906:85da:: with SMTP id i26mr37086650ejy.287.1620813008025;
 Wed, 12 May 2021 02:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210507150553.208763-1-peterx@redhat.com> <20210507150553.208763-4-peterx@redhat.com>
In-Reply-To: <20210507150553.208763-4-peterx@redhat.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 12 May 2021 15:19:55 +0530
Message-ID: <CA+G9fYswoAtwh=m1pakV2fB7w3Aq-emvLSCU+b_OhxyqV0Ybsg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm: gup: pack has_pinned in MMF_HAS_PINNED
To:     Peter Xu <peterx@redhat.com>, linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Jan Kara <jack@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Kirill Shutemov <kirill@shutemov.name>,
        Oleg Nesterov <oleg@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jann Horn <jannh@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        Hugh Dickins <hughd@google.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 7 May 2021 at 20:36, Peter Xu <peterx@redhat.com> wrote:
>
> From: Andrea Arcangeli <aarcange@redhat.com>
>
> has_pinned 32bit can be packed in the MMF_HAS_PINNED bit as a noop
> cleanup.
>
> Any atomic_inc/dec to the mm cacheline shared by all threads in
> pin-fast would reintroduce a loss of SMP scalability to pin-fast, so
> there's no future potential usefulness to keep an atomic in the mm for
> this.
>
> set_bit(MMF_HAS_PINNED) will be theoretically a bit slower than
> WRITE_ONCE (atomic_set is equivalent to WRITE_ONCE), but the set_bit
> (just like atomic_set after this commit) has to be still issued only
> once per "mm", so the difference between the two will be lost in the
> noise.
>
> will-it-scale "mmap2" shows no change in performance with enterprise
> config as expected.
>
> will-it-scale "pin_fast" retains the > 4000% SMP scalability
> performance improvement against upstream as expected.
>
> This is a noop as far as overall performance and SMP scalability are
> concerned.
>
> Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
> [peterx: Fix build for task_mmu.c, introduce mm_set_has_pinned_flag, fix
>  comment here and there]
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  fs/proc/task_mmu.c             |  2 +-
>  include/linux/mm.h             |  2 +-
>  include/linux/mm_types.h       | 10 ----------
>  include/linux/sched/coredump.h |  8 ++++++++
>  kernel/fork.c                  |  1 -
>  mm/gup.c                       | 19 +++++++++++++++----
>  6 files changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 4c95cc57a66a8..6144571942db9 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1049,7 +1049,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
>                 return false;
>         if (!is_cow_mapping(vma->vm_flags))
>                 return false;
> -       if (likely(!atomic_read(&vma->vm_mm->has_pinned)))
> +       if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
>                 return false;
>         page = vm_normal_page(vma, addr, pte);
>         if (!page)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d6790ab0cf575..94dc84f6d8658 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1331,7 +1331,7 @@ static inline bool page_needs_cow_for_dma(struct vm_area_struct *vma,
>         if (!is_cow_mapping(vma->vm_flags))
>                 return false;
>
> -       if (!atomic_read(&vma->vm_mm->has_pinned))
> +       if (!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags))
>                 return false;
>
>         return page_maybe_dma_pinned(page);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6613b26a88946..15d79858fadbd 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -435,16 +435,6 @@ struct mm_struct {
>                  */
>                 atomic_t mm_count;
>
> -               /**
> -                * @has_pinned: Whether this mm has pinned any pages.  This can
> -                * be either replaced in the future by @pinned_vm when it
> -                * becomes stable, or grow into a counter on its own. We're
> -                * aggresive on this bit now - even if the pinned pages were
> -                * unpinned later on, we'll still keep this bit set for the
> -                * lifecycle of this mm just for simplicity.
> -                */
> -               atomic_t has_pinned;
> -
>                 /**
>                  * @write_protect_seq: Locked when any thread is write
>                  * protecting pages mapped by this mm to enforce a later COW,
> diff --git a/include/linux/sched/coredump.h b/include/linux/sched/coredump.h
> index dfd82eab29025..4d9e3a6568758 100644
> --- a/include/linux/sched/coredump.h
> +++ b/include/linux/sched/coredump.h
> @@ -73,6 +73,14 @@ static inline int get_dumpable(struct mm_struct *mm)
>  #define MMF_OOM_VICTIM         25      /* mm is the oom victim */
>  #define MMF_OOM_REAP_QUEUED    26      /* mm was queued for oom_reaper */
>  #define MMF_MULTIPROCESS       27      /* mm is shared between processes */
> +/*
> + * MMF_HAS_PINNED: Whether this mm has pinned any pages.  This can be either
> + * replaced in the future by mm.pinned_vm when it becomes stable, or grow into
> + * a counter on its own. We're aggresive on this bit for now: even if the
> + * pinned pages were unpinned later on, we'll still keep this bit set for the
> + * lifecycle of this mm, just for simplicity.
> + */
> +#define MMF_HAS_PINNED         28      /* FOLL_PIN has run, never cleared */
>  #define MMF_DISABLE_THP_MASK   (1 << MMF_DISABLE_THP)
>
>  #define MMF_INIT_MASK          (MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 502dc046fbc62..a71e73707ef59 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -1026,7 +1026,6 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>         mm_pgtables_bytes_init(mm);
>         mm->map_count = 0;
>         mm->locked_vm = 0;
> -       atomic_set(&mm->has_pinned, 0);
>         atomic64_set(&mm->pinned_vm, 0);
>         memset(&mm->rss_stat, 0, sizeof(mm->rss_stat));
>         spin_lock_init(&mm->page_table_lock);
> diff --git a/mm/gup.c b/mm/gup.c
> index 9933bc5c2eff2..bb130723a6717 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1270,6 +1270,17 @@ int fixup_user_fault(struct mm_struct *mm,
>  }
>  EXPORT_SYMBOL_GPL(fixup_user_fault);
>
> +/*
> + * Set the MMF_HAS_PINNED if not set yet; after set it'll be there for the mm's
> + * lifecycle.  Avoid setting the bit unless necessary, or it might cause write
> + * cache bouncing on large SMP machines for concurrent pinned gups.
> + */
> +static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
> +{
> +       if (!test_bit(MMF_HAS_PINNED, mm_flags))
> +               set_bit(MMF_HAS_PINNED, mm_flags);
> +}
> +
>  /*
>   * Please note that this function, unlike __get_user_pages will not
>   * return 0 for nr_pages > 0 without FOLL_NOWAIT
> @@ -1292,8 +1303,8 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>                 BUG_ON(*locked != 1);
>         }
>
> -       if ((flags & FOLL_PIN) && !atomic_read(&mm->has_pinned))
> -               atomic_set(&mm->has_pinned, 1);
> +       if (flags & FOLL_PIN)
> +               mm_set_has_pinned_flag(&mm->flags);
>
>         /*
>          * FOLL_PIN and FOLL_GET are mutually exclusive. Traditional behavior
> @@ -2617,8 +2628,8 @@ static int internal_get_user_pages_fast(unsigned long start,
>                                        FOLL_FAST_ONLY)))
>                 return -EINVAL;
>
> -       if ((gup_flags & FOLL_PIN) && !atomic_read(&current->mm->has_pinned))
> -               atomic_set(&current->mm->has_pinned, 1);
> +       if (gup_flags & FOLL_PIN)
> +               mm_set_has_pinned_flag(&current->mm->flags);

Linux next tag next-20210512 builds failed on arm, riscv, mips and sh
for the tinyconfig and allnoconfig due this patch.

 arm, mips, riscv and sh (tinyconfig) with gcc-8
 arm, mips, riscv and sh (allnoconfig) with gcc-8
 arm, mips, riscv and sh (tinyconfig) with gcc-9
 arm, mips, riscv and sh (allnoconfig) with gcc-9
 arm, mips, riscv and sh (tinyconfig) with gcc-10
 arm, mips, riscv and sh (allnoconfig) with gcc-10

mm/gup.c: In function 'internal_get_user_pages_fast':
mm/gup.c:2698:3: error: implicit declaration of function
'mm_set_has_pinned_flag' [-Werror=implicit-function-declaration]
 2698 |   mm_set_has_pinned_flag(&current->mm->flags);
      |   ^~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [/builds/linux/scripts/Makefile.build:273: mm/gup.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

#regzb introduced: 354a2e3604e2 ("mm: gup: pack has_pinned in MMF_HAS_PINNED")

Build url:
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/1255567072#L315

--
Linaro LKFT
https://lkft.linaro.org
