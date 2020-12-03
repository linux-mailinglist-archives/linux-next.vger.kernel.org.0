Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C153B2CDC4D
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 18:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgLCRYc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 12:24:32 -0500
Received: from foss.arm.com ([217.140.110.172]:45838 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbgLCRYb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 12:24:31 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC90511D4;
        Thu,  3 Dec 2020 09:23:45 -0800 (PST)
Received: from [10.37.8.53] (unknown [10.37.8.53])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14A7F3F575;
        Thu,  3 Dec 2020 09:23:42 -0800 (PST)
Subject: Re: [PATCH v2] lib: stackdepot: Add support to configure
 STACK_HASH_SIZE
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
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
 <ff00097b-e547-185d-2a1a-ce0194629659@arm.com>
Message-ID: <55b7ba6e-6282-2cf6-c42c-272bdd23a607@arm.com>
Date:   Thu, 3 Dec 2020 17:26:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ff00097b-e547-185d-2a1a-ce0194629659@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 12/3/20 4:34 PM, Vincenzo Frascino wrote:
> Hi Andrey,
> 
> On 12/3/20 4:15 PM, Andrey Konovalov wrote:
>> On Thu, Dec 3, 2020 at 5:04 PM Qian Cai <qcai@redhat.com> wrote:
>>>
>>> On Thu, 2020-11-26 at 10:13 +0530, vjitta@codeaurora.org wrote:
>>>> From: Yogesh Lal <ylal@codeaurora.org>
>>>>
>>>> Add a kernel parameter stack_hash_order to configure STACK_HASH_SIZE.
>>>>
>>>> Aim is to have configurable value for STACK_HASH_SIZE, so that one
>>>> can configure it depending on usecase there by reducing the static
>>>> memory overhead.
>>>>
>>>> One example is of Page Owner, default value of STACK_HASH_SIZE lead
>>>> stack depot to consume 8MB of static memory. Making it configurable
>>>> and use lower value helps to enable features like CONFIG_PAGE_OWNER
>>>> without any significant overhead.
>>>>
>>>> Suggested-by: Minchan Kim <minchan@kernel.org>
>>>> Signed-off-by: Yogesh Lal <ylal@codeaurora.org>
>>>> Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
>>>
>>> Reverting this commit on today's linux-next fixed boot crash with KASAN.
>>>
>>> .config:
>>> https://cailca.coding.net/public/linux/mm/git/files/master/x86.config
>>> https://cailca.coding.net/public/linux/mm/git/files/master/arm64.config
>>
>> Vincenzo, Catalin, looks like this is the cause of the crash you
>> observed. Reverting this commit from next-20201203 fixes KASAN for me.
>>
>> Thanks for the report Qian!
>>
> 
> Thank you for this. I will try and let you know as well.
> 

Reverting the patch above works for me as well, and the problem seems to be the
order on which the initcalls are invoked. In fact stackdepot should be
initialized before kasan from what I can see.

-- 
Regards,
Vincenzo
