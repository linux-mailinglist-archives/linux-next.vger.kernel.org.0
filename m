Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704F03B3FEA
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 11:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhFYJFN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 05:05:13 -0400
Received: from foss.arm.com ([217.140.110.172]:50704 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229839AbhFYJFM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 25 Jun 2021 05:05:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA2A731B;
        Fri, 25 Jun 2021 02:02:51 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6DE63F719;
        Fri, 25 Jun 2021 02:02:50 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc:     Bharata B Rao <bharata@linux.ibm.com>, linux-next@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: PowerPC guest getting "BUG: scheduling while atomic" on linux-next-20210623 during secondary CPUs bringup
In-Reply-To: <YNWFiZii+MINhUC3@hirez.programming.kicks-ass.net>
References: <YNSq3UQTjm6HWELA@in.ibm.com> <20210625054608.fmwt7lxuhp7inkjx@linux.vnet.ibm.com> <YNWFiZii+MINhUC3@hirez.programming.kicks-ass.net>
Date:   Fri, 25 Jun 2021 10:02:45 +0100
Message-ID: <87k0mi8gga.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 25/06/21 09:28, Peter Zijlstra wrote:
> On Fri, Jun 25, 2021 at 11:16:08AM +0530, Srikar Dronamraju wrote:
>> Bharata,
>>
>> I think the regression is due to Commit f1a0a376ca0c ("sched/core:
>> Initialize the idle task with preemption disabled")
>
> So that extra preempt_disable() that got removed would've incremented it
> to 1 and then things would've been fine.
>
> Except.. Valentin changed things such that preempt_count() should've
> been inittialized to 1, instead of 0, but for some raisin that didn't
> stick.. what gives.
>
> So we have init_idle(p) -> init_idle_preempt_count(p) ->
> task_thread_info(p)->preempt_count = PREEMPT_DISABLED;
>
> But somehow, by the time you're running start_secondary(), that's gotten
> to be 0 again. Does DEBUG_PREEMPT give more clues?

Given the preempt_count isn't reset between hotplugs anymore, you might be
able to find the culprit with a hotplug cycle and ftrace with
trace_prempt_off and trace_preempt_on events (requires PREEMPT_TRACER
IIRC).

It's doable at boot time too, but that will mean sifting through many more
events than you'd like...
