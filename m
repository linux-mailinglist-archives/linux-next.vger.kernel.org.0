Return-Path: <linux-next+bounces-3595-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C0696C3E1
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 18:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120691C20E5B
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 16:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3CE1DFE0F;
	Wed,  4 Sep 2024 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROivptP+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F081DFE0B;
	Wed,  4 Sep 2024 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725466738; cv=none; b=BnDmt4sc03OevUNFm8+Mrs5Ps3BdGrSk8NlqvfPFFb9o/25u01+tWkNYfLD9xCnpUkJrFEp/BCjb4QNsqRShqnyk5lySbWT9GVhKOJD6c0TnHGPwmTBj193b7bw1LG9dDx/fckCeFambeXoxI5zX9SDr+PfbqRqAXfqXuk87Pyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725466738; c=relaxed/simple;
	bh=0bKyW3fD0KF6qrF+/e2zTkbWl5tvvBYdeZlv0lyicxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DXnD3+rd5uMPmK0pQ8xW2eB7qN/gqZTcc6a0x6yYkUmngg/nkpKddS2WGuCLrYbxEVkywwiJwIRHsmWPg/2sT5nn//KW0PMjTZAfztPwPUjvEDxDuuut24PWhErJjQXYh9fwAf9cauLKwWvNyrh4aJitcojo7FeCLv1h3YNCxvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROivptP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D249FC4CEC5;
	Wed,  4 Sep 2024 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725466738;
	bh=0bKyW3fD0KF6qrF+/e2zTkbWl5tvvBYdeZlv0lyicxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROivptP+CrJ38Sw1vOjLCyIuYylERI7RMhwkI5IUtIucs2vPKum0FWDcx1RnJj/4K
	 /Udyk3HKvxddBaTAnWfoQPdA11A6tUUIMQvCVCD+tiZ2kEDdyQZt67ps1fgvI//q91
	 Tkya6/k6RTRMCRMrRiffxYvKtaYUywX6W8/fpkigXw1Eux6mbue3ibD2jSuHH/WKMo
	 F9wqP+Y7Dqquw7ffkPZ/bhvKqj0B6M2kY41FSfPv4NeuPnIm7FAhXL4Mjx939evRTI
	 sjfXaxuZUi0cyUBfuKCabcv1Fzhb/WF8sQP/YXvQPnahHy+lQv9NMdMuWsp56QW0Xv
	 1ybbzMxSMv5QQ==
Message-ID: <04992d68-5cf7-4376-85a6-588a4c26a82c@kernel.org>
Date: Thu, 5 Sep 2024 01:18:42 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the extcon tree
To: Hans de Goede <hdegoede@redhat.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Chanwoo Choi
 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240904152421.4e0ad2b7@canb.auug.org.au>
 <f31f8bea-95da-4d32-afe0-9c2abc69d833@redhat.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Content-Language: en-US
In-Reply-To: <f31f8bea-95da-4d32-afe0-9c2abc69d833@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

24. 9. 4. 18:24에 Hans de Goede 이(가) 쓴 글:
> Hi all,
> 
> On 9/4/24 7:24 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the extcon tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/extcon/extcon-lc824206xa.c:413:22: error: initialization of 'unsigned int' from 'const enum power_supply_usb_type *' makes integer from pointer without a cast [-Wint-conversion]
>>   413 |         .usb_types = lc824206xa_psy_usb_types,
>>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/extcon/extcon-lc824206xa.c:413:22: note: (near initialization for 'lc824206xa_psy_desc.usb_types')
>> drivers/extcon/extcon-lc824206xa.c:413:22: error: initializer element is not computable at load time
>> drivers/extcon/extcon-lc824206xa.c:413:22: note: (near initialization for 'lc824206xa_psy_desc.usb_types')
>> drivers/extcon/extcon-lc824206xa.c:414:10: error: 'const struct power_supply_desc' has no member named 'num_usb_types'; did you mean 'usb_types'?
>>   414 |         .num_usb_types = ARRAY_SIZE(lc824206xa_psy_usb_types),
>>       |          ^~~~~~~~~~~~~
>>       |          usb_types
>> In file included from include/linux/kernel.h:16,
>>                  from include/linux/cpumask.h:11,
>>                  from arch/x86/include/asm/paravirt.h:21,
>>                  from arch/x86/include/asm/cpuid.h:62,
>>                  from arch/x86/include/asm/processor.h:19,
>>                  from include/linux/sched.h:13,
>>                  from include/linux/delay.h:23,
>>                  from drivers/extcon/extcon-lc824206xa.c:20:
>> include/linux/array_size.h:11:25: error: initialization of 'const enum power_supply_property *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
>>    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>>       |                         ^
>> drivers/extcon/extcon-lc824206xa.c:414:26: note: in expansion of macro 'ARRAY_SIZE'
>>   414 |         .num_usb_types = ARRAY_SIZE(lc824206xa_psy_usb_types),
>>       |                          ^~~~~~~~~~
>> include/linux/array_size.h:11:25: note: (near initialization for 'lc824206xa_psy_desc.properties')
>>    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>>       |                         ^
>> drivers/extcon/extcon-lc824206xa.c:414:26: note: in expansion of macro 'ARRAY_SIZE'
>>   414 |         .num_usb_types = ARRAY_SIZE(lc824206xa_psy_usb_types),
>>       |                          ^~~~~~~~~~
>>
>> Caused by commit
>>
>>   e508f2606c0b ("extcon: Add LC824206XA microUSB switch driver")
>>
>> interatcing with commit
>>
>>   364ea7ccaef9 ("power: supply: Change usb_types from an array into a bitmask")
>>
>> from the battery tree.
> 
> Since I'm the author of both commits this is my bad, sorry.
> 
> Stephen, thank you for fixing this in -next.
> 
> Chanwoo, Sebastian send a pull-request for an immutable branch with
> these changes:
> 
> https://lore.kernel.org/linux-pm/ez5ja55dl7w7ynq2wv4efsvvqtk4xyalf4k6agtsuhpgrtlpg3@d6ghlle4cu2q/
> 
> Can you please merge the ib-psy-usb-types-signed tag into
> extcon.git/extcon-next and then apply Stephen's fix so that Linus
> does not get hit by this build error when he merges the extcon
> changes for 6.12 ?

I pulled "tags/ib-psy-usb-types-signed" and pushed it to extcon.git
- git pull git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git tags/ib-psy-usb-types-signed

And I send the fix-up mail as following:
https://lkml.org/lkml/2024/9/5/13

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> I have applied the following merge fix patch.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Wed, 4 Sep 2024 15:19:19 +1000
>> Subject: [PATCH] fix up for "extcon: Add LC824206XA microUSB switch driver"
>>
>> interacting with "power: supply: Change usb_types from an array into a
>> bitmask" from het battery tree.
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  drivers/extcon/extcon-lc824206xa.c | 15 +++++----------
>>  1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/extcon/extcon-lc824206xa.c b/drivers/extcon/extcon-lc824206xa.c
>> index d58a2c369018..56938748aea8 100644
>> --- a/drivers/extcon/extcon-lc824206xa.c
>> +++ b/drivers/extcon/extcon-lc824206xa.c
>> @@ -393,14 +393,6 @@ static int lc824206xa_psy_get_prop(struct power_supply *psy,
>>  	return 0;
>>  }
>>  
>> -static const enum power_supply_usb_type lc824206xa_psy_usb_types[] = {
>> -	POWER_SUPPLY_USB_TYPE_SDP,
>> -	POWER_SUPPLY_USB_TYPE_CDP,
>> -	POWER_SUPPLY_USB_TYPE_DCP,
>> -	POWER_SUPPLY_USB_TYPE_ACA,
>> -	POWER_SUPPLY_USB_TYPE_UNKNOWN,
>> -};
>> -
> 
>>  static const enum power_supply_property lc824206xa_psy_props[] = {
>>  	POWER_SUPPLY_PROP_ONLINE,
>>  	POWER_SUPPLY_PROP_USB_TYPE,
>> @@ -410,8 +402,11 @@ static const enum power_supply_property lc824206xa_psy_props[] = {
>>  static const struct power_supply_desc lc824206xa_psy_desc = {
>>  	.name = "lc824206xa-charger-detect",
>>  	.type = POWER_SUPPLY_TYPE_USB,
>> -	.usb_types = lc824206xa_psy_usb_types,
>> -	.num_usb_types = ARRAY_SIZE(lc824206xa_psy_usb_types),
>> +	.usb_types = BIT(POWER_SUPPLY_USB_TYPE_SDP) |
>> +		     BIT(POWER_SUPPLY_USB_TYPE_CDP) |
>> +		     BIT(POWER_SUPPLY_USB_TYPE_DCP) |
>> +		     BIT(POWER_SUPPLY_USB_TYPE_ACA) |
>> +		     BIT(POWER_SUPPLY_USB_TYPE_UNKNOWN),
>>  	.properties = lc824206xa_psy_props,
>>  	.num_properties = ARRAY_SIZE(lc824206xa_psy_props),
>>  	.get_property = lc824206xa_psy_get_prop,
> 
> 

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi


