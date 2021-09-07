Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D8B402A25
	for <lists+linux-next@lfdr.de>; Tue,  7 Sep 2021 15:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344795AbhIGNv2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Sep 2021 09:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234990AbhIGNv1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Sep 2021 09:51:27 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB54C061575;
        Tue,  7 Sep 2021 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=LgdSNkdSlWB7zsbY0/6EDhJt8ziUdW7VQcJcKDeiYiU=; b=FSwNYaAXz2PZvhX1Ulr5GKtZ+e
        3bC1GSc5ue1bc0ZGVNpLsITgDxl4QaX84G1xG+RF3pa+1wFPmT7gWUKF3HS3v50g8Fbidpf7glokl
        zKQxY9uo7xXnJqXA8jKPX1TYzUXfqtCuYSV+PwlKZ4wsLQHB40VtJZOD85Knvd/mu0eQ4sDoXJ4aP
        NVGBpWSpSViQAgrcks8WRLos3on8dMnZrOsw2oaTQpSUjtTNoew5D8f3Th2vMGgh1+w26ouaL7GgK
        Gvh13V8p5hJIBf4xGa+goqlCITU2dd0cPPQiA2EAB8VvHGenPmS4jPy5tQucI2QyUK5H2XjDxRbbT
        n6wUhsWA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mNbTp-007ulr-QV; Tue, 07 Sep 2021 13:49:50 +0000
Date:   Tue, 7 Sep 2021 14:49:41 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the folio
 tree
Message-ID: <YTdt9eDSW8Ye2/Rv@casper.infradead.org>
References: <20210721163118.3ca01b57@canb.auug.org.au>
 <20210906144807.4db0790f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906144807.4db0790f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 06, 2021 at 02:48:07PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 21 Jul 2021 16:31:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Today's linux-next merge of the akpm-current tree got conflicts in:
> > 
> >   include/linux/memcontrol.h
> >   mm/memcontrol.c
> > 
> > between commits:
> > 
> >   05bb7bbab428 ("mm/memcg: Convert mem_cgroup_charge() to take a folio")
> >   8b2afb6a1c34 ("mm/memcg: Convert mem_cgroup_uncharge() to take a folio")
> > 
> > from the folio tree and commit:
> > 
> >   1f4c6a1cf274 ("mm, memcg: inline mem_cgroup_{charge/uncharge} to improve disabled memcg config")
> > 
> > from the akpm-current tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc include/linux/memcontrol.h
> > index af9c44bb1e42,406058a0c480..000000000000
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@@ -704,15 -691,37 +702,36 @@@ static inline bool mem_cgroup_below_min
> >   		page_counter_read(&memcg->memory);
> >   }
> >   
> > - int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gfp);
> >  -int __mem_cgroup_charge(struct page *page, struct mm_struct *mm,
> >  -			gfp_t gfp_mask);
> >  -static inline int mem_cgroup_charge(struct page *page, struct mm_struct *mm,
> >  -				    gfp_t gfp_mask)
> > ++int __mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gfp);
> > ++static inline int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm,
> > ++				    gfp_t gfp)
> > + {
> > + 	if (mem_cgroup_disabled())
> > + 		return 0;
> >  -	return __mem_cgroup_charge(page, mm, gfp_mask);
> > ++	return __mem_cgroup_charge(folio, mm, gfp);
> > + }
> > + 
> >   int mem_cgroup_swapin_charge_page(struct page *page, struct mm_struct *mm,
> >   				  gfp_t gfp, swp_entry_t entry);
> >   void mem_cgroup_swapin_uncharge_swap(swp_entry_t entry);
> >   
> > - void mem_cgroup_uncharge(struct folio *folio);
> > - void mem_cgroup_uncharge_list(struct list_head *page_list);
> >  -void __mem_cgroup_uncharge(struct page *page);
> >  -static inline void mem_cgroup_uncharge(struct page *page)
> > ++void __mem_cgroup_uncharge(struct folio *folio);
> > ++static inline void mem_cgroup_uncharge(struct folio *folio)
> > + {
> > + 	if (mem_cgroup_disabled())
> > + 		return;
> >  -	__mem_cgroup_uncharge(page);
> > ++	__mem_cgroup_uncharge(folio);
> > + }
> > + 
> > + void __mem_cgroup_uncharge_list(struct list_head *page_list);
> > + static inline void mem_cgroup_uncharge_list(struct list_head *page_list)
> > + {
> > + 	if (mem_cgroup_disabled())
> > + 		return;
> > + 	__mem_cgroup_uncharge_list(page_list);
> > + }
> >   
> >  -void mem_cgroup_migrate(struct page *oldpage, struct page *newpage);
> >  +void mem_cgroup_migrate(struct folio *old, struct folio *new);
> >   
> >   /**
> >    * mem_cgroup_lruvec - get the lru list vector for a memcg & node
> > diff --cc mm/memcontrol.c
> > index 1d77c873463c,c010164172dd..000000000000
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@@ -6712,29 -6718,27 +6708,26 @@@ out
> >   }
> >   
> >   /**
> > -  * mem_cgroup_charge - Charge a newly allocated folio to a cgroup.
> >  - * __mem_cgroup_charge - charge a newly allocated page to a cgroup
> >  - * @page: page to charge
> >  - * @mm: mm context of the victim
> >  - * @gfp_mask: reclaim mode
> > ++ * __mem_cgroup_charge - Charge a newly allocated folio to a cgroup.
> >  + * @folio: Folio to charge.
> >  + * @mm: mm context of the allocating task.
> >  + * @gfp: Reclaim mode.
> >    *
> >  - * Try to charge @page to the memcg that @mm belongs to, reclaiming
> >  - * pages according to @gfp_mask if necessary. if @mm is NULL, try to
> >  + * Try to charge @folio to the memcg that @mm belongs to, reclaiming
> >  + * pages according to @gfp if necessary.  If @mm is NULL, try to
> >    * charge to the active memcg.
> >    *
> >  - * Do not use this for pages allocated for swapin.
> >  + * Do not use this for folios allocated for swapin.
> >    *
> >  - * Returns 0 on success. Otherwise, an error code is returned.
> >  + * Return: 0 on success. Otherwise, an error code is returned.
> >    */
> > - int mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gfp)
> >  -int __mem_cgroup_charge(struct page *page, struct mm_struct *mm,
> >  -			gfp_t gfp_mask)
> > ++int __mem_cgroup_charge(struct folio *folio, struct mm_struct *mm, gfp_t gfp)
> >   {
> >   	struct mem_cgroup *memcg;
> >   	int ret;
> >   
> > - 	if (mem_cgroup_disabled())
> > - 		return 0;
> > - 
> >   	memcg = get_mem_cgroup_from_mm(mm);
> >  -	ret = charge_memcg(page, memcg, gfp_mask);
> >  +	ret = charge_memcg(folio, memcg, gfp);
> >   	css_put(&memcg->css);
> >   
> >   	return ret;
> > @@@ -6906,20 -6909,17 +6899,17 @@@ static void uncharge_folio(struct foli
> >   }
> >   
> >   /**
> > -  * mem_cgroup_uncharge - Uncharge a folio.
> >  - * __mem_cgroup_uncharge - uncharge a page
> >  - * @page: page to uncharge
> > ++ * __mem_cgroup_uncharge - Uncharge a folio.
> >  + * @folio: Folio to uncharge.
> >    *
> >  - * Uncharge a page previously charged with __mem_cgroup_charge().
> >  + * Uncharge a folio previously charged with mem_cgroup_charge().
> >    */
> > - void mem_cgroup_uncharge(struct folio *folio)
> >  -void __mem_cgroup_uncharge(struct page *page)
> > ++void __mem_cgroup_uncharge(struct folio *folio)
> >   {
> >   	struct uncharge_gather ug;
> >   
> > - 	if (mem_cgroup_disabled())
> > - 		return;
> > - 
> >  -	/* Don't touch page->lru of any random page, pre-check: */
> >  -	if (!page_memcg(page))
> >  +	/* Don't touch folio->lru of any random page, pre-check: */
> >  +	if (!folio_memcg(folio))
> >   		return;
> >   
> >   	uncharge_gather_clear(&ug);
> > @@@ -6932,19 -6932,16 +6922,16 @@@
> >    * @page_list: list of pages to uncharge
> >    *
> >    * Uncharge a list of pages previously charged with
> > -  * mem_cgroup_charge().
> > +  * __mem_cgroup_charge().
> >    */
> > - void mem_cgroup_uncharge_list(struct list_head *page_list)
> > + void __mem_cgroup_uncharge_list(struct list_head *page_list)
> >   {
> >   	struct uncharge_gather ug;
> >  -	struct page *page;
> >  +	struct folio *folio;
> >   
> > - 	if (mem_cgroup_disabled())
> > - 		return;
> > - 
> >   	uncharge_gather_clear(&ug);
> >  -	list_for_each_entry(page, page_list, lru)
> >  -		uncharge_page(page, &ug);
> >  +	list_for_each_entry(folio, page_list, lru)
> >  +		uncharge_folio(folio, &ug);
> >   	if (ug.memcg)
> >   		uncharge_batch(&ug);
> >   }
> 
> This is now a conflict between the folio tree and Linus' tree.

Quite.  Linus, how do you want to handle this?  Pull the folio-5.15 tag
I originally sent you?  Pull the pageset-5.15 tag?  Tell me you'll never
accept this and drop the entire idea?

Do you need anything from me?


