Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27EFA2ADA74
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 16:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbgKJPeL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 10:34:11 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44319 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730368AbgKJPeK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Nov 2020 10:34:10 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kcVeo-0004kU-LH; Tue, 10 Nov 2020 15:34:06 +0000
Subject: Re: [PATCH][next] cpumask: allocate enough space for string and
 trailing '\0' char
To:     paulmck@kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     Qian Cai <cai@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201109130447.2080491-1-colin.king@canonical.com>
 <737d5be9eb5af55b1a61bd8bfb49b1829a3ff916.camel@redhat.com>
 <e0458a3f-7635-bc80-9496-731bdfceed0d@windriver.com>
 <20201110152437.GS3249@paulmck-ThinkPad-P72>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <6050d075-52cc-d1b8-51c4-4d0dac62a42e@canonical.com>
Date:   Tue, 10 Nov 2020 15:34:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201110152437.GS3249@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/11/2020 15:24, Paul E. McKenney wrote:
> On Mon, Nov 09, 2020 at 11:57:15PM -0500, Paul Gortmaker wrote:
>>
>>
>> On 2020-11-09 8:07 p.m., Qian Cai wrote:
>>> On Mon, 2020-11-09 at 13:04 +0000, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> Currently the allocation of cpulist is based on the length of buf but does
>>>> not include the addition end of string '\0' terminator. Static analysis is
>>>> reporting this as a potential out-of-bounds access on cpulist. Fix this by
>>>> allocating enough space for the additional '\0' terminator.
>>>>
>>>> Addresses-Coverity: ("Out-of-bounds access")
>>>> Fixes: 65987e67f7ff ("cpumask: add "last" alias for cpu list specifications")
>>>
>>> Yeah, this bad commit also introduced KASAN errors everywhere and then will
>>> disable lockdep that makes our linux-next CI miserable. Confirmed that this
>>> patch will fix it.
>>
>> I appreciate the reports reminding me why I hate touching string handling.
>>
>> But let us not lose sight of why linux-next exists.  We want to
>> encourage code to appear there as a sounding board before it goes
>> mainline, so we can fix things and not pollute mainline git history
>> with those trivialities.
>>
>> If you've decided to internalize linux-next as part of your CI, then
>> great, but do note that does not elevate linux-next to some pristine
>> status for the world at large.  That only means you have to watch more
>> closely what is going on.
>>
>> If you want to declare linux-next unbreakable -- well that would scare
>> away others to get the multi-arch or multi-config coverage that they may
>> not be able to do themselves.  We are not going to do that.
>>
>> I have (hopefully) fixed the "bad commit" in v2 -- as part of the
>> implicit linux-next rule "you broke it, you better fix it ASAP".
>>
>> But "bad" and "miserable" can be things that might scare people off of
>> making use of linux-next for what it is meant to be for.  And I am not
>> OK with that.
> 
> They would need to use much stronger language to scare me off.  That said,
> what on earth is the point of running tests if they do not from time to
> time find bugs?  ;-)
> 
> 							Thanx, Paul

For me, part of the QA process is statically analyzing linux-next to
catch bugs before they land in linux. I think other testing is equally
worth while as catching bugs early saves time and money.

Colin

> 
>> Thanks,
>> Paul.
>> --
>>
>>>
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>   lib/cpumask.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/lib/cpumask.c b/lib/cpumask.c
>>>> index 34ecb3005941..cb8a3ef0e73e 100644
>>>> --- a/lib/cpumask.c
>>>> +++ b/lib/cpumask.c
>>>> @@ -185,7 +185,7 @@ int __ref cpulist_parse(const char *buf, struct cpumask
>>>> *dstp)
>>>>   {
>>>>   	int r;
>>>>   	char *cpulist, last_cpu[5];	/* NR_CPUS <= 9999 */
>>>> -	size_t len = strlen(buf);
>>>> +	size_t len = strlen(buf) + 1;
>>>>   	bool early = !slab_is_available();
>>>>   	if (!strcmp(buf, "all")) {
>>>

