Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F17321BFC9
	for <lists+linux-next@lfdr.de>; Sat, 11 Jul 2020 00:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGJW27 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 18:28:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:43314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726385AbgGJW27 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jul 2020 18:28:59 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFA752075D;
        Fri, 10 Jul 2020 22:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594420139;
        bh=KngizOkFDGVwz/CAX4t/0wFy4AleURxsGks2pIVd+AI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rvAyN6T1myAMIUaDEwQNXnAZMoE4HRnY8TeSMmaFTZEvRNKMtUT+KOO3R1NkQn2P5
         5z+Q0HGiMVH4jGUNAPWs97fkUn9eVPkjJcxbjL115LzpKHM+gsw9eNusmzfDuJdumt
         adAxcFBob5GPMY1M1VeuGHq0wfuge1TyXPsNadRk=
Date:   Fri, 10 Jul 2020 15:28:58 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Peter Xu <peterx@redhat.com>, Mark Brown <broonie@kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: Re: Build failure in -next with get_user_pages_remote() API change
Message-Id: <20200710152858.73c25ad43921728d4d78f0f8@linux-foundation.org>
In-Reply-To: <20200710152357.GC11839@gaia>
References: <20200710113201.GC5653@sirena.org.uk>
        <20200710122457.GK199122@xz-x1>
        <20200710152357.GC11839@gaia>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 10 Jul 2020 16:23:58 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:

> > --- a/arch/arm64/kernel/mte.c
> > +++ b/arch/arm64/kernel/mte.c
> > @@ -221,7 +221,7 @@ static int __access_remote_tags(struct task_struct *tsk, struct mm_struct *mm,
> >                 void *maddr;
> >                 struct page *page = NULL;
> >  
> > -               ret = get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
> > +               ret = get_user_pages_remote(mm, addr, 1, gup_flags,
> >                                             &page, &vma, NULL);
> >                 if (ret <= 0)
> >                         break;
> > 
> > Seems to be a new caller merged recently, so it got left behind during the
> > rebases...  Sorry for not noticing that.
> 
> The mte code is only in -next but since it's based on 5.8-rc3, we can't
> change it without breaking it.
> 
> Is there a stable branch somewhere with the gup patches? If not, I can
> provisionally drop the affected MTE patches from -next and push them
> upstream closer to the -rc1 (it's the ptrace support from MTE).

Is OK.  I restaged this patch series to come after linux-next's
material and added Peter's fixup.  I'll merge this series into Linus
after the ARM tree has merged so everything will land nicely.

Happens often ;)
