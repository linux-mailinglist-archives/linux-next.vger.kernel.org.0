Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5842D5B25
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 14:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388352AbgLJNDU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 08:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387506AbgLJNDO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2020 08:03:14 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298B7C0613D6;
        Thu, 10 Dec 2020 05:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=+RVI+GYAz7Cj9dLwQO7lJaDKUEPBg0VpOCcGAPAQzyc=; b=XayUTy0Xx36b0ASSYih2uYleT7
        OWXI61BFbpVcfYGM4id6hUCxKtOA4LQeGSlYfXphaaE2hP+1PVgdT7/etzFU9SjpKTjjgoXM0GiGJ
        A/KEIFspO0ZaYi5HC9tJBs/UmoZGEA8TtccH16jJV7PfNiKmu8491EMZrmyJuOD4Kqt6zDsGU0I/3
        b/xvf1SSDljY6wwcncUYZwzCAUjLisLHLN0X5lFJ01gffdTyZrFymsqAwnb/T/1CFTUhtQf2zmfgg
        KS0WHnXeGnB+PqSbb5BYuwtJYDqLJI8GHl0ypWYLriZLSGS7oSc0skDVHSvcFGLjXw2FyUAprHyKN
        uDWqoYIQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1knLaT-0004j4-Cy; Thu, 10 Dec 2020 13:02:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D53F23059C6;
        Thu, 10 Dec 2020 14:02:24 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id A2E6D2B855156; Thu, 10 Dec 2020 14:02:24 +0100 (CET)
Date:   Thu, 10 Dec 2020 14:02:24 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Giovanni Gherdovich <ggherdovich@suse.cz>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20201210130224.GQ2414@hirez.programming.kicks-ass.net>
References: <20201210215210.2c432324@canb.auug.org.au>
 <1607604631.22066.41.camel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607604631.22066.41.camel@suse.cz>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 10, 2020 at 01:50:31PM +0100, Giovanni Gherdovich wrote:
> On Thu, 2020-12-10 at 21:52 +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Commit
> > 
> >   46609527577d ("x86, sched: Use midpoint of max_boost and max_P for frequency invariance on AMD EPYC")
> > 
> > is missing a Signed-off-by from its author.
> > 
> 
> Hello,
> 
> I'm the author of that commit and the missing Signed-off-by is not intentional but
> due to a mistake I made. I used the string "------------" in the commit message and
> git interpreted it as "drop everything from here onwards", including the
> Signed-off-by.
> 
> According to the maintainer's preference, I agree to either them adding
> 
>   Signed-off-by: Giovanni Gherdovich <ggherdovich@suse.cz>

Hurmph, I'd have to rebase that branch to fix this.. mingo?
