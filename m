Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6B833442A
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 17:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233597AbhCJQ5h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 11:57:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31515 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233224AbhCJQ53 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Mar 2021 11:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615395448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sH8IQrZxuYeOUbLZE/57xl+lGLw/UXV3S3e87t66hh4=;
        b=NMeOJaMKltWohxFRfmQKtZHTODP/950Z/MK09WwS2KzHHtFvpdA22GSd23xwDhthm9KZW2
        9JLVQ6p6ibEXHZtH06CWvGb/N4pROHjg78LvlPRhRNDWIbUsBLkNxiT6O9rq2mhitl4got
        M6wmMzz0ei5IrYLhWHXlJmtkHE9NHtE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-VhH1cMBSM3SrL6wSOpvrog-1; Wed, 10 Mar 2021 11:57:16 -0500
X-MC-Unique: VhH1cMBSM3SrL6wSOpvrog-1
Received: by mail-qv1-f71.google.com with SMTP id iy2so13088909qvb.22
        for <linux-next@vger.kernel.org>; Wed, 10 Mar 2021 08:57:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sH8IQrZxuYeOUbLZE/57xl+lGLw/UXV3S3e87t66hh4=;
        b=eZyLujB/MOtGadsgppmku0/7tbnF9j3Qve9J0ySDDQtKuMHiNWNfyzgUtfbuyhglkD
         iN3mhNHnKK96XSdy1kWYAzPD0AX0bQGYgl7Vs5jnqKLUTyy5iLVaYsmlhdVEGZaJjeQH
         sXGpCGnrUc8cKD+i6AwEG2lMGbHuEowXjYUOtidgsvdOz1LXnbcorQQ8ihbgKYsEzwRg
         lidLsH2+xQ27GtwF1xxa9vxj+tLampiEniUk2NbkBGRBU5Y2M4zv72I8lWxYtb/j8gGT
         gWQCPRhGY57yXScqtW/c0M1ZUGbnO1lV4ns2jFpVAN+5MNRj+o8mjG98x5D6rm138X0K
         Loow==
X-Gm-Message-State: AOAM531AisyQ8cZnz1lZYDWSmVt9h8z8yBu5zFCEXXWoo2vNJ29yiurb
        LA6QdQ28XJ5UPbCqSIfljwTysKmh+LBwW5TcJ2MDe2dcgkvSU5LLlnWX8RB+ziN6l0dlPvDR8oJ
        kcEqScwdsLRYLdbxOXpzHKw==
X-Received: by 2002:ac8:4749:: with SMTP id k9mr2371971qtp.44.1615395435976;
        Wed, 10 Mar 2021 08:57:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3DSqfvNYFn7nY1WxbUtcI1yp3w27QNJwctoj81/6+xlgC0vsC2oq13zfz4EdeeuHAO5YHEQ==
X-Received: by 2002:ac8:4749:: with SMTP id k9mr2371950qtp.44.1615395435682;
        Wed, 10 Mar 2021 08:57:15 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
        by smtp.gmail.com with ESMTPSA id m21sm12908202qka.28.2021.03.10.08.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:57:15 -0800 (PST)
Date:   Wed, 10 Mar 2021 11:57:13 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
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
Subject: Re: [PATCH v4 2/4] hugetlb/userfaultfd: Forbid huge pmd sharing when
 uffd enabled
Message-ID: <20210310165713.GB6530@xz-x1>
References: <20210218230633.15028-1-peterx@redhat.com>
 <20210218231202.15426-1-peterx@redhat.com>
 <CA+G9fYvyQ=9cZgGDNzN_PH09WRk0yu=5CDfa1mxPQ+uzfonnkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <CA+G9fYvyQ=9cZgGDNzN_PH09WRk0yu=5CDfa1mxPQ+uzfonnkg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 10, 2021 at 01:18:42PM +0530, Naresh Kamboju wrote:
> Hi Peter,

Hi, Naresh,

> 
> On Fri, 19 Feb 2021 at 04:43, Peter Xu <peterx@redhat.com> wrote:
> >
> > Huge pmd sharing could bring problem to userfaultfd.  The thing is that
> > userfaultfd is running its logic based on the special bits on page table
> > entries, however the huge pmd sharing could potentially share page table
> > entries for different address ranges.  That could cause issues on either:
> >
> >   - When sharing huge pmd page tables for an uffd write protected range, the
> >     newly mapped huge pmd range will also be write protected unexpectedly, or,
> >
> >   - When we try to write protect a range of huge pmd shared range, we'll first
> >     do huge_pmd_unshare() in hugetlb_change_protection(), however that also
> >     means the UFFDIO_WRITEPROTECT could be silently skipped for the shared
> >     region, which could lead to data loss.
> >
> > Since at it, a few other things are done altogether:
> >
> >   - Move want_pmd_share() from mm/hugetlb.c into linux/hugetlb.h, because
> >     that's definitely something that arch code would like to use too
> >
> >   - ARM64 currently directly check against CONFIG_ARCH_WANT_HUGE_PMD_SHARE when
> >     trying to share huge pmd.  Switch to the want_pmd_share() helper.
> >
> > Since at it, move vma_shareable() from huge_pmd_share() into want_pmd_share().
> >
> > Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
> > Reviewed-by: Axel Rasmussen <axelrasmussen@google.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  arch/arm64/mm/hugetlbpage.c   |  3 +--
> >  include/linux/hugetlb.h       |  2 ++
> >  include/linux/userfaultfd_k.h |  9 +++++++++
> >  mm/hugetlb.c                  | 20 ++++++++++++++------
> >  4 files changed, 26 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> > index 6e3bcffe2837..58987a98e179 100644
> > --- a/arch/arm64/mm/hugetlbpage.c
> > +++ b/arch/arm64/mm/hugetlbpage.c
> > @@ -284,8 +284,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> >                  */
> >                 ptep = pte_alloc_map(mm, pmdp, addr);
> >         } else if (sz == PMD_SIZE) {
> > -               if (IS_ENABLED(CONFIG_ARCH_WANT_HUGE_PMD_SHARE) &&
> > -                   pud_none(READ_ONCE(*pudp)))
> > +               if (want_pmd_share(vma, addr) && pud_none(READ_ONCE(*pudp)))
> 
> While building Linux next 20210310 tag for arm64 architecture with
> 
>   - CONFIG_ARM64_64K_PAGES=y
> 
> enabled the build failed due to below errors / warnings
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
> aarch64-linux-gnu-ld: arch/arm64/mm/hugetlbpage.o: in function `huge_pte_alloc':
> hugetlbpage.c:(.text+0x7d8): undefined reference to `want_pmd_share'
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Sorry for the issue & thanks for the report.  Would you please check whether
the patch attached could fix the issue?

-- 
Peter Xu

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-mm-hugetlb-Fix-build-with-ARCH_WANT_HUGE_PMD_SHARE.patch"

From 4072042b415d1f78ac1ab017671e345b414ca6ab Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Wed, 10 Mar 2021 11:48:56 -0500
Subject: [PATCH] mm/hugetlb: Fix build with !ARCH_WANT_HUGE_PMD_SHARE

want_pmd_share() is undefined with !ARCH_WANT_HUGE_PMD_SHARE since it's put
by accident into a "#ifdef ARCH_WANT_HUGE_PMD_SHARE" block.  Moving it out
won't work either since vma_shareable() is only defined within the block.
Define it for !ARCH_WANT_HUGE_PMD_SHARE instead.

Fixes: 5b109cc1cdcc ("hugetlb/userfaultfd: forbid huge pmd sharing when uffd enabled")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Axel Rasmussen <axelrasmussen@google.com>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hugetlb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d58f1456fe27..8dda7e034477 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5469,9 +5469,6 @@ static bool vma_shareable(struct vm_area_struct *vma, unsigned long addr)
 
 bool want_pmd_share(struct vm_area_struct *vma, unsigned long addr)
 {
-#ifndef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
-	return false;
-#endif
 #ifdef CONFIG_USERFAULTFD
 	if (uffd_disable_huge_pmd_share(vma))
 		return false;
@@ -5616,6 +5613,11 @@ void adjust_range_if_pmd_sharing_possible(struct vm_area_struct *vma,
 				unsigned long *start, unsigned long *end)
 {
 }
+
+bool want_pmd_share(struct vm_area_struct *vma, unsigned long addr)
+{
+	return false;
+}
 #endif /* CONFIG_ARCH_WANT_HUGE_PMD_SHARE */
 
 #ifdef CONFIG_ARCH_WANT_GENERAL_HUGETLB
-- 
2.26.2


--tKW2IUtsqtDRztdT--

