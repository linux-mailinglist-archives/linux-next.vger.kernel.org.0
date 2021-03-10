Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4126933369B
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 08:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbhCJHtG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 02:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbhCJHsz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Mar 2021 02:48:55 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24958C061760
        for <linux-next@vger.kernel.org>; Tue,  9 Mar 2021 23:48:55 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id dx17so36599172ejb.2
        for <linux-next@vger.kernel.org>; Tue, 09 Mar 2021 23:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UYIAYFhn9jv5jndPR2ePIIH3j9f4IGqFq4xY6Rn35ck=;
        b=braAeI90Nb4I9UfvR7erd8SSxj9A/vwLm6IcYkkdG1V8lsbJfUXqxxNVPxmc1o2zD5
         USyRAFdzI2rzcYdxKTw36cbczuQyPUTpiyNmXacEQhRR/2f9JaBlI+w8quQrllcBespS
         e1eb1VJDP0R0U0TweLlfRbY6WqtAnRfwOL0zM4vPGXuKY+u/C8ivpxjjsc0PMnc4QkxF
         TgEK1Bg4dgHt6rGP/Z58bhy3XUGCU5HG56UTok8bezkvdLHj2xMFJ8NZxf9FX5bnFD4m
         kEEdyNinARJBnWD5V9I+tMJAm1t/HgRpNZbNBglhRIwxapMl7FqUbUGscWgAjojWh3e3
         h9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYIAYFhn9jv5jndPR2ePIIH3j9f4IGqFq4xY6Rn35ck=;
        b=YlKudGf62fKAOHWxj5wiRD4kLiGmk2p3CHVtz5G2OngfWwMSUlGHP/Vi4YfT77Bn0d
         wok5aBxhU/VQT3vYGN7XqFj7q9cFYxFGUUAmNrYeFRFq3iSmxOEJaJLt5B9cIbE5ugnb
         SkyoOg+Ikd7Im/wpY5D7/T/CMX4/+0y9gxCEDTc3FPl6EWjgP912N4d8PtXppmCNeKWm
         P4JtKvq5/8YhzPgNdb9dCjcDw5Y+hLqBKYhnzjEDQaqo4CGx6/whMOiMjm7dMqXnLfME
         A7nru+1bqDsyp/pAuPa3aDJdo0EJKj9SQ+sUT2Jv2G9/uRp0Zfx6LJXtbx/L4jwMz9tM
         um8Q==
X-Gm-Message-State: AOAM531dyF0uG55ctEi1/oL2H5RNEq/HygGvss0bApBJKR6lck+AsU8S
        qaWoOC7EwdStGCAJd4revJgmEniO/m9mGcE0/KaJykpGmtux4ffK
X-Google-Smtp-Source: ABdhPJzWLk1+GHbweU/Gu0GuvGkG0Dsq0G+OcfGNZanks6CE76sr07/IWmGLcJAyOtypC8yEDdCjY5TeBojPrD04G2o=
X-Received: by 2002:a17:906:229b:: with SMTP id p27mr2327796eja.287.1615362533619;
 Tue, 09 Mar 2021 23:48:53 -0800 (PST)
MIME-Version: 1.0
References: <20210218230633.15028-1-peterx@redhat.com> <20210218231202.15426-1-peterx@redhat.com>
In-Reply-To: <20210218231202.15426-1-peterx@redhat.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 10 Mar 2021 13:18:42 +0530
Message-ID: <CA+G9fYvyQ=9cZgGDNzN_PH09WRk0yu=5CDfa1mxPQ+uzfonnkg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] hugetlb/userfaultfd: Forbid huge pmd sharing when
 uffd enabled
To:     Peter Xu <peterx@redhat.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Peter,

On Fri, 19 Feb 2021 at 04:43, Peter Xu <peterx@redhat.com> wrote:
>
> Huge pmd sharing could bring problem to userfaultfd.  The thing is that
> userfaultfd is running its logic based on the special bits on page table
> entries, however the huge pmd sharing could potentially share page table
> entries for different address ranges.  That could cause issues on either:
>
>   - When sharing huge pmd page tables for an uffd write protected range, the
>     newly mapped huge pmd range will also be write protected unexpectedly, or,
>
>   - When we try to write protect a range of huge pmd shared range, we'll first
>     do huge_pmd_unshare() in hugetlb_change_protection(), however that also
>     means the UFFDIO_WRITEPROTECT could be silently skipped for the shared
>     region, which could lead to data loss.
>
> Since at it, a few other things are done altogether:
>
>   - Move want_pmd_share() from mm/hugetlb.c into linux/hugetlb.h, because
>     that's definitely something that arch code would like to use too
>
>   - ARM64 currently directly check against CONFIG_ARCH_WANT_HUGE_PMD_SHARE when
>     trying to share huge pmd.  Switch to the want_pmd_share() helper.
>
> Since at it, move vma_shareable() from huge_pmd_share() into want_pmd_share().
>
> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
> Reviewed-by: Axel Rasmussen <axelrasmussen@google.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/arm64/mm/hugetlbpage.c   |  3 +--
>  include/linux/hugetlb.h       |  2 ++
>  include/linux/userfaultfd_k.h |  9 +++++++++
>  mm/hugetlb.c                  | 20 ++++++++++++++------
>  4 files changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 6e3bcffe2837..58987a98e179 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -284,8 +284,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
>                  */
>                 ptep = pte_alloc_map(mm, pmdp, addr);
>         } else if (sz == PMD_SIZE) {
> -               if (IS_ENABLED(CONFIG_ARCH_WANT_HUGE_PMD_SHARE) &&
> -                   pud_none(READ_ONCE(*pudp)))
> +               if (want_pmd_share(vma, addr) && pud_none(READ_ONCE(*pudp)))

While building Linux next 20210310 tag for arm64 architecture with

  - CONFIG_ARM64_64K_PAGES=y

enabled the build failed due to below errors / warnings

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
aarch64-linux-gnu-ld: arch/arm64/mm/hugetlbpage.o: in function `huge_pte_alloc':
hugetlbpage.c:(.text+0x7d8): undefined reference to `want_pmd_share'

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Steps to reproduce:
----------------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch arm64 --toolchain gcc-9
--kconfig defconfig --kconfig-add
https://builds.tuxbuild.com/1pYCSoc1oGtPWlPgLAJxbHx07kL/config

Build link,
https://builds.tuxbuild.com/1pYCSoc1oGtPWlPgLAJxbHx07kL/


-- 
Linaro LKFT
https://lkft.linaro.org
