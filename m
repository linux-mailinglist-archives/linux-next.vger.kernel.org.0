Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B47321B95F
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 17:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgGJPYC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 11:24:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:49980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727074AbgGJPYC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jul 2020 11:24:02 -0400
Received: from gaia (unknown [95.146.230.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4C3320767;
        Fri, 10 Jul 2020 15:24:00 +0000 (UTC)
Date:   Fri, 10 Jul 2020 16:23:58 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Peter Xu <peterx@redhat.com>
Cc:     Mark Brown <broonie@kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: Re: Build failure in -next with get_user_pages_remote() API change
Message-ID: <20200710152357.GC11839@gaia>
References: <20200710113201.GC5653@sirena.org.uk>
 <20200710122457.GK199122@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710122457.GK199122@xz-x1>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 10, 2020 at 08:24:57AM -0400, Peter Xu wrote:
> On Fri, Jul 10, 2020 at 12:32:01PM +0100, Mark Brown wrote:
> > Today's -next fails to build in various arm64 configs with:
> > 
> > arch/arm64/kernel/mte.c:225:23: error: too many arguments to function call, expected 7, have 8
> >                                             &page, &vma, NULL);
> >                                                          ^~~~
> > ./include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
> > #define NULL ((void *)0)
> >              ^~~~~~~~~~~
> > ./include/linux/mm.h:1705:6: note: 'get_user_pages_remote' declared here
> > long get_user_pages_remote(struct mm_struct *mm,
> >      ^
> > 1 error generated.
> > 
> > caused by b7363b0ab88d66d3c (mm/gup: remove task_struct pointer for all
> > gup code) which updated the signature of get_user_pages_remote() without
> > updating the caller in mte.c.
> 
> We should need to squash into "mm/gup: remove task_struct pointer for all gup
> code" with:
> 
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 934639ab225d..11e558b02a05 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -221,7 +221,7 @@ static int __access_remote_tags(struct task_struct *tsk, struct mm_struct *mm,
>                 void *maddr;
>                 struct page *page = NULL;
>  
> -               ret = get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
> +               ret = get_user_pages_remote(mm, addr, 1, gup_flags,
>                                             &page, &vma, NULL);
>                 if (ret <= 0)
>                         break;
> 
> Seems to be a new caller merged recently, so it got left behind during the
> rebases...  Sorry for not noticing that.

The mte code is only in -next but since it's based on 5.8-rc3, we can't
change it without breaking it.

Is there a stable branch somewhere with the gup patches? If not, I can
provisionally drop the affected MTE patches from -next and push them
upstream closer to the -rc1 (it's the ptrace support from MTE).

-- 
Catalin
