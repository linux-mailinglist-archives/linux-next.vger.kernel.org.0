Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA81820C687
	for <lists+linux-next@lfdr.de>; Sun, 28 Jun 2020 08:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgF1GyR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Jun 2020 02:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgF1GyR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Jun 2020 02:54:17 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D2AC061794;
        Sat, 27 Jun 2020 23:54:17 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id l63so6864034pge.12;
        Sat, 27 Jun 2020 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FMOl6q34ad5AqAY6wQLNmblE+0jubHB7WqyXMVxtOXg=;
        b=IXhN7eHVBo9OZc+9r6lalIEZKvuZU9pTrvBMMFsnWY+voy0meWsVwWAMaCv4Q/hUa9
         Drgeo73Ijcy3/WVsdBHvz+w5MR+dNbgfNIPJXcJD/Wo7p8n4l0mDKVpD/bgIW8zAlv2H
         o0YJjyLY9rxoN/62WBVoHjdXIw4qx2Qi7JGWR39SAkOp4WeEZvfE8xyGlpNw6xdyEB0l
         j/gD8TuZUqYtpL4vZEHUFV0OkVjF2fShDfFUHCWAld97N99SgK0s0+wiIpJtPLcOBmeO
         qddSaShUQq2AY3w+acAKyF94V2ztCgkx1LdwfbjeRMNYX3q3rzfY1WHpo7EWWLWjcRJK
         OMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FMOl6q34ad5AqAY6wQLNmblE+0jubHB7WqyXMVxtOXg=;
        b=W1/whoBAdPrDoe7xRIC2XDqDbjZvMog3ZZcyz/zS1ONYnBUsnSxVTDXvjSF/Hmafbs
         VWQ2QhzGF5LXCLU/gZBX2SxnpOh4HVw1J5VTG5RGOMbxgMPxZqMvRZufVMVGA4DjaD2X
         tECmmAxilT8/OdDApC0PvMWgOokviCRrU3lKAbMN72eihs8dKH4jgPmxD7qFBTgq+Rc6
         kPE9cg9pn5031GbP8qPvZlJ0rt+yaQvrWB9FssfZoi/N2a9LFccAzbTEGiv3o5nUZWog
         zyV9ldV6FFu6Jyi4dD6r/jk/wzvqW+XyyKe4yLjue1XyGfUyj5HNk3pyaQKgnvPS+p0x
         XY/g==
X-Gm-Message-State: AOAM531/NalcuKDRhH8Gali6RTMeky1mcXY6tnLjMgxvyO8B4tA54tYU
        1Rr/q1lapmNc03VRIesQaw==
X-Google-Smtp-Source: ABdhPJyDGLay3emEVvZbGXASX95zARUXQlGERv/x57JNEKNtX6GEDIjFLDByCdciFXP+Kq5PcjSkRQ==
X-Received: by 2002:a63:1c23:: with SMTP id c35mr5517961pgc.91.1593327254619;
        Sat, 27 Jun 2020 23:54:14 -0700 (PDT)
Received: from u2004 (h175-177-040-128.catv02.itscom.jp. [175.177.40.128])
        by smtp.gmail.com with ESMTPSA id i5sm29357103pfd.5.2020.06.27.23.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 23:54:14 -0700 (PDT)
Date:   Sun, 28 Jun 2020 15:54:09 +0900
From:   Naoya Horiguchi <nao.horiguchi@gmail.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>, cai@lca.pw,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>, osalvador@suse.de,
        Tony Luck <tony.luck@intel.com>, david@redhat.com,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        zeil@yandex-team.ru, naoya.horiguchi@nec.com,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v3 13/15] mm,hwpoison: Refactor soft_offline_huge_page
 and __soft_offline_page
Message-ID: <20200628065409.GA546944@u2004>
References: <20200624150137.7052-1-nao.horiguchi@gmail.com>
 <20200624150137.7052-14-nao.horiguchi@gmail.com>
 <CA+G9fYvopXWr+Y34xz2NVv17yeFs7fuKnJO_iUMnfCwaDNRXYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Disposition: inline
In-Reply-To: <CA+G9fYvopXWr+Y34xz2NVv17yeFs7fuKnJO_iUMnfCwaDNRXYg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 26, 2020 at 10:23:43PM +0530, Naresh Kamboju wrote:
> On Wed, 24 Jun 2020 at 20:32, <nao.horiguchi@gmail.com> wrote:
> >
> > From: Oscar Salvador <osalvador@suse.de>
> >
> > Merging soft_offline_huge_page and __soft_offline_page let us get rid of
> > quite some duplicated code, and makes the code much easier to follow.
> >
> > Now, __soft_offline_page will handle both normal and hugetlb pages.
> >
> > Note that move put_page() block to the beginning of page_handle_poison()
> > with drain_all_pages() in order to make sure that the target page is
> > freed and sent into free list to make take_page_off_buddy() work properly.
> >
> > Signed-off-by: Oscar Salvador <osalvador@suse.de>
> > Signed-off-by: Naoya Horiguchi <naoya.horiguchi@nec.com>
> > ---
> > ChangeLog v2 -> v3:
> > - use page_is_file_lru() instead of page_is_file_cache(),
> > - add description about put_page() and drain_all_pages().
> > - fix coding style warnings by checkpatch.pl
> > ---
> >  mm/memory-failure.c | 185 ++++++++++++++++++++------------------------
> >  1 file changed, 86 insertions(+), 99 deletions(-)
> >
> > diff --git v5.8-rc1-mmots-2020-06-20-21-44/mm/memory-failure.c v5.8-rc1-mmots-2020-06-20-21-44_patched/mm/memory-failure.c
> > index f744eb90c15c..22c904f6d17a 100644
> > --- v5.8-rc1-mmots-2020-06-20-21-44/mm/memory-failure.c
> > +++ v5.8-rc1-mmots-2020-06-20-21-44_patched/mm/memory-failure.c
> > @@ -78,14 +78,36 @@ EXPORT_SYMBOL_GPL(hwpoison_filter_dev_minor);
> >  EXPORT_SYMBOL_GPL(hwpoison_filter_flags_mask);
> >  EXPORT_SYMBOL_GPL(hwpoison_filter_flags_value);
> >
> > -static void page_handle_poison(struct page *page, bool release)
> > +static bool page_handle_poison(struct page *page, bool hugepage_or_freepage, bool release)
> >  {
> > +       if (release) {
> > +               put_page(page);
> > +               drain_all_pages(page_zone(page));
> > +       }
> > +
> > +       if (hugepage_or_freepage) {
> > +               /*
> > +                * Doing this check for free pages is also fine since dissolve_free_huge_page
> > +                * returns 0 for non-hugetlb pages as well.
> > +                */
> > +               if (dissolve_free_huge_page(page) || !take_page_off_buddy(page))
> > +               /*
> > +                * The hugetlb page can end up being enqueued back into
> > +                * the freelists by means of:
> > +                * unmap_and_move_huge_page
> > +                *  putback_active_hugepage
> > +                *   put_page->free_huge_page
> > +                *    enqueue_huge_page
> > +                * If this happens, we might lose the race against an allocation.
> > +                */
> > +                       return false;
> > +       }
> >
> >         SetPageHWPoison(page);
> > -       if (release)
> > -               put_page(page);
> >         page_ref_inc(page);
> >         num_poisoned_pages_inc();
> > +
> > +       return true;
> >  }
> >
> >  static int hwpoison_filter_dev(struct page *p)
> > @@ -1718,63 +1740,52 @@ static int get_any_page(struct page *page, unsigned long pfn)
> >         return ret;
> >  }
> >
> > -static int soft_offline_huge_page(struct page *page)
> > +static bool isolate_page(struct page *page, struct list_head *pagelist)
> >  {
> > -       int ret;
> > -       unsigned long pfn = page_to_pfn(page);
> > -       struct page *hpage = compound_head(page);
> > -       LIST_HEAD(pagelist);
> > +       bool isolated = false;
> > +       bool lru = PageLRU(page);
> > +
> > +       if (PageHuge(page)) {
> > +               isolated = isolate_huge_page(page, pagelist);
> > +       } else {
> > +               if (lru)
> > +                       isolated = !isolate_lru_page(page);
> > +               else
> > +                       isolated = !isolate_movable_page(page, ISOLATE_UNEVICTABLE);
> > +
> > +               if (isolated)
> > +                       list_add(&page->lru, pagelist);
> >
> > -       /*
> > -        * This double-check of PageHWPoison is to avoid the race with
> > -        * memory_failure(). See also comment in __soft_offline_page().
> > -        */
> > -       lock_page(hpage);
> > -       if (PageHWPoison(hpage)) {
> > -               unlock_page(hpage);
> > -               put_page(hpage);
> > -               pr_info("soft offline: %#lx hugepage already poisoned\n", pfn);
> > -               return -EBUSY;
> >         }
> > -       unlock_page(hpage);
> >
> > -       ret = isolate_huge_page(hpage, &pagelist);
> > +       if (isolated && lru)
> > +               inc_node_page_state(page, NR_ISOLATED_ANON +
> > +                                   page_is_file_lru(page));
> > +
> >         /*
> > -        * get_any_page() and isolate_huge_page() takes a refcount each,
> > -        * so need to drop one here.
> > +        * If we succeed to isolate the page, we grabbed another refcount on
> > +        * the page, so we can safely drop the one we got from get_any_pages().
> > +        * If we failed to isolate the page, it means that we cannot go further
> > +        * and we will return an error, so drop the reference we got from
> > +        * get_any_pages() as well.
> >          */
> > -       put_page(hpage);
> > -       if (!ret) {
> > -               pr_info("soft offline: %#lx hugepage failed to isolate\n", pfn);
> > -               return -EBUSY;
> > -       }
> > -
> > -       ret = migrate_pages(&pagelist, new_page, NULL, MPOL_MF_MOVE_ALL,
> > -                               MIGRATE_SYNC, MR_MEMORY_FAILURE);
> > -       if (ret) {
> > -               pr_info("soft offline: %#lx: hugepage migration failed %d, type %lx (%pGp)\n",
> > -                       pfn, ret, page->flags, &page->flags);
> > -               if (!list_empty(&pagelist))
> > -                       putback_movable_pages(&pagelist);
> > -               if (ret > 0)
> > -                       ret = -EIO;
> > -       } else {
> > -               /*
> > -                * We set PG_hwpoison only when we were able to take the page
> > -                * off the buddy.
> > -                */
> > -               if (!dissolve_free_huge_page(page) && take_page_off_buddy(page))
> > -                       page_handle_poison(page, false);
> > -               else
> > -                       ret = -EBUSY;
> > -       }
> > -       return ret;
> > +       put_page(page);
> > +       return isolated;
> >  }
> >
> > +/*
> > + * __soft_offline_page handles hugetlb-pages and non-hugetlb pages.
> > + * If the page is a non-dirty unmapped page-cache page, it simply invalidates.
> > + * If the page is mapped, it migrates the contents over.
> > + */
> >  static int __soft_offline_page(struct page *page)
> >  {
> > -       int ret;
> > +       int ret = 0;
> >         unsigned long pfn = page_to_pfn(page);
> > +       struct page *hpage = compound_head(page);
> > +       const char *msg_page[] = {"page", "hugepage"};
> > +       bool huge = PageHuge(page);
> > +       LIST_HEAD(pagelist);
> >
> >         /*
> >          * Check PageHWPoison again inside page lock because PageHWPoison
> > @@ -1783,98 +1794,74 @@ static int __soft_offline_page(struct page *page)
> >          * so there's no race between soft_offline_page() and memory_failure().
> >          */
> >         lock_page(page);
> > -       wait_on_page_writeback(page);
> > +       if (!PageHuge(page))
> > +               wait_on_page_writeback(page);
> >         if (PageHWPoison(page)) {
> >                 unlock_page(page);
> >                 put_page(page);
> >                 pr_info("soft offline: %#lx page already poisoned\n", pfn);
> >                 return -EBUSY;
> >         }
> > -       /*
> > -        * Try to invalidate first. This should work for
> > -        * non dirty unmapped page cache pages.
> > -        */
> > -       ret = invalidate_inode_page(page);
> > +
> > +       if (!PageHuge(page))
> > +               /*
> > +                * Try to invalidate first. This should work for
> > +                * non dirty unmapped page cache pages.
> > +                */
> > +               ret = invalidate_inode_page(page);
> >         unlock_page(page);
> > +
> >         /*
> >          * RED-PEN would be better to keep it isolated here, but we
> >          * would need to fix isolation locking first.
> >          */
> > -       if (ret == 1) {
> > +       if (ret) {
> >                 pr_info("soft_offline: %#lx: invalidated\n", pfn);
> > -               page_handle_poison(page, true);
> > +               page_handle_poison(page, false, true);
> 
> arm64 build failed on linux-next 20200626 tag
> 
> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu- HOSTCC=gcc CC="sccache
> aarch64-linux-gnu-gcc" O=build Image
> 79 #
> 80 ../mm/memory-failure.c: In function ‘__soft_offline_page’:
> 81 ../mm/memory-failure.c:1827:3: error: implicit declaration of
> function ‘page_handle_poison’; did you mean ‘page_init_poison’?
> [-Werror=implicit-function-declaration]
> 82  1827 | page_handle_poison(page, false, true);
> 83  | ^~~~~~~~~~~~~~~~~~
> 84  | page_init_poison

Thanks for reporting, Naresh, Qian Cai.

page_handle_poison() is now defined in #ifdef CONFIG_HWPOISON_INJECT block,
which is not correct because this function is used in non-injection code
path.  I'd like to move this function out of the block and it affects
multiple patches in this series, so maybe I have to update/resend the whole
series, but I like to wait for a few days for other reviews, so for quick
fix for linux-next I suggest the following one.

Andrew, could you append this diff on top of this series on mmotm?

Thanks,
Naoya Horiguchi
---
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index e90ddddab397..b49590bc5615 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -78,38 +78,6 @@ EXPORT_SYMBOL_GPL(hwpoison_filter_dev_minor);
 EXPORT_SYMBOL_GPL(hwpoison_filter_flags_mask);
 EXPORT_SYMBOL_GPL(hwpoison_filter_flags_value);
 
-static bool page_handle_poison(struct page *page, bool hugepage_or_freepage, bool release)
-{
-	if (release) {
-		put_page(page);
-		drain_all_pages(page_zone(page));
-	}
-
-	if (hugepage_or_freepage) {
-		/*
-		 * Doing this check for free pages is also fine since dissolve_free_huge_page
-		 * returns 0 for non-hugetlb pages as well.
-		 */
-		if (dissolve_free_huge_page(page) || !take_page_off_buddy(page))
-		/*
-		 * The hugetlb page can end up being enqueued back into
-		 * the freelists by means of:
-		 * unmap_and_move_huge_page
-		 *  putback_active_hugepage
-		 *   put_page->free_huge_page
-		 *    enqueue_huge_page
-		 * If this happens, we might lose the race against an allocation.
-		 */
-			return false;
-	}
-
-	SetPageHWPoison(page);
-	page_ref_inc(page);
-	num_poisoned_pages_inc();
-
-	return true;
-}
-
 static int hwpoison_filter_dev(struct page *p)
 {
 	struct address_space *mapping;
@@ -204,6 +172,38 @@ int hwpoison_filter(struct page *p)
 
 EXPORT_SYMBOL_GPL(hwpoison_filter);
 
+static bool page_handle_poison(struct page *page, bool hugepage_or_freepage, bool release)
+{
+	if (release) {
+		put_page(page);
+		drain_all_pages(page_zone(page));
+	}
+
+	if (hugepage_or_freepage) {
+		/*
+		 * Doing this check for free pages is also fine since dissolve_free_huge_page
+		 * returns 0 for non-hugetlb pages as well.
+		 */
+		if (dissolve_free_huge_page(page) || !take_page_off_buddy(page))
+		/*
+		 * The hugetlb page can end up being enqueued back into
+		 * the freelists by means of:
+		 * unmap_and_move_huge_page
+		 *  putback_active_hugepage
+		 *   put_page->free_huge_page
+		 *    enqueue_huge_page
+		 * If this happens, we might lose the race against an allocation.
+		 */
+			return false;
+	}
+
+	SetPageHWPoison(page);
+	page_ref_inc(page);
+	num_poisoned_pages_inc();
+
+	return true;
+}
+
 /*
  * Kill all processes that have a poisoned page mapped and then isolate
  * the page.
