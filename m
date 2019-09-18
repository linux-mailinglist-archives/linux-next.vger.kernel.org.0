Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2761DB5B93
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 08:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbfIRGF7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 02:05:59 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36323 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfIRGF6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2019 02:05:58 -0400
Received: by mail-wm1-f68.google.com with SMTP id t3so974255wmj.1;
        Tue, 17 Sep 2019 23:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hwWWOoPr234HCjC7JY+UqHTvhCpgrr6k759zSE0l9Nc=;
        b=fwApwtqAnoy0yRKfmvfNRI066AJX7KH1aYgokaRt8oJPm/5zK1YLT9tx01FeMbnATQ
         EANegG65/X/b3tLMAXJyNTp3Lh48MDMga6bm6prICG99UJFQEdDws/o+tmLU6umNI5DL
         OAEELI+yqkt4rODG8pPsj/27h27M90NRvIIEL6Pdb9jSMz1nYsGEcF+hxDnclk3caihA
         fWjWXsPhxnlzBzpnITKSPcToHQvf+c2rXU7i/6EfYawIO/ZPMRiKoBkwm+peP5s9cZnK
         S6iAKFc9EwUpyMzl7OGU9wF+DWZJvSv5C1LBPM70U7py7NnXEKZCm+jYhhVT1O/A8q1d
         xzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=hwWWOoPr234HCjC7JY+UqHTvhCpgrr6k759zSE0l9Nc=;
        b=PxiKmTvVsNfpwAQpQqmaPPQjwt5cQ5BciB2Y2x1RykUEUm98OkkpfZnD2aeLHsrr9T
         oBcvb4kSX18k+NUhdfMUqbnAKbRS96uRWh5FLqtU82RHZw1Kj7uQLbbq2rte/AFIsWT9
         Baj0VzqpEV4Ht1IrFgtThFoZvtuy8skcRIgYJTK6xz2QEmD7Ic/cItWKq8Z8Ufa9Gqgi
         JeJgC2F7zIP6462raYFc620PR3jXGW5rSyUkONhbu6Hg9uUE+NpUW0jMcmdBS4ZXX5x6
         zxquoXyFvAZ0fMBopAf7e5UOcLwDTgBiwESmuFVIgweNehZh0dsSywe1o/uQMRe+XcAZ
         18GQ==
X-Gm-Message-State: APjAAAVEPCxAF0eRnvZWunbmNs+Pi5DLXKaTJ7s9mybiUv9lnbpGWNnV
        5Z3OwfDlcDvKEzjMZwK999U=
X-Google-Smtp-Source: APXvYqwU0+e2HElYuzpSfzcE+GkiQ+aYFob/UzJgKWM7kOsJQF5Hz7OdHkC3zNnl3auyupNu142lyQ==
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr1349728wmj.115.1568786755902;
        Tue, 17 Sep 2019 23:05:55 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
        by smtp.gmail.com with ESMTPSA id a13sm11311194wrf.73.2019.09.17.23.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 23:05:55 -0700 (PDT)
Date:   Wed, 18 Sep 2019 08:05:53 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Patrick Bellasi <patrick.bellasi@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Sep 16 (kernel/sched/core.c)
Message-ID: <20190918060553.GA21173@gmail.com>
References: <20190916223850.GQ4352@sirena.co.uk>
 <1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org>
 <20190917075242.GB49590@gmail.com>
 <8736gv2gbv.fsf@arm.com>
 <30eb4c83-a90d-21aa-3f9e-4da8e66769ef@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30eb4c83-a90d-21aa-3f9e-4da8e66769ef@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Randy Dunlap <rdunlap@infradead.org> wrote:

> On 9/17/19 6:38 AM, Patrick Bellasi wrote:
> > 
> > On Tue, Sep 17, 2019 at 08:52:42 +0100, Ingo Molnar wrote...
> > 
> >> * Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >>> On 9/16/19 3:38 PM, Mark Brown wrote:
> >>>> Hi all,
> >>>>
> >>>> Changes since 20190915:
> >>>>
> >>>
> >>> on x86_64:
> >>>
> >>> when CONFIG_CGROUPS is not set:
> > 
> > Hi Randy,
> > thanks for the report.
> > 
> >>>   CC      kernel/sched/core.o
> >>> ../kernel/sched/core.c: In function ‘uclamp_update_active_tasks’:
> >>> ../kernel/sched/core.c:1081:23: error: storage size of ‘it’ isn’t known
> >>>   struct css_task_iter it;
> >>>                        ^~
> >>>   CC      kernel/printk/printk_safe.o
> >>> ../kernel/sched/core.c:1084:2: error: implicit declaration of function ‘css_task_iter_start’; did you mean ‘__sg_page_iter_start’? [-Werror=implicit-function-declaration]
> >>>   css_task_iter_start(css, 0, &it);
> >>>   ^~~~~~~~~~~~~~~~~~~
> >>>   __sg_page_iter_start
> >>> ../kernel/sched/core.c:1085:14: error: implicit declaration of function ‘css_task_iter_next’; did you mean ‘__sg_page_iter_next’? [-Werror=implicit-function-declaration]
> >>>   while ((p = css_task_iter_next(&it))) {
> >>>               ^~~~~~~~~~~~~~~~~~
> >>>               __sg_page_iter_next
> >>> ../kernel/sched/core.c:1091:2: error: implicit declaration of function ‘css_task_iter_end’; did you mean ‘get_task_cred’? [-Werror=implicit-function-declaration]
> >>>   css_task_iter_end(&it);
> >>>   ^~~~~~~~~~~~~~~~~
> >>>   get_task_cred
> >>> ../kernel/sched/core.c:1081:23: warning: unused variable ‘it’ [-Wunused-variable]
> >>>   struct css_task_iter it;
> >>>                        ^~
> >>>
> >>
> >> I cannot reproduce this build failue: I took Linus's latest which has all 
> >> the -next scheduler commits included (ad062195731b), and an x86-64 "make 
> >> defconfig" and a disabling of CONFIG_CGROUPS still resuls in a kernel 
> >> that builds fine.
> > 
> > Same here Ingo, I cannot reproduce on arm64 and !CONFIG_CGROUPS and
> > testing on tip/sched/core.
> > 
> > However, if you like, the following patch can make that code a
> > bit more "robust".
> > 
> > Best,
> > Patrick
> > 
> > ---8<---
> > From 7e17b7bb08dd8dfc57e01c2a7b6875439eb47cbe Mon Sep 17 00:00:00 2001
> > From: Patrick Bellasi <patrick.bellasi@arm.com>
> > Date: Tue, 17 Sep 2019 14:12:10 +0100
> > Subject: [PATCH 1/1] sched/core: uclamp: Fix compile error on !CONFIG_CGROUPS
> > 
> > Randy reported a compiler error on x86_64 and !CONFIG_CGROUPS which is due
> > to uclamp_update_active_tasks() using the undefined css_task_iter().
> > 
> > Since uclamp_update_active_tasks() is used only when cgroup support is
> > enabled, fix that by properly guarding that function at compile time.
> > 
> > Signed-off-by: Patrick Bellasi <patrick.bellasi@arm.com>
> > Link: https://lore.kernel.org/lkml/1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org/
> > Fixes: commit babbe170e05 ("sched/uclamp: Update CPU's refcount on TG's clamp changes")
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 
> Thanks.

Build failures like this one shouldn't depend on the compiler version - 
and it's still a mystery how and why this build bug triggered - we cannot 
apply the fix without knowing the answer to those questions.

Can you reproduce the build bug with Linus's latest tree? If not, which 
part of -next triggers the build failure?

Thanks,

	Ingo
