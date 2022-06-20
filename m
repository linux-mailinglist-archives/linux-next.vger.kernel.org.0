Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF9855110A
	for <lists+linux-next@lfdr.de>; Mon, 20 Jun 2022 09:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239105AbiFTHMQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jun 2022 03:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239145AbiFTHML (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jun 2022 03:12:11 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CC9E092
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 00:12:09 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id i15so12531689ybp.1
        for <linux-next@vger.kernel.org>; Mon, 20 Jun 2022 00:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W4HgBL+rarePRfhToeCDFreePibGLonEGtpm7wVJr5M=;
        b=I2cwsbInE4YE+M/nciNA1a3jf9o6ZJiJzkLTwACB4ctl+mf6GwJAg3y5bE9U3MuKRC
         ZBi4z/b2qsRihjxkPs5Mhst6hFIJ7l+Kx6QYtsCspiFvtw+VG8MSa0z9hovtnuxDZ88U
         8VuWt7Cmn0gNISnGss0oC3Pxcufi0d+AK3EBAZyi8t7STPePyCF6qb7KQP83wg8SFSnr
         HX594jybe01mCEH6sC/82/zdAf6tTDXiPsXzohvL5cxlyyCAZhA3iLO4hmnKSN0O3eeW
         MUKDZdnV9ci6Dkwa7CQ69uic2oCT5xyCfAIE9GpFIXXgTcND/xeqGAx5ypxsH47pq8K8
         LMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4HgBL+rarePRfhToeCDFreePibGLonEGtpm7wVJr5M=;
        b=1YjTe7LJEaq9ufqYf90vzumdEHIrfwIcsrSameEZ+hfXfwSuF/q+kcSJSxQAf6u0+h
         yuplG1wcQTl+MXgtsqysn6HQypma0QhhdjeA8fXpBNxGy5Ryw/y/uQlXn7rM/lelB8xb
         ltT97B4wbGfCok4fyo9sVub9ea+HNd8wDoSchvslCv47Pebb2sVFsGF8v2ZSbsR++qDf
         855NaFE8PH+6z1zpsa/GQ3bo93Ffp02CnUNPLKChWR+3uLnsu5fRUEC4jutHa35eFGYR
         xyKTxymwo9T2FY545oyOvFuy0tUEEYdnI5LRWaaNc32m8gDTdF19lUczawuj7Yj9HAnL
         XtxA==
X-Gm-Message-State: AJIora8ikkpuATvwTemxSMaO25DgmoYejqak8Lp//c+1K2e583Ns9HYl
        er31w/cgkHkPWo8+Zu+7+oUIVu1Jye7LBLTR4kVItg==
X-Google-Smtp-Source: AGRyM1tAzOpmCC+WVAOJqdbYbrfNbOsH7WtWuoJedfT4Ju14UIBTBqKFkmWmj9obQqB5rYInTZyAWjMvx9/RLmMqK8A=
X-Received: by 2002:a25:d146:0:b0:668:aa24:c321 with SMTP id
 i67-20020a25d146000000b00668aa24c321mr19499821ybg.89.1655709128850; Mon, 20
 Jun 2022 00:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220620164246.0d3f7784@canb.auug.org.au>
In-Reply-To: <20220620164246.0d3f7784@canb.auug.org.au>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 20 Jun 2022 15:11:31 +0800
Message-ID: <CAMZfGtWmGOr1LRBnKGVeqP8p47xyaA0ny_rotdHmgLx8DOk6xg@mail.gmail.com>
Subject: Re: linux-next: build failures after merge of the mm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks for your report. It is fixed in thread [1].

https://lore.kernel.org/all/20220619133851.68184-3-songmuchun@bytedance.com/ [1]

On Mon, Jun 20, 2022 at 2:42 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (x86_64 allnoconfig)
> failed like this:
>
> In file included from arch/x86/include/asm/page.h:86,
>                  from arch/x86/include/asm/thread_info.h:12,
>                  from include/linux/thread_info.h:60,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:55,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/slab.h:15,
>                  from include/linux/crypto.h:20,
>                  from arch/x86/kernel/asm-offsets.c:9:
> include/linux/mm.h: In function 'destroy_large_folio':
> include/asm-generic/memory_model.h:35:21: error: implicit declaration of function 'page_to_section'; did you mean 'present_section'? [-Werror=implicit-function-declaration]
>    35 |         int __sec = page_to_section(__pg);                      \
>       |                     ^~~~~~~~~~~~~~~
> include/asm-generic/memory_model.h:40:32: note: in definition of macro '__pfn_to_page'
>    40 | ({      unsigned long __pfn = (pfn);                    \
>       |                                ^~~
> include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
>    52 | #define page_to_pfn __page_to_pfn
>       |                     ^~~~~~~~~~~~~
> include/linux/mm.h:214:38: note: in expansion of macro 'page_to_pfn'
>   214 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
>       |                                      ^~~~~~~~~~~
> include/linux/page-flags.h:312:33: note: in expansion of macro 'nth_page'
>   312 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
>       |                                 ^~~~~~~~
> include/linux/mm.h:928:38: note: in expansion of macro 'folio_page'
>   928 |         enum compound_dtor_id dtor = folio_page(folio, 1)->compound_dtor;
>       |                                      ^~~~~~~~~~
> In file included from include/linux/memcontrol.h:20,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from arch/x86/kernel/asm-offsets.c:13:
> include/linux/mm.h: At top level:
> include/linux/mm.h:1556:29: error: conflicting types for 'page_to_section'; have 'long unsigned int(const struct page *)'
>  1556 | static inline unsigned long page_to_section(const struct page *page)
>       |                             ^~~~~~~~~~~~~~~
> In file included from arch/x86/include/asm/page.h:86,
>                  from arch/x86/include/asm/thread_info.h:12,
>                  from include/linux/thread_info.h:60,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:55,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:6,
>                  from include/linux/slab.h:15,
>                  from include/linux/crypto.h:20,
>                  from arch/x86/kernel/asm-offsets.c:9:
> include/asm-generic/memory_model.h:35:21: note: previous implicit declaration of 'page_to_section' with type 'int()'
>    35 |         int __sec = page_to_section(__pg);                      \
>       |                     ^~~~~~~~~~~~~~~
> include/asm-generic/memory_model.h:40:32: note: in definition of macro '__pfn_to_page'
>    40 | ({      unsigned long __pfn = (pfn);                    \
>       |                                ^~~
> include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
>    52 | #define page_to_pfn __page_to_pfn
>       |                     ^~~~~~~~~~~~~
> include/linux/mm.h:214:38: note: in expansion of macro 'page_to_pfn'
>   214 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
>       |                                      ^~~~~~~~~~~
> include/linux/page-flags.h:312:33: note: in expansion of macro 'nth_page'
>   312 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
>       |                                 ^~~~~~~~
> include/linux/mm.h:928:38: note: in expansion of macro 'folio_page'
>   928 |         enum compound_dtor_id dtor = folio_page(folio, 1)->compound_dtor;
>       |                                      ^~~~~~~~~~
> cc1: some warnings being treated as errors
>
> Caused by commit (I think)
>
>   d3b90b76e101 ("mm: convert destroy_compound_page() to destroy_large_folio()")
>
> I have reverted these commits fot today:
>
> 56629699b3dd mm/swap: convert __delete_from_swap_cache() to a folio
> e5085f2cc241 mm/swap: convert delete_from_swap_cache() to take a folio
> 169f02f4efb1 mm: convert page_swap_flags to folio_swap_flags
> d3b90b76e101 mm: convert destroy_compound_page() to destroy_large_folio()
>
> Then I got:
>
> mm/hugetlb_vmemmap.c: In function 'vmemmap_optimizable_pages':
> mm/hugetlb_vmemmap.c:110:24: error: implicit declaration of function 'sparse_decode_mem_map' [-Werror=implicit-function-declaration]
>   110 |         vmemmap_page = sparse_decode_mem_map(ms->section_mem_map,
>       |                        ^~~~~~~~~~~~~~~~~~~~~
> mm/hugetlb_vmemmap.c:110:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   110 |         vmemmap_page = _sparsedecode_mem_map(ms->section_mem_map,
>       |                      ^
> cc1: some warnings being treated as errors
>
> from my arm64 defconfig build.
>
> Caused by commit
>
>   10a768735470 ("mm: memory_hotplug: make hugetlb_optimize_vmemmap compatible with memmap_on_memory")
>
> So I gave up and used the mm tree from next-20220617 for today.
> --
> Cheers,
> Stephen Rothwell
