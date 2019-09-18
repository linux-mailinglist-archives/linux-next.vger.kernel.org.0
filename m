Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B0BB6100
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 12:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbfIRKDH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 18 Sep 2019 06:03:07 -0400
Received: from foss.arm.com ([217.140.110.172]:38570 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728941AbfIRKDG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Sep 2019 06:03:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41EC4337;
        Wed, 18 Sep 2019 03:03:06 -0700 (PDT)
Received: from e110439-lin (e110439-lin.cambridge.arm.com [10.1.194.43])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BAB93F59C;
        Wed, 18 Sep 2019 03:03:05 -0700 (PDT)
References: <20190916223850.GQ4352@sirena.co.uk> <1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org> <20190917075242.GB49590@gmail.com> <8736gv2gbv.fsf@arm.com> <30eb4c83-a90d-21aa-3f9e-4da8e66769ef@infradead.org> <20190918060553.GA21173@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Patrick Bellasi <patrick.bellasi@arm.com>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Sep 16 (kernel/sched/core.c)
In-reply-to: <20190918060553.GA21173@gmail.com>
Date:   Wed, 18 Sep 2019 11:03:02 +0100
Message-ID: <87y2yl2a7d.fsf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On Wed, Sep 18, 2019 at 07:05:53 +0100, Ingo Molnar wrote...

> * Randy Dunlap <rdunlap@infradead.org> wrote:
>
>> On 9/17/19 6:38 AM, Patrick Bellasi wrote:
>> > 
>> > On Tue, Sep 17, 2019 at 08:52:42 +0100, Ingo Molnar wrote...
>> > 
>> >> * Randy Dunlap <rdunlap@infradead.org> wrote:
>> >>
>> >>> On 9/16/19 3:38 PM, Mark Brown wrote:
>> >>>> Hi all,
>> >>>>
>> >>>> Changes since 20190915:
>> >>>>
>> >>>
>> >>> on x86_64:
>> >>>
>> >>> when CONFIG_CGROUPS is not set:
>> > 
>> > Hi Randy,
>> > thanks for the report.
>> > 
>> >>>   CC      kernel/sched/core.o
>> >>> ../kernel/sched/core.c: In function ‘uclamp_update_active_tasks’:
>> >>> ../kernel/sched/core.c:1081:23: error: storage size of ‘it’ isn’t known
>> >>>   struct css_task_iter it;
>> >>>                        ^~
>> >>>   CC      kernel/printk/printk_safe.o
>> >>> ../kernel/sched/core.c:1084:2: error: implicit declaration of function ‘css_task_iter_start’; did you mean ‘__sg_page_iter_start’? [-Werror=implicit-function-declaration]
>> >>>   css_task_iter_start(css, 0, &it);
>> >>>   ^~~~~~~~~~~~~~~~~~~
>> >>>   __sg_page_iter_start
>> >>> ../kernel/sched/core.c:1085:14: error: implicit declaration of function ‘css_task_iter_next’; did you mean ‘__sg_page_iter_next’? [-Werror=implicit-function-declaration]
>> >>>   while ((p = css_task_iter_next(&it))) {
>> >>>               ^~~~~~~~~~~~~~~~~~
>> >>>               __sg_page_iter_next
>> >>> ../kernel/sched/core.c:1091:2: error: implicit declaration of function ‘css_task_iter_end’; did you mean ‘get_task_cred’? [-Werror=implicit-function-declaration]
>> >>>   css_task_iter_end(&it);
>> >>>   ^~~~~~~~~~~~~~~~~
>> >>>   get_task_cred
>> >>> ../kernel/sched/core.c:1081:23: warning: unused variable ‘it’ [-Wunused-variable]
>> >>>   struct css_task_iter it;
>> >>>                        ^~
>> >>>
>> >>
>> >> I cannot reproduce this build failue: I took Linus's latest which has all 
>> >> the -next scheduler commits included (ad062195731b), and an x86-64 "make 
>> >> defconfig" and a disabling of CONFIG_CGROUPS still resuls in a kernel 
>> >> that builds fine.
>> > 
>> > Same here Ingo, I cannot reproduce on arm64 and !CONFIG_CGROUPS and
>> > testing on tip/sched/core.
>> > 
>> > However, if you like, the following patch can make that code a
>> > bit more "robust".
>> > 
>> > Best,
>> > Patrick
>> > 
>> > ---8<---
>> > From 7e17b7bb08dd8dfc57e01c2a7b6875439eb47cbe Mon Sep 17 00:00:00 2001
>> > From: Patrick Bellasi <patrick.bellasi@arm.com>
>> > Date: Tue, 17 Sep 2019 14:12:10 +0100
>> > Subject: [PATCH 1/1] sched/core: uclamp: Fix compile error on !CONFIG_CGROUPS
>> > 
>> > Randy reported a compiler error on x86_64 and !CONFIG_CGROUPS which is due
>> > to uclamp_update_active_tasks() using the undefined css_task_iter().
>> > 
>> > Since uclamp_update_active_tasks() is used only when cgroup support is
>> > enabled, fix that by properly guarding that function at compile time.
>> > 
>> > Signed-off-by: Patrick Bellasi <patrick.bellasi@arm.com>
>> > Link: https://lore.kernel.org/lkml/1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org/
>> > Fixes: commit babbe170e05 ("sched/uclamp: Update CPU's refcount on TG's clamp changes")
>> 
>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>> 
>> Thanks.
>
> Build failures like this one shouldn't depend on the compiler version - 
> and it's still a mystery how and why this build bug triggered - we cannot 
> apply the fix without knowing the answer to those questions.

Right, but it's also quite strange it's not triggering without the
guarding above. The only definition of struct css_task_iter I can see is
the one
provided in:

   include/linux/cgroup.h:50
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/cgroup.h?h=35f7a95266153b1cf0caca3aa9661cb721864527#n50

which is CONFIG_CGROUPS guarded.

> Can you reproduce the build bug with Linus's latest tree? If not, which 
> part of -next triggers the build failure?

I tried again using this morning's Linus tree headed at:

  commit 35f7a9526615 ("Merge tag 'devprop-5.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")

and compilation actually fails for me too.

Everything is fine in v5.3 with !CONFIG_CGROUPS and a git bisect
between v5.3 and Linus master points to:

  commit babbe170e053c ("sched/uclamp: Update CPU's refcount on TG's clamp changes")

So, I think it's really my fault not properly testing !CONFIG_CGROUP,
which is enforced by default from CONFIG_SCHED_AUTOGROUP.

The patch above fixes the compilation error, hope this helps.

Cheers,
Patrick

-- 
#include <best/regards.h>

Patrick Bellasi
