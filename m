Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9EF93001CE
	for <lists+linux-next@lfdr.de>; Fri, 22 Jan 2021 12:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbhAVLms (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Jan 2021 06:42:48 -0500
Received: from foss.arm.com ([217.140.110.172]:43122 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727534AbhAVLmn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Jan 2021 06:42:43 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78A3711D4;
        Fri, 22 Jan 2021 03:41:57 -0800 (PST)
Received: from [10.37.8.28] (unknown [10.37.8.28])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D9553F719;
        Fri, 22 Jan 2021 03:41:55 -0800 (PST)
Subject: Re: rcu-torture: Internal error: Oops: 96000006
To:     Mark Rutland <mark.rutland@arm.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Will Deacon <will@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        rcu@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, catalin.marinas@arm.com,
        linux-arm-kernel@lists.infradead.org
References: <CA+G9fYvV5SZ47M-XpABya11okgR7BJQk-3dDuFWzgVmGN3Lurg@mail.gmail.com>
 <20210121185521.GQ2743@paulmck-ThinkPad-P72>
 <20210121213110.GB23234@willie-the-truck>
 <20210121214314.GW2743@paulmck-ThinkPad-P72>
 <20210122095925.GA29124@C02TD0UTHF1T.local>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <07a8f455-8414-979e-3e1a-cbc63357acb6@arm.com>
Date:   Fri, 22 Jan 2021 11:45:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122095925.GA29124@C02TD0UTHF1T.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 1/22/21 10:02 AM, Mark Rutland wrote:
> On Thu, Jan 21, 2021 at 01:43:14PM -0800, Paul E. McKenney wrote:
>> On Thu, Jan 21, 2021 at 09:31:10PM +0000, Will Deacon wrote:
>>> On Thu, Jan 21, 2021 at 10:55:21AM -0800, Paul E. McKenney wrote:
>>>> On Thu, Jan 21, 2021 at 10:37:21PM +0530, Naresh Kamboju wrote:
>>>>> While running rcu-torture test on qemu_arm64 and arm64 Juno-r2 device
>>>>> the following kernel crash noticed. This started happening from Linux next
>>>>> next-20210111 tag to next-20210121.
>>>>>
>>>>> metadata:
>>>>>   git branch: master
>>>>>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>>>>>   git describe: next-20210111
>>>>>   kernel-config: https://builds.tuxbuild.com/1muTTn7AfqcWvH5x2Alxifn7EUH/config
>>>>>
>>>>> output log:
>>>>>
>>>>> [  621.538050] mem_dump_obj() slab test: rcu_torture_stats =
>>>>> ffff0000c0a3ac40, &rhp = ffff800012debe40, rhp = ffff0000c8cba000, &z
>>>>> = ffff8000091ab8e0
>>>>> [  621.546662] mem_dump_obj(ZERO_SIZE_PTR):
>>>>> [  621.546696] Unable to handle kernel NULL pointer dereference at
>>>>> virtual address 0000000000000008
>>>
>>> [...]
>>>
>>>> Huh.  I am relying on virt_addr_valid() rejecting NULL pointers and
>>>> things like ZERO_SIZE_PTR, which is defined as ((void *)16).  It looks
>>>> like your configuration rejects NULL as an invalid virtual address,
>>>> but does not reject ZERO_SIZE_PTR.  Is this the intent, given that you
>>>> are not allowed to dereference a ZERO_SIZE_PTR?
>>>>
>>>> Adding the ARM64 guys on CC for their thoughts.
>>>
>>> Spooky timing, there was a thread _today_ about that:
>>>
>>> https://lore.kernel.org/r/ecbc7651-82c4-6518-d4a9-dbdbdf833b5b@arm.com
>>
>> Very good, then my workaround (shown below for Naresh's ease of testing)
>> is only a short-term workaround.  Yay!  ;-)
> 
> Hopefully, though we might need to check other architectures beyond
> arm64, ppc, and x86, to be certain!
> 

Which other architectures do you propose to verify?

> Is there any other latent use of virt_addr_valid() that needs this
> semantic? If so we'll probably want to backport the changes to arm64's
> implementation, at least for v5.10.
> 
> Vincenzo, would you mind taking a look?
> 

I am happy to have a look at it, but due to previous commitments I will be able
to get at it after -rc1. A quick grep shows that there are ~32 cases that might
be affected by the same semantic in the common code (left out arch/ and
drivers/). I will post the improvement for arm64 in the meantime though.

> Thanks,
> Mark.
> 

-- 
Regards,
Vincenzo
