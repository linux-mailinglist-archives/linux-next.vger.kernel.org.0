Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA443EF5BA
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 00:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbhHQW1q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 18:27:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232453AbhHQW1p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Aug 2021 18:27:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CFB82604AC;
        Tue, 17 Aug 2021 22:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629239232;
        bh=yL+zHAtB3UEw3Ksld7rKWAvgYILgcAm9dclgUnd/MPA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ptVsGcNwnfOKkV5zz3+yKmAtZbByihq56gC4pKkihsGXYu8bELFnd95+CCXtrROVD
         F6m7vC0rFxYoBXfzmvjsTHSsmgxGot+/zQbPtYKPMc5goZDsRpouiimE0I3a6XPt+O
         Pdw06aSMUa6SQZwFR/M5Xlfkw5EkJXLYBDuLqAGHQ0DZFc7uh6kPgZT7CPVIPmZf0s
         YEViBlQXN28m8W7cFDUH9q/mYXlu9qJEfxZDkwcHRlGnx4svtCqI7Nx2RqUeQqc6Q7
         dYEQGGf1JaYR7lnoyRawv/W6CEiLmm8zccXOfz8EF3RYxNDAsSLK9gJKCyOpJZxdpP
         6nO76UKSJiEVg==
Subject: Re: [PATCH v2 2/3] pktgen: Add imix distribution bins
To:     Nick Richardson <richardsonnick@google.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, nrrichar@ncsu.edu,
        Philip Romanov <promanov@google.com>,
        Arun Kalyanasundaram <arunkaly@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Di Zhu <zhudi21@huawei.com>, Leesoo Ahn <dev@ooseel.net>,
        Ye Bin <yebin10@huawei.com>,
        Yejune Deng <yejune.deng@gmail.com>,
        Netdev <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20210810190159.4103778-1-richardsonnick@google.com>
 <20210810190159.4103778-3-richardsonnick@google.com>
 <CA+G9fYszRMoz-FKDJKzOuw7VkEyy-YQF1NR_0q4dc5Dpvb6ykw@mail.gmail.com>
 <CAGr-3gmgzr2KGJq5hBUzxEOhFp0_sibpY9HfXS5rMVwtSK16rg@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <4135e426-5a6f-c36a-d048-382c07f16b0a@kernel.org>
Date:   Tue, 17 Aug 2021 15:27:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAGr-3gmgzr2KGJq5hBUzxEOhFp0_sibpY9HfXS5rMVwtSK16rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/17/2021 3:17 PM, Nick Richardson wrote:
> On Wed, 11 Aug 2021 at 00:32, Nicholas Richardson
> <richardsonnick@google.com> wrote:
>>
>> From: Nick Richardson <richardsonnick@google.com>
>>
>> In order to represent the distribution of imix packet sizes, a
>> pre-computed data structure is used. It features 100 (IMIX_PRECISION)
>> "bins". Contiguous ranges of these bins represent the respective
>> packet size of each imix entry. This is done to avoid the overhead of
>> selecting the correct imix packet size based on the corresponding weights.
>>
>> Example:
>> imix_weights 40,7 576,4 1500,1
>> total_weight = 7 + 4 + 1 = 12
>>
>> pkt_size 40 occurs 7/total_weight = 58% of the time
>> pkt_size 576 occurs 4/total_weight = 33% of the time
>> pkt_size 1500 occurs 1/total_weight = 9% of the time
>>
>> We generate a random number between 0-100 and select the corresponding
>> packet size based on the specified weights.
>> Eg. random number = 358723895 % 100 = 65
>> Selects the packet size corresponding to index:65 in the pre-computed
>> imix_distribution array.
>> An example of the  pre-computed array is below:
>>
>> The imix_distribution will look like the following:
>> 0        ->  0 (index of imix_entry.size == 40)
>> 1        ->  0 (index of imix_entry.size == 40)
>> 2        ->  0 (index of imix_entry.size == 40)
>> [...]    ->  0 (index of imix_entry.size == 40)
>> 57       ->  0 (index of imix_entry.size == 40)
>> 58       ->  1 (index of imix_entry.size == 576)
>> [...]    ->  1 (index of imix_entry.size == 576)
>> 90       ->  1 (index of imix_entry.size == 576)
>> 91       ->  2 (index of imix_entry.size == 1500)
>> [...]    ->  2 (index of imix_entry.size == 1500)
>> 99       ->  2 (index of imix_entry.size == 1500)
>>
>> Create and use "bin" representation of the imix distribution.
>>
>> Signed-off-by: Nick Richardson <richardsonnick@google.com>
>> ---
>>   net/core/pktgen.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/net/core/pktgen.c b/net/core/pktgen.c
>> index a7e45eaccef7..ac1de15000e2 100644
>> --- a/net/core/pktgen.c
>> +++ b/net/core/pktgen.c
>> @@ -177,6 +177,7 @@
>>   #define MPLS_STACK_BOTTOM htonl(0x00000100)
>>   /* Max number of internet mix entries that can be specified in imix_weights. */
>>   #define MAX_IMIX_ENTRIES 20
>> +#define IMIX_PRECISION 100 /* Precision of IMIX distribution */
>>
>>   #define func_enter() pr_debug("entering %s\n", __func__);
>>
>> @@ -354,6 +355,8 @@ struct pktgen_dev {
>>          /* IMIX */
>>          unsigned int n_imix_entries;
>>          struct imix_pkt imix_entries[MAX_IMIX_ENTRIES];
>> +       /* Maps 0-IMIX_PRECISION range to imix_entry based on probability*/
>> +       __u8 imix_distribution[IMIX_PRECISION];
>>
>>          /* MPLS */
>>          unsigned int nr_labels; /* Depth of stack, 0 = no MPLS */
>> @@ -483,6 +486,7 @@ static void pktgen_stop_all_threads(struct pktgen_net *pn);
>>
>>   static void pktgen_stop(struct pktgen_thread *t);
>>   static void pktgen_clear_counters(struct pktgen_dev *pkt_dev);
>> +static void fill_imix_distribution(struct pktgen_dev *pkt_dev);
> 
> Linux next 20210813 tag arm builds failed due to following build errors.
> 
> Regressions found on arm:
> 
>   - build/gcc-10-ixp4xx_defconfig
>   - build/gcc-10-orion5x_defconfig
>   - build/gcc-10-multi_v5_defconfig
> 
> net/core/pktgen.c:489:13: warning: 'fill_imix_distribution' used but
> never defined
>   static void fill_imix_distribution(struct pktgen_dev *pkt_dev);
>               ^~~~~~~~~~~~~~~~~~~~~~
> ERROR: modpost: "fill_imix_distribution" [net/core/pktgen.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:150: modules-only.symvers] Error 1
> make[2]: *** Deleting file 'modules-only.symvers'
> make[2]: Target '__modpost' not remade because of errors.
> make[1]: *** [Makefile:1918: modules] Error 2
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Steps to reproduce:
> 
> # TuxMake is a command line tool and Python library that provides
> # portable and repeatable Linux kernel builds across a variety of
> # architectures, toolchains, kernel configurations, and make targets.
> #
> # TuxMake supports the concept of runtimes.
> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
> # that you install podman or docker on your system.
> #
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
> 
> tuxmake --runtime podman --target-arch arm --toolchain gcc-10
> --kconfig orion5x_defconfig
> 
> 
> On Sat, Aug 14, 2021 at 1:13 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
>>
>> On Wed, 11 Aug 2021 at 00:32, Nicholas Richardson
>> <richardsonnick@google.com> wrote:
>>>
>>> From: Nick Richardson <richardsonnick@google.com>
>>>
>>> In order to represent the distribution of imix packet sizes, a
>>> pre-computed data structure is used. It features 100 (IMIX_PRECISION)
>>> "bins". Contiguous ranges of these bins represent the respective
>>> packet size of each imix entry. This is done to avoid the overhead of
>>> selecting the correct imix packet size based on the corresponding weights.
>>>
>>> Example:
>>> imix_weights 40,7 576,4 1500,1
>>> total_weight = 7 + 4 + 1 = 12
>>>
>>> pkt_size 40 occurs 7/total_weight = 58% of the time
>>> pkt_size 576 occurs 4/total_weight = 33% of the time
>>> pkt_size 1500 occurs 1/total_weight = 9% of the time
>>>
>>> We generate a random number between 0-100 and select the corresponding
>>> packet size based on the specified weights.
>>> Eg. random number = 358723895 % 100 = 65
>>> Selects the packet size corresponding to index:65 in the pre-computed
>>> imix_distribution array.
>>> An example of the  pre-computed array is below:
>>>
>>> The imix_distribution will look like the following:
>>> 0        ->  0 (index of imix_entry.size == 40)
>>> 1        ->  0 (index of imix_entry.size == 40)
>>> 2        ->  0 (index of imix_entry.size == 40)
>>> [...]    ->  0 (index of imix_entry.size == 40)
>>> 57       ->  0 (index of imix_entry.size == 40)
>>> 58       ->  1 (index of imix_entry.size == 576)
>>> [...]    ->  1 (index of imix_entry.size == 576)
>>> 90       ->  1 (index of imix_entry.size == 576)
>>> 91       ->  2 (index of imix_entry.size == 1500)
>>> [...]    ->  2 (index of imix_entry.size == 1500)
>>> 99       ->  2 (index of imix_entry.size == 1500)
>>>
>>> Create and use "bin" representation of the imix distribution.
>>>
>>> Signed-off-by: Nick Richardson <richardsonnick@google.com>
>>> ---
>>>   net/core/pktgen.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 41 insertions(+)
>>>
>>> diff --git a/net/core/pktgen.c b/net/core/pktgen.c
>>> index a7e45eaccef7..ac1de15000e2 100644
>>> --- a/net/core/pktgen.c
>>> +++ b/net/core/pktgen.c
>>> @@ -177,6 +177,7 @@
>>>   #define MPLS_STACK_BOTTOM htonl(0x00000100)
>>>   /* Max number of internet mix entries that can be specified in imix_weights. */
>>>   #define MAX_IMIX_ENTRIES 20
>>> +#define IMIX_PRECISION 100 /* Precision of IMIX distribution */
>>>
>>>   #define func_enter() pr_debug("entering %s\n", __func__);
>>>
>>> @@ -354,6 +355,8 @@ struct pktgen_dev {
>>>          /* IMIX */
>>>          unsigned int n_imix_entries;
>>>          struct imix_pkt imix_entries[MAX_IMIX_ENTRIES];
>>> +       /* Maps 0-IMIX_PRECISION range to imix_entry based on probability*/
>>> +       __u8 imix_distribution[IMIX_PRECISION];
>>>
>>>          /* MPLS */
>>>          unsigned int nr_labels; /* Depth of stack, 0 = no MPLS */
>>> @@ -483,6 +486,7 @@ static void pktgen_stop_all_threads(struct pktgen_net *pn);
>>>
>>>   static void pktgen_stop(struct pktgen_thread *t);
>>>   static void pktgen_clear_counters(struct pktgen_dev *pkt_dev);
>>> +static void fill_imix_distribution(struct pktgen_dev *pkt_dev);
>>
>> Linux next 20210813 tag arm builds failed due to following build errors.
>>
>> Regressions found on arm:
>>
>>   - build/gcc-10-ixp4xx_defconfig
>>   - build/gcc-10-orion5x_defconfig
>>   - build/gcc-10-multi_v5_defconfig
>>
>> net/core/pktgen.c:489:13: warning: 'fill_imix_distribution' used but
>> never defined
>>   static void fill_imix_distribution(struct pktgen_dev *pkt_dev);
>>               ^~~~~~~~~~~~~~~~~~~~~~
>> ERROR: modpost: "fill_imix_distribution" [net/core/pktgen.ko] undefined!
>> make[2]: *** [scripts/Makefile.modpost:150: modules-only.symvers] Error 1
>> make[2]: *** Deleting file 'modules-only.symvers'
>> make[2]: Target '__modpost' not remade because of errors.
>> make[1]: *** [Makefile:1918: modules] Error 2
>>
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>>
>> Steps to reproduce:
>>
>> # TuxMake is a command line tool and Python library that provides
>> # portable and repeatable Linux kernel builds across a variety of
>> # architectures, toolchains, kernel configurations, and make targets.
>> #
>> # TuxMake supports the concept of runtimes.
>> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
>> # that you install podman or docker on your system.
>> #
>> # To install tuxmake on your system globally:
>> # sudo pip3 install -U tuxmake
>> #
>> # See https://docs.tuxmake.org/ for complete documentation.
>>
>> tuxmake --runtime podman --target-arch arm --toolchain gcc-10
>> --kconfig orion5x_defconfig
>>
>> --
>> Linaro LKFT
>> https://lkft.linaro.org
> 
> Thanks for the reply Naresh. Do you have any ideas on how to resolve
> this error? Pktgen already defines a couple of function prototypes
> before they are declared and that seems to be the cause of this error
> message.

The problem is that you declare and use fill_imix_distribution() 
unconditionally in the file but fill_imix_distribution() is only defined 
if CONFIG_XFRM is set, resulting in this error if CONFIG_XFRM is not set.

Should fill_imix_distribution() be moved out of that block or does it 
truly depend on CONFIG_XFRM? If it does, should the use of 
fill_imix_distribution() be guarded by CONFIG_XFRM as well?

Cheers,
Nathan
