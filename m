Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381E8261D91
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 21:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732326AbgIHTjB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 15:39:01 -0400
Received: from foss.arm.com ([217.140.110.172]:56482 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730955AbgIHPzg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 11:55:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2853E1045;
        Tue,  8 Sep 2020 08:47:15 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BD343F66E;
        Tue,  8 Sep 2020 08:47:13 -0700 (PDT)
References: <20200908205659.361b0a1b@canb.auug.org.au> <ddc76403-4b00-66ba-43ea-7889b9a32bb5@infradead.org> <CAKfTPtB-br6iKAMnofbPEmPVF-fpQpjkbXtfTcNkNzbc1Kdtug@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>
Subject: Re: linux-next: Tree for Sep 8 (sched/topology.c)
In-reply-to: <CAKfTPtB-br6iKAMnofbPEmPVF-fpQpjkbXtfTcNkNzbc1Kdtug@mail.gmail.com>
Date:   Tue, 08 Sep 2020 16:47:07 +0100
Message-ID: <jhj4ko86zk4.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 08/09/20 16:03, Vincent Guittot wrote:
> Adding Valentin as this seems related to the patch "sched/topology:
> Move sd_flag_debug out of linux/sched/topology.h"
>

Thanks!

>
> On Tue, 8 Sep 2020 at 16:48, Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 9/8/20 3:56 AM, Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > Changes since 20200903:
>> >
>>
>> on i386:
>>
>> ld: kernel/sched/topology.o: in function `cpu_attach_domain':
>> topology.c:(.text+0xf03): undefined reference to `sd_flag_debug'
>> ld: topology.c:(.text+0xf4f): undefined reference to `sd_flag_debug'
>> ld: topology.c:(.text+0xfc2): undefined reference to `sd_flag_debug'
>>

So that should be in sched_domain_debug_one() which only gets defined for
CONFIG_SCHED_DEBUG. Now, sd_flag_debug is:
- declared in include/linux/sched/topology.h if CONFIG_SCHED_DEBUG
- defined in kernel/sched/debug.c (only built if CONFIG_SCHED_DEBUG)

I've compile-tested this for arm64 & x86 (default configs + toggling
CONFIG_SCHED_DEBUG). UP can't be the cause because topology.c wouldn't even
be compiled then.

IIUC this is a build with CONFIG_SCHED_DEBUG but for some reason it doesn't
link with kernel/sched/debug.o?

>>
>> Full randconfig file is attached.
>>

I wanted to peek at that config, but can't find that email. The thread view
on lore [1] also shows it as AWOL; any chance you (or someone else) could
re-send it?

[1]: https://lore.kernel.org/lkml/20200908205659.361b0a1b@canb.auug.org.au/

>>
>> --
>> ~Randy
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
