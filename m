Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B64C2CDB4B
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 17:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731333AbgLCQbu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 11:31:50 -0500
Received: from foss.arm.com ([217.140.110.172]:44666 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731154AbgLCQbu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 11:31:50 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17AF611D4;
        Thu,  3 Dec 2020 08:31:04 -0800 (PST)
Received: from [10.37.8.53] (unknown [10.37.8.53])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BE0E3F575;
        Thu,  3 Dec 2020 08:31:01 -0800 (PST)
Subject: Re: [PATCH v2] lib: stackdepot: Add support to configure
 STACK_HASH_SIZE
To:     Andrey Konovalov <andreyknvl@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     vjitta@codeaurora.org, Minchan Kim <minchan@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Mark Brown <broonie@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>, ylal@codeaurora.org,
        vinmenon@codeaurora.org, kasan-dev <kasan-dev@googlegroups.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Qian Cai <qcai@redhat.com>
References: <1606365835-3242-1-git-send-email-vjitta@codeaurora.org>
 <7733019eb8c506eee8d29e380aae683a8972fd19.camel@redhat.com>
 <CAAeHK+w_avr_X2OJ5dm6p6nXQZMvcaAiLCQaF+EWna+7nQxVhg@mail.gmail.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <ff00097b-e547-185d-2a1a-ce0194629659@arm.com>
Date:   Thu, 3 Dec 2020 16:34:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+w_avr_X2OJ5dm6p6nXQZMvcaAiLCQaF+EWna+7nQxVhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Andrey,

On 12/3/20 4:15 PM, Andrey Konovalov wrote:
> On Thu, Dec 3, 2020 at 5:04 PM Qian Cai <qcai@redhat.com> wrote:
>>
>> On Thu, 2020-11-26 at 10:13 +0530, vjitta@codeaurora.org wrote:
>>> From: Yogesh Lal <ylal@codeaurora.org>
>>>
>>> Add a kernel parameter stack_hash_order to configure STACK_HASH_SIZE.
>>>
>>> Aim is to have configurable value for STACK_HASH_SIZE, so that one
>>> can configure it depending on usecase there by reducing the static
>>> memory overhead.
>>>
>>> One example is of Page Owner, default value of STACK_HASH_SIZE lead
>>> stack depot to consume 8MB of static memory. Making it configurable
>>> and use lower value helps to enable features like CONFIG_PAGE_OWNER
>>> without any significant overhead.
>>>
>>> Suggested-by: Minchan Kim <minchan@kernel.org>
>>> Signed-off-by: Yogesh Lal <ylal@codeaurora.org>
>>> Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
>>
>> Reverting this commit on today's linux-next fixed boot crash with KASAN.
>>
>> .config:
>> https://cailca.coding.net/public/linux/mm/git/files/master/x86.config
>> https://cailca.coding.net/public/linux/mm/git/files/master/arm64.config
> 
> Vincenzo, Catalin, looks like this is the cause of the crash you
> observed. Reverting this commit from next-20201203 fixes KASAN for me.
> 
> Thanks for the report Qian!
>

Thank you for this. I will try and let you know as well.

>>> ---
>>>  lib/stackdepot.c | 27 ++++++++++++++++++++++-----
>>>  1 file changed, 22 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
>>> index 81c69c0..ce53598 100644
>>> --- a/lib/stackdepot.c
>>> +++ b/lib/stackdepot.c
>>> @@ -141,14 +141,31 @@ static struct stack_record *depot_alloc_stack(unsigned long *entries, int size,
>>>       return stack;
>>>  }
>>>
>>> -#define STACK_HASH_ORDER 20
>>> -#define STACK_HASH_SIZE (1L << STACK_HASH_ORDER)
>>> +static unsigned int stack_hash_order = 20;
>>> +#define STACK_HASH_SIZE (1L << stack_hash_order)
>>>  #define STACK_HASH_MASK (STACK_HASH_SIZE - 1)
>>>  #define STACK_HASH_SEED 0x9747b28c
>>>
>>> -static struct stack_record *stack_table[STACK_HASH_SIZE] = {
>>> -     [0 ...  STACK_HASH_SIZE - 1] = NULL
>>> -};
>>> +static struct stack_record **stack_table;
>>> +
>>> +static int __init setup_stack_hash_order(char *str)
>>> +{
>>> +     kstrtouint(str, 0, &stack_hash_order);
>>> +     return 0;
>>> +}
>>> +early_param("stack_hash_order", setup_stack_hash_order);
>>> +
>>> +static int __init init_stackdepot(void)
>>> +{
>>> +     int i;
>>> +
>>> +     stack_table = kvmalloc(sizeof(struct stack_record *) * STACK_HASH_SIZE, GFP_KERNEL);
>>> +     for (i = 0; i < STACK_HASH_SIZE; i++)
>>> +             stack_table[i] = NULL;
>>> +     return 0;
>>> +}
>>> +
>>> +early_initcall(init_stackdepot);
>>>
>>>  /* Calculate hash for a stack */
>>>  static inline u32 hash_stack(unsigned long *entries, unsigned int size)
>>
>> --
>> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/7733019eb8c506eee8d29e380aae683a8972fd19.camel%40redhat.com.

-- 
Regards,
Vincenzo
