Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9183C1A905F
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 03:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392519AbgDOBYh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 21:24:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387762AbgDOBYd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 21:24:33 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC0E320784;
        Wed, 15 Apr 2020 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586913871;
        bh=Jttip+q2gFr6gM6I9moyxzeHwN0fQYq8HT40g3rs6lY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JZfORDVrzKDLJirpGb9+s3ZEwYKVe+1aQi9jJl2B4EpQVaHqvSofy1OkreFy5zrFl
         RCxeBGgCWqZFUHLEM0eGRWY/W9G0TMmU5gAJWZ6tiYxOQUeBw7pp/0bYOUsSQpOxzD
         G3UkU16EORnqkD1GE3SmIGEbCJt+D/foJ5zsK4hw=
Date:   Tue, 14 Apr 2020 18:24:30 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>
Subject: Re: linux-next: Tree for Apr 14 (mm/shmem.c)
Message-Id: <20200414182430.c5af29ddb1735f5fd0083983@linux-foundation.org>
In-Reply-To: <200c608a-8159-18ce-b44e-cad2022e23e2@infradead.org>
References: <20200414123900.4f97a83f@canb.auug.org.au>
        <200c608a-8159-18ce-b44e-cad2022e23e2@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 14 Apr 2020 07:18:01 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:

> On 4/13/20 7:39 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200413:
> > 
> > New tree: mhi
> > 
> > My fixes tree contains:
> > 
> >   6b038bdcd3d1 sh: mm: Fix build error
> > 
> > Non-merge commits (relative to Linus' tree): 1154
> >  1160 files changed, 31764 insertions(+), 13498 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> 
> on x86_64:
> # CONFIG_TRANSPARENT_HUGEPAGE is not set

Thanks.  hm, this took a long time to be discovered.

> In file included from ../include/linux/export.h:43:0,
>                  from ../include/linux/linkage.h:7,
>                  from ../include/linux/fs.h:5,
>                  from ../mm/shmem.c:24:
> ../mm/shmem.c: In function ‘shmem_undo_range’:
> ../include/linux/compiler.h:394:38: error: call to ‘__compiletime_assert_110’ declared with attribute error: BUILD_BUG failed
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^
> ../include/linux/compiler.h:69:3: note: in definition of macro ‘__trace_if_value’
>   (cond) ?     \
>    ^~~~
> ../include/linux/compiler.h:56:28: note: in expansion of macro ‘__trace_if_var’
>  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
>                             ^~~~~~~~~~~~~~
> ../mm/shmem.c:960:6: note: in expansion of macro ‘if’
>       if (index <
>       ^~
> ../include/linux/kernel.h:71:36: note: in expansion of macro ‘__round_mask’
>  #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
>                                     ^~~~~~~~~~~~
> ../mm/shmem.c:961:10: note: in expansion of macro ‘round_up’
>           round_up(start, HPAGE_PMD_NR))
>           ^~~~~~~~
> ../include/linux/compiler.h:382:2: note: in expansion of macro ‘__compiletime_assert’
>   __compiletime_assert(condition, msg, prefix, suffix)
>   ^~~~~~~~~~~~~~~~~~~~
> ../include/linux/compiler.h:394:2: note: in expansion of macro ‘_compiletime_assert’
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>   ^~~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:59:21: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
>  #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>                      ^~~~~~~~~~~~~~~~
> ../include/linux/huge_mm.h:319:28: note: in expansion of macro ‘BUILD_BUG’
>  #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
>                             ^~~~~~~~~
> ../include/linux/huge_mm.h:115:26: note: in expansion of macro ‘HPAGE_PMD_SHIFT’
>  #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
>                           ^~~~~~~~~~~~~~~
> ../include/linux/huge_mm.h:116:26: note: in expansion of macro ‘HPAGE_PMD_ORDER’
>  #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
>                           ^~~~~~~~~~~~~~~
> ../mm/shmem.c:961:26: note: in expansion of macro ‘HPAGE_PMD_NR’
>           round_up(start, HPAGE_PMD_NR))
>                           ^~~~~~~~~~~~
> 

That's

					if (index <
					    round_up(start, HPAGE_PMD_NR))
						start = index + 1;

from Hugh's 71725ed10c40696 ("mm: huge tmpfs: try to split_huge_page()
when punching hole").

