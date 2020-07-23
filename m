Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA41A22B573
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 20:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgGWSKm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jul 2020 14:10:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:40364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgGWSKl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jul 2020 14:10:41 -0400
Received: from gaia (unknown [95.146.230.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A13020714;
        Thu, 23 Jul 2020 18:10:40 +0000 (UTC)
Date:   Thu, 23 Jul 2020 19:10:37 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Peter Xu <peterx@redhat.com>, Mark Brown <broonie@kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: Re: Build failure in -next with get_user_pages_remote() API change
Message-ID: <20200723181037.GA29530@gaia>
References: <20200710113201.GC5653@sirena.org.uk>
 <20200710122457.GK199122@xz-x1>
 <20200710152357.GC11839@gaia>
 <20200710152858.73c25ad43921728d4d78f0f8@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710152858.73c25ad43921728d4d78f0f8@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 10, 2020 at 03:28:58PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2020 16:23:58 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > --- a/arch/arm64/kernel/mte.c
> > > +++ b/arch/arm64/kernel/mte.c
> > > @@ -221,7 +221,7 @@ static int __access_remote_tags(struct task_struct *tsk, struct mm_struct *mm,
> > >                 void *maddr;
> > >                 struct page *page = NULL;
> > >  
> > > -               ret = get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
> > > +               ret = get_user_pages_remote(mm, addr, 1, gup_flags,
> > >                                             &page, &vma, NULL);
> > >                 if (ret <= 0)
> > >                         break;
> > > 
> > > Seems to be a new caller merged recently, so it got left behind during the
> > > rebases...  Sorry for not noticing that.
> > 
> > The mte code is only in -next but since it's based on 5.8-rc3, we can't
> > change it without breaking it.
> > 
> > Is there a stable branch somewhere with the gup patches? If not, I can
> > provisionally drop the affected MTE patches from -next and push them
> > upstream closer to the -rc1 (it's the ptrace support from MTE).
> 
> Is OK.  I restaged this patch series to come after linux-next's
> material and added Peter's fixup.  I'll merge this series into Linus
> after the ARM tree has merged so everything will land nicely.

Just a heads-up that I'll drop the arm64 MTE series from -next,
postponing the merging until 5.10 (there is an ongoing discussion on the
prctl() aspect and I don't want to be forced to change the user ABI
after upstreaming). You'll get another conflict for Peter's hunk above.

Thanks.

-- 
Catalin
