Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2452340C38
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 18:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhCRRys (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 13:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhCRRyV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 13:54:21 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ED7C06174A
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 10:54:21 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a198so5955119lfd.7
        for <linux-next@vger.kernel.org>; Thu, 18 Mar 2021 10:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w1oPFphg57L7sKY8E1r5PCzrWzBNsxoEQAATZVD3hgA=;
        b=l9E1bj0g3MduMzjWqj+A9CW3VpVKUNZFOoxRnPrmPthOW7VFLBGflmrOr5m0Xk0k3b
         6/AS1LT9eiU56I6ayLhio6mlLoSQWJ0cCQ/6SGY7W2i6MTkVaATL39n+9BHzqgSYqv78
         GUmzyva0m9ohnjC4GM64UWXVrw7kteaJdSLC0Svr+kRuJbiSf50HrtMwQcBr1PruNYJU
         Z/jd1sMvKIEMTXLbjdY/ld691bUoouezgDObfUaxNuYWWuOFRz1/66obCR7Nj8yjlSic
         NQIi8A0hFU/EMNnKfH5gU7df2F/a0DpTuxzE7B3BsIdL6GzNmoHri89WhQZFGORjnoly
         TzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w1oPFphg57L7sKY8E1r5PCzrWzBNsxoEQAATZVD3hgA=;
        b=ZYntoSDOvTsnprf7V3PlI6V2IlsLwdL26t6pkpgqQfLkCgfeXDlrgONPSUc97rRpvl
         79LOPTx6OTu8YFuy1lu22B09wEA6fLh94rttD+grV+CQF570F2gE9J3Q40femLJro3nD
         lWhATOrSMfYHmkI8rE4OZ+yjYwTSPPpK5DpmQuNszhm7IOt9iIWiFAxUZ37Cxct5mFLI
         i4U7giHnaVYZqn9j1jGeArJXxLvK5uvE/SNjCZj8Itpdo/mI8jU6WXyGB3JwJe/X/boQ
         h7c9TZtNLtCsYewqPGBpQoO7rQTNsR0/PKkuvNxkpiDSsyphPnGbz7H5XBBrXQjuXh4A
         lCsg==
X-Gm-Message-State: AOAM530hMi3trFMP55/mwuGplY6zGYPLaoSRV/vGowghSZeuFwnb7Yje
        rMC+yRgCwcMfyaiswbKRm+rN3sIKTWXwNkE8h1h4Pg==
X-Google-Smtp-Source: ABdhPJx48LkaTKcfJuDXxDL4wH2SxQKU34E29bTgFkad1AodSgUxuvgjjShP6mRtZiSQISRaUK2vJpqUE56pEbbrE14=
X-Received: by 2002:a19:e0d:: with SMTP id 13mr5976627lfo.549.1616090059182;
 Thu, 18 Mar 2021 10:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210318171720.61a3f59c@canb.auug.org.au>
In-Reply-To: <20210318171720.61a3f59c@canb.auug.org.au>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Thu, 18 Mar 2021 10:54:08 -0700
Message-ID: <CALvZod7iPJ1h0MVpBwNkqJBfNNWPb+x93q59okdK5oxevzbP_g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>,
        Dan Schatzberg <schatzberg.dan@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 11:17 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>
>   mm/memcontrol.c
>
> between commit:
>
>   06d69d4c8669 ("mm: Charge active memcg when no mm is set")
>
> from the block tree and commit:
>
>   674788258a66 ("memcg: charge before adding to swapcache on swapin")
>
> from the akpm-current tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc mm/memcontrol.c
> index f05501669e29,668d1d7c2645..000000000000
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@@ -6691,65 -6549,73 +6550,80 @@@ out
>    * @gfp_mask: reclaim mode
>    *
>    * Try to charge @page to the memcg that @mm belongs to, reclaiming
>  - * pages according to @gfp_mask if necessary.
>  + * pages according to @gfp_mask if necessary. if @mm is NULL, try to
>  + * charge to the active memcg.
>    *
> +  * Do not use this for pages allocated for swapin.
> +  *
>    * Returns 0 on success. Otherwise, an error code is returned.
>    */
>   int mem_cgroup_charge(struct page *page, struct mm_struct *mm, gfp_t gfp_mask)
>   {
> -       unsigned int nr_pages = thp_nr_pages(page);
> -       struct mem_cgroup *memcg = NULL;
> -       int ret = 0;
> +       struct mem_cgroup *memcg;
> +       int ret;
>
>         if (mem_cgroup_disabled())
> -               goto out;
> +               return 0;
>
> -       if (PageSwapCache(page)) {
> -               swp_entry_t ent = { .val = page_private(page), };
> -               unsigned short id;
>  -      memcg = get_mem_cgroup_from_mm(mm);
> ++      if (!mm) {
> ++              memcg = get_mem_cgroup_from_current();
> ++              if (!memcg)
> ++                      memcg = get_mem_cgroup_from_mm(current->mm);
> ++      } else {
> ++              memcg = get_mem_cgroup_from_mm(mm);
> ++      }
> +       ret = __mem_cgroup_charge(page, memcg, gfp_mask);
> +       css_put(&memcg->css);

Things are more complicated than this. First we need a similar change
in mem_cgroup_swapin_charge_page() but I am thinking of making
get_mem_cgroup_from_mm() more general and not make any changes in
these two functions.

Is it possible to get Dan's patch series in mm tree? More specifically
the above two patches in the same tree then one of us can make their
patch rebase over the other (I am fine with doing this myself).
