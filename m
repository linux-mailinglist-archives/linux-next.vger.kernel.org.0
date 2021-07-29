Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313B93DAB97
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 21:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhG2TFP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 15:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:56068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229713AbhG2TFP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jul 2021 15:05:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FF2660EC0;
        Thu, 29 Jul 2021 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627585512;
        bh=PyoadivhHXDqsmQj3YmT7k4+9dotZZVfqKpaviYYOck=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Dn/OvyNArRhQbbCEd2H4nvwmS581p+a+2JtYmrCXNKEx2O8tYW2gBhr+3CRePInee
         x+CRdLm0qkg6bdKHFXf3JYllMdfwWrUWxC+Vj7dD8BvM5LAt/6xcF460ije8zqiub+
         c+U5JSDEhvey+UK05ve9XitHscev51by0be8C2tAWzOoq7aYiHZEJf+P+WU7jrj1NJ
         4SMu71SXy4aoqdmHz8FbCBa1xNczweOCky6E+L7pt+Oa/i7Sw8hO0d/45r4HkUGygd
         dRnP868EZJA4rZSJMR8C/b86pWHmWRekTSJGLBtPqQQR1DBJgiOIFyFg2ITox0Q7C9
         V0rVcujxWxKtw==
Subject: Re: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Will Deacon <will@kernel.org>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org,
        Claire Chang <tientzu@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org
References: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
 <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
 <20210729161335.GA22016@willie-the-truck> <YQLY0RHa/3YgJdmS@fedora>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <ec7c2fa6-3ad0-d3f6-67a2-b089310eabdf@kernel.org>
Date:   Thu, 29 Jul 2021 12:05:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQLY0RHa/3YgJdmS@fedora>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/29/2021 9:35 AM, Konrad Rzeszutek Wilk wrote:
> On Thu, Jul 29, 2021 at 05:13:36PM +0100, Will Deacon wrote:
>> On Wed, Jul 28, 2021 at 10:35:34AM -0700, Nathan Chancellor wrote:
>>> On Wed, Jul 28, 2021 at 01:31:06PM +0530, Sachin Sant wrote:
>>>> next-20210723 was good. The boot failure seems to have been introduced with next-20210726.
>>>>
>>>> I have attached the boot log.
>>>
>>> I noticed this with OpenSUSE's ppc64le config [1] and my bisect landed on
>>> commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()"). That
>>> series just keeps on giving...
> 
> Low-level across platform do that. And thank you for testing it and
> finding this bug. Please let me know if the patch works so I can add it
> in in the patch series.

That was not meant to sound as sarcastic as it did so my apologies for 
that :(

Will's patch looks good to me in QEMU, I do not have a bare metal POWER 
system to test it on.

Tested-by: Nathan Chancellor <nathan@kernel.org>

>>
>> Yes, but look how handy our new print is!
> 
> :)
>>
>> [    0.010799] software IO TLB: tearing down default memory pool
>> [    0.010805] ------------[ cut here ]------------
>> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
>>
>> Following Nick's suggestion, the diff below should help? I don't have a
>> relevant box on which I can test it though.
>>
>> Will
>>
>> --->8
>>
>> diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
>> index 1d829e257996..87f001b4c4e4 100644
>> --- a/arch/powerpc/platforms/pseries/svm.c
>> +++ b/arch/powerpc/platforms/pseries/svm.c
>> @@ -63,6 +63,9 @@ void __init svm_swiotlb_init(void)
>>   
>>   int set_memory_encrypted(unsigned long addr, int numpages)
>>   {
>> +       if (!mem_encrypt_active())
>> +               return 0;
>> +
>>          if (!PAGE_ALIGNED(addr))
>>                  return -EINVAL;
>>   
>> @@ -73,6 +76,9 @@ int set_memory_encrypted(unsigned long addr, int numpages)
>>   
>>   int set_memory_decrypted(unsigned long addr, int numpages)
>>   {
>> +       if (!mem_encrypt_active())
>> +               return 0;
>> +
>>          if (!PAGE_ALIGNED(addr))
>>                  return -EINVAL;
>>   
