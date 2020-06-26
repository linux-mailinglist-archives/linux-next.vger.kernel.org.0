Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8369620B656
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 18:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgFZQx5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 12:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgFZQx5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 12:53:57 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDF8C03E979
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 09:53:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s9so11010418ljm.11
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BpcAKrRR2y1hN2RPj8C5fND99mRqbVolDfMZWPUBdwA=;
        b=d3SYiHENtF3ykdK56P0W+0m1QsPiVrdi67hmOjt0l5BLep5HO+okxPgtyJnsl1KaSO
         lwrHJEYHubGRXVb0G++Pxlr+TeSoUXIldte1yU61Oo9K2AwSYSX1Deilq9PEk/KFbiiR
         xES6CO5MP7zsU1FHo9e1lRvneYDXmkgwBruwa2eaEVls3nXlP+nl7P9Pxm72hXzraXK0
         vWm6CdwEP3LztMwMR9iNEf1WJuQ8LOoAhpnFfKVXQGr9aOZAW0hJAIfwzAuRlMmSK/Eg
         lUHWdQRKkQh7VIrhwW2/PyPgvICvd913JPFUUMENXBBW1C05lC+CJr+J7DgmBdf15E+i
         g7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BpcAKrRR2y1hN2RPj8C5fND99mRqbVolDfMZWPUBdwA=;
        b=FIiM7m5whEivEmcPZ01jXrUyR8EhXbqG1gQsuz7RL3nI9XHdmsPk+OwUgvcBxA2CUO
         V+vDSoCEiUdWWmqF/ERqCpnrjaW0oh1TOh/reHIeCJWQjLdIfXnO5bBPSaNqONcw8Amc
         lXk45iSvEaEWMvVLRFbyubh7RlGUZxtLo0xLA248lCn089Hv6oyhLhRoGK7RGi3UYW1v
         QXfHOUaiCVC2i/OTx6AmB8eZnawUrnfsRT+iZktM/p8VxHaPpkxwM+X8oy/zG7KKKSwD
         i9J9Ya5I6vkERoMq208veDjd7e8dHKeIJGL3n9mPqwducC7XHJOClrI4JuuEEqFnjp1M
         Jocw==
X-Gm-Message-State: AOAM530NdjNECmOSyYWybMA6tzG3JTFEYeX+XFmNFy3Jl8/3hTm/ChWo
        6ZQnvFVZ+YfuXkJRgBUJ0HBx51QjtYLg/m7PuOEUBg==
X-Google-Smtp-Source: ABdhPJwyQamuTnCkxPEam1v0ezyq0r+KR7ADlZ2peLxqhQ1vshyAMXp+dXBWIy8KwlZfY7djnFu1cR+KcdxRSk8BGgc=
X-Received: by 2002:a2e:9116:: with SMTP id m22mr1896930ljg.431.1593190434899;
 Fri, 26 Jun 2020 09:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200624150137.7052-1-nao.horiguchi@gmail.com> <20200624150137.7052-14-nao.horiguchi@gmail.com>
In-Reply-To: <20200624150137.7052-14-nao.horiguchi@gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 26 Jun 2020 22:23:43 +0530
Message-ID: <CA+G9fYvopXWr+Y34xz2NVv17yeFs7fuKnJO_iUMnfCwaDNRXYg@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] mm,hwpoison: Refactor soft_offline_huge_page and __soft_offline_page
To:     nao.horiguchi@gmail.com
Cc:     linux-mm <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>, osalvador@suse.de,
        Tony Luck <tony.luck@intel.com>, david@redhat.com,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        zeil@yandex-team.ru, naoya.horiguchi@nec.com,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 24 Jun 2020 at 20:32, <nao.horiguchi@gmail.com> wrote:
>
> From: Oscar Salvador <osalvador@suse.de>
>
> Merging soft_offline_huge_page and __soft_offline_page let us get rid of
> quite some duplicated code, and makes the code much easier to follow.
>
> Now, __soft_offline_page will handle both normal and hugetlb pages.
>
> Note that move put_page() block to the beginning of page_handle_poison()
> with drain_all_pages() in order to make sure that the target page is
> freed and sent into free list to make take_page_off_buddy() work properly=
.
>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Naoya Horiguchi <naoya.horiguchi@nec.com>
> ---
> ChangeLog v2 -> v3:
> - use page_is_file_lru() instead of page_is_file_cache(),
> - add description about put_page() and drain_all_pages().
> - fix coding style warnings by checkpatch.pl
> ---
>  mm/memory-failure.c | 185 ++++++++++++++++++++------------------------
>  1 file changed, 86 insertions(+), 99 deletions(-)
>
> diff --git v5.8-rc1-mmots-2020-06-20-21-44/mm/memory-failure.c v5.8-rc1-m=
mots-2020-06-20-21-44_patched/mm/memory-failure.c
> index f744eb90c15c..22c904f6d17a 100644
> --- v5.8-rc1-mmots-2020-06-20-21-44/mm/memory-failure.c
> +++ v5.8-rc1-mmots-2020-06-20-21-44_patched/mm/memory-failure.c
> @@ -78,14 +78,36 @@ EXPORT_SYMBOL_GPL(hwpoison_filter_dev_minor);
>  EXPORT_SYMBOL_GPL(hwpoison_filter_flags_mask);
>  EXPORT_SYMBOL_GPL(hwpoison_filter_flags_value);
>
> -static void page_handle_poison(struct page *page, bool release)
> +static bool page_handle_poison(struct page *page, bool hugepage_or_freep=
age, bool release)
>  {
> +       if (release) {
> +               put_page(page);
> +               drain_all_pages(page_zone(page));
> +       }
> +
> +       if (hugepage_or_freepage) {
> +               /*
> +                * Doing this check for free pages is also fine since dis=
solve_free_huge_page
> +                * returns 0 for non-hugetlb pages as well.
> +                */
> +               if (dissolve_free_huge_page(page) || !take_page_off_buddy=
(page))
> +               /*
> +                * The hugetlb page can end up being enqueued back into
> +                * the freelists by means of:
> +                * unmap_and_move_huge_page
> +                *  putback_active_hugepage
> +                *   put_page->free_huge_page
> +                *    enqueue_huge_page
> +                * If this happens, we might lose the race against an all=
ocation.
> +                */
> +                       return false;
> +       }
>
>         SetPageHWPoison(page);
> -       if (release)
> -               put_page(page);
>         page_ref_inc(page);
>         num_poisoned_pages_inc();
> +
> +       return true;
>  }
>
>  static int hwpoison_filter_dev(struct page *p)
> @@ -1718,63 +1740,52 @@ static int get_any_page(struct page *page, unsign=
ed long pfn)
>         return ret;
>  }
>
> -static int soft_offline_huge_page(struct page *page)
> +static bool isolate_page(struct page *page, struct list_head *pagelist)
>  {
> -       int ret;
> -       unsigned long pfn =3D page_to_pfn(page);
> -       struct page *hpage =3D compound_head(page);
> -       LIST_HEAD(pagelist);
> +       bool isolated =3D false;
> +       bool lru =3D PageLRU(page);
> +
> +       if (PageHuge(page)) {
> +               isolated =3D isolate_huge_page(page, pagelist);
> +       } else {
> +               if (lru)
> +                       isolated =3D !isolate_lru_page(page);
> +               else
> +                       isolated =3D !isolate_movable_page(page, ISOLATE_=
UNEVICTABLE);
> +
> +               if (isolated)
> +                       list_add(&page->lru, pagelist);
>
> -       /*
> -        * This double-check of PageHWPoison is to avoid the race with
> -        * memory_failure(). See also comment in __soft_offline_page().
> -        */
> -       lock_page(hpage);
> -       if (PageHWPoison(hpage)) {
> -               unlock_page(hpage);
> -               put_page(hpage);
> -               pr_info("soft offline: %#lx hugepage already poisoned\n",=
 pfn);
> -               return -EBUSY;
>         }
> -       unlock_page(hpage);
>
> -       ret =3D isolate_huge_page(hpage, &pagelist);
> +       if (isolated && lru)
> +               inc_node_page_state(page, NR_ISOLATED_ANON +
> +                                   page_is_file_lru(page));
> +
>         /*
> -        * get_any_page() and isolate_huge_page() takes a refcount each,
> -        * so need to drop one here.
> +        * If we succeed to isolate the page, we grabbed another refcount=
 on
> +        * the page, so we can safely drop the one we got from get_any_pa=
ges().
> +        * If we failed to isolate the page, it means that we cannot go f=
urther
> +        * and we will return an error, so drop the reference we got from
> +        * get_any_pages() as well.
>          */
> -       put_page(hpage);
> -       if (!ret) {
> -               pr_info("soft offline: %#lx hugepage failed to isolate\n"=
, pfn);
> -               return -EBUSY;
> -       }
> -
> -       ret =3D migrate_pages(&pagelist, new_page, NULL, MPOL_MF_MOVE_ALL=
,
> -                               MIGRATE_SYNC, MR_MEMORY_FAILURE);
> -       if (ret) {
> -               pr_info("soft offline: %#lx: hugepage migration failed %d=
, type %lx (%pGp)\n",
> -                       pfn, ret, page->flags, &page->flags);
> -               if (!list_empty(&pagelist))
> -                       putback_movable_pages(&pagelist);
> -               if (ret > 0)
> -                       ret =3D -EIO;
> -       } else {
> -               /*
> -                * We set PG_hwpoison only when we were able to take the =
page
> -                * off the buddy.
> -                */
> -               if (!dissolve_free_huge_page(page) && take_page_off_buddy=
(page))
> -                       page_handle_poison(page, false);
> -               else
> -                       ret =3D -EBUSY;
> -       }
> -       return ret;
> +       put_page(page);
> +       return isolated;
>  }
>
> +/*
> + * __soft_offline_page handles hugetlb-pages and non-hugetlb pages.
> + * If the page is a non-dirty unmapped page-cache page, it simply invali=
dates.
> + * If the page is mapped, it migrates the contents over.
> + */
>  static int __soft_offline_page(struct page *page)
>  {
> -       int ret;
> +       int ret =3D 0;
>         unsigned long pfn =3D page_to_pfn(page);
> +       struct page *hpage =3D compound_head(page);
> +       const char *msg_page[] =3D {"page", "hugepage"};
> +       bool huge =3D PageHuge(page);
> +       LIST_HEAD(pagelist);
>
>         /*
>          * Check PageHWPoison again inside page lock because PageHWPoison
> @@ -1783,98 +1794,74 @@ static int __soft_offline_page(struct page *page)
>          * so there's no race between soft_offline_page() and memory_fail=
ure().
>          */
>         lock_page(page);
> -       wait_on_page_writeback(page);
> +       if (!PageHuge(page))
> +               wait_on_page_writeback(page);
>         if (PageHWPoison(page)) {
>                 unlock_page(page);
>                 put_page(page);
>                 pr_info("soft offline: %#lx page already poisoned\n", pfn=
);
>                 return -EBUSY;
>         }
> -       /*
> -        * Try to invalidate first. This should work for
> -        * non dirty unmapped page cache pages.
> -        */
> -       ret =3D invalidate_inode_page(page);
> +
> +       if (!PageHuge(page))
> +               /*
> +                * Try to invalidate first. This should work for
> +                * non dirty unmapped page cache pages.
> +                */
> +               ret =3D invalidate_inode_page(page);
>         unlock_page(page);
> +
>         /*
>          * RED-PEN would be better to keep it isolated here, but we
>          * would need to fix isolation locking first.
>          */
> -       if (ret =3D=3D 1) {
> +       if (ret) {
>                 pr_info("soft_offline: %#lx: invalidated\n", pfn);
> -               page_handle_poison(page, true);
> +               page_handle_poison(page, false, true);

arm64 build failed on linux-next 20200626 tag

make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Darm64
CROSS_COMPILE=3Daarch64-linux-gnu- HOSTCC=3Dgcc CC=3D"sccache
aarch64-linux-gnu-gcc" O=3Dbuild Image
79 #
80 ../mm/memory-failure.c: In function =E2=80=98__soft_offline_page=E2=80=
=99:
81 ../mm/memory-failure.c:1827:3: error: implicit declaration of
function =E2=80=98page_handle_poison=E2=80=99; did you mean =E2=80=98page_i=
nit_poison=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
82  1827 | page_handle_poison(page, false, true);
83  | ^~~~~~~~~~~~~~~~~~
84  | page_init_poison


--=20
Linaro LKFT
https://lkft.linaro.org
