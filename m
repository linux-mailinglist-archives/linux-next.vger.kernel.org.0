Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D3B401ECF
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 18:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240212AbhIFQ5c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 12:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233888AbhIFQ5b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 12:57:31 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3065C061757
        for <linux-next@vger.kernel.org>; Mon,  6 Sep 2021 09:56:26 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id c6so14627547ybm.10
        for <linux-next@vger.kernel.org>; Mon, 06 Sep 2021 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XaMF+DeLAjg4NOrcNx5yKPhZDgSxDgd2/NGyTr3E1P4=;
        b=Llal/g9ih9jcfAn1nHXt0VNfp+ge5evVfSFn2twpLi2vi9wYj0HbCpsEaZx1aAaLUU
         Wza2SZtDDb8NcCpBHTSlu5M+0CCV9hKiYkkcCLuvM32fj+nEGcK01fYR1x8eT/1BLB3D
         tp+axTLJKDQEfQGDFR5I6mX4CvhA55Rufp4PU1iAWRppqolsiY3fbYA2Lf/Fav97JFdH
         LfARqle14EW/A9wnFfT5nLm7ffJrzfLj5zLN2bxAFYZ/xtN2QNwFbTe1H8GqIrpX17Pm
         uAc1uRSYBSMLMgQGjOi1fJTuhVEeIO2n3gARYBMKTI0QTBvriXz9h5St2HFMQK0qjEot
         hUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XaMF+DeLAjg4NOrcNx5yKPhZDgSxDgd2/NGyTr3E1P4=;
        b=qlkt9v0mYX4j4dVggWk3Z4lfM7Ztg6FK6Hi43hj1tTnXFFpXjdU5jPt7vRgVjFG05y
         eHJiBbhE3UnGjV3F3JKhiV1nvrLGduut+vtin+VfSba0HnSUyEkUceAXEGQ3hKYCW7/N
         rHdFWEJcC1uzgrO+DGBrOw8ovgo1ez5Pi2bIWsx5J0h10gJM1tgryGJM1LCTeVwmaq9W
         m0YPM3XL3fHH7m76pPjEGzAKuPzyvGguLV/E49UVEZSkGwUkhktqj3u67+aLsh4sCF9p
         55DOwZFwJ49++QiezwnzatL6DaMhwNYa391p8DTj9XudrYCsZx9iMRsIBKgxdvzzqAQa
         tuEg==
X-Gm-Message-State: AOAM5309Ve92w2c509vqAACOZJMN7mDj0b1C3By7UuV2aNmxNeum3WOw
        Se391fzekkNKztu9yjq9ExtEuSC4MXMw8UpxK3xmig==
X-Google-Smtp-Source: ABdhPJwUDwi4HEEC5AwjEwhsaFFqNA+WH02y+E3bupDQQtbUjw3m1kZYCCjXxz5U++0g6orYF5py6RHYIkg+I2HGMrM=
X-Received: by 2002:a25:5686:: with SMTP id k128mr18302185ybb.127.1630947385793;
 Mon, 06 Sep 2021 09:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210721163118.3ca01b57@canb.auug.org.au> <20210906144807.4db0790f@canb.auug.org.au>
 <YTYFm1Ca8LHvrlyq@casper.infradead.org>
In-Reply-To: <YTYFm1Ca8LHvrlyq@casper.infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 6 Sep 2021 09:56:14 -0700
Message-ID: <CAJuCfpFMzpfR2LQ3saFk=vNfzbnKDG9ToOOVzFu5O3adniROHA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the folio tree
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 6, 2021 at 5:13 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Sep 06, 2021 at 02:48:07PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > On Wed, 21 Jul 2021 16:31:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the akpm-current tree got conflicts in:
> > >
> > >   include/linux/memcontrol.h
> > >   mm/memcontrol.c
> > >
> > > between commits:
> > >
> > >   05bb7bbab428 ("mm/memcg: Convert mem_cgroup_charge() to take a folio")
> > >   8b2afb6a1c34 ("mm/memcg: Convert mem_cgroup_uncharge() to take a folio")
> > >
> > > from the folio tree and commit:
> > >
> > >   1f4c6a1cf274 ("mm, memcg: inline mem_cgroup_{charge/uncharge} to improve disabled memcg config")
> > >
> > > from the akpm-current tree.
> > >
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > >
> > > diff --cc include/linux/memcontrol.h
> > > index af9c44bb1e42,406058a0c480..000000000000
> > > --- a/include/linux/memcontrol.h
> > > +++ b/include/linux/memcontrol.h
> > > @@@ -704,15 -691,37 +702,36 @@@ static inline bool mem_cgroup_below_min
> > >             page_counter_read(&memcg->memory);
> > >   }
> > >
> > > - int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gfp);
> > >  -int __mem_cgroup_charge(struct page *page, struct mm_struct *mm,
> > >  -                  gfp_t gfp_mask);
> > >  -static inline int mem_cgroup_charge(struct page *page, struct mm_struct *mm,
> > >  -                              gfp_t gfp_mask)
> > > ++int __mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gfp);
> > > ++static inline int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm,
> > > ++                              gfp_t gfp)
> > > + {
> > > +   if (mem_cgroup_disabled())
> > > +           return 0;
> > >  -  return __mem_cgroup_charge(page, mm, gfp_mask);
> > > ++  return __mem_cgroup_charge(folio, mm, gfp);
> > > + }
> > > +
> > >   int mem_cgroup_swapin_charge_page(struct page *page, struct mm_struct *mm,
> > >                               gfp_t gfp, swp_entry_t entry);
> > >   void mem_cgroup_swapin_uncharge_swap(swp_entry_t entry);
> > >
> > > - void mem_cgroup_uncharge(struct folio *folio);
> > > - void mem_cgroup_uncharge_list(struct list_head *page_list);
> > >  -void __mem_cgroup_uncharge(struct page *page);
> > >  -static inline void mem_cgroup_uncharge(struct page *page)
> > > ++void __mem_cgroup_uncharge(struct folio *folio);
> > > ++static inline void mem_cgroup_uncharge(struct folio *folio)
> > > + {
> > > +   if (mem_cgroup_disabled())
> > > +           return;
> > >  -  __mem_cgroup_uncharge(page);
> > > ++  __mem_cgroup_uncharge(folio);
> > > + }
> > > +
> > > + void __mem_cgroup_uncharge_list(struct list_head *page_list);
> > > + static inline void mem_cgroup_uncharge_list(struct list_head *page_list)
> > > + {
> > > +   if (mem_cgroup_disabled())
> > > +           return;
> > > +   __mem_cgroup_uncharge_list(page_list);
> > > + }
> > >
> > >  -void mem_cgroup_migrate(struct page *oldpage, struct page *newpage);
> > >  +void mem_cgroup_migrate(struct folio *old, struct folio *new);
> > >
> > >   /**
> > >    * mem_cgroup_lruvec - get the lru list vector for a memcg & node
> > > diff --cc mm/memcontrol.c
> > > index 1d77c873463c,c010164172dd..000000000000
> > > --- a/mm/memcontrol.c
> > > +++ b/mm/memcontrol.c
> > > @@@ -6712,29 -6718,27 +6708,26 @@@ out
> > >   }
> > >
> > >   /**
> > > -  * mem_cgroup_charge - Charge a newly allocated folio to a cgroup.
> > >  - * __mem_cgroup_charge - charge a newly allocated page to a cgroup
> > >  - * @page: page to charge
> > >  - * @mm: mm context of the victim
> > >  - * @gfp_mask: reclaim mode
> > > ++ * __mem_cgroup_charge - Charge a newly allocated folio to a cgroup.
> > >  + * @folio: Folio to charge.
> > >  + * @mm: mm context of the allocating task.
> > >  + * @gfp: Reclaim mode.
> > >    *
> > >  - * Try to charge @page to the memcg that @mm belongs to, reclaiming
> > >  - * pages according to @gfp_mask if necessary. if @mm is NULL, try to
> > >  + * Try to charge @folio to the memcg that @mm belongs to, reclaiming
> > >  + * pages according to @gfp if necessary.  If @mm is NULL, try to
> > >    * charge to the active memcg.
> > >    *
> > >  - * Do not use this for pages allocated for swapin.
> > >  + * Do not use this for folios allocated for swapin.
> > >    *
> > >  - * Returns 0 on success. Otherwise, an error code is returned.
> > >  + * Return: 0 on success. Otherwise, an error code is returned.
> > >    */
> > > - int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gfp)
> > >  -int __mem_cgroup_charge(struct page *page, struct mm_struct *mm,
> > >  -                  gfp_t gfp_mask)
> > > ++int __mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gfp)
> > >   {
> > >     struct mem_cgroup *memcg;
> > >     int ret;
> > >
> > > -   if (mem_cgroup_disabled())
> > > -           return 0;
> > > -
> > >     memcg = get_mem_cgroup_from_mm(mm);
> > >  -  ret = charge_memcg(page, memcg, gfp_mask);
> > >  +  ret = charge_memcg(folio, memcg, gfp);
> > >     css_put(&memcg->css);
> > >
> > >     return ret;
> > > @@@ -6906,20 -6909,17 +6899,17 @@@ static void uncharge_folio(struct foli
> > >   }
> > >
> > >   /**
> > > -  * mem_cgroup_uncharge - Uncharge a folio.
> > >  - * __mem_cgroup_uncharge - uncharge a page
> > >  - * @page: page to uncharge
> > > ++ * __mem_cgroup_uncharge - Uncharge a folio.
> > >  + * @folio: Folio to uncharge.
> > >    *
> > >  - * Uncharge a page previously charged with __mem_cgroup_charge().
> > >  + * Uncharge a folio previously charged with mem_cgroup_charge().
> > >    */
> > > - void mem_cgroup_uncharge(struct folio *folio)
> > >  -void __mem_cgroup_uncharge(struct page *page)
> > > ++void __mem_cgroup_uncharge(struct folio *folio)
> > >   {
> > >     struct uncharge_gather ug;
> > >
> > > -   if (mem_cgroup_disabled())
> > > -           return;
> > > -
> > >  -  /* Don't touch page->lru of any random page, pre-check: */
> > >  -  if (!page_memcg(page))
> > >  +  /* Don't touch folio->lru of any random page, pre-check: */
> > >  +  if (!folio_memcg(folio))
> > >             return;
> > >
> > >     uncharge_gather_clear(&ug);
> > > @@@ -6932,19 -6932,16 +6922,16 @@@
> > >    * @page_list: list of pages to uncharge
> > >    *
> > >    * Uncharge a list of pages previously charged with
> > > -  * mem_cgroup_charge().
> > > +  * __mem_cgroup_charge().
> > >    */
> > > - void mem_cgroup_uncharge_list(struct list_head *page_list)
> > > + void __mem_cgroup_uncharge_list(struct list_head *page_list)
> > >   {
> > >     struct uncharge_gather ug;
> > >  -  struct page *page;
> > >  +  struct folio *folio;
> > >
> > > -   if (mem_cgroup_disabled())
> > > -           return;
> > > -
> > >     uncharge_gather_clear(&ug);
> > >  -  list_for_each_entry(page, page_list, lru)
> > >  -          uncharge_page(page, &ug);
> > >  +  list_for_each_entry(folio, page_list, lru)
> > >  +          uncharge_folio(folio, &ug);
> > >     if (ug.memcg)
> > >             uncharge_batch(&ug);
> > >   }
> >
> > This is now a conflict between the folio tree and Linus' tree.
>
> Quite.  Linus, how do you want to handle this?  Pull the folio-5.15 tag
> I originally sent you?  Pull the pageset-5.15 tag?  Tell me you'll never
> accept this and drop the entire idea?
>
> Do you need anything from me?

If dropping my patch (1f4c6a1cf274 ("mm, memcg: inline
mem_cgroup_{charge/uncharge} to improve disabled memcg config")) helps
in resolving this, feel free to do that and I'll redo it after folios
are merged.
Thanks,
Suren.
