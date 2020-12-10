Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE02B2D5AF2
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 13:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387718AbgLJMvd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 07:51:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:54914 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731240AbgLJMvR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 07:51:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 84AFEACF4;
        Thu, 10 Dec 2020 12:50:31 +0000 (UTC)
Message-ID: <1607604631.22066.41.camel@suse.cz>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
From:   Giovanni Gherdovich <ggherdovich@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Thu, 10 Dec 2020 13:50:31 +0100
In-Reply-To: <20201210215210.2c432324@canb.auug.org.au>
References: <20201210215210.2c432324@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 2020-12-10 at 21:52 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   46609527577d ("x86, sched: Use midpoint of max_boost and max_P for frequency invariance on AMD EPYC")
> 
> is missing a Signed-off-by from its author.
> 

Hello,

I'm the author of that commit and the missing Signed-off-by is not intentional but
due to a mistake I made. I used the string "------------" in the commit message and
git interpreted it as "drop everything from here onwards", including the
Signed-off-by.

According to the maintainer's preference, I agree to either them adding

  Signed-off-by: Giovanni Gherdovich <ggherdovich@suse.cz>

or to resend them the patch with a better commit message if they prefer.


Sorry for the inconvenience,
Giovanni Gherdovich




