Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A95835E518
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 19:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347223AbhDMRe5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 13:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347213AbhDMRe4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Apr 2021 13:34:56 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEEAC061574;
        Tue, 13 Apr 2021 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=xpSO+xq94QvGNhlGMdM1wlz2kyl/VCk0p4cfdbp7g4A=; b=Mu20lbxI0gOe4unYMORmtK7l13
        FkyHOEnNTN51ZY+DbwR3RBNrjQLDNcmkvPlRCpwKPOsDk7GNVKSUN92PUlp+Ru0EWltrJwHWh/FKk
        U5MepqsDvZcWlKdy2CQG0d3doX1xXXBWqCv5VW/fbrmVFKFoYHcHHecfJ0X0gnHIwjd6+T+demrQ1
        tHQCFeAsEYsIRkh0UhXQ339DE1NE5PzR5HYaWCUfHfzdwVyIu9/TrXWPOtP0dHytMAGwffm2T8CVN
        okjkfEXBROuqigbCk5kcVRusD+rwEHg0JrDIZ4Efmkcn069JuRnRsiHKz7vWQRrIUDijMStlIZkQr
        dRiDUpPg==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lWMvl-009yi6-Em; Tue, 13 Apr 2021 17:34:30 +0000
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
References: <20210409215103.03999588@canb.auug.org.au>
 <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
 <YHPlTifk6jST5auY@kernel.org>
 <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org>
 <YHR86T15BzETVHhk@kernel.org>
 <d56ebb95-1c40-5994-383f-70d8f226e8c3@infradead.org>
 <YHU03AIwrpHCUlU/@kernel.org>
 <7cec048d-26f0-104a-6bca-d9afc6a7d1e8@infradead.org>
 <YHXNyVVUwZbVDBrr@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7bc072c0-bf10-bd0f-95db-0f0a7db47b93@infradead.org>
Date:   Tue, 13 Apr 2021 10:34:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YHXNyVVUwZbVDBrr@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/13/21 9:58 AM, Mike Rapoport wrote:
> On Mon, Apr 12, 2021 at 11:21:48PM -0700, Randy Dunlap wrote:
>> On 4/12/21 11:06 PM, Mike Rapoport wrote:
>>> Hi Randy,
>>>
>>> On Mon, Apr 12, 2021 at 01:53:34PM -0700, Randy Dunlap wrote:
>>>> On 4/12/21 10:01 AM, Mike Rapoport wrote:
>>>>> On Mon, Apr 12, 2021 at 08:49:49AM -0700, Randy Dunlap wrote:
>>>>>  
>>>>> I thought about adding some prints to see what's causing the hang, the
>>>>> reservations or their absence. Can you replace the debug patch with this
>>>>> one:
>>>>>
>>>>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
>>>>> index 776fc9b3fafe..a10ac252dbcc 100644
>>>>> --- a/arch/x86/kernel/setup.c
>>>>> +++ b/arch/x86/kernel/setup.c
>>>>> @@ -600,10 +600,13 @@ static bool __init snb_gfx_workaround_needed(void)
>>>>>  		return false;
>>>>>  
>>>>>  	vendor = read_pci_config_16(0, 2, 0, PCI_VENDOR_ID);
>>>>> +	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
>>>>> +
>>>>> +	pr_info("%s: vendor: %x, device: %x\n", __func__, vendor, device);
>>>>
>>>> s/device)/devid)/
>>>  
>>> Oh, sorry.
>>>
>>>>> +
>>>>>  	if (vendor != 0x8086)
>>>>>  		return false;
>>>>>  
>>>>> -	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
>>>>>  	for (i = 0; i < ARRAY_SIZE(snb_ids); i++)
>>>>>  		if (devid == snb_ids[i])
>>>>>  			return true;
>>>>
>>>> That prints:
>>>>
>>>> [    0.000000] snb_gfx_workaround_needed: vendor: 8086, device: 126
>>>> [    0.000000] early_reserve_memory: snb_gfx: 1
>>>> ...
>>>> [    0.014061] snb_gfx_workaround_needed: vendor: 8086, device: 126
>>>> [    0.014064] reserving inaccessible SNB gfx pages
>>>>
>>>>
>>>> The full boot log is attached.
>>>  
>>> Can you please send the log with memblock=debug added to the kernel command
>>> line?
>>>
>>> Probably should have started from this...
>>>
>>
>> It's attached.
> 
> Honestly, I can't see any reason why moving these reservations around would
> cause your laptop to hang.
> Let's try moving the reservations back to their original place one by
> one, e.g something like this:
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 776fc9b3fafe..892ad20b8557 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -632,12 +632,6 @@ static void __init trim_snb_memory(void)
>  
>  	printk(KERN_DEBUG "reserving inaccessible SNB gfx pages\n");
>  
> -	/*
> -	 * Reserve all memory below the 1 MB mark that has not
> -	 * already been reserved.
> -	 */
> -	memblock_reserve(0, 1<<20);
> -	
>  	for (i = 0; i < ARRAY_SIZE(bad_pages); i++) {
>  		if (memblock_reserve(bad_pages[i], PAGE_SIZE))
>  			printk(KERN_WARNING "failed to reserve 0x%08lx\n",
> @@ -1081,6 +1075,12 @@ void __init setup_arch(char **cmdline_p)
>  
>  	reserve_real_mode();
>  
> +	/*
> +	 * Reserve all memory below the 1 MB mark that has not
> +	 * already been reserved.
> +	 */
> +	memblock_reserve(0, 1<<20);
> +
>  	init_mem_mapping();
>  
>  	idt_setup_early_pf();
> 

Mike,
That works.

Please send the next test.

-- 
~Randy

