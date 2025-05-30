Return-Path: <linux-next+bounces-6986-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFC6AC8930
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 09:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F8AE1BA696D
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 07:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5071FE455;
	Fri, 30 May 2025 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6YHDQ5Q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF15E1898F8;
	Fri, 30 May 2025 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591066; cv=none; b=BQlHHYCN2Xaf0fQ2VdqAij2WRXE6zl95d9pbEskX8j6cEKjC/nseRd5FEuC0iYLWgj0jlgha6lDknhnceCP1djoPeevB8TyOR75Ijw0avwcqDT3yHcsX/0aqM6Bs4HRmQJptg9LacIYayFEdDPnFf98zhGlNkDu7DEF3+14Nic4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591066; c=relaxed/simple;
	bh=8c1YIHEOyuZ64Oyvg+rqcARTrCsOO97Ri4WDAUf/M30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Afck1FnUU5cPnR/EdvzGBWR9Wd2aTS5CLSlRe+u1NLr7ouyxTXPTaw+Jzox1o+4W9/ZxWh0dioNcl9+lmlA5dj3jPl0UVpn0GgTL+67wvLrqIwp5W8POdBSXNu5H7RMTC5AYzjDFrpQ/0lpTgGFPMH/u/BVZsoUaGAI0pm2k+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6YHDQ5Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A93BC4CEE9;
	Fri, 30 May 2025 07:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748591065;
	bh=8c1YIHEOyuZ64Oyvg+rqcARTrCsOO97Ri4WDAUf/M30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H6YHDQ5QVoqXtXRK+buaeNxZoI+pVT8pRdt9UpEb+oG1WmMh9BylSo2tukQpxVvDK
	 MQv1rtvuP3TjgoZAG1Y63P3EMgpR7UtVmcMsUB4e0Q6aWHvJ4yS/0hUaY1M2tBP3gQ
	 lO3HFMirCJBhxg9RsiHPTM//YrA2r8gVuoHD0tEUJdut7r6ap0v3YGB/1fAhr/uBGX
	 F3NMO6t5wFz2prkEsxgb2dGvGHzGy+9vtAa/2Z44Bt9PIFtCZntx4wTtrPk43eImba
	 gHrONh8jdqiPPHIbuYHzesZqH57onOOrUNCNmzAvJbwYeaF0sVd+fw3tvYviSEacn9
	 zendjYwUo4etw==
Message-ID: <f4b8657e-17c5-49d0-bee8-8621c811b6ca@kernel.org>
Date: Fri, 30 May 2025 09:44:21 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 27 (drivers/platform/x86/amd/amd_isp4.c)
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>
References: <20250527203231.3c6c0b9d@canb.auug.org.au>
 <04577a46-9add-420c-b181-29bad582026d@infradead.org>
 <d2ac901b-f7d2-46e6-b977-0ad90faa46f2@kernel.org>
 <b712a69d-e899-4286-b5f6-06d87d732ed8@amd.com>
 <e079d753-554e-7a42-11c6-a08cc095eb91@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <e079d753-554e-7a42-11c6-a08cc095eb91@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 30-May-25 9:41 AM, Ilpo Järvinen wrote:
> On Tue, 27 May 2025, Nirujogi, Pratap wrote:
>> On 5/27/2025 3:43 PM, Hans de Goede wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> Hi,
>>>
>>> On 27-May-25 8:56 PM, Randy Dunlap wrote:
>>>>
>>>>
>>>> On 5/27/25 3:32 AM, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20250526:
>>>>>
>>>>
>>>> on x86_64, when
>>>> # CONFIG_MODULES is not set
>>>>
>>>> ../drivers/platform/x86/amd/amd_isp4.c: In function 'is_isp_i2c_adapter':
>>>> ../drivers/platform/x86/amd/amd_isp4.c:154:35: error: invalid use of
>>>> undefined type 'struct module'
>>>>    154 |         return !strcmp(adap->owner->name,
>>>> "i2c_designware_amdisp");
>>>>        |                                   ^~
>>>
>>> Hmm, this should not check the owner->name at all.
>>>
>>> Instead the i2c_designware_amdisp should set adap->name to something
>>> unique and then this should check adap->name.
>>>
>> I noticed the unique name set to "adap->name" in i2c_designware_amdisp is
>> getting overwritten to the generic "Synopsys DesignWare I2C adapter" name in
>> i2c_dw_probe_master().
>>
>> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-designware-master.c#L1046
>>
>> Inorder to use unique name to detect the specific adapter without making
>> changes in i2c-designware-master.c, I used adap->owner->name.
>>
>> Since it is causing build issues when CONFIG_MODULES is not set, can I make a
>> change in i2c-designware-master.c to initialize the generic "Synopsys
>> DesignWare I2C adapter" name only when adap->name is NULL. This way I should
>> be able to pass the unique name from i2c_designware_amdisp module.
> 
> How can you check that, it's char name[48]; not a pointer???

A NULL check indeed will not work, but we can check that (name[0] != 0).

Regards,

Hans



